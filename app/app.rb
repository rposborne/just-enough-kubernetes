require 'sinatra/base'
require 'stringio'
require 'logger'

class App < Sinatra::Base
  get '/' do
    <<~HTML
      <h1>
        Welcome, #{request.ip}
      </h1>
      <small>Pod: #{ENV["MY_POD_NAME"]}</small>
      <small>Node: #{ENV["MY_NODE_NAME"]}</small>
    HTML
  end

  get '/users/:id' do
    "User number #{params[:id]} is an uppity know-it-all"
  end

  run! if app_file == $PROGRAM_NAME
end
