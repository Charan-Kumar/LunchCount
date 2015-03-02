$(document).ready(function() {
      $('#calendar').fullCalendar({
      firstDay:1,
      contentHeight: 600,
      weekends: true,
      header:{
        left:   '',
        center: 'title',
        right:  ''
      },

      dayRender: function( date, cell ) {

        $(cell).function(){

          
        }

      }
  
    })

});