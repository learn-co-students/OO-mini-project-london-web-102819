require_relative '../config/environment.rb'

r1 = Recipe.new
r2 = Recipe.new
r3 = Recipe.new
r4 = Recipe.new

dave = User.new('dave')
lola = User.new('lola')
marcus = User.new('marcus')
john = User.new('john')

dave.add_recipe_card(r3,'23/34/2015',2)
marcus.add_recipe_card(r3, '20/09/2092', 2)
lola.add_recipe_card(r4, '23/12/2000',5)


rc1 = RecipeCard.new('17/01/2010',1,lola,r1)
rc2 = RecipeCard.new('17/01/2998',3,dave,r1)
rc3 = RecipeCard.new('27/05/1999',3,lola,r3)
rc4 = RecipeCard.new('27/05/1997',4,lola,r2)

i1 = Ingredient.new('tomato')
i2 = Ingredient.new('celery')
i3 = Ingredient.new('salt')
i4 = Ingredient.new('sugar')


ri1 = RecipeIngredient.new(i1,r1)
ri2 = RecipeIngredient.new(i2,r1)
ri3 = RecipeIngredient.new(i1,r2)
ri4 = RecipeIngredient.new(i1,r3)

r2.add_ingredients([i3,i4])

a1 = Allergy.new(marcus, i2)
a2 = Allergy.new(lola, i3)
a3 = Allergy.new(marcus, i4)
a4 = Allergy.new(dave,i3)

dave.declare_allergy(i1)


binding.pry
