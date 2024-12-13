require "json";
FILE_PATH = "data_management/data.json";


module DataManupulation
  
  def get_data
    File.open(FILE_PATH, 'r') do |file|
      # Reading and parsing the file content
      file_content = file.read
      # Parse the JSON content and return it
      return JSON.parse(file_content);
    end
  end

  def append_data(data)
    # getting data first because in opening file data became null
    file_data = get_data;
    # opening file
    File.open(FILE_PATH,'w') do |file|
      # appending data 
      file_data << data; 
      # writing data to file
      file.write(JSON.generate(file_data));
    end

    # returning nil to prevent from data breach
    return nil;
  end

end
