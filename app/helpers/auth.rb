

helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_game
    @game ||= Game.find(session[:game_id]) if session[:game_id]
  end

  def current_image
    @image ||= Image.find(session[:image_id]) if session[:image_id]
  end

end
