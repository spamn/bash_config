FILE_LIST:= my_alias.sh  my_env.sh  my_prompt.sh  my_startwm.sh my_history.sh
INSTALL_DIR:=$(DESTDIR)/etc/bashconfig.d
INSTALL_FILES:=$(addprefix $(INSTALL_DIR)/,$(FILE_LIST)) $(DESTDIR)/etc/bashconfig

.PHONY= install clean uinstall

$(DESTDIR)/etc/bashconfig: bashconfig
	install -D -m 555 $^ $@

$(INSTALL_DIR)/%.sh: %.sh
	install -D -m 555 $^ $@

install: $(INSTALL_FILES) 

uninstall:
	rm -i $(INSTALL_FILES)
