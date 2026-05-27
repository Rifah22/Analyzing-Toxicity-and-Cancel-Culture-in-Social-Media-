# 📊 Analyzing Toxicity & Cancel Culture in Social Media

<p align="center">
  <img src="https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white"/>
  <img src="https://img.shields.io/badge/Web_Scraping-FF6B35?style=for-the-badge&logoColor=white"/>
  <img src="https://img.shields.io/badge/NLP-4CAF50?style=for-the-badge&logoColor=white"/>
  <img src="https://img.shields.io/badge/LDA_Topic_Modeling-8A2BE2?style=for-the-badge&logoColor=white"/>
</p>

> A final-term data science project using R to analyze toxic language and cancel culture discourse across 63 web-scraped articles, applying LDA topic modeling to uncover 7 dominant themes in online cancel culture narratives.

---

## 📌 Table of Contents

- [About the Project](#-about-the-project)
- [Research Questions](#-research-questions)
- [Methodology](#-methodology)
- [Data Collection](#-data-collection)
- [Preprocessing Pipeline](#-preprocessing-pipeline)
- [LDA Topic Modeling](#-lda-topic-modeling)
- [Results](#-results)
- [Visualizations](#-visualizations)
- [Dataset Files](#-dataset-files)
- [Tech Stack & Libraries](#-tech-stack--libraries)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Team](#-team)

---

## 📖 About the Project

This is the **Final Term Project** for the course *Introduction to Data Science (IDS)*, Section B, Spring 2024–25 at **American International University-Bangladesh (AIUB)**, under faculty **Tohedul Islam**.

The project investigates the rise of **toxicity and cancel culture** in online media using computational text analysis. Articles were manually selected from 47 distinct sources, scraped using R, cleaned through an extensive NLP preprocessing pipeline, and then subjected to **Latent Dirichlet Allocation (LDA)** topic modeling to reveal the dominant thematic structures in cancel culture discourse.

---

## ❓ Research Questions

1. What are the dominant topics discussed in relation to cancel culture online?
2. How is toxic language distributed across different cancel culture events?
3. What patterns emerge in media coverage of cancelled public figures?

---

## 🔬 Methodology

```
Article Selection (63 URLs across 47 sources)
               ↓
Web Scraping (rvest — title, body text, date per article)
               ↓
Merge 63 individual CSVs → merged_cancel_culture_articles.csv
               ↓
Text Preprocessing (contractions, emoji, HTML, stopwords,
                    lemmatization, stemming)
               ↓
Document-Term Matrix (DTM) Construction
               ↓
Optimal Topic Number Selection (FindTopicsNumber — k=3 to 10)
               ↓
LDA Model Training (k=7, Gibbs sampling)
               ↓
Topic Labeling & Document Assignment
               ↓
Evaluation (Perplexity) + Visualization
```

---

## 🌐 Data Collection

Articles were individually scraped from **63 URLs across 47 unique domains**, covering news outlets, academic sources, social media platforms, and opinion pieces.

**Sources include:**

| Source | Articles |
|--------|---------|
| Medium | 10 |
| Forbes | 5 |
| Pew Research | 2 |
| Reddit (r/CancelCulture) | 2 |
| CNN | 2 |
| NYT, NPR, The Atlantic, The Nation, Vice, CBS News | 1 each |
| MDPI, Frontiers in Psychology, PLOS ONE, SSRN, PubMed | 1 each |
| + 30 other outlets | 1 each |

For each URL, the scraper extracts:
- **Title** (via `h1` tag)
- **Body text** (all `<p>` tags, joined and cleaned)
- **Publication date** (via `<time>` tag or regex pattern)

Each article is saved individually and then merged into a single dataset.

---

## 🧹 Preprocessing Pipeline

The text preprocessing pipeline applied to `merged_cancel_culture_articles.csv`:

| Step | Action |
|------|--------|
| Filter | Remove rows with `NA` in `main_text` |
| Expand contractions | `don't → do not`, `it's → it is`, etc. |
| Remove emojis & emoticons | Strip non-ASCII characters |
| Remove HTML entities | Clean encoded symbols |
| Lowercase | Standardize all text |
| Remove special characters & extra spaces | Regex-based cleaning |
| Tokenize | Split into individual tokens |
| Remove short words | Drop tokens under 3 characters |
| Remove stopwords | English stopword list (`tm` package) |
| Lemmatization | Reduce words to base lemma |
| Stemming | Further reduce to word stems (SnowballC) |
| Reconstruct | Rejoin tokens into `final_text` per article |
| Parse dates | Standardize date field format |

Output saved as `processed_cancel_culture_articles.csv`.

---

## 🤖 LDA Topic Modeling

### Document-Term Matrix (DTM)
Built from the `final_text` column — words with fewer than 3 characters excluded, sparse terms (appearing in < 1% of documents) removed, and zero-frequency rows dropped.

### Optimal Topic Selection
`FindTopicsNumber()` evaluated k = 2 to 10 using four metrics:
- Griffiths2004
- CaoJuan2009
- Arun2010
- Deveaud2014

**Optimal k = 7** selected based on metric convergence and topic coherence.

### Model Training
```r
lda_model <- LDA(dtm_filtered, k = 7, method = "Gibbs", control = list(seed = 123))
```

Top 15 terms extracted per topic; each document assigned to its dominant topic; topic proportions (gamma matrix) saved per document.

### Model Evaluation
Perplexity calculated across k = 3 to 7 — **lower perplexity = better fit**. k = 7 confirmed as optimal with a dashed green marker in the perplexity plot.

---

## 📊 Results

The LDA model identified **7 topic clusters** from 63 cancel culture articles:

| # | Topic Label | Documents |
|---|-------------|-----------|
| 1 | **Public Ethics & Cancel Culture Ideology** | 16 |
| 2 | **Cultural Sanctions & Cancel Justice** | 14 |
| 3 | **Celebrity Culture & Brand Boycotts** | 13 |
| 4 | **Activism, Law & Social Movements** | 6 |
| 5 | **Online Morality & Cancel Norms** | 5 |
| 6 | **Gender, Race & Media Allegations** | 5 |
| 7 | **Toxicity in Digital Platforms** | 4 |

**Key findings:**
- *Public Ethics & Cancel Culture Ideology* and *Cultural Sanctions & Cancel Justice* are the most dominant themes, together accounting for nearly half of all articles
- *Celebrity Culture & Brand Boycotts* reflects the heavy media coverage of high-profile cancellations
- *Toxicity in Digital Platforms* is the least represented as a standalone primary topic, yet contributes significantly when considering per-document topic weight across all articles

---

## 📈 Visualizations

The project produces the following visualizations:

| Visualization | Description |
|---|---|
| **Word clouds (×7)** | One per LDA topic showing top terms by weight |
| **Word count & weight bar charts** | Top keywords per topic with frequency (bars) and term weight (line) |
| **Dominant topic bar chart** | Number of articles assigned to each topic |
| **Topic weight bar chart** | Summed topic weight across all documents |
| **Sankey diagram** | Flow of documents into their dominant topics |
| **LDAvis interactive map** | Intertopic distance map + top-30 relevant terms per topic |
| **t-SNE cluster plot** | Document-level clustering by topic in 2D space |
| **Perplexity curve** | Model quality vs. number of topics (k = 3 to 7) |

---

## 📁 Dataset Files

| File | Records | Description |
|------|---------|-------------|
| `merged_cancel_culture_articles.csv` | 63 | Raw scraped articles (url, date, title, main_text) |
| `processed_cancel_culture_articles.csv` | 63 | Cleaned and preprocessed text (`final_text`) |
| `articles_with_topic_labels.csv` | 63 | Final dataset with LDA topic assignment and per-topic proportions (V1–V7) |

---

## 🛠️ Tech Stack & Libraries

| Library | Purpose |
|---------|---------|
| `rvest` | Web scraping (HTML parsing) |
| `httr` | HTTP requests |
| `stringr` / `stringi` | String manipulation |
| `readr` / `dplyr` | Data reading and manipulation |
| `lubridate` | Date parsing |
| `tm` | Text mining corpus & DTM |
| `SnowballC` | Stemming |
| `textclean` | Contraction expansion, emoji removal |
| `topicmodels` | LDA model training |
| `ldatuning` | FindTopicsNumber for optimal k |
| `tidytext` | Tidy LDA output (beta/gamma matrices) |
| `ggplot2` | Visualization |
| `wordcloud` | Word cloud generation |
| `LDAvis` | Interactive topic visualization |
| `Rtsne` | t-SNE dimensionality reduction |

---

## 📂 Project Structure

```
Analyzing-Toxicity-and-Cancel-Culture-in-Social-Media--main/
│
├── DataPreprocessing_Group-9.R            # Main R script — scraping, preprocessing, LDA, visualizations (2,279 lines)
├── DataPreprocessing 1.R                  # Earlier version of the preprocessing script
│
├── merged_cancel_culture_articles.csv     # Raw merged scraped data (63 articles)
├── processed_cancel_culture_articles.csv  # Cleaned & preprocessed articles
├── articles_with_topic_labels.csv         # LDA topic assignments + proportions
│
├── Analyzing Toxicity and Cancel Culture 4.docx  # Project report (Word format)
├── FinalTerm_Report_group-9.pdf           # Full academic final report with all outputs & visualizations
└── README.md                              # This file
```

---

## ⚙️ Getting Started

### Prerequisites
- R (version 4.0+)
- RStudio (recommended)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Rifah22/Analyzing-Toxicity-and-Cancel-Culture-in-Social-Media-.git
   cd Analyzing-Toxicity-and-Cancel-Culture-in-Social-Media-
   ```

2. **Open `DataPreprocessing_Group-9.R` in RStudio**

3. **Install required packages**
   ```r
   install.packages(c("rvest", "httr", "stringr", "readr", "dplyr",
                       "lubridate", "tm", "SnowballC", "textclean",
                       "topicmodels", "ldatuning", "tidytext",
                       "ggplot2", "wordcloud", "LDAvis", "Rtsne"))
   ```

4. **Update file paths** — the script uses absolute Windows paths (e.g., `E:/10th sem/...`). Replace these with your local working directory path before running.

5. **Run in sections:**
   - **Section 1 (lines 1–1824):** Web scraping — scrapes 63 URLs and saves individual CSVs
   - **Section 2 (lines 1851–1943):** Merges CSVs and preprocesses text
   - **Section 3 (lines 1945–2240+):** Builds DTM, trains LDA model, generates visualizations

> ⚠️ Web scraping may fail for some URLs if the site structure has changed or access is restricted. Use the pre-scraped `merged_cancel_culture_articles.csv` to skip directly to preprocessing and modeling.

---

## 👩‍💻 Team

**Group 9 | Course: Introduction to Data Science | Section: B | AIUB | Spring 2024–25**

| Name | Student ID |
|------|-----------|
| **Md Tafhimul Haque Sadi** | 22-47071-1 |
| **Rifah Sanzida** | 22-47154-1 |
| **Sadia Afeose** | 21-45820-3 |

**Supervised by:** Tohedul Islam

**Rifah Sanzida**
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rifah-sanzida-b58141290/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/Rifah22)

---

## 📄 License

This project is open source and available for educational purposes.
