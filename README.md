# `tiny-tcl-in-haskell`

```
This was a testbed for learning Haskell.

I was just having fun.  This code dates back to Oct 2011.

        strick

--------------------------------------------------------

tcl.hs is a minimalist subset of Tcl, implememted in Haskell.

The inspiration comes from Picol, by Salvatore "antirez" Sanfilippo,
a minimalist subset of Tcl in around 500 lines of ANSI C:

   blog: http://antirez.com/page/picol.html

   code: http://antirez.com/picol/picol.c.txt

I'm trying to write a similar subset of Tcl in Haskell.

--------------------------------------------------------

joy.hs is a little subset of Joy, embedded in the above Tcl.

------------------------------------------------------
EXAMPLE:
  ghc --make -package base tcl.hs run.hs joy.hs
  # Produces binary './run'
  echo 'set x [* 4 5]; incr x 3; lappend x cents; k $x' | ./run
  echo 'joy {555 dup 404 swap}' | ./run

```
