class Fixnum
  def ack(y)
    if self == 0
      return y + 1
    elsif y == 0
      a = self
      a-= 1
      return a.ack(1)
    else
      a = self
      a-= 1
      a.ack(self.ack(y-1))
    end
  end

  def czynniki
    a = Array.new
    for i in 1..self
      if self % i == 0
        a<<i
      end
    end
    return a
  end

  def doskonala
    arr = czynniki
    num = 0
    for i in 1..arr.length-1
      num += i
    end

    if num == self
      return true
    end
    return false
  end

  def naSlowa
    arr = self.to_s
    a = ["jeden ","dwa ","trzy ","cztery ", "pięć ","sześć ","siedem ","osiem ","dziewięć ","zero "]
    str = ""
    for i in 0..arr.length-1
      str += a[arr[i].to_i-1]
    end
    return str
  end
end

class Jawne
  @a = ""
  def initialize(k)
    @a = k
  end

  def zaszyfruj(klucz)
    return Zaszyfrowane.new(@a.gsub(Regexp.union(klucz.keys), klucz))
  end

  def to_s
    return @a
  end

end

class Zaszyfrowane
  @a = ""
  def initialize(k)
    @a = k
  end

  def odszyfruj(klucz)
    nKlucz = klucz.invert()
    return Jawne.new(@a.gsub(Regexp.union(nKlucz.keys), nKlucz))
  end

  def to_s
    return @a
  end

end

puts 5.naSlowa
puts "#{6.czynniki}"
puts 2.ack(1)
puts 7.doskonala
jaw = Jawne.new("ruby")
puts jaw.zaszyfruj({"r"=>"a","q"=>"z"}).odszyfruj({"r"=>"a","q"=>"z"})