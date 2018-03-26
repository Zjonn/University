class Main
end

class Funkcja
  @fun
  def initialize(k)
    @fun = k
  end

  def value(x)
    return @fun.call(x)
  end

  def poch(x)
    return (value(x+0.00000000000001) - value(x))/0.00000000000001
  end

  def pole(a,b)
    i = a
    pH = 0
    pL = 0
    step = 0.01
    while i < b do
      pH +=  value(i+step)*step
      pL += value(i)*step
      i+=step
    end
    return (pL+pH)/2
  end

  def zerowe(a,b,e)
    if(value(a)*value(b)>0)
      return "brak"
    end

    x = 0.1
    nA = a.to_f()
    nB = b.to_f()

    while (nA-nB).abs>e do
      x = (nA+nB)/2
      if x<e
        break
      end
      if(value(nA)*value(x)<0)
        nB = x
      else
        nA = x
      end
    end
    return x
  end

  def rysuj()
    rows = 20
    columns = 20
    cM = columns/2-1
    a = Array.new(rows){Array.new(columns)}
    for i in 0..rows-1
      for j in 0..columns-1
        if(j==cM)
          a[i][j]="|"
        elsif(i==rows/2-1)
          a[i][j]="-"
        else
          a[i][j]=" "
        end
        if value(j-cM)>0-cM&&value(j-cM)<cM&&i==columns-1
          a[(value(j-cM).to_i()-cM)*(-1)][j]="*"
        end
      end
    end
    return a
  end
end

a = Funkcja.new(Proc.new {|x|x*x-2})
puts a.value(0)

puts a.poch(5)
puts a.pole(1,2)
puts a.zerowe(0,4,0.1)
b = a.rysuj()
for i in 0..20
  print b[i]
  print "\n"
end
