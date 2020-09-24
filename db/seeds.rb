EMAIL = 'test@example.com'
PASSWORD = 'password'

# データの入力範囲
START_DATE = Date.today - 11.months
END_DATE = Date.today + 1.months

# 1/(NO_RECORD_CONSTANT) の確率でデータを記録しない
# 記録が一部欠けていてもグラフが正常に描けるかをチェックするため
NO_RECORD_CONSTANT = 5

# 記録する体重の範囲（乱数で値を決める都合上，10倍しておく）
MIN_WEIGHT = 600
MAX_WEIGHT = 620
DIV_CONSTANT = 10

MIN_STEP = 10000
MAX_STEP = 12000

# テストユーザーが存在しないときだけ作成し，変数名を user とする（後に使用）
user = User.find_or_create_by!(email: EMAIL) do |user|
  user.password = SecureRandom.urlsafe_base64
  puts 'ユーザーの初期データインポートに成功しました。'
end

user.graphs.destroy_all

graphs = []
(START_DATE..END_DATE).each do |date|
  # 1/(NO_RECORD_CONSTANT) の確率でデータを入れる操作をスキップ
  next if rand(NO_RECORD_CONSTANT).zero?
  graphs << {
    user_id: user.id,
    date: date,
    # to_f 整数から少数に変更できる
    weight: rand(MIN_WEIGHT..MAX_WEIGHT).to_f / DIV_CONSTANT,
    step: rand(MIN_STEP..MAX_STEP).to_f / DIV_CONSTANT
  }
end
Graph.create!(graphs)
puts '体重の初期データ投入に成功しました！'