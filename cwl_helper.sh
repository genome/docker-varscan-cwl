#!/bin/bash

set -o errexit
set -o nounset

if [ $# -ne 3 ]
then
    echo "Usage: $0 [TUMOR_BAM] [NORMAL_BAM] [REFERENCE]"
    exit 1
fi

TUMOR_BAM="$1"
NORMAL_BAM="$2"
REFERENCE="$3"
OUTPUT="${HOME}/output"

java -jar /opt/varscan/VarScan.jar somatic \
    <(/usr/bin/samtools mpileup --no-baq -f "$REFERENCE" "$NORMAL_BAM" "$TUMOR_BAM") \
    $OUTPUT \
    --mpileup 1 \
    --output-vcf
