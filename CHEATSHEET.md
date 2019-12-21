<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      1.2.0
-->

"People don’t know that vi was written for a world that doesn’t exist anymore."
... Bill Joy, as reported in "[A Look at Vim, a Text Editor for the Ages][01]".
Also see "[Where Vim Came From][02]".

* Text Objects and Motions
    * Text Objects
        * w - words
        * s - sentence
        * p - paragraphs
        * t - tags
    * Motions
        * a - all
        * i - in
        * t - 'til
        * f - find forward
        * F- find backward
    * Commands
        * d - delete (also cut)
        * c - change (delete then place in insert mode)
        * y - yank
        * v - visual slect
* DOT Command
    * repeat the last command
* Macros
    * Sequence of commands recorded to a register

These can be combined
{Commands}{Text Object or Motion}

Example "diw" does a delete in word
"di[" does delete in bracket
"yi)" yank all text inside parentheses

## Working with files
| Vim Command | Action|
|:-----------:|:------|
| :w filename | Save changes to a file. If you don't specify a file name, Vim saves as the file name you were editing. For saving the file under a different name, specify the file name. |
| :q | Quit Vim. If you have unsaved changes, Vim refuses to exit. |
| :q! | Exit Vim without saving changes. |
| :qa | quit all (close Vim, but not if there are unsaved changes) |
| :qa! | quit all (close Vim without saving—discard any changes) |
| :wq | Write the file and exit. |
| :wa | write all changed files (save all changes), and keep working |
| :ZZ | write current file, if modified, and exit. |
| :1,10 w _outfile_ | Saves lines 1 to 10 in _outfile_ |
| :1,10 w >> _outfile_ | Appends lines 1 to 10 to _outfile_ |
| :r _infile_ | Insert the content of _infile_ |
| :23r _infile_ | Insert the content of _infile_ under line 23 |
| :x | Almost the same as :wq, write the file and exit if you've made changes to the file. If you haven't made any changes to the file, Vim exits without writing the file. |
| CTRL-Z | Suspend Vim, like ":stop".  Works in Normal and in Visual mode.  In Insert and Command-line mode, the CTRL-Z is inserted as a normal character. |

### How to Exit
| Vim Command | Action|
|:-----------:|:------|
| :q[uit] | Quit Vim. This fails when changes have been made. |
| :q[uit]! | Quit without writing. |
| :cq[uit] | Quit always, without writing. |
| :wq | Write the current file and exit. |
| :wq! | Write the current file and exit always. |
| :wq {file} | Write to {file}. Exit if not editing the last |
| :wq! {file} | Write to {file} and exit always. |
| :[range]wq[!] | [file] Same as above, but only write the lines in [range]. |
| ZZ | Write current file, if modified, and exit. |
| ZQ | Quit current file and exit (same as ":q!"). |

### Editing a File
| Vim Command | Action|
|:-----------:|:------|
| :e[dit] | Edit the current file. This is useful to re-edit the current file, when it has been changed outside of Vim. |
| :e[dit]! | Edit the current file always. Discard any changes to the current buffer. This is useful if you want to start all over again. |
| :e[dit] {file} | Edit {file}. |
| :e[dit]! {file} | Edit {file} always. Discard any changes to the current buffer. |
| gf | Edit the file whose name is under or after the cursor. Mnemonic: "goto file". |

## Moving around in the file
These Vim commands and keys work both in command mode and visual mode.

| Vim Command | Action|
|:-----------:|:------|
| j or Up Arrow | Move the cursor up one line. |
| k or Down Arrow | Down one line. |
| h or Left Arrow | Left one character. |
| l or Right Arrow | Right one character. |
| w | Move to next word |
| W | Move to next blank delimited word |
| e | To the end of a word. |
| E | To the end of a whitespace-delimited word. |
| b | To the beginning of a word. |
| B | To the beginning of a whitespace-delimited word. |
| ( | Move a sentence back |
| ) | Move a sentence forward |
| { | Move a paragraph back |
| } | Move a paragraph forward |
| 0 | To the beginning of a line. |
| ^ | To the first non-whitespace character of a line. |
| $ | To the end of a line. |
| 1G | Move to the first line of the file |
| G | Move to the last line of the file |
| nG | Move to nth line of the file |
| fc | Move forward to c |
| Fc | Move back to c |
| :n | Jump to line number n. For example, to jump to line 42, you'd type :42 |
| H | To the first line of the screen. |
| M | To the middle line of the screen. |
| L | To the last line of the screen. |
| % | Move to associated ( ), { }, [ ] |

