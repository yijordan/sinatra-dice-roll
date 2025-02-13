require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:homepage)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end
get("/asdf") do
  "Does it work?"
end
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_six)
end
get("/dice/1/6") do
  die = rand(1..6)
  @outcome = "You rolled a #{die}."
  
  erb(:one_six)
end
get("/dice/1/20") do
  die = rand(1..20)
  outcome = "You rolled a #{die}."
  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end
get("/dice/2/20") do 
  first_die = rand(1..20)
  second_die = rand(1..20)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  "<h1>2d20</h1>
  <p>#{outcome}</p>"
end
get("/dice/1/10") do
  die = rand(1..10)
  outcome = "You rolled a #{die}."
  "<h1>1d10</h1>
  <p>#{outcome}</p>"
end
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end
