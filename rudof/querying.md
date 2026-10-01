# Querying

Once RDF data is loaded, the next question is how to ask things of it.
[SPARQL](https://www.w3.org/TR/sparql11-query/) is the query language of the RDF stack, and
rudof runs it both against a graph it holds in memory and against remote endpoints. The
second chapter here is about those endpoints themselves: a **service description** is the
RDF document an endpoint publishes to say what it can do, which is how you find out what a
query against it is allowed to assume.

```{tableofcontents}
```
