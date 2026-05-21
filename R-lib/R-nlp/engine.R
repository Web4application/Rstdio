# ==========================================
# R NLP ENGINE
# Natural Language Processing with R
# ==========================================

# Install required packages
packages <- c(
  "tm",
  "tidytext",
  "stringr",
  "tokenizers",
  "SnowballC",
  "text2vec",
  "reticulate"
)

install_if_missing <- function(pkg) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

invisible(lapply(packages, install_if_missing))

# ==========================================
# SAMPLE TEXT
# ==========================================

text <- c(
  "Web4 AI is transforming blockchain and automation.",
  "Natural language processing enables intelligent systems.",
  "R and Python can work together for advanced AI."
)

cat("\n=== ORIGINAL TEXT ===\n")
print(text)

# ==========================================
# LOWERCASE
# ==========================================

clean_text <- tolower(text)

cat("\n=== LOWERCASE ===\n")
print(clean_text)

# ==========================================
# REMOVE PUNCTUATION
# ==========================================

clean_text <- stringr::str_replace_all(
  clean_text,
  "[[:punct:]]",
  ""
)

cat("\n=== CLEAN TEXT ===\n")
print(clean_text)

# ==========================================
# TOKENIZATION
# ==========================================

tokens <- tokenizers::tokenize_words(clean_text)

cat("\n=== TOKENS ===\n")
print(tokens)

# ==========================================
# STEMMING
# ==========================================

stemmed <- lapply(tokens, SnowballC::wordStem)

cat("\n=== STEMMED TOKENS ===\n")
print(stemmed)

# ==========================================
# DOCUMENT TERM MATRIX
# ==========================================

corpus <- tm::VCorpus(
  tm::VectorSource(clean_text)
)

dtm <- tm::DocumentTermMatrix(corpus)

cat("\n=== DOCUMENT TERM MATRIX ===\n")
print(as.matrix(dtm))

# ==========================================
# TF-IDF
# ==========================================

tfidf <- weightTfIdf(dtm)

cat("\n=== TF-IDF MATRIX ===\n")
print(as.matrix(tfidf))

# ==========================================
# WORD EMBEDDINGS (TEXT2VEC)
# ==========================================

it <- itoken(
  clean_text,
  tokenizer = word_tokenizer,
  progressbar = FALSE
)

vocab <- create_vocabulary(it)

vectorizer <- vocab_vectorizer(vocab)

tcm <- create_tcm(
  it,
  vectorizer,
  skip_grams_window = 5
)

glove <- GlobalVectors$new(
  rank = 10,
  x_max = 10
)

wv_main <- glove$fit_transform(
  tcm,
  n_iter = 10
)

cat("\n=== WORD VECTORS ===\n")
print(dim(wv_main))

# ==========================================
# OPTIONAL PYTHON NLP BRIDGE
# ==========================================

library(reticulate)

# Optional:
# py_install(c("transformers", "torch"))

cat("\n=== PYTHON NLP BRIDGE READY ===\n")

# ==========================================
# BASIC SENTIMENT EXAMPLE
# ==========================================

positive_words <- c(
  "intelligent",
  "advanced",
  "transforming"
)

negative_words <- c(
  "error",
  "failure",
  "broken"
)

sentiment_score <- function(sentence) {

  words <- unlist(
    tokenizers::tokenize_words(
      tolower(sentence)
    )
  )

  pos <- sum(words %in% positive_words)
  neg <- sum(words %in% negative_words)

  return(pos - neg)
}

scores <- sapply(text, sentiment_score)

cat("\n=== SENTIMENT SCORES ===\n")
print(scores)

# ==========================================
# FINISHED
# ==========================================

cat("\nR NLP engine initialized successfully.\n")
