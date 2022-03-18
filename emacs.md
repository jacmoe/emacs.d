

# Emacs Survival Guide

Notation:

`C` means `Control`, `S` means `SHIFT`, `M` means `Alt` (Meta)

For example, `C-x` means hold down the `Control` key while typing `x`.


# Regular


## Navigate

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-f / C-b</td>
<td class="org-left">move forward/backward by character</td>
</tr>


<tr>
<td class="org-left">M-f / M-b</td>
<td class="org-left">move forward/backward by word</td>
</tr>


<tr>
<td class="org-left">C-n / C-p</td>
<td class="org-left">move forward/backward by line</td>
</tr>


<tr>
<td class="org-left">C-a / C-e</td>
<td class="org-left">go to line beginning/end</td>
</tr>


<tr>
<td class="org-left">M-a / M-e</td>
<td class="org-left">go to sentence beginning/end</td>
</tr>


<tr>
<td class="org-left">M-{ / M-}</td>
<td class="org-left">go to paragraph beginning/end</td>
</tr>


<tr>
<td class="org-left">C-x [ / C-x ]</td>
<td class="org-left">go to page beginning/end</td>
</tr>


<tr>
<td class="org-left">C-v</td>
<td class="org-left">scroll to next screen</td>
</tr>


<tr>
<td class="org-left">M-v</td>
<td class="org-left">scroll to previous screen</td>
</tr>


<tr>
<td class="org-left">C-x &lt;</td>
<td class="org-left">scroll left</td>
</tr>


<tr>
<td class="org-left">C-x &gt;</td>
<td class="org-left">scroll right</td>
</tr>


<tr>
<td class="org-left">C-M-p</td>
<td class="org-left">scroll-down-line</td>
</tr>


<tr>
<td class="org-left">C-M-n</td>
<td class="org-left">scroll-up-line</td>
</tr>


<tr>
<td class="org-left">C-l</td>
<td class="org-left">scroll current line to center, top, bottom</td>
</tr>


<tr>
<td class="org-left">M-r</td>
<td class="org-left">reposition cursor to center, top, bottom</td>
</tr>


<tr>
<td class="org-left">M-m</td>
<td class="org-left">go to first non-whitespace on line, forward or backward</td>
</tr>
</tbody>
</table>


## Editing


### Files

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x C-f</td>
<td class="org-left">Find and open an existing file, or create a new file</td>
</tr>


<tr>
<td class="org-left">C-x d</td>
<td class="org-left">Open directory</td>
</tr>


<tr>
<td class="org-left">C-c r</td>
<td class="org-left">Open recently opened file</td>
</tr>


<tr>
<td class="org-left">C-x C-r</td>
<td class="org-left">Find and open file read-only</td>
</tr>


<tr>
<td class="org-left">C-x i</td>
<td class="org-left">Insert file</td>
</tr>


<tr>
<td class="org-left">C-x C-s</td>
<td class="org-left">Save file</td>
</tr>


<tr>
<td class="org-left">C-x C-w</td>
<td class="org-left">Save file as</td>
</tr>


<tr>
<td class="org-left">C-x C-c</td>
<td class="org-left">Exit Emacs</td>
</tr>
</tbody>
</table>


### Formatting

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-j</td>
<td class="org-left">perform ENTER followed by TAB</td>
</tr>


<tr>
<td class="org-left">C-o</td>
<td class="org-left">insert blank line</td>
</tr>


<tr>
<td class="org-left">C-x C-o</td>
<td class="org-left">remove all blank lines except one</td>
</tr>


<tr>
<td class="org-left">M-\</td>
<td class="org-left">delete all white space around point</td>
</tr>


<tr>
<td class="org-left">M-x canonically-space-region</td>
<td class="org-left">fix up spacing and casing in region</td>
</tr>
</tbody>
</table>


### Case change

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-u</td>
<td class="org-left">uppercase word</td>
</tr>


<tr>
<td class="org-left">M-l</td>
<td class="org-left">lowercase word</td>
</tr>


<tr>
<td class="org-left">M-c</td>
<td class="org-left">capitalize word</td>
</tr>


<tr>
<td class="org-left">M&#x2013; M-l</td>
<td class="org-left">Convert last word to lower case.  Note ‘Meta&#x2013;’ is Meta-minus.</td>
</tr>


<tr>
<td class="org-left">M&#x2013; M-u</td>
<td class="org-left">Convert last word to all upper case.</td>
</tr>


