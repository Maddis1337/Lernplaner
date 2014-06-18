$(document).ready () ->
  $('#external-events div.external-event').each () ->

    # create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
    # it doesn't need to have a start or end
    eventObject = { # use the element's text as the event title
      title: $.trim($(this).text())
    }

    # store the Event Object in the DOM element so we can get to it later
    $(this).data 'eventObject', eventObject

    # make the event draggable using jQuery UI
    $(this).draggable {
      zIndex: 999,
      revert: true,      # will cause the event to go back to its
      revertDuration: 0  #  original position after the drag
    }

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today'
        center: 'title'
        right: 'month,agendaWeek,agendaDay'
      }
      editable: true
      droppable: true # this allows things to be dropped onto the calendar !!!
      drop: (date) -> # this function is called when something is dropped
        # retrieve the dropped element's stored Event Object
        originalEventObject = $(this).data('eventObject')

        # we need to copy it, so that multiple events don't have a reference to the same object
        copiedEventObject = $.extend({}, originalEventObject)

        # assign it the date that was reported
        copiedEventObject.start = date

        # render the event on the calendar
        # the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true)

        # is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked'))
          # if so, remove the element from the "Draggable Events" list
          $(this).remove()
    })









