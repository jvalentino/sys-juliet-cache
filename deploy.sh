#!/bin/sh
# https://github.com/bitnami/charts/tree/main/bitnami/redis/#installing-the-chart
helm repo add bitnami https://charts.bitnami.com/bitnami
helm delete redis --wait || true
helm install redis \
	--wait \
	--set auth.password=redis \
	bitnami/redis
sh -x ./verify.sh