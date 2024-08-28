require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

# 新規メモ作成
if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
    puts "メモしたい内容を入力してください"
    puts "完了したらctrl + Dを押します"
    memo = readlines(chomp: true)

    CSV.open("#{file_name}.csv","w") do |csv|
        memo.each do |text|
            if text == "" #改行のみ(空文字)のときにダブルクォーテーションを表示させないようにする
                csv << []
            else
                csv << ["#{text}"]
            end
        end
    end

# 既存のメモに追記
elsif memo_type == 2
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
    puts "既存のメモに追記したい内容を入力してください"
    puts "完了したらctrl + Dを押します"
    memo = readlines(chomp: true)

    CSV.open("#{file_name}.csv","a",:force_quotes => false) do |csv|
        memo.each do |text|
            if text == ""
                csv << []
            else
                csv << ["#{text}"]
            end
        end
    end
else
    puts "1か2を入力してください"
end