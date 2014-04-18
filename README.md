beatport-renamer
================

Simple Ruby script to rename a standard beatport filename to anything you want.

### How to use

1) Set your token / api keys in a config file

2) Execute the script

``` bash
chmod +x renamer.rb
./renamer.rb path/to/beatport/folder/ "%{key} %{bpm} %{name} %{remix}" path/to/config/file


```

The format argument can be anything as long as it contains %{key} %{bpm} %{name} and %{remix}
