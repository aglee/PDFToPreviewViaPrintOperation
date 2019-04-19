#  PDFToPreviewViaPrintOperation

A second experiment ([here's the first](https://github.com/aglee/PDFToPreviewViaPipe)) to see if I could answer this question:

<https://twitter.com/MarioGuzman/status/1119014393956556800>

> Does anyone know how to (or if possible) to open a PDF document in Preview without saving to disk first with AppKit? Almost like an export... I generate a PDF and just shoot it directly to Preview without having to mess with saving to disk and passing a file path to NSWorkspace.

<https://twitter.com/colincornaby/status/1119014724404834304>

> Mario wants Preview to treat it as an unsaved document, so he doesn't have to worry about handling the save flow himself. I feel like I've seen other apps do this (like print to PDF does.)

Inspired by @colincornaby's observation, the approach here is to use `NSPrintOperation` to do an actual "print to PDF", with `showsPrintPanel` set to `NO` so the print job happens immediately, with no intervening UI.  The good news is that this is simple -- just a few lines -- and it works.  And I was able to turn sandboxing on, which is evidence that no temporary file gets created behind the scenes.  The bad news is that when I do it a couple of times, the Preview app crashes.  Debugging that is left as an exercise for the reader.

