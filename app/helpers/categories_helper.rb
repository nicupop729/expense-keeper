module CategoriesHelper
    def category_total(category)
    total_category = category.expenses.sum(:amount)
      
    "$#{total_category}"
    end
end
