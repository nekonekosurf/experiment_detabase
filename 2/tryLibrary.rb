start_ = 1
end_ = 10000
t1= Time.new
sum=0
while (start_ <= end_)
	sum = start_+sum
	start_+=1
end
t2= Time.new
puts "it takes #{t2-t1} sec"
puts "answer is #{sum}"
#Time 現在の時刻やインスタンスが作成された時の時刻を取得することが出来る。
#プログラム： 1から10000までの合計の和を求めるプログラムを実行させ開始時刻と終了時刻から実行時間と計算結果を表示する。
