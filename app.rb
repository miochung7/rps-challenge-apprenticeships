require 'sinatra/base'
require './lib/player'
require './lib/play_game'

class RockPaperScissors < Sinatra::Base

  enable :sessions
  
  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_name], :player_points)
    $player_2 = Player.new("Computer", :player_2_points)
    session[:player_points] = $player_1.score
    session[:player_2_points] = $player_2.score
    redirect('/play')
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    
  #  p params[:move]
    erb(:play)
  end

  post 'play' do 
    session[:player_1_move] = params[:move]
    @player_1= session[:player_1_move]
    @player_2 = $player_2
    $play = Play.new(@player_1, @player_2)
    redirect '/play'
  end


  run! if app_file == $0
end
