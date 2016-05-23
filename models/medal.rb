require("pry-byebug")

class Medal

  attr_accessor( :nations, :events )

  def initialize(nations, events)
    @nations = nations
    @events = events
  end

  def count_nation_medals_and_points(nation)
    gold = 0
    silver = 0
    bronze = 0
    points = 0

    athletes = nation.athletes()
    @events.each do |event|
      athletes.each do |athlete|
        case
          when athlete.id == event.gold_winner
            gold +=1
            points += 5
          when athlete.id == event.silver_winner
            silver +=1
            points += 3
          when athlete.id == event.bronze_winner
            bronze +=1
            points +=1
        end
      end
    end
      return { nation: nation.title, gold: gold, silver: silver, bronze: bronze, points: points }
  end

  def results_table()
    results = []
    @nations.each do |nation|
      results << count_nation_medals_and_points(nation)
    end
    results.sort_by! { |nation_stats| nation_stats[:points] }
    return results.reverse
  end

end

