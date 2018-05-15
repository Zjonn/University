def palindrome? string
    string = string.gsub(/[^[[:word:]]]+/, "").downcase()
    string == string.reverse
end

def count_words string
    hash = Hash.new
    string.downcase.split(/[^[[:word:]]]+/).each{|x| (hash[x]== nil) ? hash[x] = 1 : hash[x] += 1}
    hash
end

def same23? array
    if array.length == 5
        i = {'a' => 0, 'b' => 0, 'c' => 0}
        array.each{|c| (i[c] == nil) ? (return false) : i[c] += 1}
        return (i.values.include?(2)) && (i.values.include?(3))
    end
    false
end



def tests
    assert("pal_1", palindrome?("ęąę"),                                true)
    assert("pal_2", palindrome?("A man, a plan, a canal -- Panama"),   true)
    assert("pal_3", palindrome?("Madam, I'm Adam!"),                   true)
    assert("pal_4", palindrome?("Abracadabra"),                        false)
    assert("pal_5", palindrome?(""),                                   true)
    assert("pal_6", palindrome?("paęnama"),                            true)

    assert("count_1" , count_words("A man, a plan, a canal -- Panama"),
        {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1})
    assert("count_2" , count_words("Ala ma kota, a kot ma Ale. Ala ma również psa"),
        {'ala' => 2, 'ma' => 3, 'kota' => 1, 'a' => 1, 'kot' => 1, 'ale' => 1, 'również' => 1, 'psa' => 1})
    assert("count_3" , count_words(""),
        {})
    assert("count_4" , count_words("a"),
    {'a' => 1})

    assert("same23_1", same23?(["a", "a", "a", "b", "b"]),           true)
    assert("same23_2", same23?(["a", "b", "c", "b", "c"]),           false)
    assert("same23_3", same23?(["a", "a", "a", "b", "b", "b"]),      false)
    assert("same23_4", same23?(["a", "a", "a", "d", "d"]),           false)
    assert("same23_5", same23?(["f", "f", "f", "e", "e"]),           false)
    assert("same23_6", same23?(["a", "a", "b", "b", "c", "b"]),      false)
end

def assert name, val, expVal
    puts "\e[33;1mTest \e[35m" + name
    if val != expVal
        puts "  \e[91m wrong"
    elsif
        puts "  \e[92m✓ ok"
    end
end

tests
