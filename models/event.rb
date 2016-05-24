require_relative('../db/sql_runner.rb')
require("date")
require('pry-byebug')

class Event

  attr_reader( :id, :sport, :type, :day )
  attr_accessor( :gold_winner, :silver_winner, :bronze_winner )

  def initialize(options)
    @id = options["id"].to_i
    @sport = options["sport"]
    @type = options["type"]
    @day = options["day"]
    @day = @day.class == Date ? @day : Date.parse(@day)
    @gold_winner = 0
    @silver_winner = 0
    @bronze_winner = 0
    if options.has_key?("gold_winner") 
      @gold_winner = options["gold_winner"].to_i
      @silver_winner = options["silver_winner"].to_i
      @bronze_winner = options["bronze_winner"].to_i
    end
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def self.map_events(sql)
    events = SqlRunner.run(sql)
    result = events.map { |event| Event.new(event) }
    return result
  end

  def self.map_event(sql)
    result = Event.map_events(sql)
    return result.first
  end

  def save()
    sql = "INSERT INTO events (sport, type, day) VALUES ('#{@sport}', '#{@type}', '#{@day}') RETURNING *;"
    return Event.map_event(sql)
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_events(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events
      WHERE events.id = #{id};"
    return Event.map_event(sql)
  end

  def self.update(options)
    sql = "UPDATE events SET 
      sport = '#{options['sport']}',
      type = '#{options['type']}',
      day = '#{options['day']}',
      gold_winner = #{options['gold_winner']},
      silver_winner = #{options['silver_winner']},
      bronze_winner = #{options['bronze_winner']}
      WHERE events.id = #{options['id']};"
    begin
      SqlRunner.run(sql)
    rescue PG::CheckViolation
    end
  end

  # def self.delete_all()
  #   sql = "DELETE FROM events"
  #   SqlRunner.run(sql)
  # end

  def self.delete_all()
    sql = "TRUNCATE TABLE events RESTART IDENTITY CASCADE;"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM events
      WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def athletes()
    sql = "SELECT a.* FROM athletes a
      INNER JOIN athletes_events ae
      ON a.id = ae.athlete_id
      WHERE ae.event_id = #{@id};"
    return Athlete.map_athletes(sql)
  end

  def add_athlete(athlete)
    sql = "INSERT INTO athletes_events (athlete_id, event_id) VALUES (#{athlete.id}, #{@id});"
    begin
      SqlRunner.run(sql)
    rescue PG::UniqueViolation
    end
  end

  def add_athletes(athletes)
    athletes.each do |athlete|
      add_athlete(athlete)
    end
  end

  def delete_athlete(athlete)
    sql = "DELETE FROM athletes_events
      WHERE athletes_events.athlete_id = #{athlete.id};"
    SqlRunner.run(sql)
  end

  def delete_athletes(athletes)
    athletes.each do |athlete|
      delete_athlete(athlete)
    end
  end

  def update_winners()
    sql = "UPDATE events SET 
      gold_winner = '#{@gold_winner}',
      silver_winner = '#{@silver_winner}',
      bronze_winner = '#{@bronze_winner}'
      WHERE events.id = #{@id};"
    SqlRunner.run(sql)
  end

  def add_gold_winner(athlete)
    @gold_winner = athlete.id
    update_winners()
  end

  def add_silver_winner(athlete)
    @silver_winner = athlete.id
    update_winners()
  end

  def add_bronze_winner(athlete)
    @bronze_winner = athlete.id
    update_winners()
  end

  def add_winners(athlete_1, athlete_2, athlete_3)
    @gold_winner = athlete_1.id
    @silver_winner = athlete_2.id
    @bronze_winner = athlete_3.id
    update_winners()
  end

  def date_has_passed?(day)
    Date.today > day 
  end

end