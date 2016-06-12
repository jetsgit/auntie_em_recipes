controllers = angular.module('controllers')
controllers.controller('RecipesController', ['$scope', '$routeParams', '$location', '$resource',
  ($scope, $routeParams, $location, $resource) ->
    $scope.search = (keywords)-> $location.path('/').search('keywords', keywords)
    # Define Recipe Class
    Recipe = $resource('/recipes/:recipeID', { recipeID: "@id", format: 'json' })
    if $routeParams.keywords
      Recipe.query(keywords: $routeParams.keywords, (results) ->
        $scope.recipes = results
      )
    else
      $scope.recipes = []
    $scope.placeholder = "Kalamari, Paella, Lamb Stew, etc..."
])
