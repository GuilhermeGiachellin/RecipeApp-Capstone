class ShoppingCartController < ApplicationController
    def index
       @recipes = current_user.recipes
       @recipes.each do |r|
        p 'OHAIRHURAOH'
       @bla = r.recipe_foods
        @bla.each do |b|
            p b.quantity
        end
        p 'OHAIRHURAOH'
    end 
    #    @recipe_foods = @recipes.recipe_foods
    #    @foods = @recipes.foods
       
    end
end
