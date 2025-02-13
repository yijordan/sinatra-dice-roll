require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  return "<!DOCTYPE html>
<html>
  <head>
    <meta charset='UTF-8'>
    <style>
      ul {
        list-style: none;
        padding-left: 0;
      }
      ul li::before {
        content: '🎲';
        margin-right: 8px;
        }
    </style>
  </head>
  <body>
    <h1>Super Fun Dice Roll Extravaganza</h1>
    <ul>
      <li><a href=\"/dice/1/6\">1d6</a></li>
      <li><a href=\"/dice/2/6\">2d6</a></li>
      <li><a href=\"/dice/1/10\">1d10</a></li>
      <li><a href=\"/dice/2/10\">2d10</a></li>
      <li><a href=\"/dice/1/20\">1d20</a></li>
      <li><a href=\"/dice/2/20\">2d20</a></li>
    </ul>
  </body>
</html>"
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
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end
get("/dice/1/6") do
  die = rand(1..6)
  outcome = "You rolled a #{die}."
  "<h1>1d6</h1>
  <p>#{outcome}</p>"
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
