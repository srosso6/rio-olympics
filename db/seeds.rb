require('pry-byebug')
require_relative('../models/nation.rb')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require("date")

Nation.delete_all()
Athlete.delete_all()
Event.delete_all()

nation_1 = Nation.new( { "title" => "Canada", "code" => "CAN" } ).save()
nation_2 = Nation.new( { "title" => "United States", "code" => "USA" } ).save()
nation_3 = Nation.new( { "title" => "Mexico", "code" => "MEX" } ).save()
nation_4 = Nation.new( { "title" => "Brazil", "code" => "BRA" } ).save()
nation_5 = Nation.new( { "title" => "Argentina", "code" => "ARG" } ).save()
nation_6 = Nation.new( { "title" => "Great Britain", "code" => "GBR" } ).save()
nation_7 = Nation.new( { "title" => "Sweden", "code" => "SWE" } ).save()
nation_8 = Nation.new( { "title" => "Greece", "code" => "GRE" } ).save()
nation_9 = Nation.new( { "title" => "Japan", "code" => "JPN" } ).save()
nation_10 = Nation.new( { "title" => "New Zealand", "code" => "NZL" } ).save()
nation_11 = Nation.new( { "title" => "Madagasca", "code" => "MAD" } ).save()
nation_12 = Nation.new( { "title" => "South Africa", "code" => "RSA" } ).save()


events_data = [
 {"sport" => "Athletics", "type" => "10,000m", "day" => Date.new(2016, 05, 20), },
 {"sport" => "Athletics", "type" => "High Jump", "day" => Date.new(2016, 05, 21), },
 {"sport" => "Athletics", "type" => "Javelin Throw", "day" => Date.new(2016, 05, 22), },
 {"sport" => "Artistic Gymnastics", "type" => "Pommel Horse", "day" => Date.new(2016, 05, 23), },
 {"sport" => "Artistic Gymnastics", "type" => "Vault", "day" => Date.new(2016, 05, 24), },
 {"sport" => "Artistic Gymnastics", "type" => "Uneven bars", "day" => Date.new(2016, 05, 25), },
 {"sport" => "Swimming", "type" => "100m butterfly", "day" => Date.new(2016, 05, 26), },
 {"sport" => "Swimming", "type" => "50m freestyle", "day" => Date.new(2016, 05, 27), },
 {"sport" => "Diving", "type" => "3m springboard", "day" => Date.new(2016, 05, 28), } ,
 {"sport" => "Diving", "type" => "10m platform", "day" => Date.new(2016, 05, 29), }
]


