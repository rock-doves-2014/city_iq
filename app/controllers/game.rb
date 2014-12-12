get '/game/new' do
  @answer = City.all.shuffle.first

  erb :'/game/question'
end

post '/game/answer' do
  Question.create(guess: params[:question][:guess], answer_id: params[:question][:answer],


  @city = City.find(@question.city_id).name
  if params[:question][:guess]
end
