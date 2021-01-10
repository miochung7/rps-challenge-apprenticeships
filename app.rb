require 'sinatra/base'
require './lib/player'

class RockPaperScissors < Sinatra::Base

  enable :sessions
  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    redirect('/play')
  end

  get '/play' do
    @player_1 = $player_1
    @move = session[:move]
    erb(:play)
  end

  post 'play' do
    session[:move] = params[:move]
    redirect '/result'
  end

  get '/result' do
    @move = session[:move]
    erb(:result)
  end

  # post '/choice' do
    
  # end

  run! if app_file == $0
end
