require('pry-byebug')
require_relative('../models/nation.rb')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require("date")

Nation.delete_all()
Athlete.delete_all()
Event.delete_all()

nation_1 = Nation.new( { "title" => "Argentina", "code" => "ARG" } ).save()
nation_2 = Nation.new( { "title" => "Canada", "code" => "CAN" } ).save()
nation_3 = Nation.new( { "title" => "Great Britain", "code" => "GBR" } ).save()

athlete_1 = Athlete.new( {"first_name" => "", "last_name" => "", "gender" => "m", "nation_id" => nation_1.id} ).save()
athlete_2 = Athlete.new( {"first_name" => "", "last_name" => "", "gender" => "m", "nation_id" => nation_2.id} ).save()
athlete_3 = Athlete.new( {"first_name" => "", "last_name" => "", "gender" => "m", "nation_id" => nation_3.id} ).save()

event_1 = Event.new( {"sport" => "Athletics", "type" => "Javelin", "day" => Date.new(2016, 05, 22), } ).save()
event_2 = Event.new( {"sport" => "Athletics", "type" => "100M", "day" => Date.new(2016, 05, 23), } ).save()
event_3 = Event.new( {"sport" => "Artistic Gymnastics", "type" => "Pommel Horse", "day" => Date.new(2016, 05, 24), } ).save()

Event.all