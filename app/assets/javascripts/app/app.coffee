auntie_em_recipes = angular.module('auntie_em_recipes', [
  'templates',
  'ngRoute',
  'ngResource',
  'controllers'
])

auntie_em_recipes.config(['$routeProvider', '$locationProvider',
  ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode(true)
    $routeProvider
      .when('/',
        templateUrl: 'index.html',
        controller: 'RecipesController'
      )
])
