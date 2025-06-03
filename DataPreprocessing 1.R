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


#5
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




#6
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




#7
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








#8
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






#9
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




#10
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







#11
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





#12
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



#13
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





#14
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



#15
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



#16
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





#17
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




#18
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




#19
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



#20
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



#21
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


#22
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

#23
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



#24
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





#25
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






#26
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



#27
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



#28
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





#29
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




#30
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




#31
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




#32
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




#33
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



#34
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




#35
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


#36
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




#37
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


#38
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




#39
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



#40
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



#41
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


#42
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


#43
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



#44
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



#45
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



#46
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



#47
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




#48
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



#49
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



#50
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



#51
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



#52
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



#53
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



#54
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



#55
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



#56
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



#57
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



#58
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


#59
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


#60
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



#61
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



#62
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



#63
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



#64
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



#65
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



#66
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


#67
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
library(textclean)
library(textstem)
library(hunspell)
library(dplyr)
library(stringr)
library(tidytext)
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

correct_spelling <- function(text) {
  words <- unlist(strsplit(text, " "))
  misspelled <- hunspell(words)[[1]]
  
  if (length(misspelled) == 0) return(text)
  
  for (word in misspelled) {
    suggestion <- hunspell_suggest(word)[[1]]
    if (length(suggestion) > 0) {
      words[words == word] <- suggestion[1]
    }
  }
  
  return(paste(words, collapse = " "))
}

df <- df %>%
  mutate(text_spellchecked = sapply(text_cleaned, correct_spelling))


clean_text <- function(text) {
  text <- tolower(text)                      
  text <- gsub("<.*?>", " ", text)            
  text <- gsub("[^a-z\\s]", " ", text)         
  text <- gsub("\\s+", " ", text)           
  text <- str_trim(text)
  return(text)
}

df <- df %>%
  mutate(text_cleaned_final = sapply(text_spellchecked, clean_text))

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
