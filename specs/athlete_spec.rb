require( "minitest/autorun" )
require_relative( "../models/athlete.rb" )
require_relative( "../models/nation.rb" )

class TestAthlete < Minitest::Test

  def setup

    @nation_1 = Nation.new( { "id" => 1, "title" => "Canada", "code" => "CAN" } )
    @nation_4 = Nation.new( { "id" => 4, "title" => "Brazil", "code" => "BRA" } )
    @nation_6 = Nation.new( { "id" => 6, "title" => "Great Britain", "code" => "GBR" } )

    nations = [@nation_1, @nation_4, @nation_6]
      

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

  def test_full_name()
    assert_equal("Aaron Brown", @athletes[0].full_name())
  end

end