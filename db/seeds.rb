require 'bcrypt'

User.create(name: 'bob', password: 'fox')

Game.create(score: '12', user_id: '1')

Question.create(city_id: '1', guess: 'new york', game_id: '1')

City.create(name:'new york', state: 'new york')

