@commands = %w[mv cp mkdir ls rm]

def valid_selection?(num)
    num_commands = @commands.size
    /^[1-#{num_commands}]{1}$/ === num
end


def list_available_commands
    puts "Available commands"
    @commands.each_index { |x| print x + 1, ". #{@commands[x]} \n"}

    puts "Select your command"
    selection = gets.chomp
    if valid_selection?(selection)
        return selection
    else
        puts "Invalid selection, try again"
        list_available_commands
    end
end

def get_man_page(cmd)
    puts `man #{cmd}`
end

def print_menu
    puts "-----------------------------"
    puts "\n Cheatsheet"
    puts "1) Command Line"
    puts "2) Search"
    puts "3) Exit"
    puts "--Make a selection--"
    menu
end

def menu
   selection = gets.chomp.to_i

   case selection
    when 1
        selection = list_available_commands
        get_man_page(@commands[selection.to_i - 1])
        print_menu
    when 2
        puts "Enter the command you want to search."
        command = gets.chomp
        get_man_page(command)
        print_menu
    when 3
        puts "Goodbye"
    else
        puts "Invalid input, try again"
        print_menu
   end

end

print_menu

