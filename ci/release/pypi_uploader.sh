#!/bin/bash
#
# Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.
#

set -e

# Skip upload if CI is executed locally
if [[ ${RUNNING_CI_LOCALLY} = true  ]]; then
    echo "Skipping PyPi upload - running ci locally"
    return 0
fi

# Skip upload if current branch is not master or starts with "dev-"
if [ "${COMMIT_HASH}" != "master" ] && [[ ! "${COMMIT_HASH}" =~ ^dev-.+ ]]; then
    echo "Skipping PyPI upload - not master or development branch"
    return 0
fi

for f in "${WORKSPACE}"/pyclaragenomics/pyclaragenomics_wheel/*.whl; do
    if [ ! -e "${f}" ]; then
        echo "pyclaragenomics Whl file does not exist"
        exit 1
    else
        conda install -c conda-forge twine
        python3 -m pip install 'readme-renderer>=21.0' # to support py3.5 images
        # Change .whl package name to support PyPI upload
        MODIFIED_WHL_NAME=$(dirname ${f})/$(basename "${f}" | sed -r "s/(.*-.+-.+)-.+-.+.whl/\1-none-any.whl/")
        mv "${f}" "${MODIFIED_WHL_NAME}"
        echo "File name ${f} was changed into ${MODIFIED_WHL_NAME}"
        # Perform Upload
        python3 -m twine upload --skip-existing --repository-url https://test.pypi.org/legacy/ "${WORKSPACE}"/pyclaragenomics/pyclaragenomics_wheel/*
    fi
done
