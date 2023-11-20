local http = require "resty.http"
local cjson = require "cjson"


local RestrictionCheck = {
  VERSION = "1.0.0",
  PRIORITY = 99999,
}

function RestrictionCheck:access(conf)
  local httpc, err = http.new()
  httpc:set_timeout(5000)

  local response, error = httpc:request_uri(conf.target_url, {
    method = "GET"
  })

  if error then
    return kong.response.exit(
      500,
      {
        message = "Restriction Check API is not working."
      }
    )
  end

  local table_response_body = cjson.decode(response.body)

  if table_response_body[conf.decide_key] then
    return kong.response.exit(
      503,
      {
        message = "This API is under maintenance."
      }
    )
  end
end

return RestrictionCheck
