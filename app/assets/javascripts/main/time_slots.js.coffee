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

  onDataLoaded: (data) =>
    @timeSlotDataSet = new vis.DataSet(data)
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

jQuery ($) ->
  $('.js-timeline').each -> new Timeline(@)
