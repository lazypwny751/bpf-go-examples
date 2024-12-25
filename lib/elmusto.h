struct event {
	int pid;
	int ppid;
	unsigned exit_code;
	unsigned long long dur_ns;
	char comm[16];	
};
