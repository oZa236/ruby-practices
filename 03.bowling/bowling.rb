# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0

frames.each_index do |i|
  point += frames[i].sum
  if i == 9 # 10フレーム目のとき
    if frames[9][0] == 10 # ストライク
      count = i * 2 + 2
      next_point = 0
      loop do
        next_point += shots[count]
        break if frames.last.sum.zero?

        count += 1
        break if next_point != 0
      end

      next_next_point = 0
      loop do
        next_next_point += shots[count]
        break if next_next_point != 0
        break if frames.last.sum.zero?

        count += 1
      end
      point += next_point + next_next_point
      break

    elsif frames[9].sum == 10 # スペア
      count = i * 2 + 2
      next_point = 0
      loop do
        next_point += shots[count]
        break if next_point != 0

        count += 1
      end
      point += next_point
      break
    end
  end

  if frames[i][0] == 10 # ストライク
    count = i * 2 + 2
    next_point = 0
    loop do
      next_point += shots[count]
      count += 1
      break if next_point != 0
    end
    next_next_point = 0
    loop do
      next_next_point += shots[count]
      break if next_next_point != 0
      break if frames.last.sum.zero?

      count += 1
    end
    point += next_point + next_next_point

  elsif frames[i].sum == 10 # スペア
    count = i * 2 + 2
    next_point = 0

    loop do
      next_point += shots[count]
      break if next_point != 0

      count += 1
    end
    point += next_point
  end
end

puts point
