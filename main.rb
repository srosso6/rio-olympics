require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/athletes_controller')
require_relative('controllers/events_controller')
require_relative('controllers/nations_controller')
require_relative('models/medal.rb')
require('pry-byebug')
require("json")

get '/' do
  erb(:home)
end

get '/results' do
  @nations = Nation.all()
  @events = Event.all()
  @medal = Medal.new(@nations, @events)
  erb(:results)
end

get '/schedule' do
  @events = Event.all()
  @events.sort_by! { |event| event.day }
  erb(:schedule)
end

get '/results/nations' do
  content_type( :json )

  @nations = Nation.all()
  @events = Event.all()
  @medal = Medal.new(@nations, @events) 
  
  results = @medal.results_table()

  return results.to_json
end

get '/results/events' do
  content_type( :json )

  @nations = Nation.all()
  @events = Event.all()
  @medal = Medal.new(@nations, @events) 

  results = @medal.medalists_table()

  return results.to_json
end