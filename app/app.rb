require 'sinatra/base'
require 'stringio'
require 'logger'

AVAILABLE_MESSAGES = [
  "Your parents are more proud of you than you'll ever know.",
  "You actually looked super graceful that time you tripped in front of everyone.",
  "People at trivia night are terrified by you.",
  "You pick the best radio stations when you're riding shotgun.",
  "Your pet loves you too much to ever run away."
]

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

  # Thanks https://github.com/makandra/nice/blob/master/stage-02/app/models/compliment.rb
  get '/praise/:name' do
    "#{params[:name]}, #{AVAILABLE_MESSAGES.sample}"
  end

  run! if app_file == $PROGRAM_NAME
end
