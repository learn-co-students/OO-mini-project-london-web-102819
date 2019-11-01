class Ingredient

    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        iac = {}
        Allergy.all.each do |allergen|
            if iac[allergen.ingredient]
                iac[allergen.ingredient] += 1
            else
                iac[allergen.ingredient] = 1
            end
        end
        mca = iac.max_by{|ingredient, allergen_count| allergen_count}
        mca[0]
    end

end