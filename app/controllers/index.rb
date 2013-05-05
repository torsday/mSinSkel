get '/' do
  erb :index
end

get '/resources' do
  # Typically the index of a resource returns a collection of the resources
  # For instances, a blog may have a '/' route that returns all the articles
  # @resources = Resource.all
  # ...
end

get '/resources/:id' do
  # This route would retrieve the specific resource that corresponds with the
  # params[:id]
  # @resource = Resource.find(params[:id])
  # ...
end

get '/resources/new' do
  # This is a get request to retrieve the form that can be used to generate a
  # new resource
  # @resource = Resource.new
  # ...
end

post '/resources' do
  # A post to the index to create a new resouce, think of it as adding a new
  # resource to the collection
  # Be sure to handle scenarios where the resources is not valid
  #
  # @resource = Resource.new(name: 'Kevin')
  # if @resource.save
  #   redirect '/'
  # else
  #   erb :new
  # ...cont...
end

get 'resources/:id/edit' do
  # This is a get request to obtain the resource and the form to make edits
  # @resource = Resource.find(params[:id])
  # ...
end

put 'resources/:id' do
  # This will updated the resource, much like a post you need to make sure
  # to handle situations that may cause the record to be invalid and fail
  # to save to the database
  # @resource = Resource.find(params[:id])
  # if @resource.update_attributes(params[:resource])
  #   redirect "/#{@resource.id}"
  # else
  #   erb :edit
  # ...cont...
end

delete 'resources/:id' do
  # This route will remove the resource from the server
  # @resource = Resource.find(params[:id])
  # @resource.destroy
  # ...
end
