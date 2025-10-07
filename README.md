# Rudof Tutorials

This repository contains tutorials for learning and using Rudof, a Rust-based RDF validation tool. The tutorials are built using [Jupyter Book](https://jupyterbook.org/).

## Quick Start

### Prerequisites

- Python 3.8 or higher
- pip (Python package installer)

### Installation

1. Clone this repository:
```bash
git clone https://github.com/rudof-project/tutorials.git
cd tutorials
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

Or use the Makefile:
```bash
make install
```

### Building the Book

To build the Jupyter Book:

```bash
jupyter-book build .
```

Or use the Makefile:
```bash
make build
```

The built HTML files will be in the `_build/html/` directory.

### Viewing the Book

After building, you can view the book by opening `_build/html/index.html` in your web browser, or serve it locally:

```bash
make serve
```

Then open http://localhost:8000 in your browser.

## Tutorial Contents

The tutorials cover:

1. **Getting Started** - Installation and setup of Rudof
2. **Basic Usage** - Fundamental concepts and operations
3. **Advanced Features** - Advanced use cases and optimization

## Development

### Adding New Tutorials

1. Create a new markdown file in the `tutorials/` directory
2. Add the file to `_toc.yml` in the appropriate location
3. Build the book to see your changes

### Cleaning Build Files

To remove all built files:

```bash
jupyter-book clean .
```

Or use the Makefile:
```bash
make clean
```

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Resources

- [Rudof Project](https://github.com/rudof-project/rudof)
- [Jupyter Book Documentation](https://jupyterbook.org/)
- [ShEx Specification](http://shex.io/)
- [SHACL Specification](https://www.w3.org/TR/shacl/)
