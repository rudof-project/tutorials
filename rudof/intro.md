# rudof: A semantic-less tool for the Semantic Web

This is a Jupyter book that introduces Knowledge Graph concepts (RDF, SPARQL, ShEx,
SHACL, DCTAP and property graphs) through runnable examples built with [rudof](https://rudof-project.github.io/rudof/).

## What is rudof?

[rudof](https://rudof-project.github.io/rudof/) is an open library written in Rust that implements all of the above in a single tool: it reads and serializes RDF in the usual formats, runs SPARQL queries locally or against remote endpoints, validates with ShEx and SHACL, reads DCTAP profiles, converts and compares schemas, draws UML-like diagrams, works with property graphs, and generates synthetic data from a schema.

It is available as:

* a [command line tool](https://rudof-project.github.io/rudof/overview.html), with
  [binaries for Windows, Linux and macOS](https://github.com/rudof-project/rudof/releases);
* a set of [Rust crates](https://crates.io/crates/rudof_lib);
* **Python bindings**, published on PyPI as [`pyrudof`](https://pypi.org/project/pyrudof/) -
  this is what the notebooks in this book use.

## How to read this book

Every chapter is a Jupyter notebook that you can run as you read. There are two easy ways:

* **In the browser**: use the rocket launch button at the top right of any chapter to open
  it in [Google Colab](https://colab.research.google.com/). Nothing to install.
* **Locally**: clone [the repository](https://github.com/rudof-project/tutorials),
  `pip install -r requirements.txt`, and open the notebooks under `rudof/`.

The chapters build on each other in roughly this order, but each one is self-contained and
starts by installing and initializing rudof, so you can also jump straight to the topic you
need.

```{tableofcontents}
```

## Where to go next

* [rudof documentation](https://rudof-project.github.io/rudof/) - the command line tool and
  the project as a whole.
* [`pyrudof` API reference](https://pyrudof.readthedocs.io/) - every class, method and enum
  used in this book, plus a gallery of runnable examples.
* [rudof on GitHub](https://github.com/rudof-project/rudof) - source, issues and releases.
