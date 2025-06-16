mtx <- read.csv("QBS103_GSE157103_series_matrix.csv", header = TRUE)
genes <- read.csv("QBS103_GSE157103_genes.csv", header = TRUE)
print(head(mtx))
print(head(genes))
genes <- data.frame(genes)
df <- merge(genes, mtx, by = 'row.names', all = TRUE)
rownames(df) <- df$Row.names
df_sub <- df[c("A1BG","age","sex","icu_status",)]