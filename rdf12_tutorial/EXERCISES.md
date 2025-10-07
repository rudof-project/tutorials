# RDF 1.2 Exercises

Practice your RDF 1.2 and rudof skills with these hands-on exercises.

## Getting Started

Each exercise builds on concepts from the main tutorial. Work through them in order, or jump to topics that interest you.

## Exercise 1: Basic RDF Modeling

**Goal:** Create an RDF file describing a university course catalog.

**Requirements:**
1. Model at least 3 courses with:
   - Course name
   - Course code
   - Credits (integer)
   - Instructor
   - Prerequisites (reference to other courses)

2. Model at least 2 instructors with:
   - Name
   - Email
   - Department

**Tasks:**
```bash
# 1. Create your file: courses.ttl

# 2. View your data
rudof data courses.ttl

# 3. Convert to N-Triples
rudof data courses.ttl -r ntriples

# 4. Inspect a specific course
rudof node -n <your-course-iri> courses.ttl
```

**Bonus:** Add course descriptions in multiple languages using language tags.

<details>
<summary>Show Solution Hint</summary>

```turtle
@prefix ex: <http://university.example.org/> .
@prefix schema: <http://schema.org/> .

ex:Course101 a schema:Course ;
    schema:name "Introduction to Programming" ;
    ex:courseCode "CS101" ;
    ex:credits 3 ;
    schema:instructor ex:ProfSmith .

ex:ProfSmith a schema:Person ;
    schema:name "Dr. Jane Smith" ;
    schema:email "j.smith@university.example.org" ;
    ex:department "Computer Science" .
```
</details>

---

## Exercise 2: RDF-star Annotations

**Goal:** Create a citation database with provenance information.

**Requirements:**
1. Model at least 3 scientific papers
2. Add citations between papers (Paper A cites Paper B)
3. Use RDF-star to add metadata about citations:
   - Citation context (where in the paper)
   - Citation count
   - Citation date

**Tasks:**
```bash
# 1. Create: citations.ttl with quoted triples

# 2. Validate your syntax
rudof data citations.ttl

# 3. Check specific citation metadata
rudof node -n <citation-triple> citations.ttl
```

**Example structure:**
```turtle
ex:Paper1 ex:cites ex:Paper2 .
<< ex:Paper1 ex:cites ex:Paper2 >> 
    ex:citedIn "Section 3.2" ;
    ex:citationDate "2024-01-15"^^xsd:date .
```

<details>
<summary>Show Solution Hint</summary>

Use RDF-star syntax `<< subject predicate object >>` to create quoted triples, then add properties to those quoted triples.
</details>

---

## Exercise 3: Multi-lingual Content

**Goal:** Create a product catalog in at least 3 languages.

**Requirements:**
1. Model 5 products with:
   - Name in English, Spanish, and French
   - Description in at least 2 languages
   - Price (decimal)
   - Category

2. Use proper language tags (e.g., @en, @es, @fr)

**Tasks:**
```bash
# 1. Create: products.ttl

# 2. View and verify all languages appear
rudof data products.ttl

# 3. Query for products in a specific language (create query.sparql)
rudof query -q query.sparql products.ttl
```

**SPARQL Query Challenge:** Write a query that returns only Spanish labels.

<details>
<summary>Show SPARQL Solution</summary>

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?product ?label
WHERE {
    ?product rdfs:label ?label .
    FILTER (lang(?label) = "es")
}
```
</details>

---

## Exercise 4: ShEx Validation

**Goal:** Create a ShEx schema and validate data against it.

**Requirements:**
1. Create an RDF file with employee data (at least 5 employees)
2. Create a ShEx schema that enforces:
   - Every employee must have: name, employeeID, department
   - Every employee may have: email, phone, manager
   - EmployeeID must be a string
   - Manager must reference another employee

3. Create a shapemap to validate specific employees

**Tasks:**
```bash
# 1. Create: employees.ttl, employees.shex, employees.sm

# 2. Validate all employees
rudof validate employees.ttl -s employees.shex -m employees.sm

# 3. Intentionally break a constraint and see the error
# (e.g., remove a required field)

# 4. Fix and re-validate
```

<details>
<summary>Show Schema Hint</summary>

```shex
PREFIX ex: <http://example.org/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

ex:Employee {
    ex:name xsd:string ;
    ex:employeeID xsd:string ;
    ex:department xsd:string ;
    ex:email xsd:string ? ;
    ex:phone xsd:string ? ;
    ex:manager @ex:Employee ?
}
```
</details>

---

## Exercise 5: Complex Datatypes

**Goal:** Practice using various XSD datatypes.

**Requirements:**
Create an IoT sensor data file with:
1. Temperature readings (decimal)
2. Timestamps (dateTime)
3. Sensor status (boolean)
4. Sensor location (coordinates as decimals)
5. Data hash (hexBinary)

**Tasks:**
```bash
# 1. Create: sensors.ttl with at least 10 readings

# 2. View your data
rudof data sensors.ttl

