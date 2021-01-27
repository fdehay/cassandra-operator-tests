#!/bin/sh

cat <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: rick-s3-backup-restore-secret
type: Opaque
stringData:
  awsaccesskeyid: ${S3_ID}
  awssecretaccesskey: ${S3_KEY}
  awsregion: "Sophia"
  awsendpoint: "https://zone2.s3.orangeportails.net"
EOF
