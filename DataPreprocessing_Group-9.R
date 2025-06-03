install.packages("rvest")
install.packages("stringr")
install.packages("readr")
install.packages("lubridate")
install.packages(c("tm", "SnowballC", "textclean"))

library(rvest)
library(stringr)
library(readr)
library(dplyr)
library(lubridate)
library(httr)
library(tidyverse)
library(tm)
library(SnowballC)
library(textclean)



url <- "https://animexnews.com/mrbeasts-involved-in-serious-allegations/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
timestamp <- html_nodes(webpage, "span, div") %>% html_text(trim = TRUE)
date <- str_extract(timestamp, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
if (!is.na(date)) {
  date <- as.Date(date, format = "%B %d, %Y")
  date <- format(date, "%d %B %Y")
}

print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article5.csv")





url <- "https://old.reddit.com/r/CancelCulture/comments/1ct60ez/my_cancel_story/"
webpage <- read_html(url)
heading <- html_node(webpage, "a.title")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_node(webpage, "time") %>% html_text(trim = TRUE)
print(date) 
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article6.csv")





url <- "https://old.reddit.com/r/CancelCulture/comments/1b7g03d/trader_joes_lost_at_sea_cancelled_and_banned/"
webpage <- read_html(url)
heading <- html_node(webpage, "a.title")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_node(webpage, "time") %>% html_text(trim = TRUE)
print(date) 
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article7.csv")









url <- "https://www.vice.com/en/article/cancel-culture-meaning/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
timestamp <- html_node(webpage, "time") %>% html_text(trim = TRUE)
print(timestamp)
date <- str_extract(timestamp, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
print(date) 
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article8.csv")







url <- "https://medium.com/@saffron.thewriter/percy-hynes-white-and-the-danger-of-cancel-culture-part-1-explainer-1a29270fd47d"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article9.csv")





url <- "https://medium.com/@reverieofthedead/cancel-culture-as-a-byproduct-of-misused-words-and-manufactured-wrongs-647198f6e86c"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_texts <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
relative_date <- str_extract(date_texts, "\\d+ days ago")
relative_date <- relative_date[!is.na(relative_date)][1]
print(relative_date)
if (!is.na(relative_date)) {
  days <- as.numeric(str_extract(relative_date, "\\d+"))
  date <- Sys.Date() - days
  date <- format(date, "%d %B %Y")  
} else {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article10.csv")








url <- "https://medium.com/@mawovan/against-sectarianism-slander-and-cancel-culture-in-the-palestine-solidarity-movement-8b2cf4b21e46"
webpage <- read_html(url)
title <- "Against Sectarianism, Slander and Cancel Culture in the Palestine Solidarity Movement!"
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article11.csv")






url <- "https://medium.com/@adhvik19m/cancel-culture-0ca154e3aafa"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_texts <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
relative_date <- str_extract(date_texts, "\\d+ days ago")
relative_date <- relative_date[!is.na(relative_date)][1]
print(relative_date)
if (!is.na(relative_date)) {
  days <- as.numeric(str_extract(relative_date, "\\d+"))
  date <- Sys.Date() - days
  date <- format(date, "%d %B %Y")  
} else {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article12.csv")




url <- "https://medium.com/trill-mag/the-inevitability-of-cancel-culture-f2b81aef3007"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article13.csv")






url <- "https://medium.com/@sandra.pragana/the-cancel-culture-debate-accountability-or-censorship-f2e2b0ab72c3"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article14.csv")




url <- "https://medium.com/@brandencollinsworth/why-we-need-to-cancel-cancel-culture-c38011d1c7ec"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article15.csv")




url <- "https://medium.com/@californiayouthstemproject/cancel-culture-the-psychology-behind-the-storm-2c3b1f974245"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article16.csv")






url <- "https://medium.com/@zitalucacsatho/the-dark-side-of-cancel-culture-a-modern-witch-hunt-1a01e908b7ad"
webpage <- read_html(url)
heading <- html_node(webpage, "#29db")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article17.csv")





url <- "https://medium.com/illumination/how-cancel-culture-can-change-society-for-the-better-a06df3bdc398"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- gsub("[^\x20-\x7E]", "", title)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_node <- html_nodes(webpage, "span") %>% html_text(trim = TRUE)
date <- str_extract(date_node, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1] 
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article18.csv")





url <- "https://www.pewresearch.org/internet/2021/05/19/americans-and-cancel-culture-where-some-see-calls-for-accountability-others-see-censorship-punishment/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")  
print(substr(main_text, 1, 300))

date <- html_node(webpage, "time") %>% html_text(trim = TRUE)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article19.csv")




url <- "https://www.ucf.edu/pegasus/is-cancel-culture-effective/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
print(title)

paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
print(substr(main_text, 1, 300))

date <- "October 23, 2020"
print(date)

data <- data.frame(url = url, date = date, title = title, main_text = main_text, stringsAsFactors = FALSE)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article20.csv")




url <- "https://www.depts.ttu.edu/rise/Blog/cancelculture.php"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
print(substr(main_text, 1, 300))
h4_block <- html_node(webpage, "h4") %>% html_text(trim = TRUE)
print(h4_block)
date_pattern <- "[A-Z][a-z]+\\s\\d{1,2}(st|nd|rd|th)?,?\\s\\d{4}"
date <- str_extract(h4_block, date_pattern)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article21.csv")


url <- "https://therapygroupdc.com/therapist-dc-blog/the-psychology-of-cancel-culture-impacts-on-mental-health/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
print(title)

paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
print(substr(main_text, 1, 300))

date <- html_node(webpage, ".blogPost__author-date") %>% html_text(trim = TRUE)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(url = url, date = date, title = title, main_text = main_text, stringsAsFactors = FALSE)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article22.csv")


url <- "https://www.aei.org/articles/the-dangerous-evolution-of-cancel-culture/"
webpage <- read_html(url)
heading <- html_node(webpage, ".entry-title")
title <- html_text(heading)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
print(substr(main_text, 1, 300))

date <- html_node(webpage, ".date") %>% html_text(trim = TRUE)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(url = url, date = date, title = title, main_text = main_text, stringsAsFactors = FALSE)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article23.csv")




url <- "https://edition.cnn.com/2023/05/12/asia/cancel-culture-law-singapore-intl-hnk"
webpage <- read_html(url)
heading <- html_node(webpage, "#maincontent")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p") 
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
main_text <- iconv(main_text, from = "UTF-8", to = "ASCII//TRANSLIT", sub = "")
print(substr(main_text, 1, 300))
timestamp <- html_node(webpage, ".vossi-timestamp") %>% html_text(trim = TRUE)
timestamp <- str_squish(timestamp)
date <- str_extract(timestamp, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article24.csv")






url <- "https://www.enzuzo.com/blog/cancel-culture-examples"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p") 
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
main_text <- iconv(main_text, from = "UTF-8", to = "ASCII//TRANSLIT", sub = "")
print(substr(main_text, 1, 300))
timestamp <- html_node(webpage, ".text-base-200") %>% html_text(trim = TRUE)
timestamp <- str_squish(timestamp)
print(timestamp)
date <- str_extract(timestamp, "\\d{1,2}/\\d{1,2}/\\d{2}")
if (!is.na(date)) {
  date <- as.Date(date, format = "%m/%d/%y")
  date <- format(date, "%d-%B-%Y")
}
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article25.csv")







url <- "https://gettysburgian.com/2023/11/canceled-or-popularized-the-rise-of-cancel-culture/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p") 
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
main_text <- iconv(main_text, from = "UTF-8", to = "ASCII//TRANSLIT", sub = "")
print(substr(main_text, 1, 300))
timestamp <- html_node(webpage, ".post-meta") %>% html_text(trim = TRUE)
timestamp <- str_squish(timestamp)
print(timestamp)
date <- str_extract(timestamp, "[A-Z][a-z]{2,} \\d{1,2}, \\d{4}")
if (!is.na(date)) {
  date <- as.Date(date, format = "%b %d, %Y")
  date <- format(date, "%d-%B-%Y")
}
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article26.csv")




url <- "https://desktime.com/blog/cancel-culture-in-the-workplace"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_node(webpage, ".posted-on__date") %>% html_text(trim = TRUE)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article27.csv")




url <- "https://www.workthegreymatter.com/cancel-culture-how-it-works-four-useful-examples/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_node(webpage, ".published") %>% html_text(trim = TRUE)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article28.csv")






url <- "https://nycmuseumgallery.org/1196/entertainment/how-has-social-media-affected-cancel-culture/"
webpage <- read_html(url)
heading <- html_node(webpage, ".storyheadline")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_node(webpage, ".time-wrapper") %>% html_text(trim = TRUE)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article29.csv")





url <- "https://www.essencemediacom.com/news/cancelculture"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_node(webpage, ".hero-article_dateTime__0BNIZ") %>% html_text(trim = TRUE)
if (length(date) == 0 || is.na(date)) {
  date <- NA
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article30.csv")





url <- "https://www.linkedin.com/pulse/sidestep-cancel-culture-3-ways-manage-your-reputation-lida-citro%C3%ABn/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_divs <- html_nodes(webpage, "div") %>% html_text(trim = TRUE)
date <- str_extract(all_divs, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article31.csv")





url <- "https://www.npr.org/2021/02/10/965815679/is-cancel-culture-the-future-of-the-gop"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_divs <- html_nodes(webpage, ".date") %>% html_text(trim = TRUE)
date <- str_extract(all_divs, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article32.csv")





url <- "https://www.forbes.com/councils/forbescoachescouncil/2020/03/25/one-way-forward-from-a-cancel-culture-to-an-accountable-culture/"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_divs <- html_nodes(webpage, "._0th4g") %>% html_text(trim = TRUE)
date <- str_extract(all_divs, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article33.csv")




url <- "https://time.com/5735403/cancel-culture-is-not-real/"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_divs <- html_nodes(webpage, "time") %>% html_text(trim = TRUE)
date <- str_extract(all_divs, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article34.csv")





url <- "https://www.dictionary.com/e/pop-culture/cancel-culture/"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_divs <- html_nodes(webpage, "time") %>% html_text(trim = TRUE)
date <- str_extract(all_divs, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article35.csv")



url <- "https://davidlat.substack.com/p/the-canceling-of-the-american-mind"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h2")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_divs <- html_nodes(webpage, ".meta-EgzBVA") %>% html_text(trim = TRUE)
date <- str_extract(all_divs, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article36.csv")





url <- "https://capclaw.com/feedback-responses-to-cancel-culture-is-illegal-at-work/"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_divs <- html_nodes(webpage, ".updated") %>% html_text(trim = TRUE)
date <- str_extract(all_divs, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article37.csv")


url <- "https://www.peoplemanagement.co.uk/article/1848776/hr-achieve-balance-cancel-culture-free-speech"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "span, div, p") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "\\d{1,2} [A-Z][a-z]+ \\d{4}")
date <- date[!is.na(date)][1]
if (!is.na(date)) {
  parsed_date <- as.Date(date, format = "%d %B %Y")
  date <- format(parsed_date, "%d %B %Y") 
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article38.csv")




url <- "https://lens.monash.edu/@a-different-lens/2024/04/05/1386422/the-consequences-of-cancel-culture"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".date-area") %>% html_text(trim = TRUE)
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article39.csv")



url <- "https://reputationcrisis.org/blog/cancel-culture/"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, ".entry-title")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".published") %>% html_text(trim = TRUE)
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article40.csv")



url <- "https://www.frontiersin.org/journals/political-science/articles/10.3389/fpos.2022.805008/full"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "span, div, p") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "\\d{1,2} [A-Z][a-z]+ \\d{4}")
date <- date[!is.na(date)][1]
if (!is.na(date)) {
  parsed_date <- as.Date(date, format = "%d %B %Y")
  date <- format(parsed_date, "%d %B %Y") 
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article41.csv")


url <- "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0228723"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "#artTitle")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date_text <- html_node(webpage, "#artPubDate") %>% html_text(trim = TRUE)
date <- str_extract(date_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article42.csv")


url <- "https://rsisinternational.org/journals/ijriss/articles/selected-students-perceptions-and-attitudes-on-cancel-culture-reflections-on-public-opinion-attribution-theory-compassionate-education-and-restorative-justice/"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, ".h2")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "span, li, div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]{2} \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article43.csv")



url <- "https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4715439"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "span, div, p") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "\\d{1,2} [A-Z][a-z]+ \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article44.csv")



url <- "https://www.cbsnews.com/news/cancel-culture-internet-joke-anything-but/"
webpage <- read_html(GET(url, user_agent("Mozilla/5.0")))
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "time, span, div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article45.csv")



