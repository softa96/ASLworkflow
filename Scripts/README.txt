Here are the scripts used in the processing and analysis steps.
Dependendcies: FSL v6.0. Matlab 2020 or higher.
Arterial atlas is available at: https://www.nitrc.org/projects/arterialatlas

Scripts:
runFSLAnalysis_LongitudinalMeasurement.sh (Code to run the processing and analysis using FSL on the data in DATA-ParticipantB folder. The data needs to be structured according to the search paths in this script. E.g. Data from Day01 in a folder named Day01 with folders named T1, PD, and ASL)
fsl_ASLreg_withBET.sh (Call to run the registration for ASL maps to reference space) -> Output ASL maps in T1 reference space.
app_VisAndQuant_ASLResults (Matlab app to visualize the outputs from the FSL analysis, choose the path to the main folder containing all data and results as input)
colormaps_ASL.mat (Contains the defined colormaps used)
