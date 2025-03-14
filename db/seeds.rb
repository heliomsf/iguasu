require 'csv'
require 'smarter_csv'

#Place.create([
# { name: 'Nascente', latitude: -25.49334671422468, longitude: -48.97783081628372 },
# { name: 'Foz', latitude: -25.690558614557588, longitude: -54.44000254026623 }
#])

# Path to the CSV file
csv_file_path = Rails.root.join('db', 'seeds', 'entries.csv')

# Print the CSV file path
puts "Using CSV file: #{csv_file_path}"

# Preprocess the CSV file to handle escaped characters
def preprocess_csv(file_path)
  temp_file_path = file_path.to_s + '.tmp'
  File.open(temp_file_path, 'w') do |temp_file|
    File.foreach(file_path) do |line|
      # Replace escaped semicolons and quotes
      line.gsub!('\;', ';')
      line.gsub!('\"', '"')
      temp_file.puts(line)
    end
  end
  temp_file_path
end

# Preprocess the CSV file
preprocessed_csv_file_path = preprocess_csv(csv_file_path)

# Read and print the first few rows of the preprocessed CSV file
puts "First few rows of the preprocessed CSV file:"
SmarterCSV.process(preprocessed_csv_file_path, col_sep: ';', quote_char: '"', chunk_size: 5) do |chunk|
  chunk.each do |row|
    puts row
  end
end

# Read the preprocessed CSV file and insert the data into the entries table
SmarterCSV.process(preprocessed_csv_file_path, col_sep: ';', quote_char: '"') do |array|
  array.each do |row|
    entry = Entry.new(
      pdfUrl: row[:pdfurl],
      ref: row[:ref],
      author: row[:author],
      recipient: row[:recipient],
      title: row[:title],
      placeId: row[:placeid],
      placeName: row[:placename],
      date1: row[:date1],
      date2: row[:date2],
      date3: row[:date3],
      document: row[:document],
      description: row[:description]
    )
   if entry.save
      puts "Entry created: #{entry.inspect}"
   else
     puts "Failed to create entry: #{entry.errors.full_messages.join(', ')}"
   end
  end
end

# Clean up the temporary file
File.delete(preprocessed_csv_file_path) if File.exist?(preprocessed_csv_file_path)
