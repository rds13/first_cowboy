PROJECT = first_cowboy

DEPS = cowboy folsom folsom_cowboy bear folsomite zeta lager protobuffs proper
dep_cowboy = git https://github.com/ninenines/cowboy master
dep_folsom = git https://github.com/boundary/folsom 0.8.1
dep_folsom_cowboy = git https://github.com/rds13/folsom_cowboy master
dep_bear = git https://github.com/boundary/bear 0.8.2
dep_folsomite = git https://github.com/rds13/folsomite master
dep_zeta = git https://github.com/campanja/zeta campanja
dep_lager = git https://github.com/basho/lager master
dep_protobuffs = git https://github.com/campanja/protobuffs campanja
dep_proper = git https://github.com/manopapad/proper master

include erlang.mk
