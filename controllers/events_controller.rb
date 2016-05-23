require_relative('../models/event.rb')
require_relative('../models/athlete.rb')

get '/events' do
  @events = Event.all()
  erb(:'events/index')
end

get '/events/new' do
  erb(:'events/new')
end

post '/events' do
  event = Event.new(params)
  event.save()
  redirect to('/events')
end

get '/events/:id' do
  @athletes = Athlete.all()
  @event = Event.find(params[:id])
  erb(:'events/show')
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb(:'events/edit')
end

put '/events/:id' do
  @event = Event.update(params)
  redirect to ('/events')
end

get '/events/:id/delete' do
  @event = Event.find(params[:id])
  erb(:'events/delete')
end

delete '/events/:id' do
  Event.destroy(params[:id])
  redirect to ('/events')
end

post '/events/:id/athletes' do
  @event = Event.find(params[:id])
  @athlete = Athlete.find(params["athlete_id"])
  @event.add_athlete(@athlete)
  redirect to ("/events/#{@event.id}")
end

delete '/events/:id/athletes' do
  @event = Event.find(params[:id])
  @athlete = Athlete.find(params["athlete_id"])
  @event.delete_athlete(@athlete)
  redirect to ("/events/#{@event.id}")
end