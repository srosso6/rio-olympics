require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/athletes_controller')
require_relative('controllers/events_controller')
require_relative('controllers/nations_controller')
require_relative('models/medal.rb')
require('pry-byebug')

get '/' do
  erb(:home)
end

get '/results' do
  @nations = Nation.all()
  @events = Event.all()
  @medal = Medal.new(@nations, @events)
  erb(:results)
end

get '/results/j' do
  content_type( :json )

  @nations = Nation.all()
  @events = Event.all()
  @medal = Medal.new(@nations, @events) 

  # @medal.results_table().each do |result|
  #   result[:nation]
  #   result[:gold]
  #   result[:silver]
  #   result[:bronze]
  #   result[:points]
  # end

  results = @medal.results_table()

  return results.to_json
end