## Inserting and overwriting text
| Vim Command | Action|
|:-----------:|:------|
| i | Insert before cursor. |
| I | Insert to the start of the current line. |
| a | Append after cursor. |
| A | Append to the end of the current line. |
| o | Open a new line below and insert. |
| O | Open a new line above and insert. |
| C | Change the rest of the current line. |
| r | Overwrite one character. After overwriting the single character, go back to command mode. |
| R | Enter insert mode but replace characters rather than inserting. |
| Esc | Exit insert/overwrite mode and go back to command mode. |

## Deleting text
| Vim Command | Action|
|:-----------:|:------|
| Del-key | Delete characters under the cursor. |
| x | Delete characters under the cursor. |
| X | Delete characters before the cursor. |
| dd or :d | Delete the current line. |
| dw | Delete the word under the cursor. |
| d$ | Delete to the end of the line. |
| d{motion} | Delete text that {motion} moves over |

## Yanking Text
Note that "* and "+ work both ways. So if you have selected some text in another application, you can paste it into vim using "*p and if you have copied some text (using, say, Ctrl-C) then you can paste it into vim using "+p.

| Vim Command | Action|
|:-----------:|:------|
| yy | Yank the current line |
| :y | Yank the current line |
| nyy | Yank n lines from current down |
| yw | Yank the word under the cursor |
| y$ | Yank to the end of the line |
| "+y | copies to the "usual" clipboard buffer (so you can paste using Ctrl+V, right click and select "Paste" etc) |
| "*y | copies to the X11 selection - you can paste from this buffer using middle click |

## Putting Text
| Vim Command | Action|
|:-----------:|:------|
| p | Put after the position or after the line |
| P | Put before the position or before the line |

## Changing Text
| Vim Command | Action|
|:-----------:|:------|
| C | Change to the end of the line |
| cc | Change the whole line |
| cw | Change the word under the cursor |

## Other
| Vim Command | Action|
|:-----------:|:------|
| J | Join lines |
| . | Repeat last text-changing command |
| u | Undo last change |
| U | Undo all changes to line |

## Entering visual mode
| Vim Command | Action|
|:-----------:|:------|
| v | Start highlighting characters. Use the normal movement keys and commands to select text for highlighting. |
| V | Start highlighting lines. |
| The ESC key | Exit visual mode and return to command mode. |

## Editing blocks of text
Note: the Vim commands marked with (V) work in visual mode, when you've selected some text. The other commands work in the command mode, when you haven't selected any text.

| Vim Command | Action|
|:-----------:|:------|
| ~ | Change the case of characters. This works both in visual and command mode. In visual mode, change the case of highlighted characters. In command mode, change the case of the character under cursor. |
| > (V) | Shift right (indent). |
| < (V) | Shift left (de-indent). |
| c (V) | Change the highlighted text. |
| y (V) | Yank the highlighted text. In Windows terms, "copy the selected text to clipboard." |
| d (V) | Delete the highlighted text. In Windows terms, "cut the selected text to clipboard." |
| yy or :y or Y | Yank the current line. You don't need to highlight it first. |
| dd or :d | Delete the current line. Again, you don't need to highlight it first. |
| p | Put the text you yanked or deleted. In Windows terms, "paste the contents of the clipboard". Put characters after the cursor. Put lines below the current line. |
| P | Put characters before the cursor. Put lines above the current line. |

## Spelling
| Vim Command | Action|
|:-----------:|:------|
| ]s | move to the next misspelled word |
| [s | move to the previous misspelled word |
| zg | add a word to the dictionary |
| zug | undo the addition of a word to the dictionary |
| z= | view spelling suggestions for a misspelled word |

## Alignment
| Vim Command | Action|
|:-----------:|:------|
| :%!fmt | Align all lines |
| !}fmt | Align all lines at the current position |
| 5!!fmt | Align the next 5 lines |

## Undo and redo
| Vim Command | Action|
|:-----------:|:------|
| u | Undo the last action. |
| U | Undo all the latest changes that were made to the current line. |
| Ctrl + r | Redo. |

