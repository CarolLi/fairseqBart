# BART: Denoising Sequence-to-Sequence Pre-training for Natural Language Generation, Translation, and Comprehension

[https://arxiv.org/abs/1910.13461](https://arxiv.org/abs/1910.13461)

## Introduction

BART is sequence-to-sequence model trained with denoising as pretraining objective. We show that this pretraining objective is more generic and show that we can match [RoBERTa](../roberta) results on SQuAD and GLUE and gain state-of-the-art results on summarization (XSum, CNN dataset), long form generative question answering (ELI5) and dialog response genration (ConvAI2). See the associated paper for more details.

## Download
### Pre-trained models

Model | Description | # params | Download
---|---|---|---
`bart.large.cnn` | `bart.large` finetuned on `CNN-DM` | 400M | [bart.large.cnn.tar.gz](https://dl.fbaipublicfiles.com/fairseq/models/bart.large.cnn.tar.gz)

### CNNDM dataset

```wget https://s3.amazonaws.com/datasets.huggingface.co/summarization/cnn_dm_v2.tgz```


## Installation
### StandfordNLP
- Download and unzip [CoreNLP 4.2.0](https://nlp.stanford.edu/software/stanford-corenlp-latest.zip)
- Download model jar [English 4.2.0](https://nlp.stanford.edu/software/stanford-corenlp-4.2.0-models-english.jar)
- Move the jar to the distribution directory. 
    ```mv /path/to/stanford-corenlp-4.2.0-models-french.jar /path/to/stanford-corenlp-4.2.0```
- Include the distribution directory in your CLASSPATH. 
    ```export CLASSPATH=$CLASSPATH:/path/to/stanford-corenlp-4.2.0/*:```

### files2rouge
For calculating rouge, install `files2rouge` from [here](https://github.com/pltrdy/files2rouge).
Make sure to use pltrdy/pyrouge, if not, some errors will occur.
Or if you are using bheinzerling/pyrouge, you can comment out the second and third parameters in **files2rouge.py** before setting up.


## Implementation
### Summarize
In `fairseq`, summaries can be generated using:

```bash
python summarize.py \
  --model-dir bart.large.cnn.tar.gz \
  --model-file model.pt \
  --src cnn_cln/test.source \
  --out cnn_cln/test.hypo
```
### Evaluate
```sh evaluate.sh```
