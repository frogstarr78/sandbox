-module(tree).
-export([empty/0, insert/3, lookup/2, has_val/2]).

empty() -> {node, 'nil'}.

%insert(Key, Value, Tree) -> Tree.
insert(Key, Val, {node, 'nil'})                                                  -> {node, {{node, 'nil'},                    Key, Val,    {node, 'nil'}}};
insert(NewKey, NewVal, {node, {LessNode, Key, Val, MoreNode}}) when NewKey < Key -> {node, {insert(NewKey, NewVal, LessNode), Key, Val,    MoreNode}};
insert(NewKey, NewVal, {node, {LessNode, Key, Val, MoreNode}}) when NewKey > Key -> {node, {LessNode,                         Key, Val,    insert(NewKey, NewVal, MoreNode)}};
insert(NewKey, NewVal, {node, {LessNode, Key, _, MoreNode}}) when NewKey =:= Key -> {node, {LessNode,                         Key, NewVal, MoreNode}}.

lookup(_,   {node, 'nil'}) -> undefined;
lookup(Key, {node, {_,        Key,     Val, _}})                  -> {ok, Val};
lookup(Key, {node, {LessNode, NodeKey, _, _}}) when Key < NodeKey -> lookup(Key, LessNode);
lookup(Key, {node, {_,        _,       _, MoreNode}})             -> lookup(Key, MoreNode).

has_val(_,   {node, 'nil'}) -> false;
has_val(Val, {node, {_, _, V, _}}) when Val =:= V -> true;
has_val(Val, {node, {L, _, _, M}}) -> has_val(Val, M) or has_val(Val, L).
