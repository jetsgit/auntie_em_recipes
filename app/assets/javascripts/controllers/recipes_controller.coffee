controllers = angular.module('controllers')
controllers.controller('RecipesController', ['$scope', '$routeParams', '$location', '$resource',
  ($scope, $routeParams, $location, $resource) ->
    $scope.search = (keywords)-> $location.path('/').search('keywords', keywords)
    Recipe = $resource('/recipes/:recipeID', { recipeID: "@id", format: 'json' })
    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.recipes = recipes.filter (recipe) -> recipe.name.toLowerCase().indexOf(keywords) != -1
      Recipe.query(keywords: $routeParams.keywords, (results) ->
        $scope.recipes = results
      )
    else
      $scope.recipes = []
    $scope.placeholder = "Kalamari, Paella, Lamb Stew, etc..."
])
recipes = [
  {
    id: 1
    name: 'Baked Potato w/ Cheese'
  },
  {
    id: 2
    name: 'Garlic Mashed Potatoes',
  },
  {
    id: 3
    name: 'Potatoes Au Gratin',
  },
  {
    id: 4
    name: 'Baked Brussel Sprouts',
  },
]
