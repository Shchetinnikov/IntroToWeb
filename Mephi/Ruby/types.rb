# ###### ТИПЫ ДАННЫХ ######

# Все типы данных - классы. Константное значение относится к некоторому классу.
puts "Hello World!".class
puts true.class
puts 5.class
puts 6.4.class
puts nil.class


# Ruby - динамически типизируемый.
a = 5
a = "abcd"
a = 5 + 6.0


# Преобразование типов
a = 15 / 10         # результат 1
a = 15 / 10.0       # результат 1.5
a = 15.0 / 10.0     # результат 1.5
a = "15" / 10       # ошибка: оператор / не определен для строк

# to_i – преобразование к целому числу
# to_f – преобразование к вещественному числу
# to_s – преобразование к строке

a = 1.2345
b = a.to_i
c = b.to_f

# из сторки в целое
a = "123.45"
b = "ab.2b"
c = "0b101"
d = "0101"
e = "0x123a"
f = "0123a"
puts a.to_i
puts b.to_i
puts b.to_i(16)
puts c.to_i
puts c.to_i(2)
puts d.to_i
puts d.to_i(2)
puts e.to_i
puts e.to_i(16)
puts f.to_i
puts f.to_i(16)
puts a.to_i(0)
puts c.to_i(0)
puts e.to_i(0)
puts f.to_i(0)

# из строки в вещественное
a = "123.456"
b = ".456"
c = "123.bgh"
e = "test"
f = "1.23e-2"
puts a.to_f, b.to_f, c.to_f, e.to_f, f.to_f

# из числа в строку
a = 139
b = 123.456
puts a.to_s, a.to_s(2), a.to_s(5), a.to_s(8), a.to_s(16), 
     a.to_s(36) # 36 - максимум
puts a.to_f.to_s, b.to_s

# автоматическое преобразование
puts 1/2
puts 1.0/2.0
puts 1 % 3
puts 1 % 0.3
puts 1 + 2
puts 1.0 + 2
puts 1 + 2.0

# целые числа в Ruby почти бесконечны - длинная арифметика
# а вещественные нет - Infinity