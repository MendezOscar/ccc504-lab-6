class ApiController

  constructor: (@app) ->
    @defineCustomRoutes?()
    @defineRestRoutes()
    @
    
  defineRestRoutes: =>
    parent = @constructor
    route = "/#{parent.route}"
    response = @app.get route         , @findAll
    response = @app.get route  + "/*" , @find
    response = @app.post route + "/*" , @create
    response = @app.put route  + "/*" , @update
    response = @app.del route  + "/*" , @destroy

  find: (req,res) ->
    return res.send 500 if !parseInt(req.entityId)
    res.send 200

  findAll: (req,res) ->
    res.send 200

  create: (req,res) ->
    res.send 200

  update: (req,res) ->
    res.send 200

  destroy: (req,res) ->
    res.send 200

module.exports = ApiController