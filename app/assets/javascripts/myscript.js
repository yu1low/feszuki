var player;

$(function(){
  $('search').click(function(){
      
    var url = "https://gdata.youtube.com/feeds/api/videos";
    
    var options = {
      "q": $('#q').val(),
      "alt": "json",
      "max-results": 10,
      "v": 2
    };
    
    $.get(url, options, function(rs){
      console.log(rs);
      for (var i=0; i<rs.feedentry.length; i++){
          var f = rs.feed.entry[i];
          $('#list').append(
            $('<li class="movie">').append(
              $('<img>').attr('scr', f['media$group']['media$thumbnail'][0]['url'])
              ).data('video-id', f['media$group']['yt$videoid']['$t'])  
              );
      }
    }, "json");
  });
  
  $(document).on('click', 'li.video', function(){
    player.loadVideoById(video.id);    
  });
  
});

function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    height: '360',
    width: '640',
  });
}