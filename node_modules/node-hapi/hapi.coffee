HapiController = require "./hapiController"
LoadControllers = require "./utils/loadControllers"
LoadPolicies = require "./utils/loadPolicies"

HapiRequest = require "./utils/hapiRequest"
HapiPolicy = require "./utils/hapiPolicy"


class Hapi
  
  @test: ->
    console.log "ok"

Hapi.ApiController = HapiController
Hapi.Util = LoadControllers: LoadControllers, LoadPolicies: LoadPolicies , HapiRequest: HapiRequest , HapiPolicy: HapiPolicy

module.exports = Hapi
