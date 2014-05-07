Trainee = (data) ->
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
  return

EmptyTrainee = () ->
  @id = ko.observable()
  @first_name = ko.observable()
  @last_name = ko.observable()
  @badge_id = ko.observable()
  @employee_number = ko.observable()
  @phone = ko.observable()
  @home_phone = ko.observable()
  @fax = ko.observable()
  @address = ko.observable()
  @internal_address = ko.observable()
  @birth_date = ko.observable()
  @hire_date = ko.observable()
  @termination_date = ko.observable()
  @blood_type = ko.observable()
  @medical_notes = ko.observable()
  @department_id = ko.observable()
  @category_id = ko.observable()
  @job_title_id = ko.observable()
  return

TraineeViewModel = ->
  self = this
  @heading = ko.observable("Search Trainees")
  @page = ko.observable("index")
  @errors = ko.observableArray([])
  @trainees = ko.observableArray([])
  @selected = ko.observable(new EmptyTrainee)
  @empty = ko.observable(new EmptyTrainee)
  @flash = ko.observable("")
  @flashClass = ko.observable("")

  @setFlash = (msg, status) ->
    self.flash(msg)
    self.flashClass(status)
    return

  @editTrainee = (e) ->
    self.selected(e)
    self.heading "Edit Trainee"
    self.page "edit"
    return

  @newTrainee = ->
    self.heading "New Trainee"
    self.page "new"
    return

  @cancelTrainee = ->
    self.heading "Search Trainees"
    self.page "index"
    return

  @updateTrainee = (e) ->
    json_data = ko.toJS(self.selected)

    $.ajax
      type: "PUT"
      url: "/api/v1/trainees/" + self.selected().id() + ".json"
      data: {
        trainee: json_data
      },
      success: (data) ->
        self.errors []
        self.setFlash "You successfully saved a trainee", "success"
        self.page "index"
        return
      error: (msg) ->
        self.setFlash "Trainee must", "alert"
        return

    return

  @createTrainee = (e) ->
    $.ajax
      type: "POST"
      url: "/api/v1/trainees.json"
      data: $(e).serialize()
      success: (data) ->
        self.errors []
        self.setFlash "You successfully added a trainee", "success"
        self.page "index"
        return
      error: (msg) ->
        self.setFlash "Trainee must", "alert"
        return

    return

  @destroyTrainee = (trainee) ->
    $.ajax
      type: "DELETE"
      url: "/api/v1/trainees/" + trainee.id() + ".json"
      dataType: "json"
      success: ->
        self.errors []
        self.setFlash "You successfully deleted a trainee"
        self.trainees.remove(trainee)
        return

      error: (msg) ->
        viewModel.errors JSON.parse(msg.responseText)
        return
    return

  @searchTrainees = (e) ->
    $.ajax
      type: "POST"
      url: "/api/v1/trainees/search"
      data: $(e).serialize()
      success: (data) ->
        @results = $.map(data, (t) -> new Trainee(t))
        self.trainees(@results)
        return
  return


$(document).ready ->
  ko.applyBindings new TraineeViewModel
  return
