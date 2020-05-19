
xml_files = example-1.xml
xml_valid_tokens = ${xml_files:%.xml=tmp/valid/%.xml}

.PHONY: valid
valid: ${xml_valid_tokens}

tmp/valid/%.xml: %.xml
	xs-validate -c niem/xml-catalog.xml $<
	mkdir -p ${dir $@}
	touch $@



