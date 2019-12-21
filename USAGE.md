<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      1.2.0
-->

# Usage Linux
On Linux, using the Bash shell, I do the following alias

```bash
alias vi='vim -g -p'
```

# Vim vs GVim
vim runs in terminal, if you set up your terminal correctly, vim supports 256 (or 88) colors.
However gvim  runs in a graphics window and can support from 000000 - FFFFFF colors.

You can start vim as long as you can get a terminal, even tty or pts.
But with Gvim you have to have GUI installed, such as X Windows or MS Windows.

If you want to test your codes in shell/terminal,
or execute some shell commands during your editing.
In vim you can just `ctrl-z` to back to terminal do what you want,
and `fg` back to vim. With Gvim, you cannot do that.

When you are in gvim, you have that single window,
switching to other program/application is not as easy (read comfortable) as vim in tmux/screen.

On some systems, gvim is just `vim -g`:
you can edit a file in a GVim window from your shell with `vim -g filename` or simply `gvim filename`.
On other systems, like RedHat, vim and gvim are two different executables.

# Usage Windows
gvim

# Usage Chromebook
```bash
sudo apt-get install vim-gnome
```

```bash
$ whereis vim
vim: /usr/bin/vim.gnome /usr/bin/vim /usr/bin/vim.tiny /usr/bin/vim.basic /etc/vim /usr/bin/X11/vim.gnome /usr/bin/X11/vim /usr/bin/X11/vim.tiny /usr/bin/X11/vim.basic /usr/share/vim /usr/share/man/man1/vim.1.gz
```

```bash
$ whereis vi
vi: /usr/bin/vi /usr/bin/X11/vi /usr/share/man/man1/vi.1.gz
```

