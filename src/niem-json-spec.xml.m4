<?xml version="1.0" encoding="US-ASCII"?>
<document xmlns="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258">
  <title>NIEM JSON Specification</title>
  <version>MACRO_DOCUMENT_VERSION</version>
  <date>MACRO_DOCUMENT_DATE</date>
  <author>NIEM Technical Architecture Committee (NTAC)</author>

  <subsection>
    <title>Abstract</title>

    m4_define([[[MACRO_ABSTRACT_TEXT]]],[[[

    <p>The NIEM JSON Specification establishes methods, rules, and conformance targets for using
      NIEM with JSON.</p>

    <p>The definition of conformance for NIEM JSON data primarily focuses on the relationship
      between the data in the JSON file and the definitions established by a NIEM-conformant schema,
      like the schema defined by a NIEM IEPD. There a two forms of conformance of a NIEM JSON
      document to a NIEM-conformant schema:</p>

    <ul>
      <li><p><strong>Strict conformance</strong> establishes that the JSON instance follows all
          rules of the schema or IEPD. An instance that strictly conforms to an IEPD will contain
          all content that is required by the IEPD, will contain only content allowed by the IEPD,
          and reflect the parent-child structure and cardinality constraints defined by the
          IEPD. This is intended to enable NIEM JSON to satisfy exchange requirements similar to
          traditional NIEM XML use cases.</p></li>
      <li><p><strong>Lax conformance</strong> is intended to enable the use of vocabularies that are
          defined by NIEM schemas or IEPDs via <em>linked data</em> and <em>linked open data</em>
          methods. It is intended to establish that exchanges that use NIEM-conformant vocabularies
          use those vocabularies properly, while allowing for more flexibilty, and for combining
          terms from NIEM-conformant vocabularies with terms from other vocabularies.</p></li>
    </ul>
    

    

    ]]])

    MACRO_ABSTRACT_TEXT

  </subsection>

  <subsection>
    <title>Authors</title>
    <p>Webb Roberts, Georgia Tech Research Institute
      (<link href="mailto:webb.roberts@gtri.gatech.edu">&lt;webb.roberts@gtri.gatech.edu&gt;</link>),
      Lead Author</p>
  </subsection>

  <subsection>
    <title>Document Status</title>
    <p>This document is a draft of a specification product of the NIEM Technical Architecture
      Committee (NTAC).</p>

    <p>Updates, revisions, and errata for this specification are posted to
      <link>https://github.com/NIEM/NIEM-JSON-Spec</link>. Please submit comments on this
      specification as issues at <link>https://github.com/NIEM/NIEM-JSON-Spec/issues</link>.</p>

  </subsection>

  <subsection id="toc">
    <title>Table of Contents</title>
    <tableOfContents/>
  </subsection>
  <section>
    <title>Introduction</title>

    MACRO_ABSTRACT_TEXT
  </section>

  <section>
    <title>Terminology</title>
    
    <p>This document uses terminology from other specifications. This section enumerates this
      externally-defined terminology.</p>

    <!-- taken from ndr -->
    <section id="section-terminology-bcp-14">
      <title>IETF Best Current Practice 14 terminology</title>
      <p>The key words <q>MUST</q>, <q>MUST NOT</q>, <q>REQUIRED</q>, <q>SHALL</q>,
        <q>SHALL NOT</q>, <q>SHOULD</q>, <q>SHOULD NOT</q>, <q>RECOMMENDED</q>, <q>NOT RECOMMENDED</q>,
        <q>MAY</q>, and <q>OPTIONAL</q> in this document are to be interpreted as described in
        <ref idref="BCP14"/> <ref idref="RFC2119"/> <ref idref="RFC8174"/> when, and only when, they appear in
        all capitals, as shown here.</p>
    </section>

    <!-- taken from code lists spec -->
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
      <title>JSON</title>
    </section>
    <section>
      <title>JSON-LD</title>
      <p><ref idref="JSON-LD"/> defines the term <termDef>JSON-LD document</termDef> at
        MACRO_REF_EXTERNAL(JSON-LD,MACRO_HREF_JSONLD#dfn-json-ld-document,7,Data Model).</p>
    </section>
  </section>

  <section>
    <title>Conformance Targets</title>

    <section>
      <title>JSON document</title>
      <p>The conformance target <termDef>JSON document</termDef> uses code
        <conformance-target id="JSON">JSON</conformance-target>.</p>
    </section>
  </section>

  <section>
    <title>Conformance of a JSON document to a NIEM IEPD</title>
    <p>A JSON document MAY be conformant to any number of NIEM IEPDs.</p>
    <section>
      <title>Strict conformance to an IEPD</title>
      <p>A JSON document is strictly conformant to an IEPD if and only if it contains only the
        content as described by an NIEM-conformant XML Schema set.</p>
    </section>
    <section>
      <title>Lax conformance to an IEPD</title>
      <p>A JSON document is laxly conformant to an IEPD if and only if it contains the content
        required by an NIEM-conformant XML Schema set, and MAY include other content not specified
        by the NIEM-conformant XML Schema set.</p>
    </section>
  </section>

  <section>
    <title>Rules</title>
    
    <ruleSection>
      <title>File must be a JSON-LD file</title>
      <rule applicability="JSON" id="is-json-ld" class="Constraint">
        <p>The file MUST be a JSON-LD file.</p>
      </rule>
    </ruleSection>
    
    <!-- maybe add an interpretation rule that captures:
         https://json-ld.org/spec/latest/json-ld-api-best-practices/#unordered-values
         Best practice 6: assume arrays are unordered
      -->
    <!-- maybe add something about caching? See
    http://manu.sporny.org/2016/json-ld-context-caching/ -->
  </section>

  <section isAppendix="true">
    <title>References</title>

    <reference id="CTAS">
      <p>Roberts, Webb. <q>NIEM Conformance Targets Attribute Specification, Version 3.0.</q> NIEM
      Technical Architecture Committee, July 31, 2014. <link>MACRO_HREF_CTAS</link>.</p>
    </reference>

    <reference id="RFC8259">
      <p>Bray, T., Ed., <q>The JavaScript Object Notation (JSON) Data Interchange Format</q>, STD
        90, RFC 8259, DOI 10.17487/RFC8259, December
        2017, <link>https://www.rfc-editor.org/info/rfc8259</link>.</p>
    </reference>

    <reference id="NDR" label="NIEM NDR">
      <p>Roberts, Webb. <q>National Information Exchange Model Naming and Design Rules, Version
          4.0.</q> NIEM Technical Architecture Committee, November 7,
          2017. <link>MACRO_HREF_NDR</link>.</p>
    </reference>
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
    <reference id="JSON-LD">
      <p>Manu Sporny, Dave Longley, Gregg Kellogg, Markus Lanthaler, and Niklas
          Lindstr<char name="ouml"/>m. <q>JSON-LD 1.0, A JSON-Based Serialization for Linked Data,
          W3C Recommendation.</q> Edited by Manu Sporny, Gregg Kellogg, and Markus Lanthaler. W3C,
          January 16, 2014. <link>MACRO_HREF_JSONLD</link>.</p>
    </reference>

    <reference id="SHACL">
      <p>Holger Knublauch, and Dimitris Kontokostas. <q>Shapes Constraint Language (SHACL).</q> W3C,
      July 20, 2017. <link>https://www.w3.org/TR/2017/REC-shacl-20170720/</link>.</p>
    </reference>
    
  </section>
  <section id="index"><title>Index</title>
    <index/>
  </section>
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
