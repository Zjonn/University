class Kolekcja
  def initialize()
    @ListE = ListElem.new(nil,nil,nil)
    @ListE.prev = @ListE
    @ListE.next = @ListE
  end

  def add(k)
    a = ListElem.new(k,@ListE,@ListE.prev)
    @ListE.prev.next = a
    @ListE.prev = a
  end

  def swap(i,j)
    if i > j
      a = i
      i = j
      j = a
    elsif j==i
      return
    end
    tmp1 = nil
    list = @ListE.next
    for it in 0..j-1
      if i == it
        tmp1 = list
      end
      list = list.next
    end
    val = list.v
    list.v = tmp1.v
    tmp1.v = val
  end

  def get(i)
    a = @ListE
    while i>0
      a = a.next
      i-=1
    end
    return a.next.v
  end

  def length()
    a = @ListE.prev
    i = 0
    while a.v != nil
      i+=1
      a = a.prev
    end
    return i
  end
end

class Sortowanie
  def sort1(list)
    for i in 0..list.length-1
      m = list.get(i)
      n = i
      for j in i..list.length-1
        if list.get(j)<m
          m = list.get(j)
          n = j
        end
      end
      list.swap(i, n)
    end
  end

  def sort2(list)
    for i in 0..list.length-1
      for j in 0..list.length-2-i
        if list.get(j+1)<list.get(j)
          list.swap(j+1, j)
        end
      end
    end
  end
end

class ListElem
  attr_accessor :v, :next, :prev
  def initialize(val,nextE,prevE)
    @v = val
    @next = nextE
    @prev = prevE
  end
end

class Wyszukiwanie
  def find(kol,key)
    a = 0
    b = kol.length-1
    while a<b
      v = (a+b)/2
      if kol.get(v) < key
        a = v+1
      else
        b = v
      end
    end
    if kol.get(a) == key
      return a
    end
    throw "Nie znaleziono wartosci"
  end

  def findI(kol,key)
    p = -1
    a = 0
    b = kol.length()-1
    sr = 0
    while( (av = kol.get(a))<=key && key<= (bv = kol.get(b)))
    #  print(a," : " ,b, "\n")
      sr = a + (key-av)*(b-a)/(bv-av)
    puts sr
      if key == kol.get(sr)
        return sr
      elsif key < kol.get(sr)
        b = sr - 1
      else
        a = sr + 1
      end
    end
    return p
  end
end

a = Kolekcja.new()
a.add(1)
a.add(2)
a.add(3)
a.add(4)
a.add(5)
a.add(6)
print(a.length())
s = Sortowanie.new()
s.sort1(a)
w = Wyszukiwanie.new
puts " "
for i in 0..a.length-1
  print(a.get(i))
  puts "..."
end

puts " : "
print("Pos = ",w.findI(a,6))

