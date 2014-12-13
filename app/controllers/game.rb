post '/games' do
  @answer = City.all.shuffle.first
  game = Game.create(score:nil, user_id: session[:user_id])
  redirect "/games/#{game.id}"
end

get '/games/:id' do |id|

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








#   @city = City.find(@question.city_id).name
#   if params[:question][:guess]
# end
