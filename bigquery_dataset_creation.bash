# Code to create a BigQuery dataset if it does not exist
%%bash

# Get project name
export PROJECT=$(gcloud config list project --format "value(core.project)")
echo "GCP Project name is: "$PROJECT

#Variables
# DATASETNAME=dataset_test
# DESCRIPTION="Right your description here"

# Variable with code to check if a dataset already exists
dataset_check = $(bq ls -d | grep -w dataset_test)

# Checking if the data exist or not with if statement
if [-n "$dataset_check"]; then
    echo -e "BigQuery dataset exists!. Skip creation step."
else
    echo "BigQuery dataset does not exist. Creating a dataset called: "$DATASETNAME
    bq --location=US mk --dataset --description=DESCRIPTION $PROJECT:$DATASETNAME

echo "Bellow are your current datasets:"
bq ls
fi
