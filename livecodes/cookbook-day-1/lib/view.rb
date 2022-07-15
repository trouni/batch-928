class View
  def display(recipes)
    puts '*' * 30
    puts 'Here are your recipes:'
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} | #{recipe.description}"
    end
    puts '*' * 30
  end

  def ask_for(attribute)
    puts "What is the #{attribute} of your recipe?"
    print '> '
    gets.chomp
  end

  def ask_for_index
    puts "Which recipe?"
    print '> '
    gets.chomp.to_i - 1
  end
end