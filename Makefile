INSTALL_DIR=~/.local/bin

all:
	@echo "Please run 'make install'"

install:
	@echo ""
	mkdir -p $(INSTALL_DIR)
	cp alrc-termux.sh $(INSTALL_DIR)
	cp Changelog.al.txt $(INSTALL_DIR)
	@echo ""
	@echo "Please add 'source $(INSTALL_DIR)/alrc-termux.sh' to your .bashrc file"
	@echo ''

.PHONY: all install
