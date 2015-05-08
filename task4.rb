#!/path/to/ruby -w

$num_codes = { 1 => '0010010',
               2 => '1011101',
               3 => '1011011',
               4 => '0111010',
               5 => '1101011',
               6 => '1101111',
               7 => '1010010',
               8 => '1111111',
               9 => '1111011',
               0 => '1110111' }
def receiver(number)
  number = number.to_s if number.is_a? Numeric
  number.split('')
    .map! do |num|
    num = $num_codes[num.to_i].split('')
          .map!(&:to_i)
  end
    .transpose
end

def printer(index, digit)
  digit.each do |item|
    mark = case index
    when 0, 3, 6
      item == 1 ? ' __ ' : '   '
    when 1, 4
      item == 1 ? '| ' : '  '
    when 2, 5
      item == 1 ? ' |' : '  '
    end
    print mark
  end
  puts '' unless [1, 4].include? index
end

def mixer(arr1, arr2)
  len = arr1.size
  arr1 = arr1.zip(arr2)
  arr1.flatten!
  arr2 = arr1.slice(-len, len)
  arr1 = arr1.slice(0, len)
  [arr1, arr2]
end

task1 = receiver 696

task1[1], task1[2] = mixer(task1[1], task1[2])
task1[4], task1[5] = mixer(task1[4], task1[5])

task1.each_with_index do |digit, index|
  printer(index, digit)
end
