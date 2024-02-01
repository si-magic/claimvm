PREFIX ?= /usr/local
SYSTEMD_UNITS ?= claimvm@.service claimvm.slice

install:
	install -d $(PREFIX)/libexec/claimvm $(PREFIX)/lib/systemd/system
	install -t $(PREFIX)/libexec/claimvm src/claimvm
	cd systemd && install -t $(PREFIX)/lib/systemd/system $(SYSTEMD_UNITS)
	systemctl daemon-reload

uninstall:
	rm -f $(PREFIX)/libexec/claimvm/claimvm
	cd $(PREFIX)/lib/systemd/system && rm -f $(SYSTEMD_UNITS)
	systemctl daemon-reload
