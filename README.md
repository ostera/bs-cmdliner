`bs-cmdliner`
-------------
This is Cmdliner, a CLI-interface building tool for OCaml, packaged for
[BuckleScript][] (an OCaml-to-JavaScript compiler) and [Reason][] (an
alternative OCaml syntax targeting that compiler.)

You can safely ignore the installation instructions below when compiling
to JS. Instead:

1. Install this fork through npm:

        npm install --save @elliottcable/bs-cmdliner

2. Manually add `bs-cmdliner` to your `bsconfig.json`'s
   `bs-dependencies`:

        "bs-dependencies": [
          ...
          "@elliottcable/bs-cmdliner"
        ],

3. Write a CLI!

The usage docs are below, but one thing worth noting, is that [Node.js
doesn't follow the POSIX standard for `argv`][process-argv]; so you need
to prepend `process.argv.shift()` or similar to actually executing your
command-line interface. Something like this should do:

```ocaml
(* OCaml syntax *)
open Cmdliner
[%%raw "process.argv.shift()"]

let hello () = print_endline "Hello, world!"
let hello_t = Term.(const hello $ const ())

let () = Term.exit @@ Term.eval (hello_t, Term.info "wrange")
```

```reason
/* ReasonML syntax */
open Cmdliner;
%raw "process.argv.shift()";

let hello = () => print_endline("Hello, world!");
let hello_t = Term.(const(hello) $ const());

let () = Term.exit @@ Term.eval((hello_t, Term.info("wrange")));
```

> **NOTE:** OCaml doesn't often move fast; and I can't say I have much
> intention to follow the upstream development of Cmdliner with a
> microscope. As of right now, BuckleScript (4.02.3) is pretty far
> behind upstream OCaml (4.07.0) *anyway*, so I'm fairly worried that
> future versions of Cmdliner won't compile on BuckleScript.
>
> In any case, feel free to reach out directly if you want me to bump
> the version on npm. No promises, though, if substantial changes to the
> source are necessary to make it compile. (There's a reason I didn't
> stomp on the npm package names outside my own scope! `;)`)

   [BuckleScript]: <https://bucklescript.github.io/>
   [Reason]: <https://reasonml.github.io/>
   [process-argv]: <https://nodejs.org/api/process.html#process_process_argv>

#### Original README follows:

Cmdliner — Declarative definition of command line interfaces for OCaml
-------------------------------------------------------------------------------
%%VERSION%%

Cmdliner allows the declarative definition of command line interfaces
for OCaml.

It provides a simple and compositional mechanism to convert command
line arguments to OCaml values and pass them to your functions. The
module automatically handles syntax errors, help messages and UNIX man
page generation. It supports programs with single or multiple commands
and respects most of the [POSIX][1] and [GNU][2] conventions.

Cmdliner has no dependencies and is distributed under the ISC license.

[1]: http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap12.html
[2]: http://www.gnu.org/software/libc/manual/html_node/Argument-Syntax.html

Home page: http://erratique.ch/software/cmdliner  
Contact: Daniel Bünzli `<daniel.buenzl i@erratique.ch>`


## Installation

Cmdliner can be installed with `opam`:

    opam install cmdliner

If you don't use `opam` consult the [`opam`](opam) file for build
instructions.


## Documentation

The documentation and API reference is automatically generated by from
the source interfaces. It can be consulted [online][doc] or via
`odig doc cmdliner`.

[doc]: http://erratique.ch/software/cmdliner/doc/Cmdliner


## Sample programs

If you installed Cmdliner with `opam` sample programs are located in
the directory `opam config var cmdliner:doc`. These programs define
the command line of some classic programs.

In the distribution sample programs are located in the `test`
directory of the distribution. They can be built and run with:

    topkg build --tests true && topkg test
