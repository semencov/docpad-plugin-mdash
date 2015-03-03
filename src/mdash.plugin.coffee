Mdash = require 'mdash-node'
instances = {}

module.exports = (BasePlugin) ->

  class MdashPlugin extends BasePlugin

    name: 'mdash'

    config:
      default:
        "Text": false
        "OptAlign": false

    extendTemplateData: (options) ->
      docpad = @docpad
      config = @config
      templateData = options.templateData

      templateData.mdash = (str, set='default') ->
        if set in Object.keys(instances)
          tp = instances[set]
        else
          tp = new Mdash(config[set] or config.default or {})
          instances[set] = tp
        str and tp.format(str)

