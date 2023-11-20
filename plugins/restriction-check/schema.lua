local typedefs = require "kong.db.schema.typedefs"

return {
  name = "restriction-check",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { target_url = {
            type = "string",
            required = true
          }},
          { decide_key = {
            type = "string",
            required = true
          }}
        }
      },
    },
  }
}
