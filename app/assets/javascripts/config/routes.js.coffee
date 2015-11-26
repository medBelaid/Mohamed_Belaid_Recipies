@cooking.config ( $routeProvider ) ->

  $routeProvider

  .when "/login",
    controller:  'authCtrl'
    templateUrl: 'assets/templates/auth/_login.html'

  .when "/register",
    controller:  'authCtrl'
    templateUrl: 'assets/templates/auth/_register.html'

  .when "/profile",
    controller:  'profileCtrl'
    templateUrl: 'assets/templates/home/profile.html'

  .when "/home",
    controller:  'homeCtrl'
    templateUrl: 'assets/templates/home/index.html'

  .when "/recipes",
    controller: 'recipesCtrl'
    templateUrl: 'assets/templates/recipes/index.html'

  .when "/recipe",
    controller: 'viewRecipeCtrl'
    templateUrl: 'assets/templates/recipes/show.html'


  .otherwise redirectTo: "/home"
