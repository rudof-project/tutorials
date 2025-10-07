# RDF 1.2 Tutorial Index

Welcome to the comprehensive RDF 1.2 tutorial using rudof! This index helps you navigate through the tutorial materials.

## 🎯 Start Here

**New to RDF?** Start with:
1. [Quick Start Guide](QUICKSTART.md) - 5-minute introduction
2. [Main Tutorial - Introduction](README.md#introduction-to-rdf-12) - Core concepts

**Experienced with RDF?** Jump to:
1. [RDF 1.2 New Features](README.md#rdf-12-new-features)
2. [Advanced Topics](ADVANCED.md)

## 📖 Learning Path

### Beginner Path
1. **[Quick Start Guide](QUICKSTART.md)**
   - Installation
   - First commands
   - Basic examples

2. **[Main Tutorial](README.md)**
   - RDF concepts
   - RDF 1.2 features
   - Basic commands
   - Simple examples

3. **[Exercises 1-4](EXERCISES.md)**
   - Basic RDF modeling
   - Multi-lingual content
   - ShEx validation

### Intermediate Path
1. **[Main Tutorial - Advanced Sections](README.md#working-with-rdf-data)**
   - Working with different formats
   - SPARQL queries
   - Validation

2. **[Exercises 5-7](EXERCISES.md)**
   - Complex datatypes
   - Data transformation
   - Knowledge graphs

3. **[Advanced Topics](ADVANCED.md)**
   - RDF-star patterns
   - Named graphs

### Advanced Path
1. **[Advanced Topics - All Sections](ADVANCED.md)**
   - Nested annotations
   - Provenance tracking
   - Performance optimization
   - Integration patterns

2. **[Exercises 8-10](EXERCISES.md)**
   - Book review system
   - Temporal data
   - Integration challenge

## 📂 File Organization

```
rdf12_tutorial/
├── README.md           # Main tutorial (comprehensive guide)
├── QUICKSTART.md       # 5-minute quick start
├── ADVANCED.md         # Advanced topics and patterns
├── EXERCISES.md        # Hands-on practice problems
├── INDEX.md           # This navigation guide
└── examples/          # All example files
    ├── basic.ttl                  # Basic RDF triples
    ├── quoted-triples.ttl         # RDF-star examples
    ├── multilingual.ttl           # Language tags
    ├── complex-types.ttl          # XSD datatypes
    ├── book-catalog.ttl           # Real-world example
    ├── person.shex                # ShEx schema
    ├── person.sm                  # ShapeMap
    ├── book.shex                  # Book schema
    └── query.sparql               # SPARQL query
```

## 🎓 By Topic

### RDF 1.2 Features
- **Quoted Triples (RDF-star)**
  - [Tutorial](README.md#1-quoted-triples-rdf-star)
  - [Example](examples/quoted-triples.ttl)
  - [Advanced](ADVANCED.md#rdf-star-advanced-patterns)
  - [Exercise 2](EXERCISES.md#exercise-2-rdf-star-annotations)

- **Language Tags**
  - [Tutorial](README.md#2-directional-language-tags)
  - [Example](examples/multilingual.ttl)
  - [Exercise 3](EXERCISES.md#exercise-3-multi-lingual-content)

- **Datatypes**
  - [Tutorial](README.md#4-improved-datatype-support)
  - [Example](examples/complex-types.ttl)
  - [Exercise 5](EXERCISES.md#exercise-5-complex-datatypes)

### rudof Commands
- **View Data**: [Tutorial](README.md#1-view-rdf-data) | [Quick Start](QUICKSTART.md#1-view-your-first-rdf-file)
- **Node Inspection**: [Tutorial](README.md#2-inspect-a-node) | [Quick Start](QUICKSTART.md#2-explore-a-node)
- **Validation**: [Tutorial](README.md#4-validate-rdf-data) | [Quick Start](QUICKSTART.md#5-validate-data-with-shex)
- **SPARQL Queries**: [Tutorial](README.md#3-query-rdf-data) | [Advanced](ADVANCED.md#sparql-advanced-queries)

### Validation
- **ShEx**
  - [Tutorial](README.md#4-validate-rdf-data)
  - [Examples](examples/person.shex)
  - [Exercise 4](EXERCISES.md#exercise-4-shex-validation)
  - [Advanced](ADVANCED.md#complex-validation-scenarios)

- **SHACL**
  - [Tutorial](README.md#validation-with-shapes)
  - [Advanced](ADVANCED.md#complex-validation-scenarios)

### Real-World Examples
- **Book Catalog**: [Example](examples/book-catalog.ttl) | [Exercise 8](EXERCISES.md#exercise-8-book-review-system)
- **Person/Organization**: [Example](examples/basic.ttl) | [Exercise 1](EXERCISES.md#exercise-1-basic-rdf-modeling)
- **Knowledge Graph**: [Exercise 7](EXERCISES.md#exercise-7-practical-project---personal-knowledge-graph)

## 🔍 By Use Case

### I want to...
- **Learn RDF basics** → [Quick Start](QUICKSTART.md) → [Main Tutorial](README.md)
- **Validate my RDF data** → [Validation Section](README.md#4-validate-rdf-data) → [Exercise 4](EXERCISES.md#exercise-4-shex-validation)
- **Query RDF data** → [Query Section](README.md#3-query-rdf-data) → [Advanced SPARQL](ADVANCED.md#sparql-advanced-queries)
- **Use RDF-star** → [RDF-star Section](README.md#1-quoted-triples-rdf-star) → [Advanced RDF-star](ADVANCED.md#rdf-star-advanced-patterns)
- **Convert formats** → [Format Section](README.md#working-with-rdf-formats) → [Quick Start](QUICKSTART.md#3-convert-to-different-format)
- **Build real applications** → [Advanced Integration](ADVANCED.md#integration-patterns) → [Exercise 10](EXERCISES.md#exercise-10-integration-challenge)

## 🛠️ Tooling Reference

### Command Reference
| Command | Where to Find |
|---------|---------------|
| `rudof data` | [Tutorial](README.md#1-view-rdf-data), [Quick Start](QUICKSTART.md#common-commands-cheat-sheet) |
| `rudof node` | [Tutorial](README.md#2-inspect-a-node) |
| `rudof query` | [Tutorial](README.md#3-query-rdf-data), [Advanced](ADVANCED.md#sparql-advanced-queries) |
| `rudof validate` | [Tutorial](README.md#4-validate-rdf-data), [Quick Start](QUICKSTART.md#5-validate-data-with-shex) |
| `rudof shex` | [Main README](README.md) |
| `rudof convert` | [Advanced](ADVANCED.md#integration-patterns) |

### Format Reference
- **Turtle (.ttl)**: Most examples use this format
- **N-Triples (.nt)**: [Format Section](README.md#working-with-rdf-formats)
- **TriG (.trig)**: [Named Graphs](ADVANCED.md#named-graphs)
- **RDF/XML**: [Format Section](README.md#working-with-rdf-formats)

## 📚 Additional Resources

- [rudof Documentation](https://rudof-project.github.io/rudof/)
- [rudof Repository](https://github.com/rudof-project/rudof)
- [RDF 1.2 Specification](https://www.w3.org/TR/rdf12-concepts/)
- [ShEx Primer](http://shex.io/shex-primer/)

## 🤝 Contributing

Found an issue or want to improve the tutorial? See the [main README](../README.md#contributing) for contribution guidelines.

## 📝 Quick Reference

### Most Common Tasks
```bash
# View RDF data
rudof data file.ttl

# Validate with ShEx
rudof validate data.ttl -s schema.shex -m shapemap.sm

# Query with SPARQL
rudof query -q query.sparql data.ttl

# Inspect a node
rudof node -n ex:NodeName data.ttl

# Convert formats
rudof data input.ttl -r ntriples -o output.nt
```

### Example Files Quick Reference
- Simple example: `examples/basic.ttl`
- RDF-star: `examples/quoted-triples.ttl`
- Languages: `examples/multilingual.ttl`
- Types: `examples/complex-types.ttl`
- Real-world: `examples/book-catalog.ttl`

---

**Happy Learning! 🚀**

If you get stuck, check the [FAQ](https://github.com/rudof-project/rudof/wiki/FAQ) or join the [discussions](https://github.com/rudof-project/rudof/discussions).
