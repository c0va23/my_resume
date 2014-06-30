#= require vis
class Timeline
  constructor: (root) ->
    @root = $(root)
    @container = @root.find('.js-timeline-container')[0]
    timeSlotsPath = @root.data('time-slots-path')
    $.getJSON(timeSlotsPath).done(@onDataLoaded)

  onDataLoaded: (data) =>
    @timeSlots = new vis.DataSet(data)
    @timeline = new vis.Timeline(@container, @timeSlots, stack: false, selectable: false)

jQuery ($) ->
  $('.js-timeline').each -> new Timeline(@)
