# string concatenation testing

def f1 strs
  result = ""
  strs.each do |str|
    result += str
  end
  return result
end

def f2 strs
  result = ""
  strs.each do |str|
    result << str
  end
  return result
end

def f3 strs
  return strs.join
end

{:f1 => :"+=", :f2 => :<<, :f3 => :join}.each do |t|
  time = Time.now
  # lots of chunky bacon
  method(t.first).call ["chunky", "bacon"] * 10_000
  puts "%-6s %s" % [t.last, Time.now - time]
end

# join ftw, followed by <<, += took a pit stop along the way
# would be interesting to see results for Permutations, i.e. not just ["chunky", "bacon"] over and over, more like: ["aaaaaa", "bbbbbb", "abbbbb", ...], and etc.

