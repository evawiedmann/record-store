require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

get('/albums/new') do
  erb(:new_album)
end

post('/albums') do
  values = *params.values
  album = Album.new(values[0], nil, values[1], values[2], values[3])
  album.save()
  @albums = Album.all() # Adding this line will fix the error.
  erb(:albums)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  values = *params.values
  @album.update(values[1], values[2], values[3], values[4])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end
