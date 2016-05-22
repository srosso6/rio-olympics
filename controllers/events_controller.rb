require_relative('../models/event.rb')

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