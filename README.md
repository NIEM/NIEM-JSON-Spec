
# NIEM JSON Specification

## Issues & Notes

- The conformance of the JSON-LD to a specific IEPD may involve converting the
  XML Schema of the IEPD to SHACL rules. This level of conformance DOES NOT live
  in this specification. There should be a separate specification that
  identifies the conformance of an RDF graph to an IEPD.
    - This MAY be part of a new IEPD spec. But it MUST NOT be in this spec. It's
      going to get into the details of 

## The spec as Software

### Origin ###

The framework was lifted from the configuration for the NIEM Code Lists Spec, which has
more details. Look there if you need to add anything in.

### Building ###

Don't build where the doc source is; it junks up the source directory with a
bunch of unnecessary files and directories. Instead, use a separate build
directory. Recommended breakdown:

* `$common-dir/source`: the git repository for the source of the document
* `$common-dir/build`: where you build and validate the document
* `$common-dir/publish`: the git repository for generated document artifacts

How to build it:

```bash
$ mkdir $common-dir/build
$ cd $common-dir/build
$ $common-dir/doc/configure output_dir=$common-dir/publish
$ make depend
$ make
$ make install
$ make valid
```

We do "make valid" after "make install" to ensure that all needed artifacts are
included in the generated distribution.

### Creating configure scripts ###

From the source root directory, run:

```bash
$ make -f unconfigured.mk
 ```


