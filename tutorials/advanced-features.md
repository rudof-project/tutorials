# Advanced Features

This tutorial covers advanced features and use cases for Rudof.

## Complex Validation Scenarios

### Multiple Shape Maps

You can use shape maps to specify which nodes should be validated against which shapes:

```bash
rudof validate --data data.ttl --schema schema.shex --shapemap shapemap.sm
```

#### Example Shape Map (shapemap.sm)

```
<http://example.org/alice>@:PersonShape
<http://example.org/bob>@:PersonShape
```

## Data Conversion

### Converting Between RDF Formats

Rudof can convert RDF data between different serialization formats:

```bash
rudof convert input.ttl --output output.rdf --format rdfxml
```

Supported formats:
- Turtle (`.ttl`)
- N-Triples (`.nt`)
- RDF/XML (`.rdf`)
- JSON-LD (`.jsonld`)

## Schema Analysis

### Analyzing ShEx Schemas

You can analyze and validate ShEx schemas themselves:

```bash
rudof analyze-schema schema.shex
```

This will check for:
- Syntax errors
- Circular dependencies
- Unreachable shapes
- Best practice violations

## Performance Optimization

### Large Datasets

For large datasets, consider these optimization strategies:

1. **Streaming Validation**: Process data in chunks

```bash
rudof validate --data large-data.nt --schema schema.shex --streaming
```

2. **Parallel Processing**: Use multiple threads

```bash
rudof validate --data data.ttl --schema schema.shex --threads 4
```

## Integration with Other Tools

### Using Rudof in Scripts

Rudof can be easily integrated into shell scripts:

```bash
#!/bin/bash
for file in data/*.ttl; do
    echo "Validating $file..."
    if rudof validate --data "$file" --schema schema.shex; then
        echo "✓ $file is valid"
    else
        echo "✗ $file has validation errors"
    fi
done
```

### Programmatic Usage

For programmatic usage, consider using Rudof as a Rust library in your own projects:

```rust
use rudof::{validate, Schema, Data};

fn main() {
    let schema = Schema::from_file("schema.shex").unwrap();
    let data = Data::from_file("data.ttl").unwrap();
    
    match validate(&data, &schema) {
        Ok(result) => println!("Validation successful: {:?}", result),
        Err(e) => eprintln!("Validation failed: {}", e),
    }
}
```

## Custom Extensions

### Writing Custom Validators

You can extend Rudof with custom validation functions:

```rust
// Example custom validator
fn custom_validator(value: &str) -> bool {
    // Your custom validation logic
    value.len() > 0 && value.len() < 100
}
```

## Debugging and Troubleshooting

### Verbose Output

For detailed debugging information:

```bash
rudof validate --data data.ttl --schema schema.shex --verbose
```

### Logging

Enable detailed logging:

```bash
RUST_LOG=debug rudof validate --data data.ttl --schema schema.shex
```

## Best Practices

1. **Version Control**: Keep your schemas under version control
2. **Documentation**: Document your shapes and constraints
3. **Testing**: Test schemas with known valid and invalid data
4. **Modular Schemas**: Break large schemas into reusable modules
5. **Performance**: Profile and optimize for your specific use cases

## Resources

- [Rudof GitHub Repository](https://github.com/rudof-project/rudof)
- [ShEx Specification](http://shex.io/)
- [SHACL Specification](https://www.w3.org/TR/shacl/)
- [RDF Primer](https://www.w3.org/TR/rdf11-primer/)

## Conclusion

You've now learned the advanced features of Rudof! Experiment with these features to build powerful RDF validation and processing workflows.
