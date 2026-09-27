# Fake News Detection with PLMs

## Description

This project focuses on fake news detection using Natural Language Processing (NLP) and Pretrained Language Models (PLMs).

Three approaches are implemented and compared:

1. **Baseline:** TF-IDF + Logistic Regression
2. **Frozen PLM:** DistilBERT embeddings + Logistic Regression
3. **Fine-tuned PLM:** Fine-tuned DistilBERT for sequence classification

The experiments are implemented in the `fakenewsKaggle.ipynb` notebook.

## Dataset

The project uses the **WELFake** dataset available on Hugging Face:

`davanstrien/WELFake`

The dataset is loaded directly in the notebook using:

```python
from datasets import load_dataset

ds = load_dataset("davanstrien/WELFake")
```

The dataset contains 72,134 examples with the following features:

* `title`
* `text`
* `label`

The local `dataset/` directory is not required for notebook execution and is excluded from Git because the dataset file is large.

## Project Structure

```text
FakeNews/
│
├── dataset/                  # Local dataset files (not tracked by Git)
├── fakenewsKaggle.ipynb      # Main notebook
├── pyproject.toml            # Project configuration and dependencies
├── requirements.txt          # Python dependencies for pip installation
├── uv.lock                   # Locked dependency versions
├── .python-version           # Python version used by uv
├── .gitignore
├── .dockerignore
├── Dockerfile                # Docker configuration
└── README.md                 # Project documentation
```

## Requirements

* Python 3.13
* uv
* Docker (optional, for containerized execution)
* Internet connection to download the WELFake dataset and the pretrained DistilBERT model

## Installation with uv

Clone the repository:

```bash
git clone <https://github.com/halaBelmo/fakeNews.git>
cd fakeNews
```

Create the project environment and install the locked dependencies:

```bash
uv sync
```

The required Python version and dependencies are managed by `uv`.

## Installation with pip

The project also provides a `requirements.txt` file containing the main Python dependencies.

Install the dependencies using:

```bash
pip install -r requirements.txt
```

Python 3.13 is required.

## Running the Notebook

Start Jupyter using the project environment:

```bash
uv run jupyter notebook
```

Open:

```text
fakenewsKaggle.ipynb
```

If available, select the `FakeNews (uv)` kernel.

The notebook downloads the WELFake dataset automatically from Hugging Face.

## Implemented Approaches

### Approach A — TF-IDF + Logistic Regression

A classical NLP baseline based on:

* TF-IDF vectorization
* Logistic Regression
* Classification metrics
* Confusion matrix

### Approach B — Frozen DistilBERT

The pretrained model:

```text
distilbert-base-uncased
```

is used as a frozen feature extractor.

The extracted representations are then classified using Logistic Regression.

### Approach C — Fine-tuned DistilBERT

DistilBERT is fine-tuned directly for binary fake-news classification using the Hugging Face `Trainer`.

The model is:

```text
distilbert-base-uncased
```

Evaluation includes:

* Accuracy
* Precision
* Recall
* F1-score
* Confusion matrix

## Reproducibility

To reproduce the Python environment using `uv`:

```bash
uv sync
```

The `uv.lock` file records the resolved dependency versions.

The project uses Python 3.13 as specified in:

```text
.python-version
```

The main dependencies are also listed in:

```text
requirements.txt
```

The dataset and pretrained model are downloaded automatically when required.

Some machine learning operations use fixed `random_state` values where applicable.

## Docker

A Docker image can be built using:

```bash
docker build -t fakenews-plm .
```

Then run the container with:

```bash
docker run --name fakenews-plm-container -p 8888:8888 fakenews-plm
```

Jupyter Notebook will then be available through port `8888`.

## Main Files

| File                   | Description                                   |
| ---------------------- | --------------------------------------------- |
| `fakenewsKaggle.ipynb` | Main ML/NLP experiments                       |
| `pyproject.toml`       | Python project configuration and dependencies |
| `requirements.txt`     | Python dependencies for pip installation      |
| `uv.lock`              | Locked dependency versions                    |
| `.python-version`      | Python version                                |
| `Dockerfile`           | Docker environment definition                 |
| `.dockerignore`        | Files excluded from the Docker build context  |
| `README.md`            | Project documentation                         |

## Notes

The fine-tuning approach may require significant computational resources. GPU acceleration can be used when available.

The local dataset file is intentionally excluded from version control because of its size.

The WELFake dataset and the pretrained DistilBERT model are downloaded automatically when required, so an internet connection is necessary for the first execution.
