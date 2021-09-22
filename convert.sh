#!/bin/sh

KSY_FILE=dwg_ac1_50.ksy
OUTPUT_PM_FILE=AC1_50.pm

ksc -t perl $KSY_FILE
mv DwgAc150.pm $OUTPUT_PM_FILE
sed -i s/DwgAc150/CAD::Format::DWG::AC1_50/g $OUTPUT_PM_FILE
