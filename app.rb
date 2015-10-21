require 'sinatra/flash'

enable :sessions

use Rack::Auth::Basic, "Must login first" do |username, password|
  username == ENV['CN_LOGIN'] and password == ENV['CN_PASS'] 
end

before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

get '/' do
  erb :index
end

post '/process' do
  if TrelloNewsletter.new.run 
     flash[:notice] = "Trello processed" 
     redirect('/')
  else
     flash[:notice] = "Trello failed"
     redirect('/')
  end 
end
