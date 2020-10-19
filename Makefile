PREFIX:=/usr/local
JASP_PREFIX:=/usr/local

# guix patches desktop files itself
install: startjasp org.psychnotebook.jasp.desktop
	install -d $(PREFIX)/bin $(PREFIX)/share/applications $(PREFIX)/share/icons/hicolor/scalable/apps
	install -m 755 startjasp $(PREFIX)/bin/
	install -m 644 -D org.psychnotebook.jasp.desktop $(PREFIX)/share/applications/
	install -m 644 -D jasp.svg $(PREFIX)/share/icons/hicolor/scalable/apps/

startjasp: startjasp.in
	m4 -DXPRA_PREFIX=$(XPRA_PREFIX) -DJASP_PREFIX=$(JASP_PREFIX) < $< > $@

