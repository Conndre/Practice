import csv
import sys

from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

TEST_SIZE = 0.4


def main():

    # Check command-line arguments
    if len(sys.argv) != 2:
        sys.exit("Usage: python shopping.py data")

    # Load data from spreadsheet and split into train and test sets
    evidence, labels = load_data(sys.argv[1])
    X_train, X_test, y_train, y_test = train_test_split(
        evidence, labels, test_size=TEST_SIZE
    )

    # Train model and make predictions
    model = train_model(X_train, y_train)
    predictions = model.predict(X_test)
    sensitivity, specificity = evaluate(y_test, predictions)

    # Print results
    print(f"Correct: {(y_test == predictions).sum()}")
    print(f"Incorrect: {(y_test != predictions).sum()}")
    print(f"True Positive Rate: {100 * sensitivity:.2f}%")
    print(f"True Negative Rate: {100 * specificity:.2f}%")


def load_data(filename):
    """
    Load shopping data from a CSV file `filename` and convert into a list of
    evidence lists and a list of labels. Return a tuple (evidence, labels).

    evidence should be a list of lists, where each list contains the
    following values, in order:
        - Administrative, an integer
        - Administrative_Duration, a floating point number
        - Informational, an integer
        - Informational_Duration, a floating point number
        - ProductRelated, an integer
        - ProductRelated_Duration, a floating point number
        - BounceRates, a floating point number
        - ExitRates, a floating point number
        - PageValues, a floating point number
        - SpecialDay, a floating point number
        - Month, an index from 0 (January) to 11 (December)
        - OperatingSystems, an integer
        - Browser, an integer
        - Region, an integer
        - TrafficType, an integer
        - VisitorType, an integer 0 (not returning) or 1 (returning)
        - Weekend, an integer 0 (if false) or 1 (if true)

    labels should be the corresponding list of labels, where each label
    is 1 if Revenue is true, and 0 otherwise.
    """
    evidence = []
    labels = []
    # Add an index for each month (e.g.: "Jan" equal to 0)
    months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    with open(filename, 'r') as file:
        reader = csv.reader(file)
        # Skip header row
        next(reader)

        # Loop over each row of data
        for row in reader:
            evidence.append([
                int(row[0]),
                float(row[1]),
                int(row[2]),
                float(row[3]),
                int(row[4]),
                float(row[5]),
                float(row[6]),
                float(row[7]),
                float(row[8]),
                float(row[9]),
                months.index(row[10]),
                int(row[11]),
                int(row[12]),
                int(row[13]),
                int(row[14]),
                1 if (row[15]) == "Returning_Visitor" else 0,
                1 if (row[16]) == 'True' else 0
            ])
            labels.append(1 if row[17] == "TRUE" else 0)

    return (evidence, labels)


def train_model(evidence, labels):
    """
    Given a list of evidence lists and a list of labels, return a
    fitted k-nearest neighbor model (k=1) trained on the data.
    """
    near_neigh_model = KNeighborsClassifier(n_neighbors=1)
    near_neigh_model.fit(evidence, labels)
    # Return a fitted k-nearest neighbor model (k=1) trained on the data.
    return near_neigh_model


def evaluate(labels, predictions):
    """
    Given a list of actual labels and a list of predicted labels,
    return a tuple (sensitivity, specificity).

    Assume each label is either a 1 (positive) or 0 (negative).

    `sensitivity` should be a floating-point value from 0 to 1
    representing the "true positive rate": the proportion of
    actual positive labels that were accurately identified.

    `specificity` should be a floating-point value from 0 to 1
    representing the "true negative rate": the proportion of
    actual negative labels that were accurately identified.
    """
    # Initialise variables to calculate proportions
    num_positive = 0
    num_negative = 0
    positive_id = 0
    negative_id = 0

    # Loop through actual and predicted values 
    for actual, predicted in zip(labels, predictions):
        #  Check if predicted label is positive, add to variables
        if actual == 1:
            num_positive += 1
            if predicted == actual:
                positive_id += 1
        else:
            # If predicted label is negative, add to variables
            num_negative += 1
            if predicted == actual:
                negative_id += 1

    # Return sensitivity (true positive rate)
    sensitivity = positive_id / num_positive
    # Return specificity (true negative rate)
    specificity = negative_id / num_negative

    return (sensitivity, specificity)


if __name__ == "__main__":
    main()
