OpenApplication
===============

NAME
----

`open` --  A simple command line interface that uses `LSOpenApplication` to open application with preserving environment variables and arguments.

SYNOPSIS
--------

    open path [ARGS...]

DESCRIPTION
-----------

Open application at `path`. All following arguments are set as `argv`, you can give such as `-AppleLanguages` or `-AppleLocale`.

    open /path/to/Application.app -AppleLanguages "(ja_JP)" -AppleLocale "ja_JP"

All environment variables are preserved, so user `env -i` to clear them, if needed.

    env -i open /path/to/Application.app

Since `open(1)` no longer preserves environment variables since Tiger, this is useful to set for example `DYLD_INSERT_LIBRARIES` to inject a dynamic link library to the application.

    env -i DYLD_INSERT_LIBRARIES=/path/to/dylib open /path/to/Application.app

BUILD
-----

It requires Xcode. Use `make` to build. Target is built at `build/open`.

    make
