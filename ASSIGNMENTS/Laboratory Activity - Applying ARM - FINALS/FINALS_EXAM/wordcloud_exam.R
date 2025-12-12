setwd("C:/Users/VICTUS/Documents/wordcloud")

# install required package
# install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer"))

# PART 1-DATA PREPARATION
library(tm) 
library(SnowballC) 
library(wordcloud) 
library(RColorBrewer)

feedback <- readLines("feedback.txt",encoding = "UTF-8", warn = FALSE)
feedback <- paste(feedback, collapse = " ")

corpus <- VCorpus(VectorSource(feedback))

corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, content_transformer(function(x) gsub("[^a-z ]", " ", x)))
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)               
corpus <- tm_map(corpus, stemDocument)    


# PART 2-WORD FREQUENCY ANALYSIS
tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)

# Sort by highest frequency
word_freqs <- sort(rowSums(m), decreasing = TRUE)
df <- data.frame(word = names(word_freqs), freq = word_freqs)

# Display top 10 words
print("Top 10 Most Frequent Words:")
print(df[1:10,], row.names = FALSE)


# Part 3–WORD CLOUD GENERATION
png("wordcloud_exam.png", width = 800, height = 600)

set.seed(1223)

wordcloud(
  words = freq_df$word,
  freq = freq_df$frequency,
  min.freq = 2,
  max.words = 1000, 
  colors = brewer.pal(8, "Dark2"),
  random.order = FALSE
)
dev.off()


# PART 4-ADVANCED TASK
rare_words_freq1 <- subset(freq_df, frequency == 1)

print("5 Least Frequent Words:")
rare_words5 <- head(rare_words_freq1, 1000)

print(rare_words5, row.names = FALSE)

# Save the rare word cloud as wordcloud_rare.png
png("wordcloud_rare.png", width = 800, height = 600)

set.seed(2113)

wordcloud(
  words = rare_words5$word,
  freq = rare_words5$frequency,
  min.freq = 1,               
  max.words = 5,               
  colors = brewer.pal(8, "Dark2"),
  random.order = FALSE
)
dev.off()







