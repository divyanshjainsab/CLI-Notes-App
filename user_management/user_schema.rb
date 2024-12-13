require './data_management/data_handling.rb';
require 'colorize'
module User

  include DataManupulation;

  def start
    menu_title("Notes App");
    # displaying list of available actions
    message_display;
  end

  def message_display
    print <<-MESSAGE
  #{"Please choose an option:".blue}
    #{"1. Register".green}
    #{"2. Login".green}
    #{"3. Exit".red}
    #{"# -> Navigate to Main Menu"}
    MESSAGE

    # from above options take uses input and process that
    user_action_taken;
  end

  # Gets the input form user and take action upon them
  def user_action_taken
    puts ('-'*50).green;
    print "Enter option number: ".blue

    # get the user input
    action_num = gets.chomp;

    # takes action upon the 
    # using case-when for taking action

    case action_num
    when '1' 
      menu_title("Register")
      user_register
    when "2"
      user_login
    when "3"
      menu_title("Thanks for Using me.")
      exit;
    when "#"
      message_display;
    else 
      puts "None of the Actions matched with your input.\nRetry!".red;
      user_action_taken;
    end
  end

  def getting_user_input
    # getting username
    print 'Enter Username: '.blue;
    user_name = gets.chomp;
    print 'Enter Password: '.blue;
    user_password = gets.chomp;
    
    # go to main menu if user wants
    if user_name == "#" || user_password == "#" then
      message_display 
      return;
    end

    green_line;
    return {:name => user_name, :password => user_password};
  end

  # registering user
  def user_register

    # getting user data
    user = getting_user_input;

    # importing data of existing users
    data = get_data;
    
    # checking for duplicate users
    data.each do |hash|
      if hash["name"].downcase == user[:name].downcase then
        puts "!!! User Already Exists !!!".center(50).red;

        # asking for login
        user_login;
        return;
      end
    green_line;
    end

    # as no user found with that data insert that

    user_data = {
      :name => user[:name],
      :password => user[:password],
      :notes => []
    }
    # adding user data to file
    append_data(user_data);

    menu_title("User #{user[:name]} is Successfully registered with us.");
    puts "Kindly Login Now.".blue;
    user_login;

  end

  def user_login
    menu_title("Login");
    user = getting_user_input;
    isVerified = false;
    get_data.each do |user_info|
      # password is case sensitive but username isn't.
      isVerified = true if user_info["name"].downcase == user[:name].downcase && user_info["password"] == user[:password];
      # match found then leave.
      break;
    end
    if isVerified then
      menu_title("Welcome #{user[:name].split(' ')[0]}");
      # todo
    else
      puts 'User Password or User Name is Incorrect'.center(50).red;
      user_login;
    end

  end

  # useless functions, just for formatting
  def green_line
    puts ('-'*50).green;
  end

  def menu_title(title)
    puts "\n"+('*'*50).green;
    puts title.center(50).yellow;
    puts ('*'*50 << "\n").green;
  end
end
