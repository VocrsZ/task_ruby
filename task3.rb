#!/path/to/ruby -w

N = 100

class ShowBanner
  (1..N).each_with_object(@showed = {}) { |num, hash| hash[num] = false }
  def self.show
    numb = @showed.reject { |_k, v| v == true }
           .keys
    number = numb[rand(numb.size)]
    @showed[number] == true
    puts number
  end
end

N.times { ShowBanner.show }
