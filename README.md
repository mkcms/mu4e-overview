# mu4e-overview.el - Show overview of maildir #

This Emacs package lets you see a hierarchy of maildirs in a separate buffer:

```
mymail@gmail.com
 [Gmail]
  .Trash [0/25]
  .Starred [0/0]
  .Spam [0/3]
  .Sent Mail [0/4]
  .Important [0/21]
  .Drafts [0/0]
  .All Mail [0/56]
 Trash [0/0]
 Inbox [2/45]
```

## Usage ##

`M-x mu4e-overview` displays a buffer with a list of all maildirs.  The root
maildir can be set via the variable `mu4e-maildir`.

The number of unread and total number of emails is displayed next to each
maildir in this format: `[UNREAD-COUNT/TOTAL-COUNT]`.  If UNREAD-COUNT is not
zero, that maildir is highlighted.

Use n and p keys to go to next/previous maildir (or alternatively,
tab/backtab).  Use [ and ] keys to go to previous/next *unread* maildir.

When you click on a maildir or type RET when point is on it, mu4e headers view
is displayed, which shows messages only in that maildir.  Type `C-u RET` to
show only unread messages.

## API ##

The package also provides the function `mu4e-overview-gather` which returns the
folder hierarchy and asynchronously counts the number of total and unread
counts for each folder.  This can be used to build a custom view of the folder
hierarchy.  See it's documentation for details.

## License ##

```
Copyright (C) 2019-2025 Michał Krzywkowski

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
<!-- Local Variables: -->
<!-- coding: utf-8 -->
<!-- fill-column: 79 -->
<!-- End: -->
