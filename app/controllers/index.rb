get '/' do
  @scoreboard = Game.order(score: :desc).limit(10)
  erb :index
end


