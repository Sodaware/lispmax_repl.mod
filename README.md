# lispmax_repl

`lispmax_repl` is a small module for adding a `lispmax` REPL to your
application. This was originally part of the main module, but has been split
out.

## Installation

`lispmax_repl` depends on a couple of sub-modules from
[sodaware.mod](https://www.sodaware.net/sodaware.mod/), as well as
[lispmax](https://www.sodaware.net/lispmax/).

Once sodaware.mod is installed, navigate to the `sodaware.mod` folder and clone
the `lispmax_repl.mod` repository.

```bash
cd /path/to/blitzmax/mod/sodaware.mod/
git clone https://github.com/sodaware/lispmax_repl.mod.git
```

## A quick example

This will compile into an interactive command-line repl.

```blitzmax
SuperStrict

Framework brl.basic
Import sodaware.lispmax_repl

Local repl:LispMax_REPL = New LispMax_REPL
repl.run()
```

## Licence

Copyright (C) 2017-2021 Phil Newton

LISPMAX is free software: you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

LISPMAX is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with LISPMAX. If not, see http://www.gnu.org/licenses/.
