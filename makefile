
docName = draft-ounsworth-pq-composite-keys


default: all

txt: $(docName).txt

$(docName).txt: $(docName).mkd
	kdrfc $(docName).mkd



xml: $(docName).xml

$(docName).xml: $(docName).mkd
	 kramdown-rfc2629 $(docName).mkd > $(docName).xml
#	 # for some reason the kramdown tool seems to be creating invalid xml, so let's fix it
#	 sed -i 's/consensus="true">/>/g' $(docName).xml 




html: all # xml
	# xml2rfc $(docName).xml --basename $(docName) --html
 # Explicitely aliasing this to `all` so that a .txt is always generated, because that should be committed to git for other people's ease of editing.

all: xml
	xml2rfc $(docName).xml --html --text


clean:
	rm -f $(docName).xml # $(docName).html # $(docName).txt
	# Explicitely not deleting the .html or .txt because that should be committed to git for other people's ease of editing.
