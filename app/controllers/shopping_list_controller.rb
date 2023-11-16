class ShoppingListController < ApplicationController
  def index
    @inventory_id = params[:recipe].split('?').second.split('=').second
    @recipe = Recipe.find(params[:recipe])
    @inventory = Inventory.find(@inventory_id)
    @recipefoods = RecipeFood.where(recipe_id: params[:recipe])
    @inventoryfoods = InventoryFood.where(inventory_id: @inventory_id)

    @required_foods = []
    @recipefoods.each do |food|
      @required_foods.push({ food: Food.find(food.food_id).name, quantity: food.quantity, food_id: food.food_id })
    end

    @available_foods = []
    @available_names = []
    @inventoryfoods.each do |food|
      @available_foods.push({ food: Food.find(food.food_id).name, quantity: food.quantity })
      @available_names.push(Food.find(food.food_id).name)
    end

    @foods_to_buy = []
    @counter = 0
    @required_foods.each do |required_food|
      if @available_names.include?(required_food[:food])
        @available_foods.each do |one|
          @food_to_check = one if required_food[:food] == one[:food]
        end
        if required_food[:quantity] > @food_to_check[:quantity]
          @counter += 1
          @foods_to_buy.push({ food: required_food[:food],
                               quantity: required_food[:quantity] - @food_to_check[:quantity], food_id: required_food[:food_id] })
        end
      else
        @counter += 1
        @foods_to_buy.push(required_food)
      end
    end

    @total = 0
    @foods_to_buy.each do |one|
      one[:price] = Food.find(one[:food_id]).price
      one[:unit] = Food.find(one[:food_id]).measurement_unit
      @total += (one[:quantity] * one[:price])
    end
  end
end
