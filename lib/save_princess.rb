class SavePrincess

  attr_reader :grid

  def initialize(size, grid)
    @grid = grid
  end

  def get_column(row, character)
    row.split("").index(character)
  end

  def get_positions(mario=[], princess=[])
    grid.each_with_index do |row, index|
      mario += [index, get_column(row, "m")] if row.include? "m"
      princess += [index, get_column(row, "p")] if row.include? "p"
    end
    return [mario, princess]
  end

  def populate_moves(row_moves, col_moves, moves=[])
    row_moves > 0 ? moves += ["UP\n"] * row_moves.abs : moves += ["DOWN\n"] * row_moves.abs
    col_moves > 0 ? moves += ["LEFT\n"] * col_moves.abs : moves += ["RIGHT\n"] * col_moves.abs
    return moves
  end

  def display_path_to_princess
    mario, princess = get_positions
    row_moves, col_moves = mario[0] - princess[0], mario[1] - princess[1]
    puts populate_moves(row_moves, col_moves)
  end
end

# sp = SavePrincess.new(3, ["---", "-m-",  "--p"])
# sp.display_path_to_princess
