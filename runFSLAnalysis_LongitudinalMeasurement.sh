#! /bin/bash
################################################################################
# bash script for ASL analysis for K6. Written for Unix, FSL v6.0              #
# Author: Sofie Tapper, IMT, Linkoping University, sofie.tapper@liu.se         #
# October 2023                                                                 #
################################################################################

#   Set script variables and paths. Source FSL
set -x

PATHDIR="/home/LongitudinalMeasurementData/"
SCRIPTDIR="/home/scripts/" #Where scripts and atlas is stored

################################################################################

#   Generate a BET image in structural (anatomical) space (-S means removing the optical nerve)

/usr/local/fsl/bin/robustfov -i "$PATHDIR"Day01/T1/T1_Day01 -r "$PATHDIR"Day01/T1/T1_Ref_crop
/usr/local/fsl/bin/robustfov -i "$PATHDIR"Day03/T1/T1_Day03 -r "$PATHDIR"Day03/T1/T1_Ref_crop
/usr/local/fsl/bin/robustfov -i "$PATHDIR"Day05/T1/T1_Day05 -r "$PATHDIR"Day05/T1/T1_Ref_crop
/usr/local/fsl/bin/robustfov -i "$PATHDIR"Day08/T1/T1_Day08 -r "$PATHDIR"Day08/T1/T1_Ref_crop
/usr/local/fsl/bin/robustfov -i "$PATHDIR"Day09/T1/T1_Day09 -r "$PATHDIR"Day09/T1/T1_Ref_crop
/usr/local/fsl/bin/robustfov -i "$PATHDIR"Day12/T1/T1_Day12 -r "$PATHDIR"Day12/T1/T1_Ref_crop

/usr/local/fsl/bin/bet "$PATHDIR"Day01/T1/T1_Ref_crop "$PATHDIR"Day01/T1/T1_Ref_bet
/usr/local/fsl/bin/bet "$PATHDIR"Day03/T1/T1_Ref_crop "$PATHDIR"Day03/T1/T1_Ref_bet
/usr/local/fsl/bin/bet "$PATHDIR"Day05/T1/T1_Ref_crop "$PATHDIR"Day05/T1/T1_Ref_bet
/usr/local/fsl/bin/bet "$PATHDIR"Day08/T1/T1_Ref_crop "$PATHDIR"Day08/T1/T1_Ref_bet
/usr/local/fsl/bin/bet "$PATHDIR"Day09/T1/T1_Ref_crop "$PATHDIR"Day09/T1/T1_Ref_bet
/usr/local/fsl/bin/bet "$PATHDIR"Day12/T1/T1_Ref_crop "$PATHDIR"Day12/T1/T1_Ref_bet

#   Run ASL processing according to the GUI settings and use BET image instead of .anat

mkdir -p "$PATHDIR"OutputReg/

/usr/local/fsl/bin/oxford_asl -i "$PATHDIR"Day01/ASL/ASL_Day01.nii.gz --ibf=rpt --iaf=ct --tis 1.99 --bolus 0.70 -s "$PATHDIR"Day01/T1/T1_Ref_crop.nii.gz --sbrain "$PATHDIR"Day01/T1/T1_Ref_bet.nii.gz -c "$PATHDIR"Day01/PD/PD_Day01.nii.gz --tr 10.00 --cgain 10.00 --cmethod voxel --wp --t1b 1.65 --alpha 0.98 --fixbolus --spatial --mc --artoff --pvcorr -o "$PATHDIR"Day01/ASL/
/usr/local/fsl/bin/oxford_asl -i "$PATHDIR"Day03/ASL/ASL_Day03.nii.gz --ibf=rpt --iaf=ct --tis 1.99 --bolus 0.70 -s "$PATHDIR"Day03/T1/T1_Ref_crop.nii.gz --sbrain "$PATHDIR"Day03/T1/T1_Ref_bet.nii.gz -c "$PATHDIR"Day03/PD/PD_Day03.nii.gz --tr 10.00 --cgain 10.00 --cmethod voxel --wp --t1b 1.65 --alpha 0.98 --fixbolus --spatial --mc --artoff --pvcorr -o "$PATHDIR"Day03/ASL/
/usr/local/fsl/bin/oxford_asl -i "$PATHDIR"Day05/ASL/ASL_Day05.nii.gz --ibf=rpt --iaf=ct --tis 1.99 --bolus 0.70 -s "$PATHDIR"Day05/T1/T1_Ref_crop.nii.gz --sbrain "$PATHDIR"Day05/T1/T1_Ref_bet.nii.gz -c "$PATHDIR"Day05/PD/PD_Day05.nii.gz --tr 10.00 --cgain 10.00 --cmethod voxel --wp --t1b 1.65 --alpha 0.98 --fixbolus --spatial --mc --artoff --pvcorr -o "$PATHDIR"Day05/ASL/
/usr/local/fsl/bin/oxford_asl -i "$PATHDIR"Day08/ASL/ASL_Day08.nii.gz --ibf=rpt --iaf=ct --tis 1.99 --bolus 0.70 -s "$PATHDIR"Day08/T1/T1_Ref_crop.nii.gz --sbrain "$PATHDIR"Day08/T1/T1_Ref_bet.nii.gz -c "$PATHDIR"Day08/PD/PD_Day08.nii.gz --tr 10.00 --cgain 10.00 --cmethod voxel --wp --t1b 1.65 --alpha 0.98 --fixbolus --spatial --mc --artoff --pvcorr -o "$PATHDIR"Day08/ASL/
/usr/local/fsl/bin/oxford_asl -i "$PATHDIR"Day09/ASL/ASL_Day09.nii.gz --ibf=rpt --iaf=ct --tis 1.99 --bolus 0.70 -s "$PATHDIR"Day09/T1/T1_Ref_crop.nii.gz --sbrain "$PATHDIR"Day09/T1/T1_Ref_bet.nii.gz -c "$PATHDIR"Day09/PD/PD_Day09.nii.gz --tr 10.00 --cgain 10.00 --cmethod voxel --wp --t1b 1.65 --alpha 0.98 --fixbolus --spatial --mc --artoff --pvcorr -o "$PATHDIR"Day09/ASL/
/usr/local/fsl/bin/oxford_asl -i "$PATHDIR"Day12/ASL/ASL_Day12.nii.gz --ibf=rpt --iaf=ct --tis 1.99 --bolus 0.70 -s "$PATHDIR"Day12/T1/T1_Ref_crop.nii.gz --sbrain "$PATHDIR"Day12/T1/T1_Ref_bet.nii.gz -c "$PATHDIR"Day12/PD/PD_Day12.nii.gz --tr 10.00 --cgain 10.00 --cmethod voxel --wp --t1b 1.65 --alpha 0.98 --fixbolus --spatial --mc --artoff --pvcorr -o "$PATHDIR"Day12/ASL/

