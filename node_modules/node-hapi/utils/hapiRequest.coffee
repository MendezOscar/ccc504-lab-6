_  = require 'lodash'
_.str = require 'underscore.string'

# adds entity , action and id to a express request
# used for policies
module.exports = (req, res, next) ->
  pieces = req.path.replace("/","").split('/');

  req.entity= if pieces.length > 0 then pieces[0] else null
  req.action= if pieces.length > 2 and pieces[1] == 'custom' then pieces[2] else null
  req.entityId= if pieces.length == 2 then pieces[1] else null

  if req.body.action then req.action = req.body.action
  if req.query.action then req.action = req.query.action

  if req.action == null and req.entity and req.app.controllers[req.entity]
    if req.method == "GET" and req.entityId != null then req.action = "find"
    if req.method == "GET" and req.entityId == null then req.action = "findAll"
    if req.method == "DEL" and req.entityId != null then req.action = "destroy"
    if req.method == "POST" and req.entityId != null then req.action = "update"
    if req.method == "PUT"  then req.action = "create"

  req.controller = req.app.controllers[req.entity]

  next();
