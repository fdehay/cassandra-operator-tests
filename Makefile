
kuttl-casskop:
	kuttl test --config ./CassKop-kuttl-tests/kuttl-test.yaml ./CassKop-kuttl-tests# --test $(KUTTL_ARGS) || { kubectl get events --all-namespaces --sort-by .metadata.creationTimestamp ; exit 1; }