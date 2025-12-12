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

corpus <- Corpus(VectorSource(feedback)) 

corpus <- tm_map(corpus, content_transformer(tolower)) #Converts all text to lowercase.
corpus <- tm_map(corpus, removeNumbers) #Removes all numbers.
corpus <- tm_map(corpus, content_transformer(function(x) gsub("[^a-z ]", " ", x))) #Removes everything except alphabet letters and spaces.
corpus <- tm_map(corpus, removeWords, stopwords("english")) #Removes common English stopwords (e.g., the, is, and, to).
corpus <- tm_map(corpus, stripWhitespace) #Removes unnecessary extra spaces.
corpus <- tm_map(corpus, stemDocument) #word stemming (e.g., running → run, playing → play).


# PART 2-WORD FREQUENCY ANALYSIS
tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)

# Sort by highest frequency
word_freqs <- sort(rowSums(m), decreasing = TRUE)
df <- data.frame(word = names(word_freqs), freq = word_freqs)

# Display top 10 words
print("Top 10 Most Frequent Words Used:")
print(df[1:10,], row.names = FALSE)

# OUTPUT ANALYSIS: 
#  The most frequent words highlight major concerns and experiences of citizens 
#  interacting with government offices. Terms related to service speed, staff 
#  behavior, and processing delays appear prominently, indicating the common 
#  feedback themes. Frequent mention of "document", "process" and "office" 
#  suggests that administrative workflow is a recurring issue among respondents.

# Part 3–WORD CLOUD GENERATION
png("wordcloud_exam.png", width = 800, height = 600)

set.seed(1223)

wordcloud(
  words = df$word,        
  freq = df$freq,      
  min.freq = 2,
  max.words = 1000, 
  colors = brewer.pal(8, "Dark2"),
  random.order = FALSE
)
dev.off()


# PART 4-ADVANCED TASK
rare_words_freq1 <- subset(df, freq == 1)

print("5 Least Frequent Words Used:")
rare_words5 <- head(rare_words_freq1, 5) 
print(rare_words5, row.names = FALSE)

png("wordcloud_rare.png", width = 800, height = 600)

set.seed(2113)

wordcloud(
  words = rare_words5$word,
  freq = rare_words5$freq,
  min.freq = 1, 
  max.words = 5, 
  colors = brewer.pal(8, "Dark2"),
  random.order = FALSE
)
dev.off()





