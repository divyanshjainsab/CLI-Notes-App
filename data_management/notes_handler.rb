module Notes
    # grabs the data about all users and current user
    def user_initailize(current_user)
        @all_user_data = get_data;
        @user_notes =  @all_user_data.filter {|user| user['name'] == current_user[:name]}[0]["notes"];
        save_and_exit(@all_user_data);
    end
end
