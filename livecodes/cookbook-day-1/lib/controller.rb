require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_all_recipes
  end

  def create
    # 1. Ask the user for the name of the recipe
    name = @view.ask_for('name')
    # 2. Ask the user for the description of the recipe
    description = @view.ask_for('description')
    # 3. Create the recipe instance
    recipe = Recipe.new(name, description)
    # 4. Add the recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 0. Display the recipes
    display_all_recipes
    # 1. Ask the user for the index of the recipe to destroy
    index = @view.ask_for_index
    # 2. Destroy the recipe from the cookbook
    @cookbook.remove_recipe(index)
  end

  private

  def display_all_recipes
    # 1. Get the recipes from the cookbook
    recipes = @cookbook.all
    # 2. Display the recipes (ask the view)
    @view.display(recipes)
  end
end