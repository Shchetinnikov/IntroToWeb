year = get.strip
str = case year
when '2023'
    'Текущий'
when '1001'..'2000'
    '2 десяток веков'
else
    'Что-то давнее'
end