require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

bob = Lion.new('Bob')
simba = Lion.new('Simba')
nala = Lion.new('Nala')
doug = Meerkat.new('Doug')
timon = Meerkat.new('Timon')
yann = Warthog.new('Yann')
pumbaa = Warthog.new('Pumbaa')

animals = [bob, simba, nala, doug, timon, yann, pumbaa]

animals.each do |animal|
  # Polymorphism
  puts "#{animal.talk} (#{animal.class})"
end