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

    <p>NIEM-conformance of JSON data is primarily focused on the relationship
      between the data in the JSON file and the definitions established by a NIEM-conformant schema,
      e.g., the schema defined by a NIEM IEPD. There are two forms of conformance of a NIEM JSON
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

    <section>
      <title>Audience</title>

      <p>This document was developed as a technical specification, and is not intended to be a user
        guide or an introduction to the use of JSON for NIEM. Its intended audience is developers of
        tools that work with NIEM and NIEM JSON, or other individuals who require an understanding
        of the details of the alignment between NIEM JSON and other representations of NIEM
        data.</p>

      <p>Developers of NIEM message formats with a JSON representation may prefer to read the NIEM
        JSON documentation at <link>https://niem.github.io/json/</link>, specifically
        the <em><a href="https://niem.github.io/json/tutorial/">NIEM JSON Tutorial</a></em>, which
        proceeds step-by-step from data requirements to a conforming JSON representation. Developers
        of systems that read and write NIEM JSON messages should conform to the relevant message
        descriptions.</p>
      
    </section>
  </section>

  <section><title>Document conventions and normative content</title>

    <p>This document uses formatting and syntactic conventions to clarify meaning and avoid ambiguity.</p>

    <section><title>Document references</title>
      <p>This document relies on references to many outside documents. Such references are noted by bold,
        bracketed inline terms. For example, a reference to RFC 2119 is shown as <ref idref="RFC2119"/>. All
        reference documents are recorded in <ref idref="references"/>.</p>
    </section>

      <section id="SectionNormativeAndInformativeContent">
        <title>Normative and informative content</title>
        <p>This document includes a variety of content. Some content of this document
          is <termRef>normative</termRef>, while other content is <termRef>informative</termRef>. In general, the
          informative material appears as supporting text, description, and rationales for the normative
          material.</p>

        <definition term="normative">
          <p>The term <q>normative</q> is as defined by MACRO_REF_EXTERNAL(ConfReq,,7.2,Conformance by key words), which states:</p>
          <blockquote>
            <p>NORMATIVE <char name="mdash"/> statements provided for the prescriptive parts of the specification, providing that which is necessary in order to be able to claim conformance to the specification.</p>
          </blockquote>
        </definition>
        <definition term="informative">
          <p>The term <q>informative</q> is as defined by MACRO_REF_EXTERNAL(ConfReq,,7.2,Conformance by key words), which states:</p>
          <blockquote>
            <p>INFORMATIVE (NON-NORMATIVE) <char name="mdash"/> statements provided for informational purposes,
              intended to assist the understanding or use of the specification and shall not contain provisions
              that are required for conformance.</p>
          </blockquote>
        </definition>

        <p>Definitions within this document are <termRef>normative</termRef>, and are given special formatting.</p>

        <bogusDefinition term="&lt;term&gt;">
          <p>A formal definition of a word or phrase.</p>
        </bogusDefinition>

        <p>Uses of these terms
        are given special formatting, using raised dots to identify the term. For example the use
          of the term <termRef>conformance target</termRef> has special formatting.</p>

        <section id="section-rules">
          <title>Rules</title>

          <p>A rule states a specific requirement on a <termRef>conformance target</termRef>
            or on the interpretation of a <termRef>conformance target</termRef>. The classes of
            <termRef>conformance target</termRef> 
            are enumerated in <ref idref="section-conformance-targets"/>. Rules are
            normative. Human-readable text in rules uses <ref idref="BCP14"/> terminology as described in <ref idref="section-terminology-bcp-14"/> for normative requirements and recommendations.</p>

          <bogusRule section="&lt;section&gt;" number="&lt;number&gt;" applicability="&lt;applicability&gt;" class="&lt;classification&gt;">
            <p>An enforceable rule.</p>
          </bogusRule>

          <p>Each rule has a <em>classification</em>, which is either <q>Constraint</q> or <q>Interpretation</q>. If
            the classification is <q>Constraint</q>, then the rule is a <termRef>constraint rule</termRef>. If the classification
            is <q>Interpretation</q>, then the rule is an <termRef>interpretation rule</termRef>.</p>

          <definition term="constraint rule">
            <p>A <strong>constraint rule</strong> is a rule that sets a requirement on an artifact with respect to
              its conformance to a <termRef>conformance target</termRef>.</p>
          </definition>

          <definition term="interpretation rule">
            <p>An <strong>interpretation rule</strong> is a rule that sets the methodology, pattern, or procedure
              for understanding some aspect of an instance of a conformance target.</p>
          </definition>

          <p>Each rule identifies its <em>applicability</em>. This identifies the conformance
            targets to which the rule applies. Each entry in the list is a code from
            <ref idref="table-ct-list" />. If a code appears in the applicability list for a rule,
            then the rule applies to the corresponding conformance target. For example, a rule with
            applicability <q>(STRICT)</q> is applicable to <termRef>NIEM JSON document strictly conformant to a schema</termRef>.</p>

          <p>Rules are numbered according to the section in which they appear and the order in which they appear
            within that section. For example, the second rule in Section 4 is Rule 4-2.</p>

        </section>
      </section>
    <section>
      <title>Additional formatting</title>

        <p>In addition to the special formatting above, this document uses additional formatting conventions.</p>

        <p><code>Courier</code>: All words appearing in <code>Courier</code> font are values, objects, keywords, or literal XML text.</p>
        <p><em>Italics</em>: A phrase appearing in <em>italics</em> is one of:</p>
        <ul>
          <li><p>a title of a section of document or a rule,</p></li>
          <li><p>a locally-defined term, often one that is not normatively defined, or</p></li>
          <li><p>is emphasized for importance or prominence.</p></li>
        </ul>
        <p><strong>Bold</strong>: A phrase appearing in <strong>bold</strong> is one of:</p>
        <ul>
          <li><p>a term being defined within a definition,</p></li>
          <li><p>a term that was bold in the original source text for a quote</p></li>
          <li><p>a heading, such as for a section, figure, definition, or rule, or</p></li>
          <li><p>a cross-reference within the document or to a reference to an outside document.</p></li>
        </ul>

        <p>Throughout the document, fragments of code appear, including XML, RDF, and JSON-LD. These fragments are specially formatted in <code>Courier</code> font and appear in text boxes. An example of such a fragment follows:</p>
        <figure>
          <title>Example of an XML fragment</title>
          <pre><![CDATA[<xs:complexType name="PersonType">
  ...
</xs:complexType>]]></pre>
        </figure>
      </section>
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

      <p>The term <termDef>conformant schema document set</termDef> is a <termRef>conformance target</termRef>
        defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_conformant_schema_document_set,4.1.3,Schema
        document set), which states: </p>

      <blockquote>
        <p>A <strong>conformant schema document set</strong> is a collection of schema documents
          that together are capable of validating a conformant instance XML document.</p>
      </blockquote>

      <p>Note the principal component of a NIEM exchange definition (an information exchange package
        documentation, or IEPD) is a conformant schema document set.</p>

      <p>The term <termDef>conformant instance XML document</termDef> is a <termRef>conformance target</termRef>
        defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_conformant_instance_XML_document,4.1.4,Instance
        documents and elements), which states: </p>

      <blockquote>
        <p>A <strong>conformant instance XML document</strong> is an XML document that is [an]
          instance document valid to a conformant schema document set.</p>
      </blockquote>

      <p>Although the above definitions for the <termRef term="conformance target">conformance targets</termRef>
        <termRef>conformant schema
      document set</termRef> and <termRef>conformant instance XML document</termRef> reference
      each other, each conformance target is supported by a set of rules. Each artifact (i.e.,
      document set or XML document) must conform to all rules for its conformance target in order
      to conform to the conformance target.</p>
      
      <p>The term <termDef>reference schema document</termDef> is a <termRef>conformance target</termRef>
        defined by the
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#definition_reference_schema_document,4.1.1,Reference schema document), which states: </p>

      <blockquote>
        <p>A <strong>reference schema document</strong> is a schema document that is intended to
          provide the authoritative definitions of broadly reusable schema components.</p>
      </blockquote>
      
      <p>The term <termDef>extension schema document</termDef> is a <termRef>conformance target</termRef>
        defined by the
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
      <title>RDF and RDF Schema</title>

      <p>MACRO_REF_EXTERNAL(RDF-Concepts,MACRO_HREF_RDF_CONCEPTS#dfn-rdf-graph,3,RDF Graphs) defines the term <termDef>RDF graph</termDef>:</p>

      <blockquote>
        <p>An RDF graph is a set of RDF triples.</p>
      </blockquote>

      <p>MACRO_REF_EXTERNAL(RDF-Concepts,MACRO_HREF_RDF_CONCEPTS#dfn-equivalence,1.7,[[[Equivalence,
        Entailment and Inconsistency]]]) defines the term <termDef>equivalent</termDef>:</p>

      <blockquote>
        <p>Two RDF graphs A and B are equivalent if they make the same claim about the world. A is equivalent to B if and only if A entails B and B entails A.</p>
      </blockquote>

      <p><ref idref="RDFS"/> describes RDF Schema (RDFS), which provides a data-modeling vocabulary
        for RDF data. <ref idref="NDR"/> defines components of NIEM-conformant schema document sets
        in terms of RDF Schema.</p>

      <p>Property <qName>rdf:value</qName> is defined by
        MACRO_REF_EXTERNAL(RDFS,MACRO_HREF_RDFS#ch_value,5.4.3,rdf:value). This property is used
        within an object to carry a simple value with no additional meaning.</p>
    </section>
  </section>

  <section id="section-conformance-targets">
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
        <td><termRef>NIEM JSON document strictly conformant to a schema</termRef></td>
      </tr>
      <tr>
        <td><conformance-target id="LAX">LAX</conformance-target></td>
        <td><termRef>NIEM JSON document laxly conformant to a schema</termRef></td>
      </tr>
    </table>

    <section>
      <title>NIEM JSON document strictly conformant to a schema</title>
      <definition term="NIEM JSON document strictly conformant to a schema">
        <p>A <strong>NIEM JSON document strictly conformant to a schema</strong> is
          a <termRef>JSON-LD document</termRef> that may be assigned a one-to-one correspondence to
          a <termRef>conformant instance XML document</termRef> valid against a <termRef>conformant schema document set</termRef>.  It is
          a <termRef>conformance target</termRef> of this specification. A NIEM JSON document
          strictly conformant to a schema MUST conform to all rules of this specification that apply
          to this conformance target.  The <termRef>conformance target identifier</termRef> for this
          conformance target is <code>MACRO_CT_URI_STRICT</code>.</p>
      </definition>
    </section>

    <section>
      <title>NIEM JSON document laxly conformant to a schema</title>
      <definition term="NIEM JSON document laxly conformant to a schema">
        <p>A <strong>NIEM JSON document laxly conformant to a schema</strong> is a <termRef>JSON-LD
            document</termRef> that may be interpreted using the RDF vocabulary defined by a
          <termRef>conformant schema document set</termRef>.
          It is a <termRef>conformance target</termRef> of this specification. A NIEM JSON
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
        <p>A <termRef>NIEM JSON document strictly conformant to a schema</termRef> or
          <termRef>NIEM JSON document laxly conformant to a schema</termRef> MUST be
            a <termRef>JSON-LD document</termRef>.</p>
      </rule>

    </ruleSection>

    <ruleSection>
      <title>Strictly conformant JSON corresponds to valid XML</title>

      <rule applicability="STRICT" class="Constraint">
        <p>The <termRef>RDF graph</termRef> entailed by a <termRef>NIEM JSON document strictly
          conformant to a schema</termRef> MUST be <termRef>equivalent</termRef> to the <termRef>RDF
          graph</termRef> entailed by a corresponding <termRef>conformant instance XML
          document</termRef> instance of the schema, accounting for
          <termRef>literal-to-object conversion</termRef> and the omission of external content.</p>
      </rule>

      <p>Within this rule, the <em>schema</em> includes a <termRef>conformant schema document
          set</termRef>, and will include all other constraints of an <termRef>IEP conformance
          target</termRef> defined by an IEPD. The <termRef>RDF graph</termRef> entailed by a
          candidate JSON document is described by <ref idref="JSON-LD-API"/>. The <termRef>RDF
          graph</termRef> entailed by an XML document is described by <ref idref="NDR"/>. This rule
          does not provide or require a translation of JSON to XML, although such a translation may
          be helpful in validating this rule.</p>
      
    </ruleSection>

    <ruleSection>
      <title>JSON is satisfiable with schema</title>

      <rule applicability="STRICT LAX" class="Constraint">
        <p>The <termRef>RDF graph</termRef> consisting of the union of:</p>
        <ol>
          <li><p>the <termRef>RDF graph</termRef> entailed by the <termRef>JSON document</termRef> and</p></li>
          <li><p>the <termRef>RDF graph</termRef> entailed by the schema</p></li>
        </ol>
        <p>MUST be RDFS satisfiable, accounting for <termRef>literal-to-object
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
        <p>A <termRef>NIEM JSON document strictly conformant to a schema</termRef> or
          <termRef>NIEM JSON document laxly conformant to a schema</termRef> MUST be interpreted as
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
        cumbersome. For this reason, NIEM JSON instances may use a shorthand syntax, in which any
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

      <section>
        <title>Example of literal-to-object conversion</title>

      <p>This section provides an example of literal-to-object conversion. It shows the conversion
        of a simple XML instance document to a corresponding simple JSON-LD object. The following is
        a simple XML instance document:</p>

      <figure>
        <title>XML representation of simple example</title>
        <pre><![CDATA[
<nc:PersonFullName xmlns:nc="http://release.niem.gov/niem/niem-core/4.0/"
  >Sherlock Holmes</nc:PersonFullName>
]]></pre>
      </figure>

      <p>MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#section_5.6.3.2,5.6.3.2,Element instance) specifies
        that each element that is defined by a NIEM-conformant schema carries an object value, not a
        literal value. The value of the above element <code>nc:PersonName</code> is an object with a
        single simple value, which is reflected by the following RDF, in Turtle format:</p>

      <figure>
        <title>RDF representation of simple example</title>
        <pre><![CDATA[
@prefix nc:  <http://release.niem.gov/niem/niem-core/4.0/> .
@prefix rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
_:b0    nc:PersonFullName  _:b1 .
_:b1    rdf:value  "Sherlock Holmes" .
]]></pre>
      </figure>

      <p>The JSON-LD versions of the example use the following JSON-LD context:</p>

      <figure>
        <title>JSON-LD context for simple example</title>
        <pre><![CDATA[
{
    "nc" : "http://release.niem.gov/niem/niem-core/4.0/",
    "rdf" : "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
}
]]></pre>
      </figure>

      <p>The JSON-LD version of the above instance includes the object, with the literal name as an
        <code>rdf:value</code> property:</p>

      <figure id="convert-after">
        <title>JSON-LD representation of simple example</title>
        <pre><![CDATA[
{
  "nc:PersonFullName" : {
    "rdf:value": "Sherlock Holmes"
  }
}
]]></pre>
      </figure>

      <p>Users of NIEM JSON have expressed a preference for a representation of data that is less
        verbose than the above. By converting from an object to a literal, the JSON-LD may be
        simplified:</p>

      <figure id="convert-before">
        <title>JSON-LD example using literals</title>
        <pre><![CDATA[
{
  "nc:PersonFullName" : "Sherlock Holmes"
}
]]></pre>
      </figure>

      <p><termRef term="literal-to-object conversion">Literal-to-object conversion</termRef> is the
        transformation from <ref idref="convert-before"/> to <ref idref="convert-after"/>. Users may
        express NIEM data using a brief format, with the knowledge that it represents the more
        verbose use of objects instead of bare literals.</p>

      </section>
    </section>

    <section>
      <title>External content omission</title>

      <p>NIEM provides a mechanism for data that is not NIEM-conformant to be included within NIEM
        data. Such data is called external content (see
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#section_10.2.3,10.2.3,External adapter types and
        external components)). External content includes
        any content with a namespace defined by an <termRef>external schema document</termRef>, or with any
        namespace not defined by a <termRef>reference schema document</termRef>
        or <termRef>extension schema document</termRef>.</p>

      <p>NIEM provides a mapping from NIEM-conformant XML content and XML
        Schemas to RDF (see MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#section_5,5,The NIEM conceptual
        model)). The NDR rules do not provide a mapping from external content to RDF.</p>

      <p>An object carried by an external element (i.e., an instance of an element that is in a
        namespace not defined by NIEM-conformant schema documents) may be part of a subgraph of
        resources and properties that are not described by NIEM-conformant schemas. Such an object
        may be mapped to a resource that is assigned an IRI that is a blank node (described by
        MACRO_REF_EXTERNAL(NDR,MACRO_HREF_NDR#section_5.4,5.4,Unique identification of data
        objects)), or may be given a more meaningful resource identifier.</p>

      <p>Since the structure and content of such a subgraph is not described by NIEM-conformant
        schemas, its structure and content are not material to the conformance of a JSON document by
        this specification. Such content may effectively be omitted from consideration of its
        validity against a schema, as regards conformance to this specification.  Other
        specifications may introduce introduce additional rules, but that is outside the scope of
        this specification.</p>

    </section>

  </section>

  <section id="references" isAppendix="true">
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
    <reference id="ConfReq">
      <p>Lynne Rosenthal, and Mark Skall, eds. <q>Conformance Requirements for Specifications v1.0.</q> The Organization for the Advancement of Structured Information Standards (OASIS), March 15, 2002. <link>https://www.oasis-open.org/committees/download.php/305/conformance_requirements-v1.pdf</link>.</p>
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
    <reference id="RDF-Concepts">
      <p>Richard Cyganiak, David Wood, and Markus Lanthaler, eds. <q>RDF 1.1 Concepts and Abstract Syntax.</q> W3C Recommendation. The World Wide Web Consortium (W3C), February 25, 2014. <link>MACRO_HREF_RDF_CONCEPTS</link>.</p>
    </reference>
    <reference id="RDFS" label="RDF-Schema">
      <p>Dan Brickley, and R.V. Guha, eds. <q>RDF Schema 1.1.</q> The World Wide Web Consortium (W3C), February 25, 2014. <link>http://www.w3.org/TR/2014/REC-rdf-schema-20140225/</link>.</p>
    </reference>
    <reference id="RDF-Semantics">
      <p>Patrick J. Hayes, and Peter F. Patel-Schneider, eds. <q>RDF 1.1 Semantics.</q> The World
        Wide Web Consortium (W3C), February 25,
        2014. <link>MACRO_HREF_RDF_SEMANTICS</link>.</p>
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
