class Search 
  @trainees = ko.observableArray([])

  @trainee = (data) ->
    @first_name = ko.observable(data.first_name)
    @last_name = ko.observable(data.last_name)
    @phone = ko.observable(data.phone)
    @badge_id = ko.observable(data.badge_id)
    @employee_number = ko.observable(data.employee_number)
    @department_name = ko.observable(data.department_name)
    @category_name = ko.observable(data.category_name)
    @job_title_name = ko.observable(data.job_title_name)
    return

  @searchTrainees = (e) ->
    $.ajax({
      type: 'POST',
      url: '/api/v1/trainees/search',
      data: $(e).serialize(),
      success: (data) ->
        @results = $.map(data, (t) -> new Search.trainee(t))
        Search.trainees(@results)
        return
    })
    return

$(document).ready ->
  ko.applyBindings(Search)