athletes_data = [ 
  {"first_name" => "Aaron", "last_name" => "Brown", "gender" => "m", "nation_id" => nation_1.id},
  {"first_name" => "Phil", "last_name" => "Edwards", "gender" => "m", "nation_id" => nation_1.id},
  {"first_name" => "Lauren", "last_name" => "Regula", "gender" => "f", "nation_id" => nation_1.id},
  {"first_name" => "Hugh", "last_name" => "Smith", "gender" => "m", "nation_id" => nation_1.id},
  {"first_name" => "Kyle", "last_name" => "Shewfelt", "gender" => "m", "nation_id" => nation_1.id},
  {"first_name" => "Christine", "last_name" => "Lee", "gender" => "f", "nation_id" => nation_1.id},
  {"first_name" => "Alec", "last_name" => "Page", "gender" => "m", "nation_id" => nation_1.id},
  {"first_name" => "Jennifer", "last_name" => "Song", "gender" => "f", "nation_id" => nation_1.id},
  {"first_name" => "Maxim", "last_name" => "Bouchard", "gender" => "m", "nation_id" => nation_1.id},
  {"first_name" => "Pamela", "last_name" => "Ware", "gender" => "f", "nation_id" => nation_1.id},
  {"first_name" => "Nilson", "last_name" => "Andre", "gender" => "m", "nation_id" => nation_4.id},
  {"first_name" => "Caio", "last_name" => "Bonfim", "gender" => "m", "nation_id" => nation_4.id},
  {"first_name" => "Geisa", "last_name" => "Arcanjo", "gender" => "f", "nation_id" => nation_4.id},
  {"first_name" => "Arthur", "last_name" => "Zanetti", "gender" => "m", "nation_id" => nation_4.id},
  {"first_name" => "Diego", "last_name" => "Hypolito", "gender" => "m", "nation_id" => nation_4.id},
  {"first_name" => "Lais", "last_name" => "Souza", "gender" => "f", "nation_id" => nation_4.id},
  {"first_name" => "Henrique", "last_name" => "Barbosa", "gender" => "m", "nation_id" => nation_4.id},
  {"first_name" => "Nayara", "last_name" => "Figueira", "gender" => "f", "nation_id" => nation_4.id},
  {"first_name" => "Cesar", "last_name" => "Castro", "gender" => "m", "nation_id" => nation_4.id},
  {"first_name" => "Ana", "last_name" => "Rodrigues", "gender" => "f", "nation_id" => nation_4.id},
  {"first_name" => "Mo", "last_name" => "Farah", "gender" => "m", "nation_id" => nation_6.id},
  {"first_name" => "Greg", "last_name" => "Rutherford", "gender" => "m", "nation_id" => nation_6.id},
  {"first_name" => "Jessica", "last_name" => "Ennis-Hill", "gender" => "f", "nation_id" => nation_6.id},
  {"first_name" => "Joe", "last_name" => "Fraser", "gender" => "m", "nation_id" => nation_6.id},
  {"first_name" => "Louis", "last_name" => "Smith", "gender" => "m", "nation_id" => nation_6.id},
  {"first_name" => "Ellie", "last_name" => "Downie", "gender" => "f", "nation_id" => nation_6.id},
  {"first_name" => "Duncan", "last_name" => "Scott", "gender" => "m", "nation_id" => nation_6.id},
  {"first_name" => "Rebecca", "last_name" => "Adlington", "gender" => "f", "nation_id" => nation_6.id},
  {"first_name" => "Tom", "last_name" => "Daley", "gender" => "m", "nation_id" => nation_6.id},
  {"first_name" => "Tonia", "last_name" => "Couch", "gender" => "f", "nation_id" => nation_6.id},
  {"first_name" => "Yuki", "last_name" => "Ebihara", "gender" => "m", "nation_id" => nation_9.id},
  {"first_name" => "Masashi", "last_name" => "Eriguchi", "gender" => "m", "nation_id" => nation_9.id},
  {"first_name" => "Tomomi", "last_name" => "Abiko", "gender" => "f", "nation_id" => nation_9.id},
  {"first_name" => "Masaki", "last_name" => "Ito", "gender" => "m", "nation_id" => nation_9.id},
  {"first_name" => "Ryohei", "last_name" => "Kato", "gender" => "m", "nation_id" => nation_9.id},
  {"first_name" => "Ayano", "last_name" => "Kishi", "gender" => "f", "nation_id" => nation_9.id},
  {"first_name" => "Kosuke", "last_name" => "Kitajima", "gender" => "m", "nation_id" => nation_9.id},
  {"first_name" => "Hanae", "last_name" => "Ito", "gender" => "f", "nation_id" => nation_9.id},
  {"first_name" => "Shunsuke", "last_name" => "Ando", "gender" => "m", "nation_id" => nation_9.id},
  {"first_name" => "Mai", "last_name" => "Nakagawa", "gender" => "f", "nation_id" => nation_9.id},
  {"first_name" => "Lusapho", "last_name" => "April", "gender" => "m", "nation_id" => nation_12.id},
  {"first_name" => "Willem", "last_name" => "Coertzen", "gender" => "m", "nation_id" => nation_12.id},
  {"first_name" => "Rene", "last_name" => "Kalmer", "gender" => "f", "nation_id" => nation_12.id},
  {"first_name" => "Matthew", "last_name" => "Brittain", "gender" => "m", "nation_id" => nation_12.id},
  {"first_name" => "Philip", "last_name" => "Buys", "gender" => "m", "nation_id" => nation_12.id},
  {"first_name" => "Dirkie", "last_name" => "Chamberlain", "gender" => "f", "nation_id" => nation_12.id},
  {"first_name" => "Heerden", "last_name" => "Herman", "gender" => "m", "nation_id" => nation_12.id},
  {"first_name" => "Trudi", "last_name" => "Maree", "gender" => "f", "nation_id" => nation_12.id},
  {"first_name" => "Noko", "last_name" => "Matlou", "gender" => "m", "nation_id" => nation_12.id},
  {"first_name" => "Marsha", "last_name" => "Marescia", "gender" => "f", "nation_id" => nation_12.id}
  ]

athletes = athletes_data.map { |athlete| Athlete.new(athlete).save() }

events = events_data.map { |event| Event.new(event).save() }


i = 0
while i<events.length
 events[i].add_athletes([athletes[i], athletes[i+10], athletes[i+20], athletes[i+30], athletes[i+40]])
i += 1
end


# puts Nation.find(1).title

# n4_athletes = nation_4.athletes()
# n4_athletes.each { |athlete| puts athlete.full_name() }

# puts athletes[10].nation().title

# athletes_in_2 = event_2.athletes()
# athletes_in_2.each { |athlete| puts athlete.full_name() }







