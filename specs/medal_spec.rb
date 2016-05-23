require( "minitest/autorun" )
require_relative( "../models/medal.rb" )
require_relative( "../models/athlete.rb" )
require_relative( "../models/event.rb")
require_relative( "../models/nation.rb")

class TestMedal < Minitest::Test

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

    athletes = athletes_data.map { |athlete| Athlete.new(athlete) }


    events_data = [
      {"id" => 1, "sport" => "Athletics", "type" => "10,000m", "day" => Date.new(2016, 05, 20) },
      {"id" => 2, "sport" => "Athletics", "type" => "High Jump", "day" => Date.new(2016, 05, 21) },
      {"id" => 3, "sport" => "Athletics", "type" => "Javelin Throw", "day" => Date.new(2016, 05, 22) }
      ]

      events = events_data.map { |event| Event.new(event) }

      events[0].gold_winner = athletes[0].id
      events[0].silver_winner = athletes[6].id
      events[0].bronze_winner = athletes[3].id
      events[1].gold_winner = athletes[4].id
      events[1].silver_winner = athletes[7].id
      events[1].bronze_winner = athletes[1].id
      events[2].gold_winner = athletes[8].id
      events[2].silver_winner = athletes[5].id
      events[2].bronze_winner = athletes[2].id

      @medal_1 = Medal.new(nations, events)

  end

  def test_count_nation_medals_and_points()
    assert_equal({ nation: @nation_1.title, gold: 1, silver: 0, bronze: 2, points: 7 }, @medal_1.count_nation_medals_and_points(@nation_1))
    assert_equal({ nation: @nation_4.title, gold: 1, silver: 1, bronze: 1, points: 9 }, @medal_1.count_nation_medals_and_points(@nation_4))
    assert_equal({ nation: @nation_6.title, gold: 1, silver: 2, bronze: 0, points: 11 }, @medal_1.count_nation_medals_and_points(@nation_6))
  end 

  def test_results_table()
    assert_equal( 
      [ { nation: @nation_6.title, gold: 1, silver: 2, bronze: 0, points: 11 }, 
        { nation: @nation_4.title, gold: 1, silver: 1, bronze: 1, points: 9 }, 
        { nation: @nation_1.title, gold: 1, silver: 0, bronze: 2, points: 7 } ],
      @medal_1.results_table())
  end

  def test_result()
    assert_equal(1, @medal_1.count_nation_medals_and_points(@nation_6)[:gold])
  end

end