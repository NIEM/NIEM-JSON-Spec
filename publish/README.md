# The NIEM JSON Specification

The NIEM JSON Specification establishes the technical basis for using JavaScript
Object Notation (JSON) as a data format for exchange of information consistent
with NIEM-conformant schemas and information exchange package documentations
(IEPDs).

NIEM-conformance of JSON data is primarily focused on the relationship between
the data in the JSON file and the definitions established by a NIEM-conformant
schema, e.g., the schema defined by a NIEM IEPD. There are two forms of
conformance of a NIEM JSON document to a NIEM-conformant schema:

* **Strict conformance** establishes that the JSON instance follows all rules of
the schema or IEPD. An instance that strictly conforms to an IEPD will contain
all content that is required by the IEPD, will contain only content allowed by
the IEPD, and will reflect the parent-child structure and cardinality
constraints defined by the IEPD. This enables NIEM JSON to satisfy exchange
requirements similar to traditional NIEM XML use cases.

* **Lax conformance** enables the use of vocabularies that are defined by NIEM
schemas or IEPDs via linked data and linked open data methods. It establishes
that exchanges with NIEM-conformant vocabularies use those vocabularies
properly; this allows data to be more flexible, and to combine terms from
NIEM-conformant vocabularies with terms from other vocabularies.

The latest pre-release draft of the NIEM JSON Specification is viewable at
<https://rawgit.com/NIEM/NIEM-JSON-spec/dev-4.0/niem-json-spec.html>.

Please submit any comments as issues at
<https://github.com/NIEM/NIEM-JSON-Spec/issues>.
