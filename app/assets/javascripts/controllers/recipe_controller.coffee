controllers = angular.module('controllers')
controllers.controller('RecipeController',['$scope', '$routeParams', '$resource',
  ($scope, $routeParams, $resource)->
    Recipe = $resource('/recipes/:recipeID', { recipeID: '@id', format: 'json' })
])
