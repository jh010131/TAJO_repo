#!/bin/bash

# 로컬 디렉토리 경로
SOURCE_DIRECTORY="/home/ec2-user/environment/TAJO_repo"

# S3 버킷 이름
S3_BUCKET="tajo-source-backup"

# S3 버킷 내 경로 (버전 관리를 위해 업로드 날짜 및 시간 사용)
S3_PREFIX="$(date +"%Y-%m")/source-code-backup$(date +"%d")"

# AWS CLI를 사용하여 로컬 디렉토리를 S3로 동기화
aws s3 sync "$SOURCE_DIRECTORY" "s3://$S3_BUCKET/$S3_PREFIX"