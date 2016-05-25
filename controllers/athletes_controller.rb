require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require("pry-byebug")

get '/athletes' do
  @athletes = Athlete.all()
  erb(:'athletes/index')
end

get '/athletes/new/?:nation_id?' do
  @nations = Nation.all()
  @id = nil
  if params.has_key?("nation_id")
    @id = params["nation_id"].to_i
  end
  erb(:'athletes/new')
end

post '/athletes' do
  athlete = Athlete.new(params)
  athlete.save()
  redirect to("/nations/#{athlete.nation_id}")
end

get '/athletes/:id' do
  @athlete = Athlete.find(params[:id])
  erb(:'athletes/show')
end

get '/athletes/:id/edit' do
  @nations = Nation.all()
  @athlete = Athlete.find(params[:id])
  erb(:'athletes/edit')
end

put '/athletes/:id' do
  Athlete.update(params)
  athlete = Athlete.find(params[:id])
  redirect to ("/nations/#{athlete.nation_id}")
end

get '/athletes/:id/delete' do
  @athlete = Athlete.find(params[:id])
  erb(:'athletes/delete')
end

delete '/athletes/:id' do
  athlete = Athlete.find(params[:id])
  nation_id = athlete.nation_id
  Athlete.destroy(params[:id])
  redirect to ("/nations/#{nation_id}")
end