mdash = require 'mdash-node'
instances = {}

# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class MdashPlugin extends BasePlugin
    # Plugin Name
    name: 'mdash'

    config:
      default:
        "Text.paragraphs": "off"
        "Text.auto_links": "off"
        "Text.email": "off"
        "Text.breakline": "off"
        "OptAlign": "off"


    extendTemplateData: (options) ->
      docpad = @docpad
      config = @config
      templateData = options.templateData

      templateData.mdash = (str, set="default") ->
        if set in Object.keys(instances)
          typo = instances[set]
        else
          typo = new mdash(config[set] or config.default or {})
          instances[set] = typo
        # console.log set, typo.format(str)
        str and typo.format(str)

