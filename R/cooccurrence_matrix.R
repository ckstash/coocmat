#####
# Given a document-topic matrix (rows are documents)
# returns a topic cooccurrence matrix
#####

get_cooccurrence_matrix <- function(df) {
  #load libraries
  library(magrittr)
  library(dplyr)
  
  #get row and col indicies of non-zero elems as dataframe
  #col names are "row" and "col"
  df_nz <- as.data.frame(which(df != 0, arr.ind = T))

  #get list of sorted documents (unique row indices) and topics (unique col indices)
  rows <- sort(unique(df_nz$row))
  cols <- sort(unique(df_nz$col))

  #find cooccurring pairs (n choose 2 combinations)
  df_comb_list <- list()
  for(i in rows) {
    tryCatch(
      df_comb_list[[i]] <-
        df_nz %>%
        filter(row == i) %>%
        select(col) %>%
        t() %>% combn(2) %>% t(),
      #do nothing upon error, but NULL value will be added to df_comb_list
      error = function(e) {}
    )
  }

  #list of non-NULL combo dfs
  df_comb_list <- df_comb_list[lengths(df_comb_list) != 0]
  #single df of combos
  df_combs <- as.data.frame(do.call(rbind, df_comb_list))

  #initialize coocurrence matrix
  cooccurrence_matrix <- data.frame(matrix(0, ncol = length(cols), nrow = length(cols)))
  rownames(cooccurrence_matrix) <- cols
  colnames(cooccurrence_matrix) <- cols

  #fill matrix
  for (i in seq(nrow(df_combs))) {
    rn <- toString(df_combs[i, 1]) #row name
    cn <- toString(df_combs[i, 2]) #col name
    cooccurrence_matrix[rn, cn] <- cooccurrence_matrix[rn, cn] + 1
  }

  return(cooccurrence_matrix)
}
