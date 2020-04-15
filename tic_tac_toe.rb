class Game
    @@gameboard = Array.new(9, " ")
    @@is_winner = false

    def initialize(first_player)
        @first_player = first_player
    end

    def winner?
        winning_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
        #0,1,2 - top row
        #3,4,5 - middle row
        #6,7,8 - bottom row
        #0,3,6 - left column
        #1,4,7 - middle column
        #2,5,8 - right column
        #0,4,8 - back slash
        #6,4,2 - forward slash
        winning_combos.each do |combo|
            if @@gameboard[combo[0]] == @@gameboard[combo[1]] && @@gameboard[combo[1]] == @@gameboard[combo[2]] && !@@gameboard[combo[2]].strip.empty?
                puts "WINNER!"
                puts combo.join(",")
            end
        end
    end

    def print_board
        puts "#{@@gameboard[0]} | #{@@gameboard[1]} | #{@@gameboard[2]}\n" \
             "--+---+--\n" \
             "#{@@gameboard[3]} | #{@@gameboard[4]} | #{@@gameboard[5]}\n" \
             "--+---+--\n" \
             "#{@@gameboard[6]} | #{@@gameboard[7]} | #{@@gameboard[8]}"
    end

    def change_board!(location, value)
        @@gameboard[location] = value
    end

    def to_s
    if self.nil?
        print "jkfslj;adskl"
    else super
    end
    end
end


game = Game.new("x")
#game.print_board
#game.change_board!(0, "x")
#game.change_board!(3, "x")
game.change_board!(6, "x")
game.print_board
game.winner?

