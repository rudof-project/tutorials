# Describing and validating data

A property-graph database usually wants its schema declared up front, which is the opposite
of the RDF habit of describing data after the fact. **PG schemas** are the language for
that declaration, and rudof both reads them and validates property-graph data against
them, the same job [ShEx](shex.ipynb) and [SHACL](shacl.ipynb) do on the RDF side, with a
report of the same shape.

```{tableofcontents}
```
