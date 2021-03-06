# coocmat
R package for deriving a topic cooccurrence matrix from document-topic matrix

### Description
Given a document-topic matrix, the function returns a topic cooccurrence matrix (also called an adjacency matrix).

### Installation Steps
#### 1. You need to have devtools installed
```R
install.packages("devtools", dependencies = TRUE)
```

#### 2. Load devtools
```R
library(devtools)
```

#### 3. Install coocmat from this github repository and dependencies
```R
install_github("ckstash/coocmat")
install.packages("magrittr", dependencies = TRUE)
install.packages("dplyr", dependencies = TRUE)
```

### Example usage

```R
library(coocmat)
# Simulate some data (rows are documents, cols are topics)
df <- data.frame(t(matrix(c(c(1,0,0,1,0,1),
                            c(0,1,1,1,0,1),
                            c(1,0,0,0,0,0),
                            c(0,0,1,1,0,1),
                            c(1,1,1,0,0,0)),
                          ncol = 5, nrow = 6)))

# Derive topic cooccurrence matrix
cooccurrence_matrix <- get_cooccurrence_matrix(df)
print(cooccurrence_matrix)

# Duplicate values along diagonal (may come in handy for some use cases)
cooccurrence_matrix_d <- cooccurrence_matrix + t(cooccurrence_matrix)
print(cooccurrence_matrix_d)

# Get list of topics
names(cooccurrence_matrix)

# Find out how many times topic "2" cooccurred with topic "3"
print(cooccurrence_matrix["2","3"])
```
