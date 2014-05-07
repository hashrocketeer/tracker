class Trainee
  constructor (data={}) ->
    @id = ko.observable(data.id)
    @first_name = ko.observable(data.first_name)
    @last_name = ko.observable(data.last_name)
    @badge_id = ko.observable(data.badge_id)
    @employee_number = ko.observable(data.employee_number)
    @phone = ko.observable(data.phone)
    @home_phone = ko.observable(data.home_phone)
    @fax = ko.observable(data.fax)
    @address = ko.observable(data.address)
    @internal_address = ko.observable(data.internal_address)
    @birth_date = ko.observable(data.birth_date)
    @hire_date = ko.observable(data.hire_date)
    @termination_date = ko.observable(data.termination_date)
    @blood_type = ko.observable(data.blood_type)
    @medical_notes = ko.observable(data.medical_notes)
    @department_id = ko.observable(data.department_id)
    @category_id = ko.observable(data.category_id)
    @job_title_id = ko.observable(data.job_title_id)
    @department_name = ko.observable(data.department_name)
    @category_name = ko.observable(data.category_name)
    @job_title_name = ko.observable(data.job_title_name)

class TraineeViewModel
  constructor: ->
    @heading = ko.observable("Search Trainees")
    @page = ko.observable("index")
    @errors = ko.observableArray()
    @trainees = ko.observableArray()
    @selected = ko.observable(new Trainee())
    @empty = ko.observable(new Trainee())
    @flash = ko.observable()
    @flashClass = ko.observable()

  setFlash: (msg, status) =>
    @flash(msg)
    @flashClass(status)

  editTrainee: (e) =>
    @selected(e)
    @heading "Edit Trainee"
    @page "edit"

  newTrainee: =>
    @heading "New Trainee"
    @page "new"

  cancelTrainee: =>
    @heading "Search Trainees"
    @page "index"

  updateTrainee: (trainee) =>
    json_data = ko.toJS(trainee)

    $.ajax
      type: "PUT"
      url: "/api/v1/trainees/" + trainee().id() + ".json"
      data: {
        trainee: json_data
      },
      success: (data) ->
        @errors []
        @setFlash "You successfully saved a trainee", "success"
        @page "index"
      error: (msg) ->
        @setFlash "Trainee must", "alert"

  createTrainee: (trainee) ->
    json_data = ko.toJS(trainee)

    $.ajax
      type: "POST"
      url: "/api/v1/trainees.json"
      data: {
        trainee: json_data
      }
      success: (data) ->
        @errors []
        @setFlash "You successfully added a trainee", "success"
        @page "index"
        return
      error: (msg) ->
        @setFlash "Trainee must", "alert"
        return

    return

  destroyTrainee: (trainee) ->
    $.ajax
      type: "DELETE"
      url: "/api/v1/trainees/" + trainee.id() + ".json"
      dataType: "json"
      success: ->
        @errors []
        @setFlash "You successfully deleted a trainee"
        @trainees.remove(trainee)

      error: (msg) ->
        viewModel.errors JSON.parse(msg.responseText)

  searchTrainees: =>
    $.ajax
      type: "POST"
      url: "/api/v1/trainees/search"
      data: $(e).serialize()
      success: (data) ->
        @trainees($.map(data, (t) -> new Trainee(t)))

$ -> ko.applyBindings new TraineeViewModel()
