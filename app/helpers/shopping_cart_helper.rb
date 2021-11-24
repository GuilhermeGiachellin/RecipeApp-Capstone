module ShoppingCartHelper
    def total_value_needed(foods)
        total = 0
        foods.each do |food|
          total += (food.amount_food * food.price)
        end
        total   
    end
end
