

class RecipeCard

    attr_reader :date, :user, :recipe
    attr_accessor :rating
    @@all = []

    def initialize(date, rating, user, recipe)
        @date = date
        @rating = rating
        @user = user
        @recipe = recipe
        @@all << self
    end

    def self.all
        @@all
    end

    
end


