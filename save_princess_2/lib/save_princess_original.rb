def nextMove(n,r,c,grid)
  mario = [r, c] #row, column
  princess = []
  moves = []

  grid.each_with_index do |row, index|
    princess += [index, get_column(row, "p")] if row.include? "p"
  end

  row_moves, col_moves = mario[0]-princess[0], mario[1]-princess[1]

  row_moves > 0 ? moves += ["UP\n"] * row_moves.abs : moves += ["DOWN\n"] * row_moves.abs
  col_moves > 0 ? moves += ["LEFT\n"] * col_moves.abs : moves += ["RIGHT\n"] * col_moves.abs

  puts moves.first
end

def get_column(row, character)
  row.split("").index(character)
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
