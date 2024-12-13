require './user_management/user_schema.rb';

class Main
  extend User;
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
# p Main.get_data.filter {|user| user["name"] == "Divyansh Jain"}[0]["notes"];