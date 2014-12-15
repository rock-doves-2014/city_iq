

helpers do

  def current_user
    p session[:user_id]
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_game
    @game ||= Game.find(session[:game_id]) if session[:game_id]
  end

  def current_image
    @image ||= Image.find(session[:image_id]) if session[:image_id]
  end

  def image_array(image_array)
    image_array.map do |object|
      object.url
    end
  end

end
