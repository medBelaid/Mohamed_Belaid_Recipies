@cooking.controller 'recipesCtrl', ($scope,$log,Auth,Recipe,Recipes,Ingredient,FileUploader,$routeParams) ->
  
  #********************** variables declaration
  $scope.newRecipe = {}
  $scope.ingredients = []
  $scope.recipes = []
  $scope.idUser = 0
  $scope.recipeToDelete = {}
  $scope.allIngredients = Ingredient.query()
  $scope.uploader = new FileUploader({url: '/recipes'});
  $scope.intermediateIngredient = {}
  $scope.newIngredient = {}

  #********************** add new empty ingredient in list
  $scope.addIngredientToList = (ingredient)->
    if !$('#notice').hasClass('hide')
      $('#notice').addClass('hide')
    test = false
    ingredient.newIng = true 
    for ing in $scope.ingredients
      if angular.equals(ing.name, ingredient.name)
        test = true
    if !test
      $scope.ingredients.push(ingredient)
      $('#notice2').addClass('hide')
    else
      $scope.notice = 'l\'ingrédient '+ingredient.name+' existe !!'
      $('#notice2').removeClass('hide')
      $('#notice2').removeClass('hide')
    $scope.newIngredient = {}
    $scope.intermediateIngredient = {}

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
    if !$('#notice2').hasClass('hide')
      $('#notice2').addClass('hide')
    $scope.newRecipe.rate = 4
    if angular.isDefined(recipe.id)
      $scope.editRecipe(recipe)
      $log.info('edit')
    else  
      $scope.addRecipe(recipe)
      $log.info('add')

  #********************** add recipe    
  $scope.addRecipe = (recipe) ->
    Recipe.recipes(1).save(recipe).$promise.then (res) ->
      $scope.recipes.unshift(res)
      for ingredient in $scope.ingredients
        Ingredient.save({ingredient:ingredient,recipe_id:res.id})
      $scope.newRecipe = {}
      $scope.ingredients = []
      $scope.notice = 'l\'ajout de recette '+res.title+' est effectuée'
      $('#notice').removeClass('hide')

  #********************** edit recipe 
  $scope.editRecipe = (recipe) ->
    for ingredient in $scope.ingredients
      if ingredient.newIng
        Ingredient.save({ingredient:ingredient,recipe_id:recipe.id})
    Recipe.recipes(1).update(recipe)
    $scope.newRecipe = {}
    $scope.ingredients = []
    window.scrollTo(0 , 0)
    $scope.notice = 'l\'édition de recette '+recipe.title+' est effectuée'
    $('#notice').removeClass('hide')


  #********************** go to form edit recipe 
  $scope.goToEdit = (recipe) ->
    $scope.newRecipe = recipe
    window.scrollTo(0 , 0)
    Ingredient.query({recipe_id: recipe.id}).$promise.then (res) ->
      $scope.ingredients = res
      for ingredient in $scope.ingredients
        ingredient.newIng = false
      if !$('#notice').hasClass('hide')
        $('#notice').addClass('hide')

  #********************** remove association ingredient recipe 
  $scope.deleteIngredient = (ingredient) ->
    index =  $scope.ingredients.indexOf(ingredient)
    $scope.ingredients.splice(index,1)
    if(angular.isDefined(ingredient.id) && !ingredient.newIng)
      Ingredient.delete({id:ingredient.id,recipe_id:$scope.newRecipe.id})
    
  
  