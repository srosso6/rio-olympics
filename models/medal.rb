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

  def event_medalists(event)

    gold_winner = {name: "", nation: ""}
    silver_winner = {name: "", nation: ""}
    bronze_winner = {name: "", nation: ""}

    event.athletes.each do |athlete|
      if athlete.id == event.gold_winner
        gold_winner[:name] = athlete.full_name
        gold_winner[:nation] = athlete.nation.code
      end
      if athlete.id == event.silver_winner
        silver_winner[:name] = athlete.full_name
        silver_winner[:nation] = athlete.nation.code
      end
      if athlete.id == event.bronze_winner
        bronze_winner[:name] = athlete.full_name
        bronze_winner[:nation] = athlete.nation.code
      end
    end
      return { event: "#{event.sport}: #{event.type}", gold: gold_winner, silver: silver_winner, bronze: bronze_winner }
  end

  def medalists_table()
    results = []
    @events.each do |event|
      results << event_medalists(event)
    end
    results.sort_by! { |event_stats| event_stats[:event] }
    return results
  end

end

