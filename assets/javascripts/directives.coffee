@cooking.directive 'listRecipes',($compile,$resource)->
 templateUrl: 'assets/templates/home/recipes-list.html.haml'
 restrict: 'E'
 link: (scope) ->
    
  controller: ($scope) ->

@cooking.directive 'popupDelete',($compile,Recipe)->
  templateUrl: 'assets/templates/recipes/popup.html.haml'
  restrict: 'E'
  link: (scope) ->
    
  controller: ($scope) ->
    $scope.recipeToDelete = {}
    $scope.ingredients = []

    #********************** go to popup delete recipe 
    $scope.goToDeletePopup = (recipe) ->
      $('#popup').fadeIn('slow')
      $('#black_overlay').fadeIn()
      $scope.recipeToDelete = recipe;
      if !$('#notice2').hasClass('hide')
        $('#notice2').addClass('hide')
      return false

    #********************** cancel delete action 
    $scope.cancelDelete = () ->
      $('#popup').fadeOut('slow')
      $('#black_overlay').fadeOut()
      return false

    #********************** delete recipe 
    $scope.deleteRecipe = () ->
      index =  $scope.recipes.indexOf($scope.recipeToDelete)
      $scope.recipes.splice(index,1)
      Recipe.recipes(1).delete($scope.recipeToDelete).$promise.then (res) ->
        window.scrollTo(0 , 0)
        $scope.cancelDelete()
        $scope.notice = 'la suppression de recette '+$scope.recipeToDelete.title+' est effectuée'
        $('#notice').removeClass('hide')
        $scope.ingredients = []

    

    

