require( "minitest/autorun" )
require_relative( "../models/event.rb" )
require("date")

class TestEvent < Minitest::Test

  def setup

    events_data = [
      {"id" => 1, "sport" => "Athletics", "type" => "10,000m", "day" => Date.new(2016, 05, 20) },
      {"id" => 2, "sport" => "Athletics", "type" => "High Jump", "day" => Date.new(2016, 05, 24) },
      {"id" => 3, "sport" => "Athletics", "type" => "Javelin Throw", "day" => Date.new(2016, 05, 26) }
      ]

      @events = events_data.map { |event| Event.new(event) }

    end

    def test_format_date()
      assert_equal("20/05/2016", @events[0].format_date(@events[0].day))
    end

    def test_date_has_passed?()
      assert_equal(true, @events[0].date_has_passed?(@events[0].day))
      assert_equal(false, @events[1].date_has_passed?(@events[1].day))
      assert_equal(false, @events[2].date_has_passed?(@events[2].day))
    end

  end