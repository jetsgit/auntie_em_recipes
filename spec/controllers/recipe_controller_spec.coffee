describe 'RecipeController', ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  recipeID     = 42
  
  fakeRecipe  =
    id: recipeID
    name: 'Baked Potatoes'
    instructions: 'Pierce potato with fork, nuke for 20 minutes'

  setupController =(recipeExists=true)->
    inject(($location, $routeParams, $rootScope, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.recipeID = recipeID

      ctrl        = $controller('RecipeController', $scope: scope)
    )

  beforeEach(module(auntie_em_recipes))
  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()
