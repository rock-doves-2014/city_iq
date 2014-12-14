get '/' do
  @scoreboard = Game.order(score: :desc).limit(10)
  p @scoreboard
  p @scoreboard.class
  erb :index
end


