class MovieController < ApplicationController
    
  def new
    @artist = Artist.find(params[:artist_id])
    videos = Yt::Collections::Videos.new
    videos.where(q:"@artist.name").first(10).each do |video|
      p video.title
      p video.thumbnail_url
      p video.id
    end
  end
    
end
