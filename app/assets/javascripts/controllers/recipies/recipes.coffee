@cooking.controller 'recipesCtrl', ($scope,$log,Auth,Recipe,Recipes,Ingredient,$routeParams) ->
  
  #********************** variables declaration
  $scope.newRecipe = {}
  $scope.ingredients = []
  $scope.recipes = []
  $scope.idUser = 0

  #********************** add new empty ingredient in list
  $scope.addIngredientToList = ->
    insertedIng = {name:''}
    $scope.ingredients.push(insertedIng)

  #********************** get current user
  Auth.currentUser().then  (user) ->
    $scope.user = user
    $log.info($scope.user)
    $scope.newRecipe.user_id = $scope.user.id
    $scope.idUser = $scope.user.id

  #********************** get recipies by user
  Recipes.$promise.then (res) ->
    intermediate = res
    for recipe in intermediate
      if recipe.user_id == $scope.idUser  
        $scope.recipes.push(recipe)

  #********************** go to add or edit recipe
  $scope.saveRecipe = (recipe) ->
    $scope.newRecipe.rate = 4
    if angular.isDefined(recipe.id)
      $scope.editRecipe(recipe)
      $log.info('edit')
    else  
      $scope.addRecipe(recipe)
      $log.info('add')

  #********************** add recipe    
  $scope.addRecipe = (recipe) ->
    $scope.notice = 'l\'ajout de recette '+recipe.title+' est effectuée'
    $('#notice').removeClass('hide')
    Recipe.recipes(1).save(recipe).$promise.then (res) ->
      $scope.recipes.unshift(res)
      for ingredient in $scope.ingredients
        ingredient.recipe_id = res.id
        Ingredient.save(ingredient)       
      $scope.newRecipe = {}
      $scope.ingredients = []

  #********************** edit recipe 
  $scope.editRecipe = (recipe) ->
    $scope.notice = 'l\'édition de recette '+recipe.title+' est effectuée'
    $('#notice').removeClass('hide')
    for ingredient in $scope.ingredients
      ingredient.recipe_id = recipe.id
      Ingredient.save(ingredient) 
    Recipe.recipes(1).update(recipe)
    $scope.newRecipe = {}
    $scope.ingredients = []
    window.scrollTo(0 , 0)

  #********************** delete recipe 
  $scope.deleteRecipe = (recipe) ->
    msg = 'suppression de recette '+recipe.title+ ' ?'
    if !confirm(msg) 
      return
    $scope.notice = 'la suppression de recette '+recipe.title+' est effectuée'
    $('#notice').removeClass('hide')
    Recipe.recipes(1).delete(recipe)
    index =  $scope.recipes.indexOf(recipe)
    $scope.recipes.splice(index,1)
    $scope.newRecipe = {}
    $scope.ingredients = []
    window.scrollTo(0 , 0)

  #********************** go to form edit recipe 
  $scope.goToEdit = (recipe) ->
    $scope.newRecipe = recipe
    window.scrollTo(0 , 0)
    $scope.ingredients = Ingredient.query({recipe_id: recipe.id})
    

  