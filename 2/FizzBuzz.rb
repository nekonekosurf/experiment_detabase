x = gets().chomp.to_i
#x = 100
i=1
while(i<x)
	if i%15==0
		puts"Fizz Buzz"
	elsif i%5==0
		puts"Buzz"
	elsif i%3==0 	 
		puts "Fizz"
	else puts i
	end
	i+= 1
end
