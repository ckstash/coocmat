# coocmat
R package for deriving a topic cooccurrence matrix from document-topic matrix

### Description
Given a document-topic matrix, the function returns a topic cooccurrence matrix (also called an adjacency matrix).

### Installation Steps
#### 1. You need to have devtools installed
install.packages("devtools")

#### 2. Load devtools
library(devtools)

#### 3. Install coocmat from this github repository
install_github("ckstash/coocmat")

### Example usage

```R
library(coocmat)
#simulate some data (rows are documents, cols are topics)
df <- data.frame(t(matrix(c(c(1,0,0,1,0,1),
                            c(0,1,1,1,0,1),
                            c(1,0,0,0,0,0),
                            c(0,0,1,1,0,1),
                            c(1,1,1,0,0,0)),
                          ncol = 5, nrow = 6)))

#derive topic cooccurrence matrix
cooccurrence_matrix <- get_cooccurrence_matrix(df)

#get list of topics
names(cooccurrence_matrix)

#print how many times topic "2" cooccurred with topic "3"
print(cooccurrence_matrix["2","3"])
```
