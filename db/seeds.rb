# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Visit.delete_all
Visit.create  country: 'United States', visited_at: DateTime.now, load_time: 3.5
Visit.create  country: 'United States', visited_at: DateTime.now, load_time: 1.5
Visit.create  country: 'United States', visited_at: DateTime.now, load_time: 1.0
Visit.create  country: 'United States', visited_at: DateTime.now - 1.day, load_time: 4.5
Visit.create  country: 'United States', visited_at: DateTime.now - 1.day, load_time: 4.0
Visit.create  country: 'United States', visited_at: DateTime.now - 2.days, load_time: 3.5
Visit.create  country: 'United States', visited_at: DateTime.now - 2.days, load_time: 1.0
Visit.create  country: 'United States', visited_at: DateTime.now - 2.days, load_time: 3.5
Visit.create  country: 'United States', visited_at: DateTime.now - 3.days, load_time: 4.5
Visit.create  country: 'United States', visited_at: DateTime.now - 3.days, load_time: 3.0
Visit.create  country: 'Germany', visited_at: DateTime.now, load_time: 1.0
Visit.create  country: 'Germany', visited_at: DateTime.now, load_time: 2.0
Visit.create  country: 'Germany', visited_at: DateTime.now, load_time: 1.0
Visit.create  country: 'Germany', visited_at: DateTime.now, load_time: 3.0
Visit.create  country: 'Germany', visited_at: DateTime.now - 1.day, load_time: 4.0
Visit.create  country: 'Germany', visited_at: DateTime.now - 2.days, load_time: 2.0
Visit.create  country: 'Germany', visited_at: DateTime.now - 2.days, load_time: 1.0
Visit.create  country: 'Germany', visited_at: DateTime.now - 2.days, load_time: 3.0
Visit.create  country: 'Germany', visited_at: DateTime.now - 3.days, load_time: 3.5
Visit.create  country: 'South Korea', visited_at: DateTime.now, load_time: 2.0
Visit.create  country: 'South Korea', visited_at: DateTime.now, load_time: 2.5
Visit.create  country: 'South Korea', visited_at: DateTime.now, load_time: 1.0
Visit.create  country: 'South Korea', visited_at: DateTime.now, load_time: 1.5
Visit.create  country: 'South Korea', visited_at: DateTime.now - 1.day, load_time: 2.5
Visit.create  country: 'South Korea', visited_at: DateTime.now - 1.day, load_time: 4.0
Visit.create  country: 'South Korea', visited_at: DateTime.now - 1.day, load_time: 3.0
Visit.create  country: 'South Korea', visited_at: DateTime.now - 2.days, load_time: 1.0
Visit.create  country: 'South Korea', visited_at: DateTime.now - 3.days, load_time: 5.0
Visit.create  country: 'South Korea', visited_at: DateTime.now - 3.days, load_time: 4.0
Visit.create  country: 'South Korea', visited_at: DateTime.now - 3.days, load_time: 5.0

%w(apple cherry).each do |item|
  new_item = Item.create({title: item})
  1000.times do
    new_item.click_tracks.create!({created_at: rand(3.years.ago..Time.now) })
  end
end

ISO3166::Country.all.shuffle.first(50).each do |country|
  Country.create({name: country.name})
end

100.times { Sporter.create({
                               name: Faker::Name.name,
                               age: rand(18..50),
                               country_id: rand(1..50)
                           }) }

%w(tennis parachuting badminton archery chess boxing racing golf running skiing walking cycling surfing swimming skeleton).each {|c| Competition.create({title: c}) }

Competition.all.each do |competition|
  sporters = Sporter.all.shuffle.first(6)
  (1..6).each do |place|
    CompetitionResult.create({
                                 sporter_id: sporters.pop.id,
                                 competition_id: competition.id,
                                 place: place,
                                 created_at: rand(5.years.ago..Time.now)
                             })
  end
end