# 3. Write a SPARQL query to find:
#    - Average temperature
#    - Readings in the last hour
#    - Active sensors only
```

---

## Exercise 6: Data Transformation

**Goal:** Transform RDF data from one schema to another.

**Requirements:**
1. Start with the basic.ttl example file
2. Write a SPARQL CONSTRUCT query to transform:
   - foaf:Person → schema:Person
   - foaf:name → schema:name
   - foaf:knows → schema:knows

**Tasks:**
```bash
# 1. Create: transform.sparql

# 2. Run transformation
rudof query -q transform.sparql examples/basic.ttl -o transformed.ttl

# 3. Verify the output
rudof data transformed.ttl
```

<details>
<summary>Show CONSTRUCT Hint</summary>

```sparql
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>

CONSTRUCT {
    ?person a schema:Person ;
            schema:name ?name .
}
WHERE {
    ?person a foaf:Person ;
            foaf:name ?name .
}
```
</details>

---

## Exercise 7: Practical Project - Personal Knowledge Graph

**Goal:** Create a personal knowledge graph.

**Requirements:**
Build an RDF graph representing:
1. Your interests (at least 5)
2. Skills (at least 5) with proficiency levels
3. Projects you've worked on
4. Connections between interests, skills, and projects
5. Use RDF-star to add:
   - When you acquired each skill
   - Confidence level in each skill
   - Project duration

**Tasks:**
```bash
# 1. Create: my-knowledge-graph.ttl

# 2. Create a ShEx schema: my-schema.shex

# 3. Validate your graph
rudof validate my-knowledge-graph.ttl -s my-schema.shex -n <your-iri> -l <shape>

# 4. Write SPARQL queries to find:
#    - All skills related to a specific interest
#    - Projects using a specific skill
#    - Skills acquired in the last year
```

**Bonus:** Create a visualization of your knowledge graph (export to different formats).

---

## Exercise 8: Book Review System

**Goal:** Extend the book-catalog.ttl example.

**Requirements:**
1. Add 5 more books
2. Add 3 more customers
3. Add at least 10 reviews using RDF-star
4. Each review should have:
   - Rating (1-5)
   - Review text
   - Review date
   - Helpful votes count

**Tasks:**
```bash
# 1. Extend: examples/book-catalog.ttl

# 2. Write SPARQL queries to find:
#    - Books with average rating > 4
#    - Most reviewed books
#    - Most active reviewers
#    - Books with no reviews

# 3. Create a ShEx schema to validate review structure

# 4. Add review responses using nested RDF-star
```

---

## Exercise 9: Temporal Data Modeling

**Goal:** Model time-varying information.

**Requirements:**
Create an employee position history:
1. Model 3 employees
2. Each employee has held 3+ positions over time
3. Use RDF-star to attach validity periods to each position
4. Include:
   - Position title
   - Department
   - Salary (with valid from/to dates)
   - Manager (with valid from/to dates)

**Tasks:**
```bash
# 1. Create: employee-history.ttl

# 2. Write SPARQL query to find:
#    - Current positions for all employees
#    - Position held by employee on specific date
#    - Employees who changed departments in 2023
```

---

## Exercise 10: Integration Challenge

**Goal:** Combine all learned concepts.

**Requirements:**
Create a complete mini social network:
1. Users (with profiles in multiple languages)
2. Posts (with RDF-star for metadata: likes, timestamp, views)
3. Comments on posts (nested RDF-star)
4. Friend relationships
5. Groups and memberships
6. Events and RSVPs

**Tasks:**
```bash
# 1. Create comprehensive data model: social-network.ttl

# 2. Create complete ShEx schema: social-network.shex

# 3. Validate entire graph
rudof validate social-network.ttl -s social-network.shex -m social-network.sm

# 4. Write 10 different SPARQL queries for various use cases

# 5. Test with both valid and invalid data
```

**Advanced Challenges:**
- Add temporal data (active/inactive users)
- Model privacy settings with named graphs
- Add moderation metadata to posts
- Include media attachments with proper types

---

## Solutions and Discussion

Complete solutions are available in the `solutions/` directory (to be added).

Share your solutions and discuss approaches in the [rudof discussions](https://github.com/rudof-project/rudof/discussions).

## Assessment Checklist

For each exercise, verify:
- [ ] Valid RDF syntax (runs without errors in rudof)
- [ ] Proper use of prefixes and namespaces
- [ ] Correct datatype usage
- [ ] Schema validation passes (where applicable)
- [ ] SPARQL queries return expected results
- [ ] Code is well-documented with comments

## Additional Practice Resources

- Work through [rudof examples](https://github.com/rudof-project/rudof/tree/master/examples)
- Explore [RDF datasets](https://www.w3.org/wiki/DataSetRDFDumps)
- Try validating real-world data from DBpedia or Wikidata
- Convert between different RDF serializations
- Experiment with SHACL validation

## Next Steps

After completing these exercises:
1. Review the [Advanced Tutorial](ADVANCED.md)
2. Explore the [rudof book](https://github.com/rudof-project/rudof-book)
3. Contribute examples to the rudof project
4. Apply RDF to your own projects

Good luck! 🎓
