require 'date'
require 'optparse'

params = ARGV.getopts('y:', 'm:')

year = if params['y'].nil?
         Date.today.year
       else
         params['y'].to_i
       end

month = if params['m'].nil?
          Date.today.mon
        else
          params['m'].to_i
        end

first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

print "     #{month}月"
print " #{year}\n"

youbi = ['日 ', '月 ', '火 ', '水 ', '木 ', '金 ', '土 ']
youbi.each { |wday| print wday }
print "\n"

if first_day.day == 1
  case first_day.cwday
  when 7
    print ''
  when 1
    print ' ' * 3
  when 2
    print ' ' * 6
  when 3
    print ' ' * 9
  when 4
    print ' ' * 12
  when 5
    print ' ' * 15
  when 6
    print ' ' * 18
  end
end

(first_day..last_day).each do |day|
  if day.cwday == 6
    print "#{day.day}".rjust(2), "\n"
  else
    print "#{day.day}".rjust(2), ' '
  end
end

puts "\n" * 2
