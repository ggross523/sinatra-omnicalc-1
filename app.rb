require "sinatra"
require "sinatra/reloader"

get ('/') do
  erb(:square_new)
end

get ("/square/new") do
  erb(:square_new)
end

get ('/square/results') do
  @the_num = params.fetch("users_number").to_f
  @the_square = @the_num ** 2
  erb(:square_results)
end

get ('/square_root/new') do
  erb(:square_root)
end

get ('/square_root/results') do
  @the_num = params.fetch("users_number").to_f
  @the_square = Math.sqrt(@the_num)
 
  erb(:square_results)
end

get ("/payment/new") do
  erb(:payment_new)
end

get('/payment/results') do
  apr = params.fetch("apr").to_f / 100
  @apr_show = sprintf("%.5f%%", apr)
  
  @years = params.fetch("years").to_i
 
  @principal = params.fetch("principal").to_i
  @principal_show = "$" + params.fetch("principal")
 
  payment_value = (apr * @principal) / (1 -(1+apr) ** -@years)
  @payment_show = "$" + sprintf("%.2f", payment_value)

  
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get '/random/results' do
  @min = params.fetch("Min").to_f
  @max = params.fetch("Max").to_f
  @rand = rand(@min...@max)

  erb(:random_results)
end
