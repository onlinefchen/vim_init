#!/bin/bash

# 检查输入参数是否正确
if [ $# -ne 1 ]; then
    echo "Usage: $0 <backup|restore>"
    exit 1
fi

# 处理备份逻辑
if [ "$1" == "backup" ]; then
    echo "Backing up conda environments..."
    # 创建备份目录
    backup_dir="conda_backup_$(date +"%Y%m%d_%H%M%S")"
    mkdir "$backup_dir"

    # 遍历所有conda环境并导出到yaml文件
    for env_name in $(conda env list | grep -v '#' | awk '{print $1}'); do
        conda env export -n "$env_name" > "$backup_dir/conda-env-$env_name.yaml"
    done

    echo "Backup completed. Check $backup_dir for backup files."

# 处理恢复逻辑
elif [ "$1" == "restore" ]; then
    echo "Restoring conda environments..."
    # 遍历当前目录下的yaml文件
    for yaml_file in $(ls conda-env-*.yaml); do
        # 提取环境名称
        env_name=$(echo "$yaml_file" | sed 's/^conda-env-\(.*\)\.yaml$/\1/')

        # 创建conda环境并安装组件
        conda env create -n "$env_name" -f "$yaml_file"
    done

    echo "Restore completed."

else
    echo "Invalid option. Usage: $0 <backup|restore>"
    exit 1
fi

