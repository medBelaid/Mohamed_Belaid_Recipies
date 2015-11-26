
#********************** get recipies by id/userId/mode 
@cooking.service  'Recipe', ($resource) ->
  recipes = (page) ->
    response = $resource('/recipes/:id',{id: '@id',page: page,mode: '@mode',userId:'@userId'},{update:{method:"PUT"}})
    return response
  return {recipes: recipes}

#********************** get ingredients by recipe id
@cooking.service  'Ingredient', ($resource) ->
  return $resource('/recipes/:recipe_id/ingredients/:id',{recipe_id: '@recipe_id'},{id: '@id'},{update:{method:"PUT"}}) 

#********************** get number likes by recipe
@cooking.service  'Favorite', ($resource) ->
  return $resource('/recipes/:id/favorite',{id: '@id'},{update:{method:"PUT"}}) 

#********************** get recipies list
@cooking.factory  'Recipes', ($resource,Recipe) ->
  return Recipe.recipes(1).query()