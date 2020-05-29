
# NIEM JSON Specification

# Publication checklist

- [ ] Update document version
- [ ] Update document date

# Issues & Notes

- The conformance of the JSON-LD to a specific IEPD may involve converting the
  XML Schema of the IEPD to SHACL rules. This level of conformance DOES NOT live
  in this specification. There should be a separate specification that
  identifies the conformance of an RDF graph to an IEPD. 

# Building ##

```bash
$ make depend=build
$ make
$ make spell
$ make publish
```

# Creating configure scripts

If you need to edit `configure.ac`, rebuilt `configure`:

```bash
$ make -f configure.mk
 ```


