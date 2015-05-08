#!/path/to/ruby -w

# Вводим данные для обработки
a = [[4, 19], nil, [32, 41], 65, 19, 'hello']
b = [234, 0, 21, [54], [[54, 53, 21], [54, 0, 'good']]]

# Создаем пустой хэш для хранения результата
result_hash = Hash.new(0)

# Сплющиваем, убираем nil-ы, чистим от некорректных значений, считаем количество элементов с ошибками, сортируем
# Если введенное значение - не цифра (Numeric), добавляем в хэш +1 к ключу :error
result = (a << b) .flatten!
         .compact!
         .delete_if do |el|
  begin
    fail ArgumentError unless el.is_a? Numeric
  rescue ArgumentError
    result_hash[:error] += 1
    true
  end
end
         .sort!

# Отбираем только уникальные значения
unique = result.uniq

# Для каждого уникального значения в массиве
# Проходимся по полному массиву
# И если уникальный элемент равен текущему элементу массива
# Увеличиваем значение результ. хэша на 1
unique.each do |item|
  result_hash[item] = 0
  result.each do |res|
    result_hash[item] += 1 if item == res
  end
end

p result_hash