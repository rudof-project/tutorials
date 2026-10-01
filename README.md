# rudof tutorials

Source for [**Shaping Knowledge Graphs**](https://rudof-project.github.io/tutorials/intro.html),
a [Jupyter Book](https://jupyterbook.org/) that introduces RDF, SPARQL, ShEx, SHACL, DCTAP
and property graphs through runnable examples built with
[rudof](https://rudof-project.github.io/rudof/).

Each chapter is a notebook under [`rudof/`](rudof/) and can be run as you read, either
locally or in [Google Colab](https://colab.research.google.com/) via the launch button at
the top of each page.

## Chapters

| Notebook | Topic |
| --- | --- |
| [`rudof.ipynb`](rudof/rudof.ipynb) | the `Rudof` session, errors, configuration, prefixes |
| [`rdf.ipynb`](rudof/rdf.ipynb) | the RDF data model, formats, visualization, node neighbourhoods |
| [`sparql.ipynb`](rudof/sparql.ipynb) | querying local graphs and remote endpoints |
| [`shex.ipynb`](rudof/shex.ipynb) | shape expressions, shape maps, validation reports |
| [`shacl.ipynb`](rudof/shacl.ipynb) | shapes as RDF, targets, validation reports |
| [`dctap.ipynb`](rudof/dctap.ipynb) | modelling in a spreadsheet, converting to ShEx |
| [`rdf12.ipynb`](rudof/rdf12.ipynb) | RDF 1.2 triple terms and annotations |
| [`sparql12.ipynb`](rudof/sparql12.ipynb) | querying those annotations with SPARQL 1.2 |
| [`compare.ipynb`](rudof/compare.ipynb) | structural comparison of two schemas |
| [`service_description.ipynb`](rudof/service_description.ipynb) | what a SPARQL endpoint says about itself |
| [`property_graphs.ipynb`](rudof/property_graphs.ipynb) | PG schemas, validation and Cypher |
| [`rudof_generate.ipynb`](rudof/rudof_generate.ipynb) | generating synthetic data from a schema |

## Requirements

The notebooks target [`pyrudof`](https://pypi.org/project/pyrudof/) **0.3.22 or later**,
and need Python 3.10 or newer. Several chapters reach the network: public SPARQL endpoints (Wikidata, DBpedia, UniProt) and the PlantUML server used to render diagrams.

## Quick start

### 1. Clone and install

```bash
git clone https://github.com/rudof-project/tutorials.git
cd tutorials
pip install -r requirements.txt
```

### 2. Build the book

```bash
jupyter-book build rudof
```

Every notebook is re-executed on each build (`execute_notebooks: force` in
[`rudof/_config.yml`](rudof/_config.yml)), so a build failure means a chapter no longer runs
against the current `pyrudof` — which is the point.

The result lands in `rudof/_build/html`.

### 3. Publish

Publishing happens automatically through the
[`deploy-book` GitHub Action](.github/workflows/deploy.yml) on every push to `main` that
touches `rudof/`.

### Cleaning build files and cache

New versions of the libraries sometimes need a clean build:

```bash
jupyter-book clean rudof          # the build directory
jupyter-book clean rudof --all    # also the jupyter_cache
```

## Links

* [rudof documentation](https://rudof-project.github.io/rudof/)
* [`pyrudof` API reference](https://pyrudof.readthedocs.io/)
* [Jupyter Book reference](https://jupyterbook.org/en/stable/start/overview.html)
