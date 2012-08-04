#!perl
# vim:ts=4:sw=4:expandtab
# Verifies that switching between the different layouts works as expected.
use i3test;

my $tmp = fresh_workspace;

open_window;
open_window;
cmd 'split v';
open_window;

my ($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splitv', 'layout is splitv currently');

cmd 'layout stacked';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'stacked', 'layout now stacked');

cmd 'layout tabbed';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'tabbed', 'layout now tabbed');

cmd 'layout toggle split';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splitv', 'layout now splitv again');

cmd 'layout toggle split';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splith', 'layout now splith');

cmd 'layout toggle split';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splitv', 'layout now splitv');

cmd 'layout toggle split';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splith', 'layout now splith');

cmd 'layout toggle';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'stacked', 'layout now stacked');

cmd 'layout toggle';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'tabbed', 'layout now tabbed');

cmd 'layout toggle';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splith', 'layout now splith');

cmd 'layout toggle';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'stacked', 'layout now stacked');

cmd 'layout toggle all';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'tabbed', 'layout now tabbed');

cmd 'layout toggle all';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splith', 'layout now splith');

cmd 'layout toggle all';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splitv', 'layout now splitv');

cmd 'layout toggle all';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'stacked', 'layout now stacked');

cmd 'layout toggle all';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'tabbed', 'layout now tabbed');

cmd 'layout toggle all';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splith', 'layout now splith');

cmd 'layout toggle all';
($nodes, $focus) = get_ws_content($tmp);
is($nodes->[1]->{layout}, 'splitv', 'layout now splitv');

done_testing;