url <- "https://www.nytimes.com/2021/03/04/books/dr-seuss-books.html"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "time, span, div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article46.csv")



url <- "https://www.forbes.com/sites/petersuciu/2021/02/16/is-gina-carano-a-victim-of-social-media-cancel-culture/?sh=7f96ad992e0e"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "._0th4g, span, div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article47.csv")




url <- "https://www.thewrap.com/coming-back-from-cancel-culture-means-self-reflection-experts-say-the-twitter-mob-is-us/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "time, span, div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article48.csv")



url <- "https://www.thenation.com/article/society/republicans-cancel-culture-kaepernick/"
webpage <- read_html(url)
heading <- html_node(webpage, ".title")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, ".article_pub_time, ui,li") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article49.csv")



url <- "https://www.forbes.com/sites/danabrownlee/2021/07/01/is-cancel-culture-really-just-long-overdue-accountability-for-the-privileged/?sh=78c0afde3a22"
webpage <- read_html(url)
heading <- html_node(webpage, ".dp_VC")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "._0th4g, span,div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article50.csv")



url <- "https://daily.jstor.org/cancel-culture-is-chaotic-good/"
webpage <- read_html(url)
heading <- html_node(webpage, ".entry-title")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, ".timestamp--published, time,div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article51.csv")



url <- "https://pmc.ncbi.nlm.nih.gov/articles/PMC11671789/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
text_blocks <- html_nodes(webpage, "div") %>% html_text(trim = TRUE)
raw_date <- str_extract(text_blocks, "\\d{4} [A-Z][a-z]{2} \\d{1,2}")
raw_date <- raw_date[!is.na(raw_date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article52.csv")



url <- "https://www.mdpi.com/2079-9292/10/11/1332"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
text_blocks <- html_nodes(webpage, "div, span, section") %>% html_text(trim = TRUE)
raw_date <- str_extract(text_blocks, "Published: \\d{1,2} [A-Z][a-z]+ \\d{4}")
raw_date <- raw_date[!is.na(raw_date)][1]
date <- str_replace(raw_date, "Published: ", "")
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article53.csv")



url <- "https://theseahawk.org/30325/thelatest/opinion-cancel-culture-is-toxic-and-does-more-harm-than-good/"
webpage <- read_html(url)
heading <- html_node(webpage, "#storyheadline")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".time-wrapper") %>% html_text(trim = TRUE)
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article54.csv")



url <- "https://www.newportacademy.com/resources/mental-health/teenage-cancel-culture/"
webpage <- read_html(url)
heading <- html_node(webpage, ".entry-title")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".published") %>% html_text(trim = TRUE)
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article55.csv")



