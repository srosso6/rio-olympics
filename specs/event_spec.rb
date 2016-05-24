require( "minitest/autorun" )
require_relative( "../models/event.rb" )
require("date")

class TestEvent < Minitest::Test

  def setup

    events_data = [
     {"sport" => "Athletics", "type" => "10,000m", "day" => Date.new(2016, 05, 20) },
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

    @events = events_data.map { |event| Event.new(event) }

    end

    def test_date_has_passed?()
      assert_same(true, @events[0].date_has_passed?(@events[0].day))
      assert_same(false, @events[4].date_has_passed?(@events[4].day))
      assert_same(false, @events[9].date_has_passed?(@events[9].day))
    end

  end