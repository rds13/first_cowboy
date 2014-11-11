-module(first_cowboy_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    application:start(folsomite),
    Dispatch = cowboy_router:compile([
            {'_', [{"/", hello_handler, []}]}
        ]),
    cowboy:start_http(my_http_listener, 10, [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]
    ),
    first_cowboy_sup:start_link().

stop(_State) ->
    ok.
