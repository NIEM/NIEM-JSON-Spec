<?xml version="1.0" encoding="US-ASCII"?>
<document
  xmlns="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <title>NIEM JSON Specification</title>
  <version>MACRO_DOCUMENT_VERSION</version>
  <date>MACRO_DOCUMENT_DATE</date>
  <author>NIEM Technical Architecture Committee (NTAC)</author>

  <subsection>
    <title>Abstract</title>

    m4_define([[[MACRO_ABSTRACT_TEXT]]],[[[

    <p>The NIEM JSON Specification establishes the technical basis for using JavaScript Object
      Notation (JSON) as a data format for exchange of information consistent with NIEM-conformant
      schemas and information exchange package documentations (IEPDs).</p>

    <p>The definition of conformance for NIEM JSON data primarily focuses on the relationship
      between the data in the JSON file and the definitions established by a NIEM-conformant schema,
      (e.g., the schema defined by a NIEM IEPD). There are two forms of conformance of a NIEM JSON
      document to a NIEM-conformant schema:</p>

    <ul>
      <li><p><strong>Strict conformance</strong> establishes that the JSON instance follows all
          rules of the schema or IEPD. An instance that strictly conforms to an IEPD will contain
          all content that is required by the IEPD, will contain only content allowed by the IEPD,
          and will reflect the parent-child structure and cardinality constraints defined by the
          IEPD. This enables NIEM JSON to satisfy exchange requirements similar to
          traditional NIEM XML use cases.</p></li>
      <li><p><strong>Lax conformance</strong> enables the use of vocabularies that are
          defined by NIEM schemas or IEPDs via <em>linked data</em> and <em>linked open data</em>
          methods. It establishes that exchanges with NIEM-conformant vocabularies
          use those vocabularies properly; this allows data to be more flexible, and to combine
          terms from NIEM-conformant vocabularies with terms from other vocabularies.</p></li>
    </ul>

    ]]])

    MACRO_ABSTRACT_TEXT

  </subsection>

  <subsection>
    <title>Authors</title>
    <p>Webb Roberts, Georgia Tech Research Institute
      (<link href="mailto:webb.roberts@gtri.gatech.edu">&lt;webb.roberts@gtri.gatech.edu&gt;</link>),
      Lead author</p>
  </subsection>

  <subsection>
    <title>Document status</title>
    <p>This document is a draft of a specification product of the NIEM Technical Architecture
      Committee (NTAC).</p>

    <p>Updates, revisions, and errata for this specification are posted to
      <link>https://github.com/NIEM/NIEM-JSON-Spec</link>. Please submit comments on this
      specification as issues at <link>https://github.com/NIEM/NIEM-JSON-Spec/issues</link>.</p>

  </subsection>

  <subsection id="toc">
    <title>Table of contents</title>
    <tableOfContents/>
  </subsection>
  <section>
    <title>Introduction</title>

    MACRO_ABSTRACT_TEXT
  </section>

  <section>
    <title>External terminology</title>
    
    <p>This document uses terminology from other documents. This section
      identifies sources and definitions of externally-defined terminology.</p>

    <section id="section-terminology-bcp-14">
      <title>IETF Best Current Practice 14 terminology</title>
      <p>The key words <q>MUST</q>, <q>MUST NOT</q>, <q>REQUIRED</q>, <q>SHALL</q>,
        <q>SHALL NOT</q>, <q>SHOULD</q>, <q>SHOULD NOT</q>, <q>RECOMMENDED</q>, <q>NOT
          RECOMMENDED</q>, <q>MAY</q>, and <q>OPTIONAL</q> in this document are to be interpreted as
        described in <ref idref="BCP14"/> <ref idref="RFC2119"/> <ref idref="RFC8174"/> when, and
        only when, they appear in all capitals, as shown here.</p>
    </section>

    <section>
      <title>Conformance Targets Attribute Specification</title>
      <p><ref idref="CTAS"/> defines several terms used normatively within this specification.</p>
      <p>The term <termDef>conformance target</termDef> is defined by
        MACRO_REF_EXTERNAL(CTAS,MACRO_HREF_CTAS#definition_conformance_target,3.1,Conformance Target
        Defined) which states:</p>
      
      <blockquote>
        <p>A <em>conformance target</em> is a class of artifact, such as an interface, protocol,
          document, platform, process or service, that is the subject of conformance clauses and
          normative statements. There may be several conformance targets defined within a
          specification, and these targets may be diverse so as to reflect different aspects of a
          specification. For example, a protocol message and a protocol engine may be different
          conformance targets.</p>
      </blockquote>
      
      <p>The term <termDef>conformance target identifier</termDef> is defined by
        MACRO_REF_EXTERNAL(CTAS,MACRO_HREF_CTAS#definition_conformance_target_identifier,3.1,Conformance
        Target Defined), which states:</p>

      <blockquote>
        <p>A <em>conformance target identifier</em> is an internationalized resource identifier that
          uniquely identifies a conformance target.</p>
      </blockquote>

      <p>The term <termDef>effective conformance target identifier</termDef> is defined by
        MACRO_REF_EXTERNAL(CTAS,MACRO_HREF_CTAS#definition_effective_conformance_target_identifier,4,Semantics
        and Use), which states:</p>
      
      <blockquote>
        <p>An <em>effective conformance target identifier</em> of a conformant document is an
          internationalized resource identifier reference that occurs in the
          document<char name="rsquo"/>s effective conformance targets attribute.</p>
      </blockquote>
    </section>

    <section>
      <title>NIEM Naming and Design Rules</title>

      <p>The term <termDef>conformant schema document set</termDef> is defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_conformant_schema_document_set,4.1.3,Schema
        document set), which states: </p>

      <blockquote>
        <p>A <strong>conformant schema document set</strong> is a collection of schema documents
          that together are capable of validating a conformant instance XML document.</p>
      </blockquote>

      <p>Note the principle component of a NIEM exchange definition (an information exchange package
        documentation, or IEPD) is a conformant schema document set.</p>

      <p>The term <termDef>conformant instance XML document</termDef> is defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_conformant_instance_XML_document,4.1.4,Instance
        documents and elements), which states: </p>

      <blockquote>
        <p>A <strong>conformant instance XML document</strong> is an XML document that is [an]
          instance document valid to a conformant schema document set.</p>
      </blockquote>
      
      <p>The term <termDef>reference schema document</termDef> is defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_reference_schema_document,4.1.1,Reference schema document), which states: </p>

      <blockquote>
        <p>A <strong>reference schema document</strong> is a schema document that is intended to
          provide the authoritative definitions of broadly reusable schema components.</p>
      </blockquote>
      
      <p>The term <termDef>extension schema document</termDef> is defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_extension_schema_document,4.1.2,Extension schema document), which states: </p>

      <blockquote>
        <p>An <strong>extension schema document</strong> is a schema document that is intended to
          provide definitions of schema components that are intended for reuse within a more narrow
          scope than those defined by a reference schema document.</p>
      </blockquote>

      <p>The term <termDef>external schema document</termDef> is defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_external_schema_document,10.2.3,External adapter types and external components), which states: </p>

      <blockquote>
        <p>An <strong>external schema document</strong>
          is any schema document that is not one of</p>
        <ul>
          <li><p>a reference schema document,</p></li>
          <li><p>an extension schema document, or</p></li>
          <li><p>a schema document that has the structures namespace as its target namespace.</p></li>
        </ul>

      </blockquote>
    </section>

    <section>
      <title>Model Package Description Specification</title>

      <p>The term <termDef>IEP conformance target</termDef> is defined by
        MACRO_REF_EXTERNAL(MPD,MACRO_HREF_MPD#definition_IEP_conformance_target,5.6,Defining
        Information Exchange Packages). An IEP conformance target defines a set of conformance
        criteria for a class of <termRef term="information exchange package">information exchange
          package (IEP)</termRef>.</p>

      <p>The term <termDef>information exchange package</termDef> is defined by
        MACRO_REF_EXTERNAL(MPD,MACRO_HREF_MPD#definition_information_exchange_package,3.2.3,IEP
        Conformance Targets). An information exchange package (<termDef>IEP</termDef>) is an XML
        document that conforms to the criteria defined for an <termRef>IEP conformance
          target</termRef>.</p>

    </section>
    
    <section>
      <title>JSON</title>

      <p>The term <termDef>JSON text</termDef> is defined by
        MACRO_REF_EXTERNAL(RFC8259,MACRO_HREF_RFC8259#section-2,2,JSON Grammar), which defines it as
        a single serialized JSON value.</p>

      <p>The term <termDef>JSON document</termDef>, when used within this document, is synonymous
        with <termRef>JSON text</termRef>.</p>
      
    </section>

    <section>
      <title>JSON-LD</title>

      <p><ref idref="JSON-LD"/> defines JSON-LD, a JSON-based format to serialize linked
        data. <ref idref="JSON-LD"/> defines the term <termDef>JSON-LD document</termDef>.
        MACRO_REF_EXTERNAL(JSON-LD,MACRO_HREF_JSONLD#dfn-json-ld-document,7,Data Model) provides a
        summary of what constitutes a JSON-LD document.
        MACRO_REF_EXTERNAL(JSON-LD,MACRO_HREF_JSONLD#json-ld-grammar,8,JSON-LD Grammar) states:</p>

      <blockquote>
        <p>A JSON-LD document MUST be a valid JSON document as described in
          <ref idref="RFC4627"/>.</p>
      </blockquote>

      <p><ref idref="JSON-LD"/> leverages <ref idref="RFC4627"/> as a normative definition of
        JSON. That specification has been superseded by <ref idref="RFC8259"/>. Consequently, this
        specification uses <ref idref="RFC8259"/> as its normative definition of JSON.</p>

      <p><ref idref="JSON-LD"/> normatively references the term <em>JSON document</em> in
        <ref idref="RFC4627"/>, which does not define that term. We interpret this to be a reference
        to <em>JSON text</em> as defined by <ref idref="RFC8259"/>.</p>

      <p>The evaluation of a JSON-LD document as Resource Description Framework (RDF) is specified
      by <ref idref="JSON-LD-API"/>.</p>

    </section>

    <section>
      <title>RDF Schema</title>

      <p><ref idref="RDFS"/> describes RDF Schema (RDFS), which provides a data-modeling vocabulary
        for RDF data. <ref idref="NDR"/> defines components of NIEM-conformant schema document sets
        in terms of RDF Schema.</p>

      <p>Property <qName>rdf:value</qName> is defined by
        MACRO_REF_EXTERNAL(RDFS,MACRO_HREF_RDFS#ch_value,5.4.3,rdf:value). This property is used
        within an object to carry a simple value with no additional meaning.</p>
    </section>
  </section>

  <section>
    <title>Conformance targets</title>

    <p>This document defines multiple <termRef term="conformance target">conformance
        targets</termRef>. Each conformance target is defined normatively by this
        specification. Each conformance target has an associated abbreviation, which appears in
        rules to
      identify to which conformance targets a rule applies.</p>

    <table id="table-ct-list">
      <title>Codes representing conformance targets</title>
      <theadr>
        <th>Code</th>
        <th>Conformance target</th>
      </theadr>
      <tr>
        <td><conformance-target id="STRICT">STRICT</conformance-target></td>
        <td><termRef>NIEM-JSON document strictly conformant to a schema</termRef></td>
      </tr>
      <tr>
        <td><conformance-target id="LAX">LAX</conformance-target></td>
        <td><termRef>NIEM-JSON document laxly conformant to a schema</termRef></td>
      </tr>
    </table>

    <section>
      <title>NIEM-JSON document strictly conformant to a schema</title>
      <definition term="NIEM-JSON document strictly conformant to a schema">
        <p>A <strong>NIEM-JSON document strictly conformant to a schema</strong> is
          a <termRef>JSON-LD document</termRef> that may be assigned a one-to-one correspondence to
          a <termRef>conformant instance XML document</termRef> valid against a NIEM schema.  It is
          a <termRef>conformance target</termRef> of this specification. A NIEM-JSON document
          strictly conformant to a schema MUST conform to all rules of this specification that apply
          to this conformance target.  The <termRef>conformance target identifier</termRef> for this
          conformance target is <code>MACRO_CT_URI_STRICT</code>.</p>
      </definition>
    </section>

    <section>
      <title>NIEM-JSON document laxly conformant to a schema</title>
      <definition term="NIEM-JSON document laxly conformant to a schema">
        <p>A <strong>NIEM-JSON document laxly conformant to a schema</strong> is a <termRef>JSON-LD
            document</termRef> that may be interpreted using the RDF vocabulary defined by a
          <termRef>conformant schema document set</termRef>.
          It is a <termRef>conformance target</termRef> of this specification. A NIEM-JSON
          document laxly conformant to a schema MUST conform to all rules of this specification that
          apply to this conformance target.  The <termRef>conformance target identifier</termRef>
          for this conformance target is <code>MACRO_CT_URI_LAX</code>.</p>
      </definition>
    </section>

  </section>

  <section>
    <title>Rules</title>
    
    <ruleSection>
      <title>File must be a JSON-LD file</title>

      <rule applicability="STRICT LAX" id="is-json-ld" class="Constraint">
        <p>A <termRef>NIEM-JSON document strictly conformant to a schema</termRef> or
          <termRef>NIEM-JSON document laxly conformant to a schema</termRef> MUST be
            a <termRef>JSON-LD document</termRef>.</p>
      </rule>

    </ruleSection>

    <ruleSection>
      <title>Strictly conformant JSON corresponds to valid XML</title>

      <rule applicability="STRICT" class="Constraint">
        <p>The RDF entailed by a <termRef>NIEM-JSON document strictly conformant to a schema</termRef>
          MUST be equal to the RDF entailed by a corresponding <termRef>conformant instance XML
          document</termRef> instance of the schema, accounting for
          <termRef>literal-to-object conversion</termRef> and the omission of external content.</p>
      </rule>

      <p>Within this rule, the <em>schema</em> includes a <termRef>conformant schema document
          set</termRef>, and will include include all other constraints of an <termRef>IEP
          conformance target</termRef> defined by an IEPD. The RDF entailed by a candidate JSON
          document is described by <ref idref="JSON-LD-API"/>. The RDF entailed by an XML document
          is described by <ref idref="NDR"/>. Note that this rule does not provide a translation of
          JSON to XML; it only requires that there is one.</p>
      
    </ruleSection>

    <ruleSection>
      <title>Laxly conformant JSON satisfiable with schema</title>

      <rule applicability="LAX" class="Constraint">
        <p>A JSON-LD document MUST be a <termRef>NIEM-JSON document laxly conformant to a
            schema</termRef> only if the RDF graph entailed by the JSON document and the schema
            together is RDFS satisfiable, accounting for <termRef>literal-to-object
            conversion</termRef> and the omission of external content.</p>
      </rule>

      <p>Within this rule, a schema is a <termRef>conformant schema document set</termRef>. The RDF
        entailed by a JSON-LD document is defined by <ref idref="JSON-LD-API"/>.  The RDF entailed
        by a schema is defined by <ref idref="NDR"/>.  The term <em>RDFS satisfiable</em>
        is defined by <ref idref="RDF-Semantics"/>.</p>

    </ruleSection>

    <ruleSection>
      <title>JSON interpreted based on schema</title>

      <rule applicability="STRICT LAX" class="Interpretation">
        <p>A <termRef>NIEM-JSON document strictly conformant to a schema</termRef> or
          <termRef>NIEM-JSON document laxly conformant to a schema</termRef> MUST be interpreted as
          an RDFS interpretation of the RDF graph composed of the RDF entailed by the JSON document
          together with the RDF entailed by the schema.</p>
      </rule>

      <p>Within this rule, a schema is a <termRef>conformant schema document set</termRef>. The RDF
        entailed by a JSON-LD document is defined by <ref idref="JSON-LD-API"/>.  The RDF entailed
        by a schema is defined by <ref idref="NDR"/>.  The term <em>RDFS interpretation</em> is
        defined by <ref idref="RDF-Semantics"/>.</p>
      
    </ruleSection>

    <section>
      <title>Literal-to-object conversion</title>

      <p>Although all NIEM elements have values that are complex types, which by
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#section_5.6.3.2,5.6.3.2,Element instance) entail an
        RDF object (rather than a literal value), JSON syntax for objects with simple values is
        cumbersome. As a result, NIEM JSON instances may use a shorthand syntax, in which any
        element with only a simple value may be represented as a literal, rather than as an object
        with a value carried by <qName>rdf:value</qName>. To accommodate these cases, conformant
        JSON documents are evaluated based on the results of <termRef>literal-to-object
        conversion</termRef>, a process that yields a JSON object in which literal values are
        converted to idiomatic objects when appropriate.</p>

      <definition term="literal-to-object conversion">
        <p>Within this document, <strong>literal-to-object conversion</strong> is a process by which
          a JSON value is transformed from a value of false, null, true, number, or string, into an
          object containing only the property <qName>rdf:value</qName>. Evaluation of conformance of
          a <termRef>JSON document</termRef> is conducted on the results of literal-to-object
          conversion of that document.</p>
      </definition>

    </section>

    <section>
      <title>External content omission</title>

      <p>NIEM content and schemas are defined with a precise RDF mapping. External content includes
        any content with a namespace defined by an <termRef>external schema document</termRef>, or otherwise with a
        namespace not defined by a <termRef>reference schema document</termRef>
        or <termRef>extension schema document</termRef>. NIEM does not provide
        external content with an RDF mapping. As such, external content is outside the scope of
        evaluation as conformance JSON documents. In addition,
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#section_5.6.3.3,5.6.3.3,Element as a property with
        unknown context), provides RDF identifying NIEM content carried by an external context.</p>

      <p>External content and unknown contexts are omitted from evaluation of conformance, and are
        presumed to be conformant, as evaluating their conformance is outside the scope of this
        specification.</p>

    </section>

  </section>

  <section isAppendix="true">
    <title>References</title>
    <reference id="BCP14" label="BCP 14">
      <p>Internet Engineering Task Force Best Current Practice 14. Available
        from <link>https://www.ietf.org/rfc/bcp/bcp14.txt</link>. BCP 14 is composed of:</p>
      <sub>
        <reference id="RFC2119" label="RFC 2119">
          <p>Bradner, S., <q>Key words for use in RFCs to Indicate Requirement Levels</q>, BCP 14,
            RFC 2119, March 1997. Available
            from <link>http://www.ietf.org/rfc/rfc2119.txt</link>.</p>
        </reference>
        <reference id="RFC8174" label="RFC 8174">
          <p>Leiba, B., <q>Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words</q>, BCP 14,
            RFC 8174, May 2017. Available
            from <link>https://www.ietf.org/rfc/rfc8174.txt</link>.</p>
        </reference>
      </sub>
    </reference>
    <reference id="CTAS">
      <p>Roberts, Webb. <q>NIEM Conformance Targets Attribute Specification, Version 3.0.</q> NIEM
        Technical Architecture Committee, July 31, 2014. <link>MACRO_HREF_CTAS</link>.</p>
    </reference>
    <reference id="JSON-LD">
      <p>Manu Sporny, Dave Longley, Gregg Kellogg, Markus Lanthaler, and Niklas
        Lindstr<char name="ouml"/>m. <q>JSON-LD 1.0, A JSON-Based Serialization for Linked Data,
          W3C Recommendation.</q> Edited by Manu Sporny, Gregg Kellogg, and Markus Lanthaler. W3C,
        January 16, 2014. <link>MACRO_HREF_JSONLD</link>.</p>
    </reference>
    <reference id="JSON-LD-API">
      <p>Dave Longley, Gregg Kellogg, Markus Lanthaler, and Manu Sporny. <q>JSON-LD 1.0 Processing
          Algorithms and API.</q> Edited by Markus Lanthaler, Gregg Kellogg, and Manu Sporny. W3C,
        January 16, 2014. <link>https://www.w3.org/TR/2014/REC-json-ld-api-20140116/</link>.</p>
    </reference>
    <reference id="MPD">
      <p>NIEM Technical Architecture Committee. <q>National Information Exchange Model Model Package
          Description Specification, Version 3.0.1</q>, April 27,
        2015. <link>MACRO_HREF_MPD</link>.</p>
    </reference>
    <reference id="NDR" label="NIEM NDR">
      <p>Roberts, Webb. <q>National Information Exchange Model Naming and Design Rules, Version
          4.0.</q> NIEM Technical Architecture Committee, November 7,
        2017. <link>MACRO_HREF_NDR</link>.</p>
    </reference>
    <reference id="RDF-Semantics">
      <p>Patrick J. Hayes, and Peter F. Patel-Schneider, eds. <q>RDF 1.1 Semantics.</q> The World
        Wide Web Consortium (W3C), February 25,
        2014. <link>http://www.w3.org/TR/2014/REC-rdf11-mt-20140225/</link>.</p>
    </reference>
    <reference id="RFC4627">
      <p>D. Crockford. The application/json Media Type for JavaScript Object Notation (JSON)
        (RFC 4627). July 2006. RFC. <link>http://www.ietf.org/rfc/rfc4627.txt</link></p>
    </reference>
    <reference id="RFC8259">
      <p>Bray, T., Ed., <q>The JavaScript Object Notation (JSON) Data Interchange Format</q>, STD
        90, RFC 8259, DOI 10.17487/RFC8259, December
        2017, <link>https://www.ietf.org/rfc/rfc8259.txt</link>.</p>
    </reference>
    <reference id="RDFS" label="RDF-Schema">
      <p>Dan Brickley, and R.V. Guha, eds. <q>RDF Schema 1.1.</q> The World Wide Web Consortium (W3C), February 25, 2014. <link>http://www.w3.org/TR/2014/REC-rdf-schema-20140225/</link>.</p>
    </reference>
  </section>
  <!-- stand down the index until it can be useful.
  <section id="index"><title>Index</title>
    <index/>
  </section>
  -->
  <section id="index-of-defns"><title>Index of definitions</title>
    <indexOfDefinitions/>
  </section>
  <section id="index-of-rules"><title>Index of rules</title>
    <indexOfRules/>
  </section>
</document>
m4_dnl Local Variables:
m4_dnl mode: sgml
m4_dnl indent-tabs-mode: nil
m4_dnl fill-column: 100
m4_dnl End:
