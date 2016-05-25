require_relative('../models/nation.rb')

get '/nations/?' do
  @nations = Nation.all()
  erb(:'nations/index')
end

get '/nations/new' do
  erb(:'nations/new')
end

post '/nations' do
  nation = Nation.new(params)
  nation.save()
  redirect to('/nations')
end

get '/nations/:id' do
  @nation = Nation.find(params[:id])
  erb(:'nations/show')
end

get '/nations/:id/edit' do
  @nation = Nation.find(params[:id])
  erb(:'nations/edit')
end

put '/nations/:id' do
  @nation = Nation.update(params)
  redirect to ('/nations')
end

get '/nations/:id/delete' do
  @nation = Nation.find(params[:id])
  erb(:'nations/delete')
end

delete '/nations/:id' do
  Nation.destroy(params[:id])
  redirect to ('/nations')
end
