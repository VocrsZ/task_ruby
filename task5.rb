#!/path/to/ruby -w
Dir.chdir(File.dirname(__FILE__))

file = 'IpToCountry.csv'

def input
  input_string = gets
  ip_format = Regexp.new('^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$')
  unless ip_format.match(input_string)
    puts 'InputError, try IP format'
    input
   end
  input_string
end

def coder(ip)
  ip_coded = ip.split('.')
             .map!(&:to_i)
             .reverse
             .each_with_index.inject (0) do |sum, (node, index)|
    sum + node * 256**index
  end
  ip_coded
end

def search(file, ip)
  File.open(file, 'r').each do |line|
    next if line.include? '#'
    next if line.empty?
    line_array = line.split(',')
    from_ip = line_array.slice(0).delete("\"").to_i
    to_ip = line_array.slice(1).delete("\"").to_i
    puts line_array[5] if (from_ip..to_ip).include? ip.to_i
  end
end

input_ip = input
coded_ip = coder(input_ip)
search(file, coded_ip)