## Search
| Vim Command | Action|
|:-----------:|:------|
| /pattern | Search the file for pattern. |
| n | Scan for next search match in the same direction. |
| N | Scan for next search match but opposite direction. |
| /word | Search word from top to bottom |
| ?word | Search word from bottom to top |
| /jo[ha]n | Search john or joan |
| /\< the | Search the, theatre or then |
| /the\> | Search the or breathe |
| /\< the\> | Search the |
| /\< ¦.\> | Search all words of 4 letters |
| /\/ | Search fred but not alfred or frederick |
| /fred\|joe | Search fred or joe |
| /\<\d\d\d\d\> | Search exactly 4 digits |
| /^\n\{3} | Find 3 empty lines |
| :bufdo /searchstr/ | Search in all open files |

## Replace
| Vim Command | Action|
|:-----------:|:------|
| :rs/foo/bar/a | Substitute foo with bar. r determines the range and a determines the arguments. |
| The range (r) can be |  |
| nothing | Work on current line only. |
| number | Work on the line whose number you give. |
| % | The whole file. |
| **Arguments (a) can be** | |
| g | Replace all occurrences in the line. Without this, Vim replaces only the first occurrences in each line. |
| i | Ignore case for the search pattern. |
| I | Don't ignore case. |
| c | Confirm each substitution. You can type y to substitute this match, n to skip this match, a to substitute this and all the remaining matches ("Yes to all"), and q to quit substitution. |
| **Examples** | |
| :452s/foo/bar/ | Replace the first occurrence of the word foo with bar on line number 452. |
| :s/foo/bar/g | Replace every occurrence of the word foo with bar on current line. |
| :%s/foo/bar/g | Replace every occurrence of the word foo with bar in the whole file. |
| :%s/foo/bar/gi | The same as above, but ignore the case of the pattern you want to substitute. This replaces foo, FOO, Foo, and so on. |
| :%s/foo/bar/gc | Confirm every substitution. |
| :%s/foo/bar/c | For each line on the file, replace the first occurrence of foo with bar and confirm every substitution. |
| :%s/old/new/g | Replace all occurrences of old by new in file |
| :%s/old/new/gw | Replace all occurrences with confirmation |
| :2,35s/old/new/g | Replace all occurrences between lines 2 and 35 |
| :5,$s/old/new/g | Replace all occurrences from line 5 to EOF |
| :%s/^/hello/g | Replace the beginning of each line by hello |
| :%s/$/Harry/g | Replace the end of each line by Harry |
| :%s/onward/forward/gi | Replace onward by forward, case insensitive |
| :%s/ *$//g | Delete all white spaces |
| :g/string/d | Delete all lines containing string |
| :v/string/d | Delete all lines containing which didn’t contain string |
| :s/Bill/Steve/ | Replace the first occurrence of Bill by Steve in current line |
| :s/Bill/Steve/g | Replace Bill by Steve in current line |
| :%s/Bill/Steve/g | Replace Bill by Steve in all the file |
| :%s/\r//g | Delete DOS carriage returns (^M) |
| :%s/\r/\r/g | Transform DOS carriage returns in returns |
| :%s#<[^>]\+>##g | Delete HTML tags but keeps text |
| :%s/^\(.*\)\n\1$/\1/ | Delete lines which appears twice |
| Ctrl+a | Increment number under the cursor |
| Ctrl+x | Decrement number under cursor |
| **Regular Expressions** | |
| . (dot) | Any single character except newline |
| * | zero or more occurances of any character |
| [...] | Any single character specified in the set |
| [^...] | Any single character not specified in the set |
| ^ | Anchor - beginning of the line |
| $ | Anchor - end of line |
| \< | Anchor - begining of word |
| \> | Anchor - end of word |
| \(...\) | Grouping - usually used to group conditions |
| \n | Contents of nth grouping |
| **[...] - Set Examples** | |
| [A-Z] | The SET from Capital A to Capital Z |
| [a-z] | The SET from lowercase a to lowercase z |
| [0-9] | The SET from 0 to 9 (All numerals) |
| [./=+] | The SET containing . (dot), / (slash), =, and + |
| [-A-F] | The SET from Capital A to Capital F and the dash (dashes must be specified first) |
| [0-9 A-Z] | The SET containing all capital letters and digits and a space |
| [A-Z][a-zA-Z] | In the first position, the SET from Capital A to Capital Z.  In the second character position, the SET containing all letters |
| **Regular Expression Examples** | |
| /Hello/ | Matches if the line contains the value Hello |
| /^TEST$/ | Matches if the line contains TEST by itself |
| /^[a-zA-Z]/ | Matches if the line starts with any letter |
| /^[a-z].*/ | Matches if the first character of the line is a-z and there is at least one more of any character following it |
| /2134$/ | Matches if line ends with 2134 |
| /\(21|35\)/ | Matches is the line contains 21 or 35. Note the use of ( ) with the pipe symbol to specify the 'or' condition |
| /[0-9]*/ | Matches if there are zero or more numbers in the line |
| /^[^#]/ | Matches if the first character is not a # in the line |

## Case
| Vim Command | Action|
|:-----------:|:------|
| Vu | Lowercase line |
| VU | Uppercase line |
| g~~ | Invert case |
| vEU | Switch word to uppercase |
| vE~ | Modify word case |
| ggguG | Set all text to lowercase |
| :set ignorecase | Ignore case in searches |
| :set smartcase | Ignore case in searches excepted if an uppercase letter is used |
| :%s/\<./\u&/g | Sets first letter of each word to uppercase |
| :%s/\<./\l&/g | Sets first letter of each word to lowercase |
| :%s/.*/\u& | Sets first letter of each line to uppercase |
| :%s/.*/\l& | Sets first letter of each line to lowercase |

## Tabs
| Vim Command | Action|
|:-----------:|:------|
| :tabnew | Creates a new tab |
| gt | Show next tab |
| :tabfirst | Show first tab |
| :tablast | Show last tab |
| :tabm n(position) | Rearrange tabs |
| :tabdo %s/foo/bar/g | Execute a command in all tabs |
| :tab ball | Puts all open files in tabs |

## Window Splitting
| Vim Command | Action|
|:-----------:|:------|
| :e filename | Edit filename in current window |
| :split filename | Split the window and open filename |
| ctrl-w up arrow | Puts cursor in top window |
| ctrl-w ctrl-w | Puts cursor in next window |
| ctrl-w_ | Maximize current window |
| ctrl-w= | Gives the same size to all windows |
| 10 ctrl-w+ | Add 10 lines to current window |
| :vsplit file | Split window vertically |
| :sview file | Same as :split in read-only mode |
| :hide | Close current window |
| :­nly | Close all windows, excepted current |
| :b 2 | Open #2 in this window |

## Marks
| Vim Command | Action|
|:-----------:|:------|
| mk | Marks current position as k |
| ˜k | Moves cursor to mark k |
| dk | Delete all until mark k |

## Recording Macros
| Vim Command | Action|
|:-----------:|:------|
| q{0-9a-zA-Z"} | Record typed characters into register {0-9a-zA-Z"} (uppercase to append).  The 'q' command is disabled while executing a register, and it doesn't work inside a mapping and :normal. |
| q | Stops recording.  (Implementation note: The 'q' that stops recording is not stored in the register, unless it was the result of a mapping) |
| qq | Start recording a new macro to the register q. |

## Play Back Macros
| Vim Command | Action|
|:-----------:|:------|
| @q{0-9a-zA-Z"} | Play back the macro. |
| {0-9}@q{0-9a-zA-Z"} | Play back the macro q{0-9a-zA-Z"} a {0-9} number of  times. |
| @@ | Repeat the last macro played |

## Folding
| Vim Command | Action|
|:-----------:|:------|
| zf#j | creates a fold from the cursor down # lines |
| zf/ | string creates a fold from the cursor to string |
| zf{motion} or {Visual}zf | operator to create a fold |
| zf'a | fold to mark |
| zn | fold none: reset 'foldenable'. All folds will be open |
| zN | fold normal: set 'foldenable'. All folds will be as they were before |
| zi | invert 'foldenable' |
| zj | moves the cursor to the next fold |
| zk | moves the cursor to the previous fold |
| zo | opens a fold at the cursor |
| zO | opens all folds at the cursor |
| zm | increases the fold-level by one |
| zM | closes all open folds |
| zr | decreases the fold-level by one |
| zR | decreases the fold-level to zero -- all folds will be open |
| zd | deletes the fold at the cursor |
| zE | deletes all folds |
| [z | move to start of open fold |
| ]z | move to end of open fold |



[01]:https://thenewstack.io/a-look-at-vim-a-text-editor-for-the-ages
[02]:https://twobithistory.org/2018/08/05/where-vim-came-from.html
