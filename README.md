<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">

<h2 align="center">Chemical Reaction Outcome Prediction</h2>

  <p align="center">
    Graph to Sequence Approach
    <br />
    <a href="#about-the-project"><strong>Explore the docs »</strong></a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#setting-up-the-conda-environment">Setting up the conda environment</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#preparing-the-dataset-for-training">Preparing the dataset</a></li>
        <li><a href="#training-the-model">Training the classification model</a></li>
      </ul>
    </li>
    <li><a href="#project-organization">Project Organization</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

This is a DL based approach for predicting chemical reaction outcome as part of my IITM MTech thesis. A Graph to Sequence encoder-decoder based approach is used where the encoder is a D-MPNN followed by transformer encoder and decoder is a Transformer based autoregressive Decoder. The input to the model is the molecular graph of the molecule and output is a SMILES string. The implementation is derived from the official implementation of the paper - ["Permutation invariant graph-to-sequence model for template-free retrosynthesis and reaction prediction" by [Tu and Coley (2022)]](https://github.com/coleygroup/Graph2SMILES).

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

- [Pytorch](https://pytorch.org//)
- [RDKit-Python](https://www.rdkit.org/docs/GettingStartedInPython.html)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started
The instructions that follow are confirmed to be working on an Ubuntu system. 

### Setting up the conda environment

1. Create a new Anaconda environment using requirements file
   ```sh
   conda create --name <env> --file <requirements file>
   ```
2. Activate the conda environment
   ```sh
   conda activate envname
   ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

### Preparing the dataset for training

1. Downloading raw (clean and tokenized) data
    ```sh
    python scripts/download_raw_data.py --data_name=USPTO_50k
    python scripts/download_raw_data.py --data_name=USPTO_480k
    ```
2. Modify DATASET: one of [USPTO_50k, USPTO_480k] in scripts/preprocess.sh

3. Running preprocessing script, 
   ```sh
   sh scripts/preprocess.sh
   ```

### Training the model:

1.  Prerequisite: <a href="#preparing-the-dataset-for-training">Preparing the dataset for training</a>

2. Modify DATASET: one of [USPTO_50k, USPTO_480k] in scripts/train_g2s.sh

3.  From the root directory, run
    ```sh
    sh scripts/train_g2s.py
    ```
    
<p align="right">(<a href="#top">back to top</a>)</p>

<!-- FOLDER STRUCTURE -->

## Project Organization
------------

    ├── LICENSE
    ├── README.md                 <- The top-level README for developers using this project.
    ├── .gitignore                <- Git-ignore file. 
    |
    ├── kube_files                <- Contains files for running Kubernetes jobs
    │   ├── job.yaml              <- YAML file for creating and running a job
    │   ├── run.sh                <- The shell file that gets run in the job
    |
    ├── data
    │   ├── USPTO_50k             <- MIT USPTO dataset with 50k reactions
    │   ├── USPTO_480k            <- MIT USPTO dataset with 480k reactions
    |
    ├── requirements.txt          <- The requirements file
    │
    ├── scripts                      <- Scripts used in this project.
    │   ├── download_raw_data.py     <- Download raw data
    |   ├── predict.sh               <- Script to generate predictions
    |   ├── preprocess.sh            <- Script for preprocessing the data
    |   ├── train_g2s.sh             <- Script to train the model
    |   ├── validate.sh              <- Script to validate the model
    |
    ├── train.py                    <- Python file to train the model
    ├── preprocess.py               <- Python file to preprocess the data    
    ├── validate.py                 <- Python file to validate the model        
    ├── predict.py                  <- Python file to generate predictions

--------

<p align="right">(<a href="#top">back to top</a>)</p>

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>