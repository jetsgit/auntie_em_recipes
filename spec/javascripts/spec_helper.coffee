#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks
#= require support/phantomjs-shims
# include below, jet
# beforeEach(module('auntie_em_recipes'))

# setupController = (keywords, results) ->
# main functioning helper
# beforeEach -> inject (_$routeParams_, _$httpBackend_, _$compile_, _$rootScope_, _$controller_, _$location_, _$resource_, $injector, $timeout) ->
#   @scope = _$rootScope_.$new()
#   @httpBackend = _$httpBackend_
#   @compile = _$compile_
#   @location = _$location_
#   @controller = _$controller_
#   @resource = _$resource_
#   @injector = $injector
#   @timeout = $timeout
#   @routeParams = _$routeParams_
#   @eventLoop =
#     flush: =>
#       @scope.digest()

#   recipes = [
#     {
#       id: 2
#       name: 'Baked Potatoes'
#     },
#     {
#       id: 4
#       name: 'Potatoes Au Gratin'
#     }
#   ]

# end main functioning helper

  # if typeof(results) != 'undefined'
  #   request = new RegExp("\/recipes.*keywords=#{keywords}")
  #   @httpBackend.expectGET(request).respond(results)

beforeEach ->
  jasmine.addMatchers(
    toEqualData: (util, customEqualityTesters) ->
      compare: (actual, expected) ->
        pass: angular.equals actual, expected
  )

# afterEach ->
#   @httpBackend.resetExpectations
#   @httpBackend.verifyNoOutstandingExpectation()
