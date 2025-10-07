# Basic Usage

In this tutorial, you'll learn the fundamental concepts and operations in Rudof.

## Working with RDF Data

### Reading RDF Files

Rudof can read various RDF formats including Turtle, RDF/XML, N-Triples, and more.

```bash
rudof data.ttl
```

### Validating with ShEx

Shape Expressions (ShEx) is a language for describing and validating RDF graph structures.

#### Basic Validation

To validate RDF data against a ShEx schema:

```bash
rudof validate --data data.ttl --schema schema.shex
```

#### Example Data (data.ttl)

```turtle
@prefix : <http://example.org/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

:alice a foaf:Person ;
    foaf:name "Alice Smith" ;
    foaf:age 30 .
```

#### Example Schema (schema.shex)

```shex
PREFIX : <http://example.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

:PersonShape {
  a [foaf:Person] ;
  foaf:name xsd:string ;
  foaf:age xsd:integer
}
```

## Working with SHACL

SHACL (Shapes Constraint Language) is another validation approach.

### Basic SHACL Validation

```bash
rudof validate --data data.ttl --shapes shapes.ttl --format shacl
```

## Output Formats

Rudof supports multiple output formats:

- **Text**: Human-readable output (default)
- **JSON**: Machine-readable structured output
- **XML**: XML format

Example:

```bash
rudof validate --data data.ttl --schema schema.shex --output-format json
```

## Common Options

- `--verbose` or `-v`: Increase output verbosity
- `--quiet` or `-q`: Suppress non-error output
- `--help` or `-h`: Display help information

## Next Steps

Learn about [Advanced Features](advanced-features.md) to unlock the full potential of Rudof.
