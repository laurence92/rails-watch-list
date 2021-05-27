# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

movie_list = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
movies = JSON.parse(movie_list)

Movie.destroy_all

movies["results"].each do |movie| 
  puts "Adding #{movie["title"]}"
  Movie.create!(
    title: movie["title"],
    rating: movie["vote_average"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
    )
    puts "#{movie["title"]} added!"
end
