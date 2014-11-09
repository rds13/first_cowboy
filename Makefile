PROJECT = first_cowboy
DEPS = cowboy folsom folsom_cowboy bear
dep_cowboy = git https://github.com/ninenines/cowboy master
dep_folsom = git https://github.com/boundary/folsom master
dep_folsom_cowboy = git https://github.com/rds13/folsom_cowboy master
dep_bear = git https://github.com/boundary/bear 0.8.2
include erlang.mk
