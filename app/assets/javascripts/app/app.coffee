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

# recipes = [
#   {
#     id: 1
#     name: 'Baked Potato w/ Cheese'
#   },
#   {
#     id: 2
#     name: 'Garlic Mashed Potatoes'
#   },
#   {
#     id: 3
#     name: 'Potatoes Au Gratin'
#   },
#   {
#     id: 4
#     name: 'Baked Brussel Sprouts'
#   },
#   {
#     id: 5
#     name: 'Baked Lamb Roast'
#   }
# ]

controllers = angular.module('controllers', [])
controllers.controller('RecipesController', ['$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location) ->
    $scope.search = (keywords)-> $location.path('/').search('keywords', keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.recipes = []
    $scope.placeholder = "Kalamari, Paella, Lamb Stew, etc..."
])
