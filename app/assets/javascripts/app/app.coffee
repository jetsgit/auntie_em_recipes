auntie_em_recipes = angular.module('auntie_em_recipes', [
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

auntie_em_recipes.config(['$routeProvider', #'$locationProvider',
  ($routeProvider ) ->
    # $locationProvider.html5Mode(true)
    $routeProvider
      .when('/',
        templateUrl: 'index.html',
        controller: 'RecipesController'
      ).when('/recipes/:recipeID',
        templateUrl: 'show.html'
        controller: 'RecipeController'
      )
])
controllers = angular.module('controllers', [])