<tr>
<td class="org-left">M&#x2013; M-c</td>
<td class="org-left">Convert last word to lower case with capital initial.</td>
</tr>


<tr>
<td class="org-left">C-x C-u</td>
<td class="org-left">uppercase region</td>
</tr>


<tr>
<td class="org-left">C-x C-l</td>
<td class="org-left">lowercase region</td>
</tr>
</tbody>
</table>


### Search and replace

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-%</td>
<td class="org-left">Search and replace</td>
</tr>
</tbody>
</table>


## Frames and Windows

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x 1</td>
<td class="org-left">delete other windows</td>
</tr>


<tr>
<td class="org-left">C-x 2</td>
<td class="org-left">split window, above and below</td>
</tr>


<tr>
<td class="org-left">C-x 3</td>
<td class="org-left">split window, side by side</td>
</tr>


<tr>
<td class="org-left">C-M-v</td>
<td class="org-left">scroll other window</td>
</tr>


<tr>
<td class="org-left">C-x o</td>
<td class="org-left">switch cursor to another window</td>
</tr>


<tr>
<td class="org-left">C-x 4 b</td>
<td class="org-left">select buffer in other window</td>
</tr>


<tr>
<td class="org-left">C-x 4 C-o</td>
<td class="org-left">display buffer in other window</td>
</tr>


<tr>
<td class="org-left">C-x 4 f</td>
<td class="org-left">find file in other window</td>
</tr>


<tr>
<td class="org-left">C-x 4 d</td>
<td class="org-left">run dired in other window</td>
</tr>


<tr>
<td class="org-left">C-RIGHT</td>
<td class="org-left">grow window narrower</td>
</tr>


<tr>
<td class="org-left">C-LEFT</td>
<td class="org-left">grow window wider</td>
</tr>


<tr>
<td class="org-left">C-DOWN</td>
<td class="org-left">make window taller</td>
</tr>


<tr>
<td class="org-left">C-UP</td>
<td class="org-left">make window smaller</td>
</tr>


<tr>
<td class="org-left">M-x follow-mode</td>
<td class="org-left">toggle follow mode</td>
</tr>
</tbody>
</table>


## Other


### Transposing

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-t</td>
<td class="org-left">transpose two characters</td>
</tr>


<tr>
<td class="org-left">M-t</td>
<td class="org-left">transpose two words</td>
</tr>


<tr>
<td class="org-left">C-x C-t</td>
<td class="org-left">transpose two lines</td>
</tr>


<tr>
<td class="org-left">M-x ts</td>
<td class="org-left">transpose sentences</td>
</tr>


<tr>
<td class="org-left">M-x tp</td>
<td class="org-left">transpose paragraphs</td>
</tr>
</tbody>
</table>


### Read-only mode

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x C-q</td>
<td class="org-left">Toggle read-only mode</td>
</tr>
</tbody>
</table>


### Numeric argument

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-u num</td>
<td class="org-left">repeat following instruction num times</td>
</tr>
</tbody>
</table>


### Abbrevs

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x a g</td>
<td class="org-left">Add global abbrev</td>
</tr>
</tbody>
</table>


### Spell check

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">F12</td>
<td class="org-left">spellcheck buffer</td>
</tr>


<tr>
<td class="org-left">S-F12</td>
<td class="org-left">spellcheck word</td>
</tr>


<tr>
<td class="org-left">i</td>
<td class="org-left">add word to private dictionary</td>
</tr>


<tr>
<td class="org-left">r</td>
<td class="org-left">change word</td>
</tr>


<tr>
<td class="org-left">a</td>
<td class="org-left">skip word for this session</td>
</tr>


<tr>
<td class="org-left">SPACE</td>
<td class="org-left">skip word</td>
</tr>


<tr>
<td class="org-left">x</td>
<td class="org-left">end spellchecking session</td>
</tr>


<tr>
<td class="org-left">q</td>
<td class="org-left">abort spell checking session</td>
</tr>


<tr>
<td class="org-left">C-h</td>
<td class="org-left">show options screen for spellchecking session</td>
</tr>


<tr>
<td class="org-left">M-x ispell-change-dictionary</td>
<td class="org-left">change current dictionary</td>
</tr>
</tbody>
</table>


### Tabs

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-j</td>
<td class="org-left">perform ENTER followed by TAB</td>
</tr>


