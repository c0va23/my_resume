#= require vis
class Timeline
  constructor: (@container) ->
    timeSlotsPath = $(@container).data('time_slots_path')
    $.getJSON(timeSlotsPath).done(@onDataLoaded)

  onDataLoaded: (data) =>
    @timeSlots = new vis.DataSet(data)
    @timeline = new vis.Timeline(@container, @timeSlots, stack: false, selectable: false)

jQuery ($) ->
  $('.js-timeline').each -> new Timeline(@)
