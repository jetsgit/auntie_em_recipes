chefstep = angular.module 'chefstep', [
  'templates',
  'ngRoute',
  'controllers'
]

chefstep.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: 'index.html'
        controller: 'RecipesController'
      )
])

controllers = angular.module(controllers, [])
controllers.controller('RecipesController'[ '$scope'
  ($scope) ->
])
