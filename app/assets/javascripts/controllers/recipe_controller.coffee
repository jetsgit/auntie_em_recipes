controllers = angular.module('controllers')
controllers.controller('RecipeController',['$scope', '$routeParams', '$resource', 'flash'
  ($scope, $routeParams, $resource, flash)->
    Recipe = $resource('/recipes/:recipeID', { recipeID: "@id", format: 'json' })

    if $routeParams.recipeID
      Recipe.get({recipeID: $routeParams.recipeID},
        ( (recipe)-> $scope.recipe = recipe ),
        ( (httpResponse)->
          $scope.recipe = null
          flash.error = "There is no recipe with ID #{$routeParams.recipeID}"
        )
      )
    else
      $scope.recipe = {}
])
