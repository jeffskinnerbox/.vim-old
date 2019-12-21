<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      1.2.0
-->

# Debugging Vim

## Trouble Isoltation
Debugging a troublesome Vim .vimrc file can be a challenge.
The posting "[Debug unexpected option settings][01]"
give you some hints on how to isolate where the problem might be.
Isolate the problem to the file your editing,
the plugins being used, or a section of your `.vimrc` file.

For starters, you can use the default Vim settings to assure
the problem isn't in the file being used.
To use Vim defaults

```bash
# the -u NONE prevents Vim from loading your vimrc
# -U NONE prevents Vim from loading your .gvimrc
vim -u NONE -U NONE <file-name>
```

You can use most define commands
(`:map`, `:abbreviate`, `:function`, `:autocmd`, ...) o
their own to list all defined maps, abbreviations, etc.
For example

```vim
:ab              " list abbreviations
:map             " list mappings
:scriptnames     " list scripts

:verbose ab x    " list abbreviations starting with 'x', and where set
:verbose map x   " list mappings starting with 'x', and where set
```

Maybe the problem is in one of the plugins?
To disable plugins, do this

```bash
vim --noplugin <file-name>
```
To isolate thing further,
try disabling parts of your `.vimrc` files to see if it still happens.
This can be done by commenting out commands,
or better yet, using a `finish` command in strategic places.
By placing a `finish` statement about halfway through your `.vimrc`,
you can sectionalized the location of the problem statement.

## Vim's Debugging Features
Vim comes with some [debugging features][02].
You can start up Vim in its debug mode with the `-D` argument.
To run Vim in debug mode without any plugins, run as:

```bash
vim --noplugin -D
```

Within debug mode, you can [step throught][03] the processing of the `.vimrc` file.
Type n/next to parse the next line and keep pressing Enter.
And cont or q to go back to vim interface.
Press `Ctrl`+`d` for list of available commands.
See "[Debugging Vim][03]" for more information.

## Vim's Logging Information
To troubleshoot the misbehaving .vimrc or its plugin,
you can capture a verbose log with `vim -V20vimlog`.



[01]:http://vim.wikia.com/wiki/Debug_unexpected_option_settings
[02]:http://vim.wikia.com/wiki/Debug_unexpected_option_settings
[03]:http://inlehmansterms.net/2014/10/31/debugging-vim/
[04]:
[05]:
[06]:
[07]:
[08]:
[09]:
