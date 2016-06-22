auntie_em_recipes = angular.module('auntie_em_recipes', [
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

auntie_em_recipes.config(['$routeProvider', 'flashProvider',#'$locationProvider',
  ($routeProvider, flashProvider) ->
    # $locationProvider.html5Mode(true)
    flashProvider.errorClassnames.push('alert-danger')
    flashProvider.warnClassnames.push('alert-warning')
    flashProvider.infoClassnames.push('alert-info')
    flashProvider.successClassnames.push('alert-success')
    $routeProvider
      .when('/',
        templateUrl: 'index.html',
        controller: 'RecipesController'
      ).when('/recipes/new',
        templateUrl: "form.html"
        controller: 'RecipeController'
      ).when('/recipes/:recipeID',
        templateUrl: 'show.html'
        controller: 'RecipeController'
      ).when('/recipes/:recipeID/edit',
        templateUrl: "form.html"
        controller: 'RecipeController'
      )
        
])
controllers = angular.module('controllers', [])
