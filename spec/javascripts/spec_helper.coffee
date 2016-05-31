#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks
#= require support/phantomjs-shims

beforeEach(module('auntie_em_recipes'))

beforeEach inject (_$routeParams_, _$httpBackend_, _$compile_, _$rootScope_, _$controller_, _$location_, _$resource_, $injector, $timeout) ->
  @scope = _$rootScope_.$new()
  @httpBackend = _$httpBackend_
  @compile = _$compile_
  @location = _$location_
  @controller = _$controller_
  @resource = _$resource_
  @routeParams = _$routeParams_
  @injector = $injector
  @timeout = $timeout
  @eventLoop =
    flush: =>
      @scope.digest()

  if typeof(results) != 'undefined'
    request = new RegExp("\/recipes.*keywords=#{keywords}")
    httpBackend.expectGET(request).respond(results)

beforeEach ->
  jasmine.addMatchers(
    toEqualData: (util, customEqualityTesters) ->
      compare: (actual, expected) ->
        pass: angular.equals actual, expected
  )

afterEach ->
  @httpBackend.resetExpectations
  @httpBackend.verifyNoOutstandingExpectation()
