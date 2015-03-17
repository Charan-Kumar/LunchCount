$(document).on('page:load ready',function() 
{
  var d = new Date();
  var month = d.getMonth();
  var year = d.getFullYear();
  $('#future_count').fullCalendar({
    firstDay:1,
    contentHeight: 600,
    weekends: true,
    header:{
      left:   '',
      center: 'title',
      right:  'prev next'
    },
  })
  
  

});

