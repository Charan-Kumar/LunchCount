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
  get_data();
  
  function get_data()
  {
    var d = get_the_date(01,month,year);
    $.ajax(
    {
    url: "/admin/future_count",
    type: "GET", 
    dataType: "json",
    data:{date:d} ,
    success: function(response){
      console.log("Sucessfully Get the Data From DataBase")
      load_count(response);
        
     },
    error: function(e){
      console.log(e)
    }

    });
  }

  $('#future_count .fc-next-button').on('click', function(){
    console.log("Hello")
    month++;
    if (month > 11)
    {
      month = 0;
      year++;
      
    }
    get_data()
    
  });
  $('#future_count .fc-prev-button').on('click', function(){
    month--;
    if (month < 0)
    {
      month = 11;
      year--;
    }
    get_data()
    
  });

  
  function search_the_date(response,date)
  { 
    
    for( var i in response)
    {
      
      if( response[date])
        return response[date];

    }
  }


  function get_the_date(day,month,year)
  {

    var d = new Date();
    var date= ""+year.toString()+"-"+("0" + (month+1)).slice(-2)+"-"+("0" + day).slice(-2).toString();
    return date;

  }

  
  
  



  function load_count(response)
  {
    $('td .fc-day').not(".fc-other-month").each(function(index){

      var toggle_id = get_the_date((index+1),month,year);
      if ( $(this).hasClass("fc-sun") || $(this).hasClass("fc-sat") )
        return;
  
      get_date = search_the_date(response,toggle_id)
      if (get_date)
        $(this).append('<center><br><br><b>'+ get_date+'</b> </center>');
      else
        $(this).append('<center><br><br><b>0</b></center>');
      
    
            
    })

  }
  
});