<tr>
<td class="org-left">M-i</td>
<td class="org-left">indent from the point to the next TAB-point</td>
</tr>
</tbody>
</table>


### Killing and deleting

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-w</td>
<td class="org-left">kill region</td>
</tr>


<tr>
<td class="org-left">M-w</td>
<td class="org-left">copy region to kill buffer</td>
</tr>


<tr>
<td class="org-left">C-y</td>
<td class="org-left">yank back last thing killed</td>
</tr>


<tr>
<td class="org-left">M-y</td>
<td class="org-left">replace last yank with previous kill, cycle kill ring</td>
</tr>


<tr>
<td class="org-left">M-z char</td>
<td class="org-left">zap to char</td>
</tr>
</tbody>
</table>


### Marking

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-@ / C-SPACE</td>
<td class="org-left">set mark here</td>
</tr>


<tr>
<td class="org-left">C-x C-x</td>
<td class="org-left">Exchange mark and point</td>
</tr>


<tr>
<td class="org-left">M-@</td>
<td class="org-left">mark arg words away</td>
</tr>


<tr>
<td class="org-left">M-h</td>
<td class="org-left">mark paragraph</td>
</tr>


<tr>
<td class="org-left">C-x h</td>
<td class="org-left">mark entire buffer</td>
</tr>
</tbody>
</table>


### Narrowing

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x n n</td>
<td class="org-left">narrow to region</td>
</tr>


<tr>
<td class="org-left">C-x n p</td>
<td class="org-left">narrow to page</td>
</tr>


<tr>
<td class="org-left">C-x n w</td>
<td class="org-left">widen view</td>
</tr>
</tbody>
</table>


### Undo / Redo

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x u</td>
<td class="org-left">undo</td>
</tr>


<tr>
<td class="org-left">C-g C-x u</td>
<td class="org-left">redo</td>
</tr>


<tr>
<td class="org-left">C-/</td>
<td class="org-left">undo</td>
</tr>


<tr>
<td class="org-left">C-g C-/</td>
<td class="org-left">redo</td>
</tr>


<tr>
<td class="org-left">M-x revert-buffer</td>
<td class="org-left">revert buffer to its original contents</td>
</tr>
</tbody>
</table>


### Registers

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x r s</td>
<td class="org-left">save region in register</td>
</tr>


<tr>
<td class="org-left">C-x r i</td>
<td class="org-left">insert register contents into buffer</td>
</tr>


<tr>
<td class="org-left">C-x r SPACE</td>
<td class="org-left">save value of point in register</td>
</tr>


<tr>
<td class="org-left">C-x r j</td>
<td class="org-left">jump to point saved in register</td>
</tr>
</tbody>
</table>


### Keyboard Macros

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">F3</td>
<td class="org-left">record keyboard macro</td>
</tr>


<tr>
<td class="org-left">F4</td>
<td class="org-left">end record keyboard macro / run keyboard macro</td>
</tr>
</tbody>
</table>


### Bookmarks

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-F5</td>
<td class="org-left">Bookmark set</td>
</tr>


<tr>
<td class="org-left">S-F5</td>
<td class="org-left">List bookmarks</td>
</tr>


<tr>
<td class="org-left">F5</td>
<td class="org-left">Bookmark jump</td>
</tr>
</tbody>
</table>


### Counting words

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-=</td>
<td class="org-left">count words in region</td>
</tr>


<tr>
<td class="org-left">C-u M-=</td>
<td class="org-left">count words in whole buffer</td>
</tr>
</tbody>
</table>


### Mark-ring

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-&lt;SPC&gt; C-&lt;SPC&gt;</td>
<td class="org-left">set the mark to the mark ring</td>
</tr>


<tr>
<td class="org-left">C-u C-&lt;SPC&gt;</td>
<td class="org-left">move point to where the mark was</td>
</tr>


<tr>
<td class="org-left">&lt;f7&gt;</td>
<td class="org-left">push current position to the mark ring</td>
</tr>


<tr>
<td class="org-left">M-&lt;f7&gt;</td>
<td class="org-left">jump to last position in the mark ring (go back)</td>
</tr>
</tbody>
</table>


### Whitespace

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-x whitespace-mode</td>
<td class="org-left">toggles rendering of white space</td>
</tr>
</tbody>
</table>


### Winner-mode

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c  left / right</td>
<td class="org-left">redo/undo window configuration</td>
</tr>
</tbody>
</table>


