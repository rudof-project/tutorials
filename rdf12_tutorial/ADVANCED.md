# Advanced RDF 1.2 Examples

This document covers advanced RDF 1.2 features and techniques using rudof.

## Table of Contents

1. [RDF-star Advanced Patterns](#rdf-star-advanced-patterns)
2. [Named Graphs](#named-graphs)
3. [Complex Validation Scenarios](#complex-validation-scenarios)
4. [SPARQL Advanced Queries](#sparql-advanced-queries)
5. [Performance Optimization](#performance-optimization)

## RDF-star Advanced Patterns

### Nested Annotations

RDF-star allows multiple levels of annotations:

```turtle
@prefix ex: <http://example.org/> .

# Statement
ex:Alice ex:knows ex:Bob .

# First-level annotation
<< ex:Alice ex:knows ex:Bob >> 
    ex:since "2020-01-01"^^xsd:date ;
    ex:context ex:WorkContext .

# Second-level annotation (annotation about an annotation)
<< << ex:Alice ex:knows ex:Bob >> ex:since "2020-01-01"^^xsd:date >>
    ex:verifiedBy ex:System ;
    ex:confidence 0.95 .
```

### Provenance Tracking

Track the source and reliability of information:

```turtle
@prefix ex: <http://example.org/> .
@prefix prov: <http://www.w3.org/ns/prov#> .

# Main statement
ex:Bob ex:salary 75000 .

# Provenance information
<< ex:Bob ex:salary 75000 >>
    prov:wasAttributedTo ex:HRDatabase ;
    prov:generatedAtTime "2024-01-15T10:00:00Z"^^xsd:dateTime ;
    prov:hadPrimarySource ex:PayrollSystem ;
    ex:accessLevel ex:Confidential ;
    ex:lastVerified "2024-03-01"^^xsd:date .
```

### Temporal Data

Express how data changes over time:

```turtle
@prefix ex: <http://example.org/> .

# Current position
ex:Alice ex:position ex:SeniorDeveloper .

# Historical positions with metadata
<< ex:Alice ex:position ex:JuniorDeveloper >>
    ex:validFrom "2020-01-01"^^xsd:date ;
    ex:validUntil "2022-06-30"^^xsd:date .

<< ex:Alice ex:position ex:Developer >>
    ex:validFrom "2022-07-01"^^xsd:date ;
    ex:validUntil "2023-12-31"^^xsd:date .

<< ex:Alice ex:position ex:SeniorDeveloper >>
    ex:validFrom "2024-01-01"^^xsd:date ;
    ex:validUntil "9999-12-31"^^xsd:date .
```

## Named Graphs

### Working with TriG Format

TriG extends Turtle with named graphs:

```trig
@prefix ex: <http://example.org/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

# Default graph
ex:Alice a foaf:Person ;
    foaf:name "Alice Smith" .

# Named graph for work information
ex:WorkGraph {
    ex:Alice ex:worksFor ex:ACME ;
        ex:position "Software Engineer" ;
        ex:department ex:Engineering .
}

# Named graph for personal information
ex:PersonalGraph {
    ex:Alice foaf:knows ex:Bob ;
        foaf:interest ex:Photography ;
        ex:location ex:NewYork .
}

# Named graph metadata
ex:WorkGraph a ex:PrivateGraph ;
    ex:lastUpdated "2024-03-15"^^xsd:date ;
    ex:accessLevel "Internal" .
```

View named graphs with rudof:

```bash
rudof data example.trig -t trig
```

## Complex Validation Scenarios

### Conditional Validation

ShEx schema with conditional constraints:

```shex
PREFIX ex: <http://example.org/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

ex:Employee {
    ex:name xsd:string ;
    ex:age xsd:integer ;
    ex:role [ ex:Manager ex:Developer ex:Intern ] ;
    (
        # Managers must have experience and team size
        ex:role [ ex:Manager ] 
        AND ex:experience xsd:integer MinInclusive 5
        AND ex:teamSize xsd:integer MinInclusive 1
    ) OR (
        # Developers must have skills
        ex:role [ ex:Developer ]
        AND ex:skills xsd:string +
    ) OR (
        # Interns must have supervisor
        ex:role [ ex:Intern ]
        AND ex:supervisor IRI
    )
}
```

### Recursive Validation

Validate hierarchical structures:

```shex
PREFIX ex: <http://example.org/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

ex:Category {
    ex:name xsd:string ;
    ex:description xsd:string ? ;
    ex:subcategory @ex:Category * ;
    ex:parent @ex:Category ?
}

ex:Product {
    ex:name xsd:string ;
    ex:category @ex:Category ;
    ex:price xsd:decimal MinInclusive 0
}
```

## SPARQL Advanced Queries

### Querying RDF-star

```sparql
PREFIX ex: <http://example.org/>

# Find all statements about statements
SELECT ?subject ?predicate ?object ?metaPred ?metaValue
WHERE {
    ?subject ?predicate ?object .
    << ?subject ?predicate ?object >> ?metaPred ?metaValue .
}
```

### Aggregation Queries

```sparql
PREFIX ex: <http://example.org/>

# Calculate average salary by department
SELECT ?department (AVG(?salary) as ?avgSalary) (COUNT(?employee) as ?count)
WHERE {
    ?employee ex:department ?department ;
              ex:salary ?salary .
}
GROUP BY ?department
HAVING (AVG(?salary) > 60000)
ORDER BY DESC(?avgSalary)
```

### Property Paths

```sparql
PREFIX ex: <http://example.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

# Find friends of friends
SELECT DISTINCT ?person ?fof
WHERE {
    ?person foaf:knows/foaf:knows ?fof .
    FILTER (?person != ?fof)
}
```

### CONSTRUCT Queries

```sparql
PREFIX ex: <http://example.org/>
PREFIX schema: <http://schema.org/>

# Transform data structure
CONSTRUCT {
    ?person schema:name ?name ;
            schema:email ?email .
}
WHERE {
    ?person ex:fullName ?name ;
            ex:emailAddress ?email .
}
```

## Performance Optimization

### Large Dataset Handling

For large RDF files:

1. **Use streaming formats** (N-Triples, N-Quads):
   ```bash
   rudof data large-file.nt -t ntriples
   ```

2. **Enable lax parsing** for faster processing:
   ```bash
   rudof data large-file.ttl --reader-mode lax
   ```

3. **Filter data early** with SPARQL:
   ```bash
   rudof query -q filter.sparql large-file.ttl
   ```

### Validation Optimization

1. **Validate specific nodes** instead of entire graphs:
   ```bash
   rudof validate data.ttl -s schema.shex -n ex:SpecificNode -l ex:Shape
   ```

2. **Use targeted shapemaps**:
   ```shex
   # Only validate specific nodes
   <http://example.org/Node1>@<http://example.org/Shape1>
   <http://example.org/Node2>@<http://example.org/Shape2>
   ```

3. **Limit validation depth**:
   ```bash
   rudof validate data.ttl -s schema.shex -m map.sm --max-steps 50
   ```

### Memory Management

For very large files:

1. **Split into smaller chunks** using SPARQL CONSTRUCT
2. **Use N-Triples format** for line-by-line processing
3. **Process named graphs separately** in TriG files

## Integration Patterns

### CI/CD Validation

Validate RDF in continuous integration:

```bash
#!/bin/bash
# validate-rdf.sh

echo "Validating RDF data..."
rudof validate data.ttl -s schema.shex -m shapemap.sm

if [ $? -eq 0 ]; then
    echo "✓ Validation successful"
    exit 0
else
    echo "✗ Validation failed"
    exit 1
fi
```

### Batch Processing

Process multiple files:

```bash
#!/bin/bash
# batch-convert.sh

for file in *.ttl; do
    echo "Converting $file..."
    rudof data "$file" -r ntriples -o "${file%.ttl}.nt" --force-overwrite
done
```

### Data Quality Checks

```bash
#!/bin/bash
# quality-check.sh

# Check for syntax errors
rudof data input.ttl --reader-mode strict || exit 1

# Validate against schema
rudof validate input.ttl -s schema.shex -m map.sm || exit 1

# Check for specific patterns with SPARQL
rudof query -q quality-checks.sparql input.ttl || exit 1

echo "All quality checks passed!"
```

## Best Practices

1. **Use prefixes consistently** across files
2. **Document your schemas** with rdfs:label and rdfs:comment
3. **Version your schemas** with owl:versionInfo
4. **Test validation** with both valid and invalid examples
5. **Use meaningful IRIs** that dereference to documentation
6. **Keep shapemaps** in separate files for reusability
7. **Use version control** for RDF data and schemas

## Next Steps

- Explore [SHACL validation](https://www.w3.org/TR/shacl/)
- Learn about [Shape Expressions](http://shex.io/)
- Study [RDF 1.2 specification](https://www.w3.org/TR/rdf12-concepts/)
- Join [rudof discussions](https://github.com/rudof-project/rudof/discussions)

## Further Reading

- [RDF-star and SPARQL-star](https://w3c.github.io/rdf-star/)
- [ShEx Primer](http://shex.io/shex-primer/)
- [SPARQL 1.1 Query Language](https://www.w3.org/TR/sparql11-query/)
- [Linked Data Best Practices](https://www.w3.org/TR/ld-bp/)
