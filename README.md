# 🗃 Fidis
[![made-with-ruby](https://img.shields.io/badge/Made%20with-Ruby-red)](https://www.ruby-lang.org)
[![ruby-version](https://img.shields.io/badge/ruby-v3.0.2-red)](https://www.ruby-lang.org)


**FI**le **DI**ctionary **S**hell - FIDIS
A File Based Redis written in Ruby

# ℹ About Fidis
Fidis is a ruby implementation of Redis. It stores data in memory for faster processing.
Data in memory can be saved using the ```save``` command. To See the commands available, [click](https://github.com/harishtpj/Fidis/new/main?readme=1#-commands) here

# 🌈 Features
 - Stores Data in .yml file
 - Keys are Ruby Sumbols
 - Symbol Sets ([info](https://github.com/harishtpj/Fidis/new/main?readme=1#-symbol-sets))
 - Ruby Commands Can Be Used (pry console)
 - Can be embedded in Ruby Programs
 
# 🚥 Symbol Sets
Symbol Sets are Sets which contain Symbol keys present in Memory. This is very Helpful in Grouping Keys under one Set.
These Sets inherits all Properties in Ruby Set

# 📚 Commands
```
$ ruby fidis.rb -h
Usage: fidis [options]
    -v, --version                    Returns version of Application
    -c, --console                    Opens Fidis Shell
    -l, --load=FNAME                 Loads .yml data file
```

## Basic Operations
```get <key>``` - Returns the value of a Key

```set <key> <val>``` - Creates a Key with value

```incr <key> <counter>``` - Increments the value of a Key (Default-1)

```listkeys``` - List all the Keys available

```tkeys <valtype>``` - List all the Keys with specific type

```type <key>``` - Returns the type of value that Key stores

```del <key>``` - Delets the Key

```clscr``` - Clears Screen

```save <filename>``` - Saves Data to .yml file

## List Commands
```lset <key> <lval>``` - Creates a key with a list value

```lpush <lkey> <val>``` - Prepends a list element

```rpush <lkey> <val>``` - Appends a list element

## Hash Commands
```hset <key> <hval>``` - Creates a key with Hash value

```hget <key>``` - Returns the value of a Hash Key type in a Nice Formatted way

```hpush <hkey> <hval>``` - Appends a Hash Key

## Symbol Set Commands
```sset <key> <sval>``` - Creates a Symbol Set Key

```sget <key>``` - Returns a Key-Value Table of Data

```spush <key> <sval>``` - Appends a Symbol Set
