#= require 'spec_helper'
describe 'RecipeController', ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  flash        = null
  recipeID     = 42
  
  fakeRecipe  =
    id: recipeID
    name: 'Baked Potatoes'
    instructions: 'Pierce potato with fork, nuke for 20 minutes'

  setupController =(recipeExists=true, recipeID=42)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller, _flash_)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.recipeID = recipeID if recipeID
      flash       = _flash_

      if recipeID
        request = new RegExp("\/recipes/#{recipeID}")
        results = if recipeExists
          [200, fakeRecipe]
        else
          [404]

        httpBackend.expectGET(request).respond(results[0], results[1])

      ctrl        = $controller('RecipeController',
                                    $scope: scope,
                                    $location: location
      )
    )

  beforeEach(module("auntie_em_recipes"))
  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'controller initialization', ->
    describe 'recipe is found', ->
      beforeEach(setupController())
      it 'loads the given recipe', ->
        httpBackend.flush()
        expect(scope.recipe).toEqualData(fakeRecipe)
    describe 'recipe is not found', ->
      beforeEach(setupController(false))
      it 'loads the given recipe', ->
        httpBackend.flush()
        expect(scope.recipe).toBe(null)
        expect(flash.error).toBe("There is no recipe with ID #{recipeID}")
      
