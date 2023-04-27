# frozen_string_literal: true

def get_directory_contents(directory_path)
  entries = Dir.entries(directory_path).sort
  entries.delete_if { |e| e.start_with?('.') }
end

def list_directory_contents(entries)
  columns = 3
  max_name_length = entries.max_by(&:size).size

  entries_column = (entries.length / columns.to_f).ceil
  entries_with_padding = entries.map { |entry| entry.ljust(max_name_length + 14) }

  (0...entries_column).each do |row|
    row_entries = []
    (0...columns).each do |column|
      index = row + (column * entries_column)
      row_entries << entries_with_padding[index] if index < entries.size
    end
    puts row_entries.join
  end
end

entries = get_directory_contents('.')
list_directory_contents(entries)