url <- "https://www.insidehook.com/internet/youthsplaining-everything-you-need-to-know-about-cancel-culture"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".date") %>% html_text(trim = TRUE)
date <- str_extract(date, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article56.csv")



url <- "https://www.pewresearch.org/short-reads/2022/06/09/a-growing-share-of-americans-are-familiar-with-cancel-culture/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "div, span") %>% html_text(trim = TRUE)
all_dates <- str_extract(all_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
all_dates <- all_dates[!is.na(all_dates)]
june_date <- unique(all_dates[str_detect(all_dates, "^June")])[1]
print(june_date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article57.csv")



url <- "https://www.forbes.com/sites/kianbakhtiari/2020/09/29/why-brands-need-to-pay-attention-to-cancel-culture/"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, "._0th4g") %>% html_text(trim = TRUE)
date <- str_extract(date, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article58.csv")


url <- "https://theconversation.com/can-we-confront-cancel-culture-by-finding-common-ground-between-moderate-leftists-and-wokists-254571"
webpage <- read_html(url)
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, "time") %>% html_text(trim = TRUE)
date <- str_extract(date, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article59.csv")


url <- "https://edition.cnn.com/2021/03/07/us/cancel-culture-accountability-reality-trnd/index.html"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".vossi-timestamp") %>% html_text(trim = TRUE)
date <- str_extract(date, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article60.csv")



url <- "https://www.theatlantic.com/ideas/archive/2022/04/cancel-culture-debate-needs-greater-specificity/629654/"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".ArticleTimestamp_root__b3bL6") %>% html_text(trim = TRUE)
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article61.csv")



url <- "https://mentalhealthathome.org/2021/04/09/what-is-cancel-culture/"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
date <- html_nodes(webpage, ".published") %>% html_text(trim = TRUE)
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article62.csv")



url <- "https://nypost.com/article/what-is-cancel-culture-breaking-down-the-toxic-online-trend/"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
updated_text <- html_node(webpage, ".updated-date") %>% html_text(trim = TRUE)
date <- str_extract(updated_text, "[A-Z][a-z]+\\. \\d{1,2}, \\d{4}")
if (!is.na(date)) {
  date <- gsub("\\.", "", date) 
  parsed_date <- as.Date(date, format = "%b %d, %Y")
  date <- format(parsed_date, "%d %B %Y")
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article63.csv")



url <- "https://axis.org/blog/an-introduction-to-cancel-culture/"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
updated_text <- html_node(webpage, ".o-page-hero__kicker") %>% html_text(trim = TRUE)
date <- str_extract(updated_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
if (!is.na(date)) {
  date <- gsub("\\.", "", date) 
  parsed_date <- as.Date(date, format = "%b %d, %Y")
  date <- format(parsed_date, "%d %B %Y")
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article64.csv")



url <- "https://inews.co.uk/culture/film/johnny-depp-proof-cancel-culture-doesnt-exist-3660509?srsltid=AfmBOoqarYxm_ZkFS9-Gs1026KLGct9NpQ5466Rp50FizwmTUFIBYMEm"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
updated_text <- html_node(webpage, ".inews__post__pubdate") %>% html_text(trim = TRUE)
date <- str_extract(updated_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
if (!is.na(date)) {
  date <- gsub("\\.", "", date) 
  parsed_date <- as.Date(date, format = "%b %d, %Y")
  date <- format(parsed_date, "%d %B %Y")
}
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article65.csv")



url <- "https://www.forbes.com/sites/evangerstmann/2020/09/13/cancel-culture-is-only-getting-worse/"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
updated_text <- html_node(webpage, "._0th4g") %>% html_text(trim = TRUE)
date <- str_extract(updated_text, "[A-Z][a-z]+ \\d{1,2}, \\d{4}")
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article66.csv")


url <- "https://nz.news.yahoo.com/jade-thirlwall-scared-cancel-culture-140127873.html?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAADlrwQM5_YB8ONQjKMx2v7im1AJcDTtLZPXrnVCHK67D37sHv6YlF9Av1ttKacyKGSUEv-4f6wM1p2GMaoMeVaF6knioQjlgY8rM-ze7v-EV849CaART_lKc6Db1ObuSy9fFMwbyzyNz3zpgo5S2djgfDTX_QuoG8wVasqhdkkIJ"
webpage <- read_html(url, encoding = "UTF-8")
heading <- html_node(webpage, "h1")
title <- html_text(heading)
title <- str_squish(title)
print(title)
paragraph <- html_nodes(webpage, "p")
main_text <- html_text(paragraph)
main_text <- paste(main_text, collapse = " ")
main_text <- str_replace_all(main_text, "[\r\n\t]", " ")
main_text <- str_squish(main_text)
print(substr(main_text, 1, 300))
all_text <- html_nodes(webpage, "time,div") %>% html_text(trim = TRUE)
date <- str_extract(all_text, "\\d{1,2} [A-Z][a-z]+ \\d{4}")
date <- date[!is.na(date)][1]
print(date)
data <- data.frame(
  url = url,
  date = date,
  title = title,
  main_text = main_text,
  stringsAsFactors = FALSE
)
write_csv(data, "E:/10th sem/Data Science/Lab/final Project/one_scraped_article67.csv")






files <- list.files(
  path = "E:/10th sem/Data Science/Lab/final Project/", 
  pattern = "^one_scraped_article([5-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|6[0-7])\\.csv$", 
  full.names = TRUE
)
merged_data <- bind_rows(lapply(files, read_csv))
write_csv(merged_data, "E:/10th sem/Data Science/Lab/final Project/merged_cancel_culture_articles.csv")












install.packages(c("textclean", "tm", "SnowballC", "textstem"))
install.packages("tidytext")
library(dplyr)
library(stringr)
library(textclean)
library(tidytext)
library(tidyr)
library(textstem)
library(readr)
library(tm)
library(SnowballC)
library(lubridate)

df <- read_csv("E:/10th sem/Data Science/Lab/final Project/merged_cancel_culture_articles.csv")

df <- df %>% filter(!is.na(main_text))

df <- df %>%
  mutate(text_contracted = replace_contraction(main_text))

df <- df %>%
  mutate(
    text_cleaned = replace_emoji(text_contracted),
    text_cleaned = replace_emoticon(text_cleaned),
    text_cleaned = gsub("<e2><80><94>", " ", text_cleaned, fixed = TRUE),
    text_cleaned = gsub("<c2><a0>", " ", text_cleaned, fixed = TRUE)
  )

clean_text <- function(text) {
  text <- tolower(text)                      
  text <- gsub("<.*?>", " ", text)            
  text <- gsub("[^a-z\\s]", " ", text)      
  text <- gsub("\\s+", " ", text)           
  text <- str_trim(text)
  return(text)
}

df <- df %>%
  mutate(text_cleaned_final = sapply(text_cleaned, clean_text))

df$id <- 1:nrow(df)

data("stop_words")
tokens_filtered <- df %>%
  select(id, text_cleaned_final) %>%
  unnest_tokens(word, text_cleaned_final) %>%
  filter(!word %in% stop_words$word) %>%
  filter(nchar(word) > 2) %>%
  group_by(id) %>%
  summarise(tokens = list(word), .groups = "drop")
df <- df %>%
  left_join(tokens_filtered, by = "id")


df <- df %>%
  mutate(tokens_lemmatized = lapply(tokens, lemmatize_words),
         tokens_stemmed = lapply(tokens_lemmatized, stem_words))

df <- df %>%
  mutate(final_text = sapply(tokens_stemmed, function(x) paste(x, collapse = " ")))

df <- df %>%
  mutate(date = parse_date_time(date, orders = c("dmy", "mdy", "ymd", "B d, Y", "d B Y", "Y B d"), tz = "UTC")) %>%
  mutate(date = format(date, "%d-%B-%Y"))
write_csv(df %>% select(url, date, title, main_text, final_text),
          "E:/10th sem/Data Science/Lab/final Project/processed_cancel_culture_articles.csv")

View(df)















data <- read_csv("E:/10th sem/Data Science/Lab/final Project/processed_cancel_culture_articles.csv")
corpus <- Corpus(VectorSource(data$final_text))

dtm <- DocumentTermMatrix(corpus,
                          control = list(wordLengths = c(3, Inf)))
 
inspect(dtm_sparse[1:5, 1:10])
saveRDS(dtm_sparse, file = "E:/10th sem/Data Science/Lab/final Project/DTM_sparse.rds")

model_output <- readRDS("E:/10th sem/Data Science/Lab/final Project/DTM_sparse.rds")
View(model_output)













install.packages(c("topicmodels", "ldatuning", "textclean", "SnowballC"))
install.packages("tm")
install.packages("remotes")      
remotes::install_github("nikita-moor/ldatuning")
install.packages("textmineR")
library(textmineR)
library(tm)
library(topicmodels)
library(ldatuning)
library(textclean)
library(SnowballC)
library(tidyverse)
library(Matrix)

dtm_sparse <- readRDS("E:/10th sem/Data Science/Lab/final Project/DTM_sparse.rds")
dtm_filtered <- removeSparseTerms(dtm_sparse, 0.99)

result <- FindTopicsNumber(
  dtm_filtered,
  topics = seq(2, 10, by = 1),
  metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
  method = "Gibbs",
  control = list(seed = 1234),
  mc.cores = 1L,
  verbose = TRUE
)
FindTopicsNumber_plot(result) 
k <- 7
lda_model <- LDA(dtm_filtered, k = k, method = "Gibbs",
                 control = list(seed = 1234, burnin = 1000, iter = 2000, thin = 100))

top_terms <- terms(lda_model, 15) 
print(top_terms)

doc_topics <- as.data.frame(topics(lda_model))
colnames(doc_topics) <- c("Topic")
doc_topics$Document <- rownames(doc_topics)

data <- read_csv("E:/10th sem/Data Science/Lab/final Project/processed_cancel_culture_articles.csv")
data$id <- 1:nrow(data)
data_with_topics <- cbind(data, Topic = doc_topics$Topic)
topic_proportions <- as.data.frame(lda_model@gamma)
topic_proportions$Document <- rownames(topic_proportions)
data_with_distribution <- cbind(data_with_topics, topic_proportions)
refined_labels <- c(
  "Public Ethics & Cancel Culture Ideology",           
  "Celebrity Culture & Brand Boycotts",          
  "Online Morality & Cancel Norms",            
  "Activism, Law & Social Movements",            
  "Toxicity in Digital Platforms",        
  "Cultural Sanctions & Cancel Justice",      
  "Gender, Race & Media Allegations"
)
data_with_distribution$Topic_Label <- refined_labels[data_with_distribution$Topic]
data_with_distribution

perplexity(lda_model, dtm_filtered)

saveRDS(lda_model, "E:/10th sem/Data Science/Lab/final Project/LDA_model.rds")
write_csv(data_with_distribution, "E:/10th sem/Data Science/Lab/final Project/articles_with_topic_labels.csv")






k_values <- 3:7
perplexity_scores <- numeric(length(k_values))

for (i in seq_along(k_values)) {
  k_val <- k_values[i]
  model_k <- LDA(dtm_filtered, k = k_val, method = "Gibbs",
                 control = list(seed = 1234, burnin = 1000, iter = 2000, thin = 100))
  perplexity_scores[i] <- perplexity(model_k, dtm_filtered)
}

perplexity_df <- data.frame(k = k_values, Perplexity = perplexity_scores)
print(perplexity_df)
library(ggplot2)
ggplot(perplexity_df, aes(x = k, y = Perplexity)) +
  geom_line(color = "steelblue") +
  geom_point(color = "darkred", size = 3) +
  geom_vline(xintercept = 7, linetype = "dashed", color = "green") +
  labs(title = "Perplexity vs. Number of Topics (k)",
       x = "Number of Topics (k)", y = "Perplexity") +
  theme_minimal()

















install.packages('wordcloud')
install.packages('RColorBrewer')
library(wordcloud)
library(RColorBrewer)

lda_model <- readRDS("E:/10th sem/Data Science/Lab/final Project/LDA_model.rds")

beta_matrix <- lda_model@beta
vocab <- lda_model@terms
k <- lda_model@k
top_n <- 15
topic_term_probs <- exp(beta_matrix)
colors <- brewer.pal(min(8, k), "Dark2")
par(mfrow = c(2, ceiling(k / 2)), mar = c(1, 1, 2, 1))

for (i in 1:k) {
  term_probs <- topic_term_probs[i, ]
  names(term_probs) <- vocab
  top_terms <- sort(term_probs, decreasing = TRUE)[1:top_n]
  top_terms_scaled <- scales::rescale(top_terms, to = c(1, 100)) 
  
  wordcloud(
    words = names(top_terms_scaled),
    freq = top_terms_scaled,
    scale = c(4, 0.8),
    max.words = top_n,
    min.freq = 0,
    random.order = FALSE,
    colors = colorRampPalette(c(colors[i %% length(colors) + 1]))(top_n)
  )
  title(main = paste("Topic", i - 1), line = -1)
}







install.packages("textmineR")
install.packages("tidytext")
install.packages("gridExtra")
library(broom)
library(tidytext)
library(tidyverse)
library(gridExtra)
library(readr)
library(rvest)
library(stringr)
library(dplyr)
library(lubridate)
library(httr)
library(tidyverse)
library(tm)
library(SnowballC)
library(textclean)


lda_model <- readRDS("E:/10th sem/Data Science/Lab/final Project/LDA_model.rds")
dtm_filtered <- readRDS("E:/10th sem/Data Science/Lab/final Project/DTM_sparse.rds")

term_topic <- tidy(lda_model, matrix = "beta")


term_counts <- tidy(dtm_filtered) %>%
  group_by(term) %>%
  summarise(word_count = sum(count), .groups = 'drop')
term_topic_counts <- term_topic %>%
  inner_join(term_counts, by = "term")
top_terms <- term_topic_counts %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  arrange(topic, -beta)

plot <- ggplot(top_terms, aes(x = reorder_within(term, beta, topic), y = word_count)) +
  geom_col(fill = "skyblue", alpha = 0.7) +
  geom_line(aes(y = beta * max(word_count), group = 1), color = "blue", size = 1) +
  geom_point(aes(y = beta * max(word_count)), color = "blue", size = 2) +
  facet_wrap(~ paste("Topic", topic), scales = "free", ncol = 2) +
  scale_x_reordered() +
  labs(
    title = "Word Count (Bar) & Weight (Line) per Topic",
    x = "Top Terms",
    y = "Word Count",
    caption = "Blue line and points represent topic-term weight (β)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 14)
  )
print(plot)







data_with_distribution <- read_csv("E:/10th sem/Data Science/Lab/final Project/articles_with_topic_labels.csv")
dominant_topic_counts <- data_with_distribution %>%
  group_by(Topic, Topic_Label) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(desc(Count)) %>%
  mutate(Topic_Label = paste0("Topic ", Topic, "\n", gsub(", ", ",\n", Topic_Label)))

plot1 <- ggplot(dominant_topic_counts, aes(x = reorder(Topic_Label, -Count), y = Count)) +
  geom_bar(stat = "identity", fill = "#b22222") +
  labs(title = "Number of Documents by Dominant Topic",
       x = NULL,
       y = "Number of Documents") +
  theme_minimal(base_size = 13) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1),
        plot.title = element_text(face = "bold"))

gamma_cols <- grep("^V", colnames(data_with_distribution), value = TRUE)

topic_weightage <- data_with_distribution %>%
  select(all_of(gamma_cols)) %>%
  summarise(across(everything(), sum)) %>%
  pivot_longer(everything(), names_to = "Topic", values_to = "Weightage") %>%
  mutate(Topic_Num = as.numeric(gsub("V", "", Topic))) %>%
  left_join(dominant_topic_counts %>% select(Topic, Topic_Label), by = c("Topic_Num" = "Topic"))

plot2 <- ggplot(topic_weightage, aes(x = reorder(Topic_Label, -Weightage), y = Weightage)) +
  geom_bar(stat = "identity", fill = "#4682b4") +
  labs(title = "Number of Documents by Topic Weightage",
       x = NULL,
       y = "Sum of Topic Proportions") +
  theme_minimal(base_size = 13) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1),
        plot.title = element_text(face = "bold"))

grid.arrange(plot1, plot2, ncol = 2)





library(networkD3)
data <- read_csv("E:/10th sem/Data Science/Lab/final Project/articles_with_topic_labels.csv")

topic_counts <- data %>%
  count(Topic_Label)
nodes <- data.frame(name = unique(c("All Documents", as.character(topic_counts$Topic_Label))))

links <- data.frame(
  source = match("All Documents", nodes$name) - 1,                    
  target = match(topic_counts$Topic_Label, nodes$name) - 1,            
  value = topic_counts$n                                              
)

sankeyNetwork(Links = links, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name",
              fontSize = 14, nodeWidth = 30,
              sinksRight = FALSE)









install.packages("LDAvis")
install.packages("servr")
install.packages("servr")
library(slam)
library(LDAvis)
library(jsonlite)
library(servr)

lda_model <- readRDS("E:/10th sem/Data Science/Lab/final Project/LDA_model.rds")
dtm <- readRDS("E:/10th sem/Data Science/Lab/final Project/DTM_sparse.rds")

phi <- exp(lda_model@beta)
theta <- lda_model@gamma
vocab <- colnames(dtm)
doc_length <- row_sums(dtm)
term_frequency <- col_sums(dtm)

json_lda <- createJSON(
  phi = phi,
  theta = theta,
  doc.length = doc_length,
  vocab = vocab,
  term.frequency = term_frequency
)

serVis(json_lda, out.dir = 'E:/10th sem/Data Science/Lab/final Project/ldavis', open.browser = TRUE)





install.packages('Rtsne')
library(Rtsne)
library(ggplot2)
library(readr)
library(dplyr)

lda_model <- readRDS("E:/10th sem/Data Science/Lab/final Project/LDA_model.rds")
topic_gamma <- as.data.frame(lda_model@gamma)

data_with_distribution <- read_csv("E:/10th sem/Data Science/Lab/final Project/articles_with_topic_labels.csv")
data_with_distribution$id <- 1:nrow(data_with_distribution)

topic_gamma$id <- 1:nrow(topic_gamma)
topic_data <- left_join(topic_gamma, data_with_distribution %>% select(id, Topic, Topic_Label), by = "id")

set.seed(42)
tsne_result <- Rtsne(as.matrix(topic_gamma[, 1:lda_model@k]), dims = 2, perplexity = 15, verbose = TRUE, max_iter = 500)

tsne_df <- data.frame(
  X = tsne_result$Y[, 1],
  Y = tsne_result$Y[, 2],
  Topic = as.factor(topic_data$Topic),
  Topic_Label = topic_data$Topic_Label
)

ggplot(tsne_df, aes(x = X, y = Y, color = Topic_Label)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "t-SNE Clustering of Topics in Documents",
       x = "t-SNE Dimension 1",
       y = "t-SNE Dimension 2",
       color = "Topic") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "right")

