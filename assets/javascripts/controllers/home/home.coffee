

@cooking.controller 'homeCtrl', ($scope,$resource,Recipe,$log) ->
   
  
  $scope.willPaginateCollection = {}
 
  $scope.willPaginateConfig = {
    previousLabel: '<',
    nextLabel: '>'
  }
  
  #********************** get 10 results by page
  $scope.getPage = (page) ->
    $log.info('page '+page)
    $log.info('perpage '+$scope.per_page)
    Recipe.recipes(1).get({mode: 't'}).$promise.then (res) ->
      $scope.willPaginateCollection.currentPage = page
      $scope.willPaginateCollection.totalEntries = res.total
      $scope.willPaginateCollection.totalPages = Math.round(res.total / $scope.per_page) + 1
      $scope.willPaginateCollection.perPage = $scope.per_page
      $scope.willPaginateCollection.offset = 0
    Recipe.recipes(page).query({mode: 'p'}).$promise.then (res) ->
      $scope.recipes = res
      for recipe in $scope.recipes
        recipe.username = Recipe.recipes(1).get({userId:recipe.user_id,mode:'getUserRecipe'})



 

