require 'find'

# Create progress subfolder if it doesn't exist
Dir.mkdir("progress") unless File.exists?("progress")

# Open or create a new file in 'progress' subfolder
File.open("progress/progress.rb", 'w') do |output_file|

  # Search for all Ruby files in the current directory
  Dir.glob("**/*.rb").each do |file|

    # Skip the output file itself
    next if file == "progress/progress.rb"

    # Read and append each file's content to output file
    File.open(file, 'r') do |input_file|
      output_file.write("# {file} start\n")
      output_file.write(input_file.read)
      output_file.write("\n# {file} end\n\n")
    end
  end
end