.PHONY: install uninstall reinstall

install: apt-ipfs completions/bash/apt-ipfs
	apt-get install --force-yes -y -qq aria2
	cp apt-ipfs /usr/local/sbin/
	cp apt-ipfs.conf /etc/
	mkdir -p /etc/bash_completion.d/
	mkdir -p /usr/share/zsh/functions/Completion/Debian/
	cp completions/bash/apt-ipfs /etc/bash_completion.d/
	cp completions/zsh/_apt-ipfs /usr/share/zsh/functions/Completion/Debian/
	chown root:root /etc/bash_completion.d/apt-ipfs
	chown root:root /usr/share/zsh/functions/Completion/Debian/_apt-ipfs
	mkdir -p /usr/local/share/man/man8/
	mkdir -p /usr/local/share/man/man5/
	cp man/apt-ipfs.8 /usr/local/share/man/man8/
	cp man/apt-ipfs.conf.5 /usr/local/share/man/man5/
	gzip -f9 /usr/local/share/man/man8/apt-ipfs.8
	gzip -f9 /usr/local/share/man/man5/apt-ipfs.conf.5
	chmod +x /usr/local/sbin/apt-ipfs

uninstall: /usr/local/sbin/apt-ipfs
	rm -rf /usr/local/sbin/apt-ipfs /etc/apt-ipfs.conf \
	/usr/local/share/man/man5/apt-ipfs.conf.5.gz /usr/local/share/man/man8/apt-ipfs.8.gz \
	/usr/share/zsh/functions/Completion/Debian/_apt-ipfs /etc/bash_completion.d/apt-ipfs
	@echo "Please manually remove deb package - aria2 if you don't need it anymore."

/usr/local/sbin/apt-ipfs:
	@echo "Not installed" 1>&2
	@exit 1

reinstall: uninstall install
