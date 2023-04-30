# ЗНАКИ ПРЕПИНАНИЯ

# - Нет знаков применания после команд
# - Пробелы перед командой ничего не значат
# - Запись нескольких команд в одной строке через точку запятую
# - Можно ставить и не ставить круглые скобки вокруг аргументов

puts "Hello World!"
puts("Hello World!")
puts('Hello World!')

puts(
    "Hello World!")
    puts "Hello World!"
puts("Hello World!"); puts "Hello World!"; puts "Hello World!"


# Не всегда очевидно, где функция
f = 5

def f(x)
    x + 10
end

a = 2

def a()
    4
end

puts(f / a)
puts(f / a())
puts(f a)
puts(f a())