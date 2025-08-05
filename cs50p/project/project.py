
from tabulate import tabulate

def main():
    # Manage errors to avoid stopping the script due to invalid inputs
    while True:
        try:
            # Get Lipids Inputs from user
            total_cholesterol = float(input("Enter total cholesterol level in mg/dL: "))
            triglycerides = float(input("Enter triglycerides level (mg/dL): "))
            hdl = float(input("Enter HDL level (mg/dL): "))

            # Manage inputs errors and ask again if inputs are negative or zero
            if total_cholesterol <= 0 or triglycerides <= 0 or hdl <= 0:
                # Print error message
                print("\nPlease enter valid positive numbers")
                # Continue the loop to ask again for the three inputs
                continue
0
            # If inputs are correct, then break the loop
            break

        # Manage non-numeric inputs errors
        except ValueError:
            print("\nPlease enter a valid positive number")

    # Once inputs are correct, call functions to proceed with calculations
    # Calculated value VLDL Cholesterol
    vldl = calc_vldl(triglycerides)

    # Calculated value LDL Cholesterol
    ldl = calc_ldl(total_cholesterol, hdl, triglycerides)

    # Calculated value Non HDL Cholesterol#
    non_hdl_cholesterol = calc_non_hdl(total_cholesterol, hdl)


    # Calculated value Cholesterol/HDL Ratio
    cholesterol_hdl_ratio = calc_cholesterol_hdl_ratio(total_cholesterol, hdl)

    # Calculated value LDL/HDL Ratio
    ldl_hdl_ratio = calc_ldl_hdl_ratio(ldl, hdl)

    # Calculated Value Triglycerides/HDL Ratio
    triglycerides_hdl_ratio = calc_triglycerides_hdl_ratio(triglycerides, hdl)


    # Manage errors due to LDL formula inaccuracy and Print tabulated data
    # Print all Data in a table format for "Triglycerides under 400 mg/dl"

    if triglycerides < 400:
        # Display a Table
        parameters_table = [
            ["Total Cholesterol", total_cholesterol, "Normal range: <200 mg/dL"],
            ["Triglycerides", triglycerides, "Normal range: <150 mg/dL"],
            ["HDL", hdl, "Normal range: >40 mg/dL"],
            ["Calculated Parameters"],
            ["LDL", ldl, "Normal range: <100 mg/dL"],
            ["Non-HDL Cholesterol", non_hdl_cholesterol, "Normal range: <130 mg/dL"],
            ["VLDL", vldl, "Normal range: 5-40 mg/dL"],
            ["Cholesterol/HDL Ratio", cholesterol_hdl_ratio, "Desirable: <5.0"],
            ["LDL/HDL Ratio", ldl_hdl_ratio, "Desirable: <5.0"],
            ["Triglycerides/HDL Ratio", triglycerides_hdl_ratio, "Desirable: <5.0"]
        ]

        # Print Tabulated Data for Triglycerides under 400 mg/dl
        print("\nParameters and Normal Ranges:")
        print(tabulate(parameters_table, headers=["Parameter", "Value mg/dl", "Normal Range"], tablefmt="grid"))

        # Print a warning message to consult a physician to evaluate health status
        print("\nThe results you receive from this tool are only for informational purposes")
        print("\nConsult your physician to evaluate your health status")


    # Print Data for "Triglycerides over 400 mg/dl"
    # Can not be printed the data that use triglycerides in the formula.

    else:
        parameters_table_error = [
            ["Total Cholesterol", total_cholesterol, "Normal range: <200 mg/dL"],
            ["Triglycerides", triglycerides, "Normal range: <150 mg/dL"],
            ["HDL", hdl, "Normal range: >40 mg/dL"],
            ["Calculated Parameters"],
            ["Non-HDL Cholesterol", non_hdl_cholesterol, "Normal range: <130 mg/dL"],
            ["Cholesterol/HDL Ratio", cholesterol_hdl_ratio, "Desirable: <5.0"],
        ]


        # Print a warning message due to high level of Tryglicerides
        print("\nSome Parameters can not be calculated due to High Level of Triglycerides (over 400 mg/dl)")

        # Print Data in a table format
        print("\nParameters and Normal Ranges:")
        print(tabulate(parameters_table_error, headers=["Parameter", "Value mg/dl", "Normal Range"], tablefmt="grid"))

        # Print a warning message  to consult a physician to evaluate health status
        print("\nIt is relevant to consult your physician to evaluate your health status")



# Functions for Parameters Calculations
# Calculate VLDL Cholesterol
def calc_vldl(triglycerides):
    vldl = triglycerides / 5
    return  round(vldl, 1)


# Calculate VLDL Cholesterol
def calc_vldl(triglycerides):
    vldl = triglycerides / 5
    return  round(vldl, 1)


# Calculate LDL (based on Friedewald Formula)
def calc_ldl(total_cholesterol, hdl, triglycerides):
    ldl = total_cholesterol - hdl - (triglycerides / 5)
    return ldl


# Calculate Non HDL Cholesterol
def calc_non_hdl(total_cholesterol, hdl):
    non_hdl_cholesterol = total_cholesterol - hdl
    return non_hdl_cholesterol



# Calculate Cholesterol/HDL Ratio
def calc_cholesterol_hdl_ratio(total_cholesterol, hdl):
    ratio = total_cholesterol / hdl
    return round(ratio, 1)

# Calculate LDL/HDL Ratio
def calc_ldl_hdl_ratio(ldl, hdl):
    ratio = ldl / hdl
    return round(ratio, 1)

# Calculate Triglycerides/HDL Ratio
def calc_triglycerides_hdl_ratio(triglycerides, hdl):
    ratio = triglycerides / hdl
    return round(ratio, 1)


if __name__ == "__main__":
    main()


