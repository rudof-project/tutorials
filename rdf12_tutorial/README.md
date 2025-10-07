# RDF 1.2 Tutorial using rudof

This tutorial introduces RDF 1.2 features and demonstrates how to work with RDF data using the [rudof](https://github.com/rudof-project/rudof) tool.

## Table of Contents

1. [Introduction to RDF 1.2](#introduction-to-rdf-12)
2. [Installing rudof](#installing-rudof)
3. [RDF 1.2 New Features](#rdf-12-new-features)
4. [Working with RDF Data](#working-with-rdf-data)
5. [Practical Examples](#practical-examples)
6. [Additional Resources](#additional-resources)

## Introduction to RDF 1.2

RDF (Resource Description Framework) is a standard model for data interchange on the Web. RDF 1.2 is the latest version of the RDF specification, which includes several improvements and new features over RDF 1.1.

### Key Concepts

- **Triples**: RDF data is structured as triples consisting of (subject, predicate, object)
- **IRIs**: Resources are identified using Internationalized Resource Identifiers
- **Literals**: Values can be plain strings or typed literals
- **Graphs**: Collections of RDF triples

## Installing rudof

### Pre-built Binaries

Download the latest release from the [rudof releases page](https://github.com/rudof-project/rudof/releases).

#### Ubuntu/Debian
```bash
wget https://github.com/rudof-project/rudof/releases/download/vX.X.X/rudof_vX.X.X_amd64.deb
sudo dpkg -i rudof_vX.X.X_amd64.deb
```

#### macOS
```bash
# Download the binary for your architecture
wget https://github.com/rudof-project/rudof/releases/download/vX.X.X/rudof-macos
chmod +x rudof-macos
sudo mv rudof-macos /usr/local/bin/rudof
```

#### Windows
Download the Windows executable from the releases page.

### Docker
```bash
docker pull angelip2303/rudof:latest
```

### From Source
```bash
git clone https://github.com/rudof-project/rudof.git
cd rudof
cargo build --release
```

## RDF 1.2 New Features

RDF 1.2 introduces several important features and clarifications:

### 1. Quoted Triples (RDF-star)

RDF 1.2 includes RDF-star notation, allowing triples to be subjects or objects of other triples. This is useful for adding metadata about statements.

**Example:**
```turtle
@prefix ex: <http://example.org/> .

ex:Alice ex:says << ex:Bob ex:likes ex:Pizza >> .
```

This states that "Alice says that Bob likes Pizza."

### 2. Directional Language Tags

RDF 1.2 supports directional language tags for text with specific text direction (left-to-right or right-to-left).

**Example:**
```turtle
@prefix ex: <http://example.org/> .

ex:greeting ex:text "مرحبا"@ar-rtl .
```

### 3. Triple Terms

Triple terms allow you to use entire triples as terms within other triples, enabling more complex relationship modeling.

### 4. Improved Datatype Support

Better support for standard XSD datatypes and clearer semantics for literal values.

## Working with RDF Data

### Basic Commands

#### 1. View RDF Data

Display RDF data in different formats:

```bash
rudof data examples/basic.ttl
```

Convert between RDF formats:

```bash
rudof data examples/basic.ttl -r ntriples
```

#### 2. Inspect a Node

View the neighborhood of a specific node:

```bash
rudof node -n ex:Alice examples/basic.ttl
```

Show both incoming and outgoing edges:

```bash
rudof node -n ex:Alice examples/basic.ttl -m both
```

#### 3. Query RDF Data

Run SPARQL queries:

```bash
rudof query -q examples/query.sparql examples/basic.ttl
```

#### 4. Validate RDF Data

Validate RDF against a ShEx schema:

```bash
rudof validate examples/data.ttl --schema examples/schema.shex --shapemap examples/shapemap.sm
```

## Practical Examples

### Example 1: Basic RDF Triple

See [examples/basic.ttl](examples/basic.ttl) for a simple RDF document with basic triples.

```bash
rudof data examples/basic.ttl
```

### Example 2: Quoted Triples (RDF-star)

See [examples/quoted-triples.ttl](examples/quoted-triples.ttl) for examples of RDF-star quoted triples.

```bash
rudof data examples/quoted-triples.ttl
```

### Example 3: Multi-lingual Data

See [examples/multilingual.ttl](examples/multilingual.ttl) for examples with language tags.

```bash
rudof data examples/multilingual.ttl
```

### Example 4: Complex Data with Types

See [examples/complex-types.ttl](examples/complex-types.ttl) for examples with various datatypes.

```bash
rudof data examples/complex-types.ttl
```

### Example 5: Real-world Scenario - Book Catalog

See [examples/book-catalog.ttl](examples/book-catalog.ttl) for a practical book catalog example.

```bash
rudof data examples/book-catalog.ttl
rudof node -n ex:Book1 examples/book-catalog.ttl
```

## Advanced Usage

### Working with RDF Formats

rudof supports multiple RDF serialization formats:
- **Turtle** (.ttl) - Human-readable, compact syntax
- **N-Triples** (.nt) - Line-based, simple format
- **RDF/XML** (.rdf, .owl) - XML-based format
- **TriG** (.trig) - Turtle with named graphs
- **N-Quads** (.nq) - N-Triples with named graphs

Convert from Turtle to N-Triples:
```bash
rudof data examples/basic.ttl -r ntriples -o output.nt
```

### Validation with Shapes

Use ShEx or SHACL to validate your RDF data structure:

```bash
# ShEx validation
rudof validate examples/data.ttl -s examples/schema.shex -n ex:Alice -l ex:Person

# SHACL validation
rudof shacl-validate --shapes examples/shapes.ttl examples/data.ttl
```

## Additional Resources

- [RDF 1.2 Concepts and Abstract Syntax](https://www.w3.org/TR/rdf12-concepts/)
- [RDF 1.2 Turtle Specification](https://www.w3.org/TR/rdf12-turtle/)
- [rudof Documentation](https://rudof-project.github.io/rudof/)
- [rudof GitHub Repository](https://github.com/rudof-project/rudof)
- [ShEx Primer](http://shex.io/shex-primer/)
- [SHACL Specification](https://www.w3.org/TR/shacl/)

## Next Steps

After completing this tutorial, you can:

1. Learn about [ShEx validation](https://github.com/rudof-project/rudof/wiki/How%E2%80%90to-guides)
2. Explore [SHACL shapes](https://www.w3.org/TR/shacl/)
3. Try the [rudof Jupyter lab introduction](https://colab.research.google.com/drive/1XuxohKDNn4UsuRKokyjH2bAlZEyyYhnl)
4. Join the [rudof discussions](https://github.com/rudof-project/rudof/discussions)

## Contributing

Found an issue or want to improve this tutorial? Please open an issue or submit a pull request at the [tutorials repository](https://github.com/rudof-project/tutorials).

## License

This tutorial is provided under the MIT License. See the repository LICENSE file for details.
