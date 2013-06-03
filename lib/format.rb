# encoding: utf-8
# helper code useful for writing and verifying tests using Pry
list = <<TXT
find
text
texts
name
names
scroll_to
TXT

list.split("\n").each do |method|
  puts "t '#{method}' do"
  puts
  puts 'end'
  puts
end

=begin
# for Pry
class Object
  def must_equal b
    raise 'not equal' unless self == b
  end
end
=end