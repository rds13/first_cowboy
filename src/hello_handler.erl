-module(hello_handler).

-export([init/2]).

init(Req, Opts) ->
    Req2 = cowboy_req:reply(200, [
            {<<"content-type">>, <<"text/plain">>}
        ], <<"Hello world!">>, Req),
    first_cowboy_stats:request(),
    {ok, Req2, Opts}.
