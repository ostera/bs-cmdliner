open B0

let cmdliner = "cmdliner"
let doc = "Declarative definition of command line interfaces for OCaml"

let pkg = Pkg.create cmdliner ~doc
let lib =
  let lib_deps = ["result"] in
  let srcs = (`Src_dirs [Fpath.v "src"]) in
  B0_ocaml.Unit.lib ~pkg cmdliner srcs ~lib_deps ~doc
