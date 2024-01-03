# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def html_body_gen
    <<-BODY
    <h1 class='title'>#{Faker::Lorem.sentence}</h1>
    <li>#{Faker::Lorem.sentence}</li>
    <li>#{Faker::Lorem.sentence}</li>
    <li>#{Faker::Lorem.sentence}</li>
    <br>
    #{Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false)}
    <br>
    <p><a href=mailto:#{Faker::Internet.free_email}>Send mail</a></p>
    <br>
    <p><a href=#{Faker::Internet.url}>#{Faker::Address.community}</a><p>
    BODY
end

15.times do 
    Article.create!(title: Faker::Lorem.sentence(word_count: 5), 
        body: html_body_gen)
    end
