#!/bin/bash

# Script to backup and restore conda environments across operating systems with full channel and pip package inclusion

# Check script usage
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 backup|restore"
    exit 1
fi

action=$1
env_dir="conda_envs"

# Backup all conda environments
backup_envs() {
    mkdir -p "$env_dir"
    for env in $(conda env list | grep -v "^#" | awk '{print $1}'); do
        if [ "$env" != "base" ]; then
            echo "Backing up environment: $env"
            # Export the environment with explicit specs for channels and pip packages
            conda env export -n $env --no-builds > "$env_dir/conda-env-$env.yaml"
        else
            echo "Skipping base environment"
        fi
    done
    echo "All environments have been backed up successfully."
}

# Restore environments from backup files
restore_envs() {
    for file in $env_dir/conda-env-*.yaml; do
        env_name=$(basename $file .yaml | sed 's/conda-env-//')
        echo "Restoring environment: $env_name from $file"
        if conda env list | grep -q "$env_name"; then
            echo "Environment $env_name already exists. Updating..."
            conda env update -f $file -n $env_name
        else
            conda env create -f $file
            # Explicitly install pip packages after creating the environment
            source activate $env_name
            cat $file | awk '/^- pip:/,/^  - /' | grep '^- ' | sed 's/^- //' | xargs -n 1 pip install
            source deactivate
        fi
    done
    echo "All environments have been restored successfully."
}

# Execute the requested action
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

