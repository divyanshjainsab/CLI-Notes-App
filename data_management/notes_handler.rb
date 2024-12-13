module Notes
    # grabs the data about all users and current user
    def user_initailize(current_user)
        @all_user_data = get_data;
        @user_notes =  @all_user_data.filter {|user| user["name"] == current_user[:name]}[0]["notes"];

        # list available options
        user_notes_options
    end

    def user_notes_options
        green_line;
        puts <<-MESSAGE
    #{"Please choose an option : ".blue}
        #{"1. Create Note".green}
        #{"2. View Notes".green}
        #{"3. Update Note".green}
        #{"4. Delete Note".green}
        #{"5. Export Specific Note to PDF".green}
        #{"6. Exit".red}
        # -> Logout and goto Main Menu
        MESSAGE
        green_line;
        # process the input and action
        input_and_action;
    end

    def input_and_action
        print "Enter a Option Number : ".blue;
        input = gets.chomp;
        case input
        when "1" 
            create_note;
        when "2" 
            view_notes;
            user_notes_options;
        when "3" 
            update_note;
        when "4" 
            delete_note;
        when "5" 
            export_note;
        when "6" 
            save_data(@all_user_data);
            exit;
        when "#"
            # resetting everything
            @user_notes = nil;
            @all_user_data = nil;
            start;
        else
            puts "Choose an Approprite option form list again".center(50).red;
            user_notes_options;
        end
    end

    def create_note
        print 'Enter Note : '.blue;
        note = gets.chomp;
        @user_notes.push(note);
        puts 'Note Added Sucessfully.'.green;
        user_notes_options;
    end

    def view_notes
        if  @user_notes.length == 0 then
            puts "No Notes Available!\nAdd Some".red;
        else
        menu_title('Available Notes');
        @user_notes.each_with_index do |ele,idx|
            puts "#{idx+1}. #{ele}".yellow;
        end
        end
    end

    def delete_note
        view_notes;
        print 'Enter Note Number to Delete : '.blue;
        note_num = gets.to_i;
        if note_num == 0 then 
            "As Entered Number wasn't Matched.\nNothing Deleted.";
        else 
            @user_notes.delete_at(note_num - 1);
            puts "Note Deleted Successfully.".red;
        end
        green_line;
        user_notes_options;
    end

    def update_note
      view_notes;
        print 'Enter Note Number to Update : '.blue;
        note_num = gets.to_i;

        print "Enter New Note : ".blue;
        new_note = gets.chomp;

        if note_num == 0 then 
            "As Entered Number wasn't Matched.\nNothing Updated.";
        else 
            @user_notes[note_num - 1] = new_note;
            puts "Note Updated Successfully.".green;
        end
        green_line;
        user_notes_options;
    end  


end
