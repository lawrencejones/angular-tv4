require 'slim'
require 'coffee-script'

get '/' do
  slim :index
end

get '/app.js' do
  coffee '../scripts/app'.to_sym
end
