$(document).on('submit','.send_tweet',function(e){
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/twitter/post',
      data: $(this).serialize()
    }).done( function(){
      console.log("you're tweet was sent!")
    });
  });



$(document).ready(function(){
  });