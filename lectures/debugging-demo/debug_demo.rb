require 'pry-byebug'

def full_name(first_name, last_name)
  binding.pry
  fname = first_name.capitalize
  lname = last_name.capitalize
  "#{fname} #{lname}"
end

puts full_name('alison', 'jeffrey')

# 1. require 'pry-byebug'
# 2. Add binding.pry where you want to introduce a breakpoint
# 3. Debug using `next`, `continue`/`exit`
# 4. Remove the binding.pry and required gem