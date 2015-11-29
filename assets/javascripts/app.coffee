

@cooking = angular.module( 'cookingRecipes', ['Devise', 'ngRoute', 'ngResource' , 'templates' , 'willPaginate', 'angularFileUpload','ui.select'] )

@cooking.controller 'mainCtrl' , ($scope,Auth,$log) ->

  $scope.signedIn = Auth.isAuthenticated
  $scope.logout   = Auth.logout
  $scope.per_page = 10


  Auth.currentUser().then  (user) ->
    $scope.user = user

  $scope.$on 'devise:new-registration', (e, user) ->
    $scope.user = user

  $scope.$on 'devise:login', (e, user) ->
    $scope.user = user

  $scope.$on 'devise:logout', (e, user) ->
    $scope.user = {}

  
  

