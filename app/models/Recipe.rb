class Recipe

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def recipecards
        RecipeCard.all.select{|rc| rc.recipe == self}
    end

    def users
        recipecards.map{|rc| rc.user}.uniq
    end

    def self.most_popular
        most = 0
        most_popular_recipe = nil
        self.all.each do |recipe|
            if recipe.users.count > most
                most = recipe.users.count
                most_popular_recipe = recipe
            end
        end
        most_popular_recipe
    end

    def recipeingredients
        RecipeIngredient.all.select{|ri| ri.recipe == self}
    end

    def ingredients
        recipeingredients.map{|ri| ri.ingredient}.uniq
    end

    def add_ingredients(ingredient_list)
        ingredient_list.each do |ingredient|
            RecipeIngredient.new(ingredient,self)
        end
    end

    def allergens
        allergen_list = []
        Allergy.all.each do |allergen|
            ingredients.each do |ingredient|
                allergen_list << ingredient if allergen.ingredient == ingredient
            end
        end
        allergen_list.uniq
    end

end
