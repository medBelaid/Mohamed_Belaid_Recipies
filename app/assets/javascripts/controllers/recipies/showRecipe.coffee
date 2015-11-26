@cooking.controller 'viewRecipeCtrl', ($scope,$log,Recipe,Ingredient,Favorite,$routeParams) ->
  
  #********************** variables declaration
  id = $routeParams.id
  $scope.countLikes = 0
  
  #********************** count number likes to selected recipe  
  $scope.countLikes = Favorite.get({id:id})
  
    

  #********************** get recipe selected by user
  Recipe.recipes(1).get({id:id}).$promise.then (res) ->
    $scope.recipe = res
    $scope.recipe.username = Recipe.recipes(1).get({userId:res.user_id,mode:'getUserRecipe'}) 
  
  #********************** get likes recipe
  if $scope.user
    Recipe.recipes(1).query({userId:$scope.user.id,mode: 'f'}).$promise.then (res) ->
      $scope.favoriteRecipes = res
      for recipe in $scope.favoriteRecipes
        recipe.countLikes = Favorite.get({id:recipe.id})
        $log.info($scope.favoriteRecipes.countLikes)
  
  #********************** save like
  $scope.favorite = ->
    Favorite.save($scope.recipe).$promise.then (res) ->
      $scope.countLikes = Favorite.get({id:res.id})

  #********************** get ingridients by recipe selected
  $scope.ingridients = Ingredient.query({recipe_id: $routeParams.id})



