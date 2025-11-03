# rudof tutorials

This repository contains the source code of some [Jupiter books](https://rudof-project.github.io/tutorials/intro.html) that can be used as small tutorials of [rudof](https://rudof-project.github.io/). 

Some links:
* [Jupiter-books reference](https://jupyterbook.org/en/stable/start/overview.html)

## 🚀 Quick Start

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


### 3. Manually publish books on gh-pages 

Note, this is no longer necessary because we publish the book through github Actions.

```bash
ghp-import -n -p -f rudof/_build/html
```

### Cleaning build files and cache

Sometimes it is necessary to clean the cache when there are new versions of the libraries. To clean the built drectory use:

```bash
jupyter-book clean rudof
```

If you want to clean also the `jupyter_cache`, use:

```bash
jupyter-book clean rudof --all
```

and to locally install an updated dependency on rudof:

```
pip install pyrudof -U
```