-module(test_app).


-behavior(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    case test_sup:start_link() of 
	{ok, Pid} ->
	    {ok, Pid};
	Error ->
	    io:format("Got error ~p ~n", [Error]),
	    {error, Error}
    end.

stop(_State) ->
    ok.
