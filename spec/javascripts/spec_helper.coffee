#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks
# Teaspoon includes some support files, but you can use anything from your own support path too.
#= require support/phantomjs-shims
#

beforeEach ->
  this.addMatchers
    toEqualData: (expected)-> return angular.equals(this.actual, expected)
