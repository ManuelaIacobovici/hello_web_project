require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # get '/hello' do
	# 	name = params[:name]
	# 	return "Hello #{name}"
  # end

  # post '/submit' do
  #   name = params[:name]
  #   message = params[:message]

  #   return "thanks #{name}, you sent this message: #{message}"
  # end

    post '/sort-names' do
    names = params[:names]

    names.split(",").sort!.join(",")
  end


  # get '/hello' do
		
	# 	return erb(:hello)
  # end

  get '/' do
		@name = params[:name]

		return erb(:hello_name)
  end
end