LUA_DIR:=/usr/
LUA_LIBDIR:=$(LUA_DIR)/lib/lua/5.1
LIBFLAG:=-shared -fpic

core.so: core.c
	$(CC) -o core.so $(LIBFLAG) $(CFLAGS) core.c -I$(LUA_LIBDIR) -llua -lsodium

clean:
	$(RM) core.so

install:
	install -d -m0755        $(DESTDIR)/usr/lib/lua
	install -m644 sodium.lua $(DESTDIR)/usr/lib/lua
	install -d -m0755        $(DESTDIR)/usr/lib/lua/sodium
	install -m644 core.so    $(DESTDIR)/usr/lib/lua/sodium