### Writeroom

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">F9</td>
<td class="org-left">Writeroom mode</td>
</tr>


<tr>
<td class="org-left">S-F9</td>
<td class="org-left">Writeroom modeline toggle</td>
</tr>
</tbody>
</table>


### Magit

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x g</td>
<td class="org-left">run Magit</td>
</tr>


<tr>
<td class="org-left">s</td>
<td class="org-left">stage</td>
</tr>


<tr>
<td class="org-left">c</td>
<td class="org-left">commit</td>
</tr>


<tr>
<td class="org-left">C-c C-c</td>
<td class="org-left">Execute commit, after having written the commit message</td>
</tr>


<tr>
<td class="org-left">P</td>
<td class="org-left">push</td>
</tr>


<tr>
<td class="org-left">F</td>
<td class="org-left">pull</td>
</tr>


<tr>
<td class="org-left">h</td>
<td class="org-left">show Magit keyboard commands</td>
</tr>


<tr>
<td class="org-left">q</td>
<td class="org-left">exit Magit</td>
</tr>
</tbody>
</table>


### Draftmode

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-x draft-mode</td>
<td class="org-left">Turn on draft-mode</td>
</tr>
</tbody>
</table>


### Yasnippet

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">TAB</td>
<td class="org-left">expand snippet</td>
</tr>


<tr>
<td class="org-left">C-c s n</td>
<td class="org-left">new snippet</td>
</tr>


<tr>
<td class="org-left">C-c s v</td>
<td class="org-left">visit snippet file</td>
</tr>
</tbody>
</table>


### Transparency

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c t</td>
<td class="org-left">toggle transparency</td>
</tr>
</tbody>
</table>


### wc-mode

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c w</td>
<td class="org-left">Turn on wc-mode</td>
</tr>


<tr>
<td class="org-left">M-x wc</td>
<td class="org-left">count words in buffer</td>
</tr>


<tr>
<td class="org-left">M-x wc-reset</td>
<td class="org-left">Reset wc-mode</td>
</tr>


<tr>
<td class="org-left">C-c C-w w</td>
<td class="org-left">set word goal</td>
</tr>
</tbody>
</table>


### Zoom

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x C-+</td>
<td class="org-left">Zoom in / make the text larger</td>
</tr>


<tr>
<td class="org-left">C-x C--</td>
<td class="org-left">Zoom out / make the text smaller</td>
</tr>


<tr>
<td class="org-left">C-x C-0</td>
<td class="org-left">Reset zoom level</td>
</tr>
</tbody>
</table>


### Org-roam

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c n f</td>
<td class="org-left">find node, or insert new node</td>
</tr>


<tr>
<td class="org-left">C-c n i</td>
<td class="org-left">insert link to node</td>
</tr>


<tr>
<td class="org-left">C-c n I</td>
<td class="org-left">insert link to node, without creating a node</td>
</tr>


<tr>
<td class="org-left">C-c n p</td>
<td class="org-left">find project</td>
</tr>


<tr>
<td class="org-left">C-c n t</td>
<td class="org-left">capture task</td>
</tr>


<tr>
<td class="org-left">C-c n b</td>
<td class="org-left">capture inbox</td>
</tr>


<tr>
<td class="org-left">C-c n d</td>
<td class="org-left">roam dailies</td>
</tr>
</tbody>
</table>


### Org-sidebar

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-x sb</td>
<td class="org-left">show sidebar</td>
</tr>


<tr>
<td class="org-left">M-x sbtree</td>
<td class="org-left">show tree sidebar</td>
</tr>


<tr>
<td class="org-left">M-x sbt</td>
<td class="org-left">toggle sidebar</td>
</tr>


<tr>
<td class="org-left">M-x sbtreet</td>
<td class="org-left">toggle tree sidebar</td>
</tr>
</tbody>
</table>

Hint: use `C-x n w` to widen the view of the main org-mode buffer if needed.


### Org-tracktable

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-x tti</td>
<td class="org-left">insert tracktable</td>
</tr>


<tr>
<td class="org-left">Mx-ttw</td>
<td class="org-left">write new tracktable entry</td>
</tr>


<tr>
<td class="org-left">M-x tts</td>
<td class="org-left">show tracktable status</td>
</tr>
</tbody>
</table>

Hint: use `C-c &` to get back to where you were prior to updating the tracktable.
Use tag `nowc` or `noexport` tags for the headings which content you do not want to be counted by the tracktable.


