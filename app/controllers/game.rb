get '/games/new' do
  session[:incorrect_guess] = 0
  session[:pic_num] = 0
  session[:game_id] = Game.create(score: 0, user_id: session[:user_id]).id
  city = Image.all.shuffle.first.city_name
  image_array = Image.all.where("city_name = ?", city)
  session[:urls] = image_array(image_array)
  erb :'game/question'
end

get '/games/:id/next_clue' do
    p session[:image_array]
    p session[:pic_num]
    session[:pic_num] = session[:pic_num].to_i + 1
    erb :'game/question'
end


post '/games/:id/guess' do
  @guess = params[:question].values.join.downcase
  @answer = Image.where('url = ?', session[:urls].first)
  puts "answer"
  p @answer.first.city_name.downcase
  puts "*" * 30
  puts @guess
  if @guess == @answer.first.city_name.downcase
    game = Game.find(session[:game_id])
    game.score += (10 - session[:pic_num].to_i)
    game.save
    erb :'/game/correct_guess'
  else
    session[:incorrect_guess] = session[:incorrect_guess].to_i + 1
    if session[:incorrect_guess] > 2
      redirect '/games/game_over'
    else
      erb :'/game/incorrect_guess'
    end
  end
end

get '/games/:id/next_question' do
  session[:pic_num] = 0
  city = Image.all.shuffle.first.city_name
  image_array = Image.all.where("city_name = ?", city)
  session[:urls] = image_array(image_array)
   erb :'game/question'
end

get '/games/game_over' do
  @answer = Image.where('url = ?', session[:urls].first)
  game = Game.find(session[:game_id])
  @score = game.score
  user = User.find(session[:user_id])
  @name = user.name
  erb :'game/game_over'
end


