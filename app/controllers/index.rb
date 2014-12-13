get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/game/new' do
  new_game = Game.create

end
