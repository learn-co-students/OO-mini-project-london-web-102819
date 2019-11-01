class User

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self  
    end

    def self.all
        @@all
    end

    def recipecards
        RecipeCard.all.select{|rc| rc.user == self}
    end

    def recipes
        recipecards.map{|rc| rc.recipe}.uniq
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(date, rating, self, recipe)
    end

    def top_three_recipes
        sorted_recipes = recipecards.sort_by{|recipe| recipe.rating}
        sorted_recipes[-3..-1].map{|rc| rc.recipe}.reverse
    end

    def most_recent_recipe
        most_recent = 0
        mrr = nil
        recipecards.each do |recipecard|
            day = recipecard.date.split("/")[0]
            month = recipecard.date.split("/")[1]
            year = recipecard.date.split("/")[2]
            date = (year + month + day).to_i
            
            if most_recent < date
                mrr = recipecard.recipe
                most_recent = date 
            end
        end
        mrr
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select{|allergen| allergen.user == self}.map{|allergen| allergen.ingredient}
    end

    def safe_recipes
       sr = []
       test = false
       recipes.each do |recipe|
            recipe.ingredients.each do |ingredient|
                test = true
                if self.allergens.include?(ingredient)
                    test = false
                    break
                end
            end
            sr << recipe if test
        end
        sr
    end


end

