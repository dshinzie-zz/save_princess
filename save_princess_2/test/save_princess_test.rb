require_relative '../lib/save_princess.rb'
require 'minitest/autorun'

class SavePrincessTest < MiniTest::Test
  def test_initialized_data
    sp = SavePrincess.new(5, [2, 3], ["p----", "-----", "-----", "-----", "----m"])

    assert_equal sp.grid, ["p----", "-----", "-----", "-----", "----m"]
    assert_equal sp.mario, [2, 3]
  end

  def test_get_column_returns_index
    sp = SavePrincess.new(5, [1, 1], [])

    princess_col = sp.get_column("p--", "p")
    assert_equal princess_col, 0
  end

  def test_get_column_returns_nil_for_no_letter
    sp = SavePrincess.new(3,[],[])
    mario_col = sp.get_column("---", "m")
    assert_equal mario_col, nil

    princess_col = sp.get_column("--m", "p")
    assert_equal princess_col, nil
  end

  def test_get_position_returns_positions_array
    sp = SavePrincess.new(3, [1, 1], ["---", "-m-", "--p"])

    assert_equal sp.get_positions, [[1,1], [2,2]]
  end

  def test_populate_next_move_returns_moves_array
    sp = SavePrincess.new(3, [1, 1], ["---", "-m-", "--p"])

    assert_equal sp.populate_next_move(1, 1), "UP\n"
    assert_equal sp.populate_next_move(0, 1), "LEFT\n"
    assert_equal sp.populate_next_move(-1, 0), "DOWN\n"
    assert_equal sp.populate_next_move(-1, 1), "DOWN\n"
    assert_equal sp.populate_next_move(-1, -1), "DOWN\n"

    assert_equal sp.populate_next_move(2, 1), "UP\n"
    assert_equal sp.populate_next_move(2, -2), "UP\n"
  end

  def test_returns_moves_for_3_by_3
    sp = SavePrincess.new(3, [1, 1], ["---", "-m-", "--p"])
    out, err = capture_io do
      sp.display_path_to_princess
    end

    assert_equal out, "DOWN\n"
  end

  def test_returns_moves_for_3_by_3_maximum_distance
    sp = SavePrincess.new(3, [1, 1], ["p--", "---", "--m"])
    out, err = capture_io do
      sp.display_path_to_princess
    end

    assert_equal out, "UP\n"
  end

  def test_returns_moves_for_5_by_5
    sp = SavePrincess.new(5, [1, 1], ["p----", "-----", "--m--", "-----", "-----"])
    out, err = capture_io do
      sp.display_path_to_princess
    end

    assert_equal out, "UP\n"
  end

  def test_returns_moves_for_5_by_5_maximum_distance
    sp = SavePrincess.new(5, [1, 1], ["p----", "-----", "-----", "-----", "----m"])
    out, err = capture_io do
      sp.display_path_to_princess
    end

    assert_equal out, "UP\n"
  end
end
