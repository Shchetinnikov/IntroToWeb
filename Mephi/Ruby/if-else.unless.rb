# любая конструкция возвращает результат

# if
if a > 0
    puts "Положительное"
end

if a > 0 then puts "Положительное" end

puts "Положительное" if a > 0


# if-else
a = gets.to_i
r1 = if a < 0
    "Отрицательное"
else
    "Не отрицательное"
end

r2 = if a < 0 then "Отрицательное" else "Не отрицательное" end
r3 = a < 0 ? "Отрицательное" : "Не отрицательное"


#  if-elsif-else
a = gets.to_i
puts(if a > 0
    "Положительное"
elsif a < 0
    "Отрицательное"
else
    "Ноль"
end)


# unless
a = gets.to_i
unless a % 2 == 0 then
    puts "Нечетное"
end

unless a % 2 == 0; puts "Нечетное" end
puts "Нечетное" unless a % 2 == 0