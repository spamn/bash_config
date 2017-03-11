FILE_LIST:= my_alias.sh  my_env.sh  my_prompt.sh  my_startx.sh
INSTALL_DIR:=$(DESTDIR)/etc/profile.d
INSTALL_FILES:=$(addprefix $(INSTALL_DIR)/,$(FILE_LIST))

.PHONY= install clean uinstall

$(INSTALL_DIR)/%.sh: %.sh
	install -D -m 555 $^ $@

install: $(INSTALL_FILES) 

uninstall:
	rm -i $(INSTALL_FILES)
