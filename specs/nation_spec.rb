require( "minitest/autorun" )
require_relative( "../models/nation.rb" )

class TestNation < Minitest::Test

  def setup

    @nation_1 = Nation.new( { "id" => 1, "title" => "Canada", "code" => "CAN" } )
    @nation_4 = Nation.new( { "id" => 4, "title" => "Brazil", "code" => "BRA" } )
    @nation_6 = Nation.new( { "id" => 6, "title" => "Great Britain", "code" => "GBR" } )

    nations = [@nation_1, @nation_4, @nation_6]
  end

end