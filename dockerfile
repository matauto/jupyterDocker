# Use an official jupyter runtime as a parent image
FROM jupyter/base-notebook

# Set the working directory to
WORKDIR /home/jovyan/work

USER root

# Install python additional libraries
RUN mamba install --yes 'numpy' 'matplotlib' 'pandas' 'ipympl' 'scipy' 'pooch' 'sympy' && \
    mamba clean --all -f -y && \
    jupyter lab clean && \
    rm -rf "/home/${NB_USER}/.cache/yarn" && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER ${NB_UID}
