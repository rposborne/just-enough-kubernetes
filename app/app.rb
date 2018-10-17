require 'sinatra/base'
require 'stringio'
require 'logger'

class App < Sinatra::Base
  get '/' do
    "Welcome, #{request.ip}"
  end

  get '/users/:id' do
    "User number #{params[:id]} is an uppity know-it-all"
  end

  run! if app_file == $PROGRAM_NAME
end
