# 📊 Analyzing Toxicity & Cancel Culture in Social Media

<p align="center">
  <img src="https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white"/>
  <img src="https://img.shields.io/badge/Web_Scraping-FF6B35?style=for-the-badge&logoColor=white"/>
  <img src="https://img.shields.io/badge/NLP-Topic_Modeling-4CAF50?style=for-the-badge"/>
</p>

> A data science project using R to analyze toxic language and cancel culture patterns in social media using web scraping and LDA topic modeling.

---

## 📌 Table of Contents
- [About the Project](#about-the-project)
- [Research Questions](#research-questions)
- [Methodology](#methodology)
- [Tech Stack & Libraries](#tech-stack--libraries)
- [Dataset](#dataset)
- [Getting Started](#getting-started)
- [Results](#results)
- [Team](#team)

---

## 📖 About the Project

This project investigates the rise of **toxicity and cancel culture** in social media platforms using computational text analysis. We scraped real-world article data, preprocessed it, and applied **Latent Dirichlet Allocation (LDA)** topic modeling to uncover dominant themes and patterns in how cancel culture is discussed online.

---

## ❓ Research Questions

1. What are the dominant topics discussed in relation to cancel culture online?
2. How is toxic language distributed across different cancel culture events?
3. What patterns emerge in media coverage of cancelled public figures?

---

## 🔬 Methodology

```
Data Collection (Web Scraping)
         ↓
Data Preprocessing & Cleaning
         ↓
Exploratory Data Analysis (EDA)
         ↓
LDA Topic Modeling
         ↓
Visualization & Insights
```

### Steps:
1. **Web Scraping** — Collected articles about cancel culture using R scraping libraries
2. **Data Cleaning** — Removed stop words, punctuation, and performed stemming/lemmatization
3. **EDA** — Word frequency analysis, word clouds, sentiment exploration
4. **LDA Topic Modeling** — Identified latent topics across scraped articles
5. **Visualization** — Topic distribution graphs and coherence scoring

---

## 🛠️ Tech Stack & Libraries

| Library | Purpose |
|---------|---------|
| `rvest` | Web scraping |
| `httr` | HTTP requests |
| `tidytext` | Text processing |
| `tm` | Text mining |
| `topicmodels` | LDA topic modeling |
| `ggplot2` | Visualization |
| `wordcloud` | Word cloud generation |
| `dplyr` | Data manipulation |

---

## 📁 Dataset

| File | Description |
|------|-------------|
| `merged_cancel_culture_articles.csv` | Raw scraped articles merged |
| `processed_cancel_culture_articles.csv` | Cleaned and preprocessed text |
| `articles_with_topic_labels.csv` | Articles labeled with LDA topic assignments |

---

## ⚙️ Getting Started

### Prerequisites
- R (version 4.0+)
- RStudio (recommended)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Rifah22/Analyzing-Toxicity-and-Cancel-Culture-in-Social-Media-.git
   ```

2. **Open RStudio** and set the working directory to the project folder

3. **Install required packages**
   ```r
   install.packages(c("rvest", "httr", "tidytext", "tm", 
                       "topicmodels", "ggplot2", "wordcloud", "dplyr"))
   ```

4. **Run the scripts in order**
   ```r
   source("DataPreprocessing_Group-9.R")
   ```

---

## 📈 Results

The LDA model identified several key topic clusters including:

- **Political accountability** — discussions around politicians and public figures
- **Entertainment industry** — actors, musicians, and social media influencers
- **Social justice movements** — intersections of race, gender, and online activism
- **Media narratives** — how news outlets frame cancel culture events

> See `FinalTerm_Report_group-9.pdf` for detailed findings, visualizations, and conclusions.

---

## 👥 Team

**Group 9** — Data Science / Text Analytics Project

| Member | Role |
|--------|------|
| Rifah Sanzida | Data preprocessing, topic modeling, report writing |
| Teammates | Web scraping, EDA, visualization |

---

## 📄 Report

📎 Full academic report: [`FinalTerm_Report_group-9.pdf`](./FinalTerm_Report_group-9.pdf)

---

## 👩‍💻 Author

**Rifah Sanzida**  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin)](https://www.linkedin.com/in/rifah-sanzida-b58141290/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github)](https://github.com/Rifah22)
