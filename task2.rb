#!/path/to/ruby -w

# Вводим данные
def_coords = [60.597223, 56.837992]
radius = 5

try_array = [
  [61, 60],
  [65],
  [64.89944, 51, 876],
  ['test', 50.1],
  [47.546, 60.14564],
  [65.597223, 56.837992],
  [60.597223, 61.837992],
  [54.54654, 700.4654],
  [*(58..60)],
  [{}, []],
  54,
  'Holla'
]

def calc_distance(def_point, dest)
  (def_point + dest).each do |dot|
    return nil unless dot.is_a? Numeric
  end
  Math.sqrt((def_point[0] - dest[0])**2 + (def_point[1] - dest[1])**2)
end

try_array.delete_if do |point|
  next true unless point.is_a?(Array) && point.size >= 2
  result = calc_distance(def_coords, point) ? radius < calc_distance(def_coords, point) : true
end
  .map { |point| point.slice!(2) }

p try_array
