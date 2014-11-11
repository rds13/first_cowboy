-module(first_cowboy_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

-define(CHILD(Mod, Type), {Mod, {Mod, start_link, []},
        permanent, 5000, Type, [Mod]}).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Procs = [ ?CHILD(first_cowboy_stats, worker)],
	{ok, {{one_for_one, 1, 5}, Procs}}.
