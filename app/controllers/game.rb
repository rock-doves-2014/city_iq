get '/games/new' do
  # game = Game.create(score:nil, user_id: session[:user_id])
  # session[:game_id] = game.id
  # @current_city = City.all.shuffle.first
  # session[:city_id] = @current_city.id
  # @url_array = CityLinks.new(@current_city.name).links
  session[:pic_num] = 0
  session[:game_id] = Game.create(score: nil, user_id: session[:user_id]).id
  city = Image.all.shuffle.first.city_name
  session[:image_array] = Image.all.where("city_name = ?", city)
  erb :'game/question'
end

get '/games/:id/next_clue' do |id|
  # if current_user
    p session[:image_array]
    p session[:pic_num]
    new_pic_num = session[:pic_num].to_i + 1
    session[:pic_num] = new_pic_num
    p "*************************************"
    p session[:pic_num]
    erb :'game/question'
  # end
end


  # Grab a question from the database
  # put it in the erb as an instance var
  # At this point correct is nil cos the user hasn't answered
  # Then in post '/game/answer' you'd look for this question
  # and update it
=begin
   In the erb you'd just have question_id in a hidden
   and an input field for the user to answer in.
    post /game/answer would do
      q = Question.find(params[:question_id])
      guess = params[:guess]
      q.correct = (guess == q.city.name)
      q.guess = guess
      q.save
  @question
=end
=begin
get '/games/:id' do |id|
  previous_wrong = Question.find_by(correct: false, game_id: id)
  if previous_wrong > 2
    @game_over = "Game over"
  else
    @game = Game.find(id);
    @game.questions
  end
  erb :"/game/question"
end

 post '/game/answer' do
   q = Question.create(params[:question])
   correct_city = q.city
   q.correct = (q.guess == q.city.name)
   q.save
   redirect "/games/#{q.game_id}"
 end
=end







#   @city = City.find(@question.city_id).name
#   if params[:question][:guess]
# end
