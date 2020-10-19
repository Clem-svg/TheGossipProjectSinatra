require 'sinatra'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Dans le champ gossip_author, on a : #{params["gossip_author"]}"
    puts "Et le champ gossip_content : #{params["gossip_content"]}"
    puts "Allez on se tire, ciao les BGs !"
    redirect '/'
  end

  get '/gossips/:id' do
    number = params['id']
    erb :show, locals: {gossip: Gossip.find(number)}
  end

 # modifier un potin
  get '/gossips/:id/edit/' do
  erb :edit
  end

  post '/gossips/edit/' do
    Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
    redirect '/'
  end




end