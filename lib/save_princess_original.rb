def displayPathtoPrincess(n,grid)
  mario = [] #row, column
  princess = []
  moves = []

  grid.each_with_index do |row, index|
    mario += [index, get_column(row, "m")] if row.include? "m"
    princess += [index, get_column(row, "p")] if row.include? "p"
  end

  row_moves, col_moves = mario[0]-princess[0], mario[1]-princess[1]

  row_moves > 0 ? moves += ["UP\n"] * row_moves.abs : moves += ["DOWN\n"] * row_moves.abs
  col_moves > 0 ? moves += ["LEFT\n"] * col_moves.abs : moves += ["RIGHT\n"] * col_moves.abs

  puts moves
end

def get_column(row, character)
  row.split("").index(character)
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
