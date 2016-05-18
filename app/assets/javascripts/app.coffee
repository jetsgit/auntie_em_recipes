auntie_em_recipes = angular.module('auntie_em_recipes', [
  'templates',
  'ngRoute',
  'controllers'
])

auntie_em_recipes.config(['$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: 'index.html',
        controller: 'RecipesController'
      )
])

controllers = angular.module('controllers', [])
controllers.controller('RecipesController', ['$scope',
  ($scope) ->
    $scope.placeholder = "Kalamari, Paella, Lamb Stew, etc..."
])
