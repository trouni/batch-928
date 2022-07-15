require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = [] # stores instances of Recipe
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # row is an array with the name and description of the recipe
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
    @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end