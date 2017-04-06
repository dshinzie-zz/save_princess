require_relative '../lib/save_princess.rb'
require 'minitest/autorun'

class SavePrincessTest < MiniTest::Test
  def test_initialized_data
    sp = SavePrincess.new(3, ["---", "-m-", "--p"])

    assert_equal sp.grid, ["---", "-m-", "--p"]
  end

  def test_get_column_returns_index
    sp = SavePrincess.new(3, [])
    mario_col = sp.get_column("--m", "m")
    assert_equal mario_col, 2

    princess_col = sp.get_column("p--", "p")
    assert_equal princess_col, 0
  end

  def test_get_column_returns_nil_for_no_letter
    sp = SavePrincess.new(3, [])
    mario_col = sp.get_column("---", "m")
    assert_equal mario_col, nil

    princess_col = sp.get_column("--m", "p")
    assert_equal princess_col, nil
  end

  def test_get_position_returns_positions
    sp = SavePrincess.new(3, ["---", "-m-", "--p"])

    assert_equal sp.get_positions, [[1,1], [2,2]]
  end
end
