dir_path = "."

entries = Dir.entries(dir_path)
entries.each do |entry|
  puts entry
end

# puts entries