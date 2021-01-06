ifeq (rick-kuttl-test,$(firstword $(MAKECMDGOALS)))
  KUTTL_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(KUTTL_ARGS):;@:)
endif

ifeq ($(KUTTL_ARGS),)
	@echo "args are: ScaleUpAndDownDC ; BackupAndRestore" && exit 1
endif

rick-kuttl-test:
	cd casskop-rick && ./kuttl test --config ./casskop-rick/kuttl-test.yaml --test $(KUTTL_ARGS) --namespace casskop-cassandra-e2e && cd ..