// This file has extinct 65 million years ago.
#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

SEC("tracepoint/syscalls/sys_enter_execve")
int handle(struct trace_event_raw_sys_enter *ctx)
{
	bpf_printk("Hi, %d\n", ctx->id);
	return 0;
}

char LICENSE[] SEC("license") = "GPL";
