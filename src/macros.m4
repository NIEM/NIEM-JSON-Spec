m4_changequote([[[,]]])m4_dnl
m4_changecom(,)m4_dnl
m4_define([[[MACRO_SPECIFIED_VERSION]]],[[[4.0]]])m4_dnl What version is the spec representing? (e.g., 4.0, 4.1)
m4_define([[[MACRO_DOCUMENT_VERSION]]],[[[4.0]]])m4_dnl What version is the spec representing? (e.g., 4.0, 4.1)
m4_define([[[MACRO_DOCUMENT_DATE]]],[[[2020-08-24]]])m4_dnl
m4_define([[[MACRO_SHORT_NAME]]],[[[niem-json-spec]]])m4_dnl
m4_define([[[MACRO_DOCUMENT_URI]]],[[[http://reference.niem.gov/niem/specification/MACRO_SHORT_NAME/MACRO_SPECIFIED_VERSION/]]])m4_dnl
m4_dnl conformance targets
m4_define([[[MACRO_CT_URI_LAX]]],[[[MACRO_DOCUMENT_URI[[[]]]#Lax]]])m4_dnl
m4_define([[[MACRO_CT_URI_STRICT]]],[[[MACRO_DOCUMENT_URI[[[]]]#Strict]]])m4_dnl
m4_dnl
m4_define([[[MACRO_HREF_NDR]]],[[[http://reference.niem.gov/niem/specification/naming-and-design-rules/4.0/niem-ndr-4.0.html]]])m4_dnl
m4_define([[[MACRO_HREF_MPD]]],[[[https://reference.niem.gov/niem/specification/model-package-description/3.0.1/model-package-description-3.0.1.html]]])m4_dnl
m4_define([[[MACRO_HREF_CTAS]]],[[[http://reference.niem.gov/niem/specification/conformance-targets-attribute/3.0/NIEM-CTAS-3.0-2014-07-31.html]]])m4_dnl
m4_define([[[MACRO_HREF_JSONLD]]],[[[https://www.w3.org/TR/2014/REC-json-ld-20140116/]]])m4_dnl
m4_define([[[MACRO_HREF_RFC8259]]],[[[https://tools.ietf.org/html/rfc8259]]])m4_dnl
m4_define([[[MACRO_HREF_RDFS]]],[[[https://www.w3.org/TR/rdf-schema/]]])m4_dnl
m4_define([[[MACRO_HREF_RDF_CONCEPTS]]],[[[https://www.w3.org/TR/2014/REC-rdf11-concepts-20140225/]]])m4_dnl
m4_define([[[MACRO_HREF_RDF_SEMANTICS]]],[[[http://www.w3.org/TR/2014/REC-rdf11-mt-20140225/]]])m4_dnl
m4_dnl
m4_dnl  MACRO_ASSERT( $test, $message )
m4_dnl
m4_define([[[MACRO_ASSERT]]],[[[m4_dnl
m4_ifelse([[[$1]]],1,,[[[
m4_errprint(m4___file__[[[:]]]m4___line__[[[:]]],[[[assert failed:]]],m4_shift($@),[[[
]]])m4_dnl
m4_m4exit(1)m4_dnl
]]])]]])m4_dnl
m4_dnl
m4_dnl
m4_dnl # MACRO_NOT(0)
m4_dnl
m4_define([[[MACRO_NOT]]],[[[m4_ifelse([[[$1]]],1,0,1)]]])m4_dnl
m4_dnl
m4_dnl
m4_dnl # MACRO_IS_EMPTY($1)
m4_dnl
m4_define([[[MACRO_IS_EMPTY]]],[[[m4_ifelse([[[$1]]],[[[]]],1,0)]]])m4_dnl
m4_dnl
m4_dnl
m4_dnl # MACRO_REF_EXTERNAL( $ndr-ref-id, $external-href, $section-number, $section-title )
m4_dnl #   you may omit $1 or $2.
m4_dnl
m4_define([[[MACRO_REF_EXTERNAL]]],[[[m4_dnl
MACRO_ASSERT(MACRO_NOT(MACRO_IS_EMPTY($4)),[[[MACRO_REF_EXTERNAL requires argument $section-title]]])m4_dnl
m4_ifelse([[[$1]]],[[[]]],[[[]]],[[[<ref idref="$1"/> ]]])m4_dnl
m4_ifelse([[[$2]]],[[[]]],[[[]]],[[[<a href="$2">]]])m4_dnl
m4_ifelse([[[$3]]],[[[]]],[[[m4_dnl
subsection <em>$4</em>m4_dnl
]]],[[[m4_dnl
Section $3, <em>$4</em>m4_dnl
]]])m4_dnl
m4_ifelse([[[$2]]],[[[]]],[[[]]],</a>)m4_dnl
]]])m4_dnl
