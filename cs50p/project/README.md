#  Cholesterol- Lipoproteins Calculator
    #### Video Demo:  <https://youtu.be/IKcbi1EhLxY>
    #### Description:


# Overview
Cardiovascular diseases (CVDs) are the leading cause of mortality in the world.


# The measurement of lipid parameters:

•	lead to earlier estimation of CVDs risk and they are current targets for prevention and treatment  management

•	Total cholesterol: the overall cholesterol level. The combination of LDL, VLDL  and  HDL.

•	High-density lipoprotein (HDL) cholesterol: with protective function, by transporting cholesterol from plasma to the liver, leading to reduced plaque formation.

•	Low-density lipoprotein (LDL) cholesterol: at high levels  promotes CVDs by enhancing inflammation and  plaque formation. Usually It is estimated by the Friedewald equation. This  equation is prone to inaccuracy at low LDL and/or high triglycerides levels.

•	Very low-density lipoprotein (VLDL) cholesterol: usually present in very low amounts. High levels in a fasting sample may be a sign of abnormal lipid metabolism.

•	Non HDL cholesterol It is  easily calculated and can provide a better risk estimation compared with LDL, in particular in raised Triglycerides.

•	Triglycerides: (TG) This is a type of lipid from the food we eat. Excess amounts of triglycerides in your blood are associated with CVDs

•	Total Cholesterol , HDL and triglycerides are routinely analysed in Medical Laboratory.

•	LDL, VLDL  and  Non HDL Cholesterol:  usually they are calculated by equations

•	Total Cholesterol/ HDL Ratio,  LDL/ HDL Ratio and Triglycerides/ HDL Radio are  calculated data included in lipid profile to evaluate CDVs risk

•	Strategies for treatment of lipid abnormalities are primarily based on LDL


# Project Goals

	Main Function: contains the "main" code of the project. Collects user inputs, performs calculations, handles errors, and displays results

	Prompts user inputs: Total Cholesterol, triglycerides and HDL

	Error Handling: The try-except block manages numerical errors such as zero division, negative numbers and non numerical type errors.

	Functions:  Six functions are performed, one for  each calculated parameter based on user inputs and equations. And they  are  accompanied by an individual unitest and executed with pytest

	Managing inaccuracy of LDL formula at high triglycerides levels

	Categorize Output Data:  a “block if- else” manages the  outputs, depending on the triglycerides level (under or over 400 mg/dl),

	Print Data in a formatted table:  facilitates medical visualization to evaluate data in relation  to  normal ranges and make clinical decisions.


#  Functions:

six functions are performed, that  calculate lipid parameters using the input data and the following equations:

•	LDL = Total Cholesterol - HDL - (Triglycerides / 5)

•	Non-HDL Cholesterol = Total Cholesterol – HDL

•	VLDL = Triglycerides / 5

•	Cholesterol Total/ HDL ratio = Total cholesterol  / HDL

•	LDL/ HDL ratio = LDL/HDL

•	Triglycerides / HDL ratio = Triglycerides/HDL


# Usage


# project.py

• Run the main program: on terminal run python project.py

• Enter the following values when prompted: Total Cholesterol (mg/dL), HDL Cholesterol (mg/dL), Triglycerides (mg/dL)

•	Categorize Output Data: to manage LDL equation inaccuracy at triglycerides high levels. This  program displays a table with 3 columns: parameters, values and normal ranges, using tabulate module,

•	Output Data for triglycerides levels over400 mg/dl: the inputs values and only the calculated parameters that do not use triglycerides level in their equation. And print warning messages:

	“Some lipid parameters can not be calculated, due to the high level of triglycerides.”
	"It is relevant to consult your physician to evaluate your health status and to perform    additional studies"


•	Output Data for triglycerides levels under 400 mg% : the input values and all the calculated parameters and a warning message:

	“The results you receive from this tool are only for informational purposes. Consult your physician to evaluate your health status"


#  requirements.txt

This file reports the required modules which not comes with Python and can be installed using the following command (via pip):

•	pip install tabulate


#  test_project.py

•  This file was created specifically for use with the pytest testing library, with the goal of automating the process of testing the six functions defined in the main project file: project.py

•  Run  on terminal:  pytest test_project.py:

•  Output:

============================================================================= test session starts ==============================================================================
platform linux -- Python 3.12.8, pytest-8.3.4, pluggy-1.5.0
rootdir: /workspaces/175588364/cs50p/project
plugins: typeguard-4.4.1
collected 6 items

test_project.py ......                                                                                                                                                   [100%]

============================================================================== 6 passed in 0.07s ===============================================================================


# References:

•	CDC Guidelines
•	Institute for Health Metrics and Evaluation
•	National Cholesterol Education Program


# Acknowledgements:

My deepest gratitude to David Malan and to the whole CS50 support team & Forums
