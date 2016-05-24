require( "minitest/autorun" )
require_relative( "../models/athlete.rb" )

class TestAthlete < Minitest::Test

  def setup

    athletes_data = [ 
      {"id" => 1,"first_name" => "Aaron", "last_name" => "Brown", "gender" => "m", "nation_id" => @nation_1.id},
      {"id" => 2,"first_name" => "Phil", "last_name" => "Edwards", "gender" => "m", "nation_id" => @nation_1.id},
      {"id" => 3,"first_name" => "Lauren", "last_name" => "Regula", "gender" => "f", "nation_id" => @nation_1.id},
      {"id" => 11, "first_name" => "Nilson", "last_name" => "Andre", "gender" => "m", "nation_id" => @nation_4.id},
      {"id" => 12,"first_name" => "Caio", "last_name" => "Bonfim", "gender" => "m", "nation_id" => @nation_4.id},
      {"id" => 13,"first_name" => "Geisa", "last_name" => "Arcanjo", "gender" => "f", "nation_id" => @nation_4.id},
      {"id" => 21, "first_name" => "Mo", "last_name" => "Farah", "gender" => "m", "nation_id" => @nation_6.id},
      {"id" => 22, "first_name" => "Greg", "last_name" => "Rutherford", "gender" => "m", "nation_id" => @nation_6.id},
      {"id" => 23, "first_name" => "Jessica", "last_name" => "Ennis-Hill", "gender" => "f", "nation_id" => @nation_6.id},
      ]

      @athletes = athletes_data.map { |athlete| Athlete.new(athlete) }

  end

end