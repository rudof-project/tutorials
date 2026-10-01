# Describing and validating data

RDF has no schema in the sense a relational database does: any node may carry any property.
That flexibility is what makes RDF good at merging data from different publishers, and it
is also why a separate layer is needed to say what *well-formed* data looks like for a
given application.

The chapters in this part cover the three languages rudof reads for that ([ShEx](shex.ipynb), [SHACL](shacl.ipynb) and [DCTAP](dctap.ipynb)) and then two things you can do once a schema exists: compare two of them to see how a model changed, and generate synthetic data that conforms to one.

```{tableofcontents}
```
