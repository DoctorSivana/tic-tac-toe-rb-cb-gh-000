def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def input_to_index(input)
  index = (input).to_i - 1

end

def move(board , index , character)
  board[index] == character

end

def position_taken?(board , index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    true
  else
    false
  end
end

def valid_move?(board , index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  else
    nil
  end
end

def turn(board)
  puts "Choose a move between 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board ,index)
    move(board , index , character)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |item|
    if item == "X" || item == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)

  (turn_count(board) % 2 ==0 )?
   "X" : "O"

end

def won?(board)
   WIN_COMBINATIONS.each do |win_combination|

    position_1 = board[win_combination[0]]

    position_2 = board[win_combination[1]]

    position_3 = board[win_combination[2]]


    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")

      return win_combination
      break
    end
  end
  return false
end

def full?(board)
  !board.any? do |elements|
    elements == " "
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end

def play(board)

  until over?(board)
    turn(board)
  end
if won?(board)
  puts "congratulations #{board[won?(board)[0]]}"
elsif draw?(board)
  puts "Cat's Game!"
end
end