#   Run ASL registration to reference space for all processed CBF maps in native space

T1_Ref="$PATHDIR"Day01/T1/T1_Ref_crop.nii.gz
T1_Ref_bet="$PATHDIR"Day01/T1/T1_Ref_bet.nii.gz

"$SCRIPTDIR"fsl_ASLreg_withBET.sh "$PATHDIR"Day01/ASL/native_space/perfusion_calib.nii.gz $T1_Ref "$PATHDIR"OutputReg/ASL/ASL_Day01_To_T1_Day01 $T1_Ref_bet
"$SCRIPTDIR"fsl_ASLreg_withBET.sh "$PATHDIR"Day03/ASL/native_space/perfusion_calib.nii.gz $T1_Ref "$PATHDIR"OutputReg/ASL/ASL_Day03_To_T1_Day01 $T1_Ref_bet
"$SCRIPTDIR"fsl_ASLreg_withBET.sh "$PATHDIR"Day05/ASL/native_space/perfusion_calib.nii.gz $T1_Ref "$PATHDIR"OutputReg/ASL/ASL_Day05_To_T1_Day01 $T1_Ref_bet
"$SCRIPTDIR"fsl_ASLreg_withBET.sh "$PATHDIR"Day08/ASL/native_space/perfusion_calib.nii.gz $T1_Ref "$PATHDIR"OutputReg/ASL/ASL_Day08_To_T1_Day01 $T1_Ref_bet
"$SCRIPTDIR"fsl_ASLreg_withBET.sh "$PATHDIR"Day09/ASL/native_space/perfusion_calib.nii.gz $T1_Ref "$PATHDIR"OutputReg/ASL/ASL_Day09_To_T1_Day01 $T1_Ref_bet
"$SCRIPTDIR"fsl_ASLreg_withBET.sh "$PATHDIR"Day12/ASL/native_space/perfusion_calib.nii.gz $T1_Ref "$PATHDIR"OutputReg/ASL/ASL_Day12_To_T1_Day01 $T1_Ref_bet

mkdir -p "$PATHDIR"OutputReg/T1
cp -fr $T1_Ref "$PATHDIR"OutputReg/T1/
cp -fr $T1_Ref_bet "$PATHDIR"OutputReg/T1/

#    Register Atlas to Patient-specific T1-space.
flirt -in $T1_Ref_bet -ref $FSLDIR/data/standard/MNI152_T1_1mm_brain.nii.gz -dof 12 -out "$PATHDIR"OutputReg/T1toMNIlin -omat "$PATHDIR"OutputReg/T1toMNIlin.mat
fnirt --in=$T1_Ref --aff="$PATHDIR"OutputReg/T1toMNIlin.mat --config=T1_2_MNI152_2mm.cnf --iout="$PATHDIR"OutputReg/T1toMNInonlin --cout="$PATHDIR"OutputReg/T1toMNI_coef --fout="$PATHDIR"OutputReg/T1toMNI_warp
invwarp --ref=$T1_Ref --warp="$PATHDIR"OutputReg/T1toMNI_coef --out="$PATHDIR"OutputReg/warps_into_Refspace
applywarp --ref=$T1_Ref --in="$SCRIPTDIR"ArterialAtlas_level2.nii.gz --warp="$PATHDIR"OutputReg/warps_into_Refspace --out="$PATHDIR"OutputReg/AtlasinRefspace --interp=nn