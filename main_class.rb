require './data_management/data_handling.rb';
require './user_management/user_schema.rb';

class Main
  extend User;
  extend DataManupulation;
end

# Main.append_data({
#   "username"=> "null",
#   "userPassword"=> "not-given",
#   "notes"=> [
#     {
#       "title"=> "undefined",
#       "content"=> "undefined"
#     }
#   ]
# });

# puts Main.get_data;

Main.start;
