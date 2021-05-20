# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
Movie.delete_all
# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
rest_reponse = RestClient.get(url)
response = JSON.parse(rest_reponse.body)

response['results'].each do |movie_hash|
  Movie.create!(title: movie_hash["title"], overview: movie_hash["overview"], poster_url: movie_hash["poster_path"], rating: movie_hash["vote_average"])
end
