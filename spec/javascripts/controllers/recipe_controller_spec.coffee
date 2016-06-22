#= require 'spec_helper'
describe 'RecipeController', ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  flash        = null
  location     = null
  recipeID     = 42
  
  fakeRecipe  =
    id: recipeID
    name: 'Baked Potatoes'
    instructions: 'Pierce potato with fork, nuke for 20 minutes'

  setupController = (recipeExists=true, recipeID=42)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller, _flash_) ->
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
        
  describe 'create', ->
    newRecipe =
      id: 42
      name: 'Toast'
      instructions: 'put in toaster, push lever'

    beforeEach ->
      setupController(false, false)
      request = new RegExp("\/recipes")
      httpBackend.expectPOST(request).respond(201, newRecipe)

    it 'posts to the backend', ->
      scope.recipe.name           = newRecipe.name
      scope.recipe.instructions   = newRecipe.instructions
      scope.save()
      httpBackend.flush()
      expect(location.path()).toBe("/recipes/#{newRecipe.id}")
  describe 'update', ->
    updatedRecipe = 
      name: 'Toast'
      instructions: 'put in toaster, push lever, add butter'

    beforeEach ->
      setupController()
      httpBackend.flush()
      request = new RegExp("\/recipes")
      httpBackend.expectPUT(request).respond(204)

    it 'posts to the backend', ->
      scope.recipe.name         = updatedRecipe.name
      scope.recipe.instructions = updatedRecipe.instructions
      scope.save()
      httpBackend.flush()
      expect(location.path()).toBe("/recipes/#{scope.recipe.id}")

  describe 'delete', ->
    beforeEach ->
      setupController()
      httpBackend.flush()
      request = new RegExp("\/recipes/#{scope.recipe.id}")
      httpBackend.expectDELETE(request).respond(204)

    it 'posts to the backend', ->
      scope.delete()
      httpBackend.flush()
      expect(location.path()).toBe('/')
