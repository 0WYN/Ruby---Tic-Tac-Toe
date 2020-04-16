class Game
    @@gameboard = Array.new(9, " ")
    @@rounds = 0

    def initialize
        @first_player = "x"
        @second_player = "o"
        self.play 
    end

    def winner?
        winning_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
        @@rounds += 1
        winning_combos.each do |combo|
            if @@gameboard[combo[0]] == @@gameboard[combo[1]] && @@gameboard[combo[1]] == @@gameboard[combo[2]] && !@@gameboard[combo[2]].strip.empty?
                puts "WINNER!"
                puts combo.join(",")
                exit
            elsif @@rounds == 9
                puts "DRAW!"
                exit
            end
        end
    end

    def print_board
        puts "#{@@gameboard[0]} | #{@@gameboard[1]} | #{@@gameboard[2]}\n" \
             "--+---+--\n" \
             "#{@@gameboard[3]} | #{@@gameboard[4]} | #{@@gameboard[5]}\n" \
             "--+---+--\n" \
             "#{@@gameboard[6]} | #{@@gameboard[7]} | #{@@gameboard[8]}"

             self.winner?
    end

    def change_board!(location, value)
        @@gameboard[location] = value
    end

    def play

        while @@gameboard.include?(" ") do
            puts "Player One please pick your location for your '#{@first_player}' (1-9)"
            @@gameboard[self.get_input] = @first_player
            self.print_board
            puts "Player Two please pick your location for your '#{@second_player}' (1-9)"
            @@gameboard[self.get_input] = @second_player
            self.print_board
        end
    end

    def get_input
        valid_range = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        input = gets.chomp.to_i
        if valid_range.include?(input) && @@gameboard[input - 1].strip.empty?
            return input - 1
        else 
            puts "Please enter a valid number"
            self.get_input
        end
    
    end

end

game = Game.new



