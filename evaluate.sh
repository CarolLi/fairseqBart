# Tokenize hypothesis and target files.
cat cnn_cln/test.hypo | java edu.stanford.nlp.process.PTBTokenizer -ioFileList -preserveLines > cnn_cln/test.hypo.tokenized
cat cnn_cln/test.target | java edu.stanford.nlp.process.PTBTokenizer -ioFileList -preserveLines > cnn_cln/test.hypo.target
files2rouge cnn_cln/test.hypo.tokenized cnn_cln/test.hypo.target
