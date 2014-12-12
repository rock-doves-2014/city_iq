get '/' do
  @scoreboard = Game.all
  erb :index
end


