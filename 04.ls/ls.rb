# frozen_string_literal: true

def get_directory_contents(directory_path)
  entries = Dir.entries(directory_path).sort
  entries.delete_if { |e| e.start_with?('.') }
end
