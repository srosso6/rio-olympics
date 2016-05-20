require_relative('../db/sql_runner.rb')
require("date")
require('pry-byebug')

class Event

  attr_reader( :id, :sport, :type, :date )
  attr_accessor( :gold_winner, :silver_winner, :bronze_winner )

  def initialize(options)
    # binding.pry
    @id = options["id"].to_i
    @sport = options["sport"]
    @type = options["type"]
    @day = options["day"]
    @day = @day.class == Date ? @day : Date.parse(@day)
    @gold_winner = nil
    @silver_winner = nil
    @bronze_winner = nil
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
    sql = "INSERT INTO events (sport, type, day) VALUES ('#{@sport}', '#{@type}', '#{@day}' ) RETURNING *"
    events = SqlRunner.run(sql).first
    result = Event.new(events)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_events(sql)
  end

end