# Quick Start Guide - RDF 1.2 with rudof

This quick start guide will get you up and running with RDF 1.2 and rudof in just a few minutes.

## Prerequisites

Install rudof from the [releases page](https://github.com/rudof-project/rudof/releases) or use Docker:

```bash
docker pull angelip2303/rudof:latest
```

## 5-Minute Tutorial

### 1. View Your First RDF File

```bash
cd examples
rudof data basic.ttl
```

This displays a simple RDF file with people and organizations.

### 2. Explore a Node

```bash
rudof node -n ex:Alice basic.ttl
```

This shows all information about Alice in the RDF graph.

### 3. Convert to Different Format

```bash
rudof data basic.ttl -r ntriples
```

Convert Turtle to N-Triples format.

### 4. Try RDF-star (Quoted Triples)

```bash
rudof data quoted-triples.ttl
```

See how RDF 1.2 allows triples as subjects/objects.

### 5. Validate Data with ShEx

```bash
rudof validate basic.ttl --schema person.shex --shapemap person.sm
```

Validate that your RDF data conforms to a shape definition.

## What's Next?

- Read the [full tutorial](README.md) for detailed explanations
- Explore the [examples](examples/) directory
- Try modifying the example files
- Check out [rudof documentation](https://rudof-project.github.io/rudof/)

## Common Commands Cheat Sheet

| Task | Command |
|------|---------|
| View RDF data | `rudof data <file.ttl>` |
| Convert format | `rudof data <file.ttl> -r <format>` |
| Inspect node | `rudof node -n <node> <file.ttl>` |
| Validate with ShEx | `rudof validate <data> -s <schema> -m <shapemap>` |
| Run SPARQL query | `rudof query -q <query.sparql> <data.ttl>` |

## Example Workflow

1. **Create** your RDF data in Turtle format
2. **Validate** the structure using ShEx or SHACL
3. **Query** the data using SPARQL
4. **Convert** to other formats as needed
5. **Share** your validated RDF data

## Troubleshooting

**Problem:** rudof command not found  
**Solution:** Make sure rudof is installed and in your PATH

**Problem:** File format not recognized  
**Solution:** Use the `-t` flag to specify the input format explicitly

**Problem:** Validation fails  
**Solution:** Check that your data matches the schema constraints

## Getting Help

- [rudof FAQ](https://github.com/rudof-project/rudof/wiki/FAQ)
- [rudof Discussions](https://github.com/rudof-project/rudof/discussions)
- [GitHub Issues](https://github.com/rudof-project/rudof/issues)

Happy RDF learning! 🚀
