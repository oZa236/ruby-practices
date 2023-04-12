# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = scores.map { |s| s == 'X' ? 'X' : s.to_i }

frames = []
10.times { frames << [] }

frames_index = 0
shots.each do |shot|
  if frames_index == 9
    frames[frames_index] << if shot == 'X'
                              10
                            else
                              shot
                            end
  elsif shot == 'X'
    frames[frames_index] << 10
    frames_index += 1
  else
    frames[frames_index] << shot
    frames_index += 1 if frames[frames_index].length == 2
  end
end

total_point = 0

frames.each_with_index do |frame, index|
  total_point += frames[index].sum

  if index == 9
    break
  elsif frame[0] == 10
    total_point += if index + 1 == 9
                     frames[index + 1][0] + frames[index + 1][1]
                   elsif frames[index + 1][0] == 10
                     frames[index + 1][0] + frames[index + 2][0]
                   else
                     frames[index + 1][0] + frames[index + 1][1]
                   end

  elsif frame.sum == 10
    total_point += frames[index + 1][0]
  end
end

puts total_point
