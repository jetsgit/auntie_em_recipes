#= require 'spec_helper'
describe 'RecipesController', ->
  beforeEach ->
    @controller('RecipesController',
      $scope: @scope
      $location: @location
    )
    # if typeof(results) != 'undefined'
    #   request = new RegExp("\/recipes.*keywords=#{keywords}")
    #   httpBackend.expectGET(request).respond(results)


  describe 'controller initialization', ->
    describe 'when no keywords present', ->
      it 'defaults to have no recipes', ->
        expect(@scope.recipes).toEqualData([])

  describe 'with keywords', ->
    keywords = 'Potatoes'
    recipes = [
      {
        id: 2
        name: 'Baked Potatoes'
      },
      {
        id: 4
        name: 'Potatoes Au Gratin'
      }
    ]
    it 'calls the backend', ->
      expect(recipes).toEqualData(recipes)

  describe 'search()', ->
    it 'redirects to itself to itself with a keyword param', ->
      keywords = 'foo'
      @scope.search(keywords)
      expect(@location.path()).toBe('/')
      expect(@location.search()).toEqualData({keywords: keywords})
