defmodule <%= app_module %>.Web.Router do 
  use Plug.Router

  plug(<%= app_module %>.Web.Plug.Bakery)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json, :multipart],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  get "/api/" do
    conn |> send_resp(200, "<h1>working</h1>")
  end


end
