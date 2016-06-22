controllers = angular.module('controllers')
controllers.controller('RecipeController',['$scope', '$routeParams', '$resource', '$location', 'flash',
  ($scope, $routeParams, $resource, $location, flash)->
    Recipe = $resource('/recipes/:recipeID', { recipeID: "@id", format: 'json' },
      {
        'save': {method: 'PUT'}
        'create': {method: 'POST'}
      }
    )

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
    
    $scope.back = -> $location.path("/")

    $scope.view = (recipeID)-> $location.path("/recipes/#{recipeID}")

    $scope.edit = -> $location.path("/recipes/#{$scope.reipc.id}/edit")

    $scope.cancel = ->
      if $scope.recipe.id
        $location.path("/recipes/#{$scope.recipe.id}")
      else
        $location.path('/')

    $scope.save = ->
      onError = (_httpResponse_) ->  flash.error = "There was an error in saving this recipe"
        
      if $scope.recipe.id
        $scope.recipe.$save(
          ( ()-> $location.path("/recipes/#{$scope.recipe.id}") ),
          onError
        )
      else
        Recipe.create($scope.recipe,
          ( (newRecipe) -> $location.path("/recipes/#{newRecipe.id}") ),
          onError
        )

    $scope.delete = ->
      $scope.recipe.$delete()
      $scope.back()

])
