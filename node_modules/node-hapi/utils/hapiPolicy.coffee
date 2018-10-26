_ = require("lodash")

module.exports = (req, res, next) ->
  #If entity or action is not defined use rule for all
  entity = req.entity or "*" 
  action = req.action or "*"
  
  #find in policies list of entities, if not defined fallback to all
  entityPolicies = req.app.policies[entity]
  entityPolicies = req.app.policies["*"] if _.isUndefined(entityPolicies)

  #find in entities list of actions, if not defined fallback to all
  rules = entityPolicies[action]
  rules = entityPolicies["*"] if _.isUndefined(rules)
  
  #if just one action, wrap in array
  rules = [ rules ] if _.isString(rules)

  result=true
  for rule in rules
    #call function with name equals to action in entity
    result = req.app.rules[rule](req,res)

  #if all rules passed , continue to perform action
  next() if result;
