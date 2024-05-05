#!/bin/bash

# Script to backup and restore conda environments

# Check for the correct usage of the script
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 backup|restore"
    exit 1
fi

action=$1
env_dir="conda_envs"

# Function to backup all conda environments
backup_envs() {
    mkdir -p "$env_dir"
    for env in $(conda env list | grep -v "^#" | awk '{print $1}'); do
        if [ "$env" != "base" ]; then
            echo "Backing up environment: $env"
            conda env export -n $env --from-history --no-builds > "$env_dir/conda-env-$env.yaml"
        else
            echo "Skipping base environment"
        fi
    done
    echo "All environments backed up successfully."
}

# Function to restore environments from backup
restore_envs() {
    for file in $env_dir/conda-env-*.yaml; do
        env_name=$(basename $file .yaml | sed 's/conda-env-//')
        echo "Restoring environment: $env_name from $file"
        if conda env list | grep -q "$env_name"; then
            echo "Environment $env_name already exists. Updating..."
            conda env update -f $file -n $env_name
        else
            conda env create -f $file
        fi
    done
    echo "All environments restored successfully."
}

# Execute the backup or restore action
case $action in
    backup)
        backup_envs
        ;;
    restore)
        restore_envs
        ;;
    *)
        echo "Invalid action: $action"
        echo "Usage: $0 backup|restore"
        exit 2
        ;;
esac

