require './data_management/data_handling.rb';

module User

  include DataManupulation;

  def start
    # displaying list of available actions
    message_display;
    nil;
  end

  def message_display
    print <<-MESSAGE
  Please choose an option:
    1. Register
    2. Login
    3. Exit
    MESSAGE

    # from above options take uses input and process that
    user_action_taken;
  end

  # Gets the input form user and take action upon them
  def user_action_taken
    print "Enter option number: "

    # get the user input
    action_num = gets.to_i;

    # takes action upon the 
    # using case-when for taking action

    case action_num
    when 1 
      user_register
    when 2
      user_login
    when 3
      exit_program
    else 
      puts "None of Actions matched with your input.\nRetry!"
      user_action_taken;
    end
  end

  def getting_user_input
    # getting username
    print 'Enter Username: '
    user_name = gets.chomp;
    
    print 'Enter Password: '
    user_password = gets.chomp;

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
      if hash["userName"] == user[:name] then
        puts "User Already Exists!\nDo Login" ;

        # asking for login
        user_login;
        break;
      end
    end

    # as no user found with that data insert that

    user_data = {
      "userName": user[:name],
      "userPassword": user[:password],
      "notes": []
    }
    # adding user data to file
    append_data(user_data);

    puts "User #{user[:name]} is Successfully registered with us."
    puts "Kindly Login Now."
    user_login;

  end

  
end
