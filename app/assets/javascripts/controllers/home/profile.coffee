

@cooking.controller 'profileCtrl', ($scope,Recipe,$log,Recipes) ->

  #********************** variables declaration
  $scope.viewProfile = true
  $scope.userProfile = $scope.user
  $scope.recipes = [] 

  #********************** get all users
  $scope.userss = Recipe.recipes(1).query({mode: 'u'})

  #********************** get all recipies by user
  $scope.getRecipiesUser = (id) ->
    $scope.viewProfile = false
    $scope.recipes = []
    Recipes.$promise.then (res) ->
      intermediate = res
      for recipe in intermediate
        if recipe.user_id == id  
          $scope.recipes.push(recipe)

  #********************** get user by id
  $scope.getUser = (id) ->
    $scope.userProfile = Recipe.recipes(1).get({mode: 'getUserRecipe',userId:id}) 
    



 

