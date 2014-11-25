angular.module('angular-tv4', [])

.controller 'AppCtrl', ($scope) ->
  angular.extend $scope, {

    error: null

    schema: null
    data: null

    init: ->
      for value in ['schema', 'data']
        $scope.$watch(value, $scope.validate)

    parseFromStrings: (keyVals) ->

      try

        for own key, string of keyVals
          keyVals[key] = new Function("return #{string}")()
        return keyVals

      catch err
        throw new Error "Failed to parse #{key}"

    validate: ->

      try

        { jsSchema, jsData } = $scope.parseFromStrings {
          jsSchema: $scope.schema
          jsData: $scope.data
        }

        valid = tv4.validate(jsData ? {}, jsSchema)
        $scope.error = tv4.error
        return valid

      catch err
        $scope.error = err

    printError: ->
      if $scope.error
        JSON.stringify($scope.error, null, 2)
      else 'PASSES'

  }
    .init()
