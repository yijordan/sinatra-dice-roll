require "sinatra"
require "sinatra/reloader"

get("/") do
  "Hello World"
end
get("/zebra") do
  "We must add a route for each path we want to support"
end
get("/asdf") do
  "Does it work?"
end
