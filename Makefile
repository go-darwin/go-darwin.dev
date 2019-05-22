.PHONY: boilerplate/public/%
boilerplate/public/%: BOILERPLATE_PKG_DIR=$(shell printf $@ | rev | awk -F/ 'OFS="/" {print $$1, $$2}' | rev)
boilerplate/public/%: BOILERPLATE_PKG_NAME=$(shell basename ${BOILERPLATE_PKG_DIR})
boilerplate/public/%: hack/boilerplate/boilerplate.index.html.txt  ## Create go file from boilerplate.go.txt
	@if [ ! -d ${BOILERPLATE_PKG_DIR} ]; then mkdir -p ${BOILERPLATE_PKG_DIR} ; fi
	@cat hack/boilerplate/boilerplate.index.html.txt | sed 's|PKG|${BOILERPLATE_PKG_NAME}|g' > ${BOILERPLATE_PKG_DIR}/index.html
