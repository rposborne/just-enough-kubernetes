require 'sinatra/base'
require 'stringio'
require 'logger'


class App < Sinatra::Base
  get '/' do

    best_layout do
      <<~HTML
      <h1>
        Hello from #{ENV["MY_POD_NAME"] ? "Kubernetes" : "Ruby"}
      </h1>
      <span class="button button-primary">IP: #{request.ip}</span>
      <span class="button button-primary">Pod: #{ENV["MY_POD_NAME"]}</span>
      <span class="button button-primary">Node: #{ENV["MY_NODE_NAME"]}</span>
      HTML
    end
  end

  # Thanks https://github.com/makandra/nice/blob/master/stage-02/app/models/compliment.rb
  get '/praise/:name' do
    best_layout do
      <<~HTML
      <h1>
      #{params[:name]}, #{AVAILABLE_MESSAGES.sample}
      </h1>
      HTML
    end
  end

  def best_layout
    <<~HTML
    <html>
      <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css" integrity="sha256-2YQRJMXD7pIAPHiXr0s+vlRWA7GYJEK0ARns7k2sbHY=" crossorigin="anonymous" />
        <style>
        .header {
          margin-top: 6rem;
          text-align: center;
        }
        </style>
      </head>
      <body>
        <div class="container">
        <section class="header">
        #{yield}
        </section>
        </div>
      </body>
    </html>
    HTML
  end

  run! if app_file == $PROGRAM_NAME
end


AVAILABLE_MESSAGES = [
  "Your parents are more proud of you than you'll ever know.",
  "You actually looked super graceful that time you tripped in front of everyone.",
  "People at trivia night are terrified by you.",
  "You pick the best radio stations when you're riding shotgun.",
  "Your pet loves you too much to ever run away.",
  "You could survive a zombie apocalypse.",
  "You're great at figuring stuff out.",
  "If someone based an Internet meme on you, it would have impeccable grammar.",
  "I appreciate you."
]

