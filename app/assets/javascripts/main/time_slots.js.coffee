#= require vis
class Timeline
  constructor: (root) ->
    @root = $(root)
    @container = @root.find('.js-timeline-container')[0]

    timeSlotsPath = @root.data('time-slots-path')
    $.ajaxSetup headers: { 'Time-Zone': @timeZone() }
    $.getJSON(timeSlotsPath).done(@onDataLoaded)

    @filters = @root.find('.js-timeline-filter')
    @filters.on 'change', @updateFilter

  onDataLoaded: (timeSlotsData) =>
    @timeSlotDataSet = new vis.DataSet @timeSlotsDataSet(timeSlotsData)
    @timeline = new vis.Timeline(@container, @timeSlots(), stack: false, selectable: false, zoomable: true)

  timeSlots: =>
    @timeSlotDataSet.get(filter: @timeSlotFilter(@selectedToolNames()))

  timeSlotFilter: (selectedToolNames) =>
    (timeSlot) =>
      return true unless selectedToolNames.length
      for toolName in selectedToolNames
        return true if toolName in timeSlot.tool_names

  selectedToolNames: =>
    @filters
      .filter(-> $(@).prop('checked'))
      .map(-> $(@).val())

  updateFilter: =>
    @timeline.setItems @timeSlots()

  timeZone: => - new Date().getTimezoneOffset() / 60

  timeSlotContent: (timeSlot) =>
    projectLink = "<a href='#{timeSlot.project_link}'>#{timeSlot.project_name}</a>"
    return projectLink unless timeSlot.company_name?
    "<b>#{timeSlot.company_name}</b><br/>#{projectLink}"

  timeSlotsDataSet: (timeSlotsData) =>
    $.map timeSlotsData, (timeSlot) =>
      {
        start: new Date(timeSlot.started_at)
        end: new Date(timeSlot.ended_at)
        content: @timeSlotContent(timeSlot)
        title: timeSlot.project_name
      }

jQuery ($) ->
  $('.js-timeline').each -> new Timeline(@)
