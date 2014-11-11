-module(first_cowboy_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

-define(HANDLER_POOL_SIZE,100).

start(_Type, _Args) ->
    HandlerPoolSize = get_app_env(handler_pool_size, ?HANDLER_POOL_SIZE),
    Dispatch = cowboy_router:compile([
            {'_', [{"/", hello_handler, []}]}
        ]),
    cowboy:start_http(my_http_listener, HandlerPoolSize, [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]
    ),
    case first_cowboy_sup:start_link() of
        {ok, Pid} ->
            alarm_handler:clear_alarm({application_stopped, first_cowboy}),
            {ok, Pid};
        Error ->
            alarm_handler:set_alarm({{application_stopped, first_cowboy}, []}),
            Error
    end.

stop(_State) ->
    alarm_handler:set_alarm({{application_stopped, first_cowboy}, []}),
    ok.

get_app_env(Opt, Default) ->
    {ok, Application} = application:get_application(),
    case application:get_env(Application, Opt) of
        {ok, Val} -> Val;
        _ ->
            case init:get_argument(Opt) of
                {ok, [[Val | _]]} -> Val;
                error       -> Default
            end
    end.
