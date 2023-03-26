require "date"
require "optparse"

# -yと-mをコマンドプロンプトから取得
params = ARGV.getopts("y:", "m:")

# -yと-mが取得されない場合、year,monthに今日の年月を代入
if params["y"] == nil
    year = Date.today.year
else
    year = params["y"].to_i
end

if params["m"] == nil
    month = Date.today.mon
else
    month = params["m"].to_i
end

# 月の最初と最後の日をそれぞれ代入
first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

# 月と年の表示
print "     #{month}月"
print " #{year}\n"

# 曜日の表示　日〜土
youbi = ["日 ", "月 ", "火 ", "水 ", "木 ", "金 ","土 "]
youbi.each do |wday|
    print wday
end
print("\n")

# 日にちの表示
for day in first_day .. last_day do
    # 最初の週を右寄せ
    # １日の曜日によってスペースを調整
    if day.day == 1
        case day.cwday
        when 7
            print ""
        when 1
            print " " * 3
        when 2
            print " " * 6
        when 3
            print " " * 9
        when 4
            print " " * 12
        when 5
            print " " * 15
        when 6
            print " " * 18
        end
    end

    # 土曜日になったら改行
    if day.day >= 10 && day.cwday == 6
        print day.day, "\n"
    elsif day.cwday == 6
        print " ", day.day, "\n"
    elsif day.day >= 10
        print day.day," "
    else
        print " ", day.day, " "
    end   
end

puts "\n" * 2

