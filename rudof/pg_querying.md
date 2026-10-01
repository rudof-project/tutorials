# Querying

Property graphs have their own query language. Where [SPARQL](sparql.ipynb) matches triple
patterns across a graph that may be spread over many publishers,
[Cypher](https://opencypher.org/) matches *paths* (`(a)-[:knows]->(b)`) inside one
database, and reads node and edge properties straight out of the records they carry.

rudof embeds a property-graph database, so the whole thing runs in-process.

```{tableofcontents}
```
