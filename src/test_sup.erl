-module(test_sup).

-behavior(supervisor).

-export([start_link/0, init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    Server = {test, {test, start_link, []}, 
	      permanent, 20000, worker, [test]},
    Child = [Server],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Child}}.