### Deft

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c d</td>
<td class="org-left">run deft</td>
</tr>


<tr>
<td class="org-left">C-c C-q</td>
<td class="org-left">quit deft</td>
</tr>
</tbody>
</table>


# Org-mode


## Visibility

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">TAB</td>
<td class="org-left">rotate current subtree between states</td>
</tr>


<tr>
<td class="org-left">S-TAB</td>
<td class="org-left">rotate entire buffer between states</td>
</tr>


<tr>
<td class="org-left">C-c C-x C-v</td>
<td class="org-left">toggle visibility of inline images</td>
</tr>
</tbody>
</table>


## Navigate

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c C-n/p</td>
<td class="org-left">next/previous heading</td>
</tr>


<tr>
<td class="org-left">C-c C-f/b</td>
<td class="org-left">next/previous heading, same level</td>
</tr>


<tr>
<td class="org-left">C-c C-u</td>
<td class="org-left">backward to higher level heading</td>
</tr>


<tr>
<td class="org-left">C-c C-j</td>
<td class="org-left">jump to another place in document</td>
</tr>
</tbody>
</table>


## Edit

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-RET</td>
<td class="org-left">insert new heading/item at current level</td>
</tr>


<tr>
<td class="org-left">C-RET</td>
<td class="org-left">insert new heading after subtree</td>
</tr>


<tr>
<td class="org-left">C-c -</td>
<td class="org-left">turn line into item, cycle item type</td>
</tr>


<tr>
<td class="org-left">C-c *</td>
<td class="org-left">turn item/line into headline</td>
</tr>


<tr>
<td class="org-left">M-LEFT/RIGHT</td>
<td class="org-left">promote/demote heading</td>
</tr>


<tr>
<td class="org-left">M-S-LEFT/RIGHT</td>
<td class="org-left">promote/demote current subtree</td>
</tr>


<tr>
<td class="org-left">M-UP/DOWN</td>
<td class="org-left">move subtree item up/down</td>
</tr>


<tr>
<td class="org-left">C-c C-x c</td>
<td class="org-left">clone a subtree</td>
</tr>


<tr>
<td class="org-left">C-c C-x v</td>
<td class="org-left">copy visible text</td>
</tr>


<tr>
<td class="org-left">C-c C-x C-w/M-w</td>
<td class="org-left">kill/copy subtree</td>
</tr>


<tr>
<td class="org-left">C-c C-x C-y or C-y</td>
<td class="org-left">yank subtree</td>
</tr>
</tbody>
</table>


## Marking

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">M-h</td>
<td class="org-left">mark the element at point. Hitting M-h multiple times will mark next item</td>
</tr>


<tr>
<td class="org-left">C-c @</td>
<td class="org-left">mark subtree</td>
</tr>
</tbody>
</table>


## Other


### Narrowing

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-x n s</td>
<td class="org-left">org-narrow-to-subtree</td>
</tr>
</tbody>
</table>


### Tags

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c C-c</td>
<td class="org-left">set tags for heading</td>
</tr>


<tr>
<td class="org-left">C-c C-q</td>
<td class="org-left">set tags for current heading</td>
</tr>


<tr>
<td class="org-left">C-u C-c C-q</td>
<td class="org-left">realign tags in all headings</td>
</tr>
</tbody>
</table>


### Links

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c C-o</td>
<td class="org-left">open link at point</td>
</tr>


<tr>
<td class="org-left">C-u C-c C-l</td>
<td class="org-left">add link to a file</td>
</tr>
</tbody>
</table>


### Capturing / Refiling

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c c</td>
<td class="org-left">Run Org-capture</td>
</tr>


<tr>
<td class="org-left">C-c C-w</td>
<td class="org-left">Run Org-refile</td>
</tr>
</tbody>
</table>


### Export

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c C-e</td>
<td class="org-left">run org-mode export dialog</td>
</tr>
</tbody>
</table>


### Timer

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">C-c C-x t</td>
<td class="org-left">set timer</td>
</tr>


<tr>
<td class="org-left">C-c C-x p</td>
<td class="org-left">pause or restart timer</td>
</tr>


<tr>
<td class="org-left">C-c C-x a</td>
<td class="org-left">activate timer</td>
</tr>


<tr>
<td class="org-left">C-c C-x e</td>
<td class="org-left">end timer</td>
</tr>
</tbody>
</table>

