def v(i)
d=i.scan(/\d+/).map{|n|n.to_i-1}
c=i.partition(':').first[-1]
p=i.split.last
(p[d.first]==c)^(p[d.last]==c)
end
e=File.readlines(File.join(File.dirname(__FILE__),'./input.txt'))
puts e.count{|pw|v pw}
