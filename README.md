# University Quality Analysis Using PCA (GNU Octave)

This repository contains an academic project completed as part of the course **Multivariate Data Analysis**.

## 📖 Overview

The project focuses on the multivariate analysis of students’ subjective evaluations of well-known European universities, including institutions such as the University of Warwick, the University of Cambridge, and the University of Lausanne.

Student evaluations were collected through a previously conducted survey and recorded on a **Likert scale** ranging from 1 (*Strongly Approve*) to 5 (*Strongly Disapprove*).

The primary objective of the analysis is to identify latent patterns in university quality assessments using **Principal Component Analysis (PCA)**.

The emphasis is placed on understanding the underlying mathematical methodology of PCA rather than relying on built-in Octave functions. Therefore, the PCA procedure was implemented manually through eigendecomposition of covariance and correlation matrices.

---

## 🗂️ Dataset

The dataset consists of average student evaluations for **36 European universities** across **8 quality-related criteria**:

* Research orientation
* Practical training
* Examinations preparation
* Student support
* Learning atmosphere
* Computer facilities
* Library facilities
* Availability of scholarly materials

Each variable corresponds to the average student rating of the respective criterion for a given university.

To facilitate interpretation, the data were transformed so that higher scores correspond to more favorable evaluations. For example, if a university received an average rating of `1.9` for computer facilities, the transformed score becomes:

```math
6 - 1.9 = 4.1
```

The transformed rating scale nevertheless remains bounded between 1 and 5.

---

## 📈 Methodology

An initial exploratory analysis revealed substantial correlations among several quality criteria, suggesting that dimensionality reduction techniques could provide a more compact and interpretable representation of the data.

The primary methodology employed in the project is **Principal Component Analysis (PCA)**.

Since all variables are homogeneous and measured on the same scale, PCA was applied using both:

* the **covariance matrix approach** (centered data), and
* the **correlation matrix approach** (standardized data),

allowing for a comparative analysis of the resulting principal components and their interpretations.

The implementation includes:

* Descriptive statistical analysis
* Eigendecomposition of covariance and correlation matrices
* Principal component extraction and interpretation
* Kaiser criterion and scree plots for selecting the appropriate number of components
* Visualization of component loadings and scores
* Grouping of quality criteria based on component loadings
* Grouping and ranking of universities based on principal component scores
* Comparison of Northern and Southern European universities

---

## 🔍 Main Findings

The covariance and correlation matrix approaches produce broadly similar results due to the homogeneous nature of the dataset variables and their common measurement scale.

Some of the main conclusions of the analysis include:

* The first principal component can be interpreted as a weighted average of university evaluations and serves as an index of university performance.
* The second principal component captures the contrast between learning infrastructure and academic mentoring/practical aspects offered by a university.
* The first two principal components explain approximately 70–72% of the total variability of the data.
* Northern European universities tend to receive higher overall evaluations, while Southern European universities appear to perform comparatively better in learning infrastructure-related criteria.
* According to the first principal component scores, the top three universities are the University of Warwick, the University of Lausanne, and the University of Cambridge.

---

## ⚙️ Tools & Technologies Used

* GNU Octave
* `statistics` package

---

## ▶️ How to Run

1. Clone the repository:

```bash
git clone https://github.com/marios-gnk/university-quality-pca.git
```

2. Open GNU Octave.

3. Run the script:

```matlab
university_quality_analysis.m
```

---

## ✍️ Notes

* The presentation material is written in Greek, as the project was originally prepared for presentation within the Department of Mathematics.
* The dataset is included directly inside the `university_quality_analysis.m` script.

---

## 👨‍💻 Author

**Marios Giannakopoulos**

Department of Mathematics

National and Kapodistrian University of Athens

