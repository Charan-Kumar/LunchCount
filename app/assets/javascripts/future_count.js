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
  read_data();
  
  
  function read_data()
  {
    var d=get_date(01,month,year);
    $.ajax(
    {
    url: "/admin/future_count",
    type: "GET", 
    dataType: "json",
    data:{date:d} ,
    success: function(response){
      console.log("Sucessfully Get the Data From DataBase")
      console.log(response);
        
     }
    });
  }

  $('.fc-next-button').on('click', function(){
    month++;
    if (month > 11)
    {
      month = 0;
      year++;
      
    }
    reload_data();
    
  });
  $('.fc-prev-button').on('click', function(){
    month--;
    if (month < 0)
    {
      month = 11;
      year--;
    }
    reload_data();
    
  });

  
  function _date(response,date)
  { 
    
    for( var i in response)
    {
      
      if( response[i].date == date)
        return response[i];

    }
  }


  function _date(day,month,year)
  {

    var d = new Date();
    var date= ""+year.toString()+"-"+("0" + (month+1)).slice(-2)+"-"+("0" + day).slice(-2).toString();
    return date;

  }

  
  function _db_id(response,date)
  {
    for( var i in response)
    {
      if(response[i].date == date)
        return response[i].id;

    }
    
  }

  



  function _toggles(response)
  {
    $('td .fc-day').not(".fc-other-month").each(function(index){

      var toggle_id = get_date((index+1),month,year);
      if ( $(this).hasClass("fc-sun") || $(this).hasClass("fc-sat") )
        return;
      

      $(this).append();
      
    })
  }
  
  
});
