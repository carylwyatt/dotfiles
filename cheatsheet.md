# cheat sheet

I'm constantly forgetting the cool stuff I can do with the vim plugins I've added. This is a log where I add something if I've had to google it multiple times.

## indenting

If you mess up indenting, visually select a section, then use `=` to have vim fix it for you.

## surround

Basic command is `cs` for 'change surrounding'. Then use the usual operators to get stuff done. Por ejemplo: `cs"'` changes double quotes to single quotes; `ds(` to delete surrounding parens; or my favorite, enter visual line mode to highlight a selection, then `S<p class="important">` to surround the selection with a tag that has a class/ID.

## commentary

Basic command is `gcc` to comment out a line. Use `gc` with motions: `gcap` comments out a paragraph; `gc` in visual mode to comment out selection.
