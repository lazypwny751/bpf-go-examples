PREFIX := .
BUILDD := build
VMDEST := $(abspath "src")
BPFENTRY := $(VMDEST)/jurassic.c
OUT := $(BUILDD)/jurassic.o

all: vmlinux gbuild ebuild

vmlinux: $(VMDEST)/vmlinux.h

$(VMDEST)/vmlinux.h:
	mkdir -vp $(VMDEST)
	test -f $(VMDEST)/vmlinux.h || bpftool btf dump file /sys/kernel/btf/vmlinux format c > $(VMDEST)/vmlinux.h

gbuild:
	mkdir -vp $(BUILDD)

ebuild:
	mkdir -vp $(BUILDD)
	ln -vfs ../lib $(VMDEST)
	clang -O2 -target bpf -c $(BPFENTRY) -o $(OUT)

clean:
	rm -rvf $(BUILDD)

.PHONY: all gbuild ebuild clean
