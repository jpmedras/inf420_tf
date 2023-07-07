import numpy as np
import re
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
import nltk
import spacy
from nltk.corpus import stopwords
from sklearn.datasets import load_files
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.ensemble import GradientBoostingClassifier

movie_data = load_files(r"./data_comp_filtered", encoding='UTF-8')
X, y = movie_data.data, movie_data.target

documents = []

nlp = spacy.load("pt_core_news_sm")
lemmatizer = nlp.get_pipe("lemmatizer")

for sen in range(0, len(X)):
	# Remove caracteres especiais
	document = re.sub(r'\W', ' ', str(X[sen]))

	# Remove caracteres únicos
	document = re.sub(r'\s+[a-zA-Z]\s+', ' ', document)

	# Remove caracteres únicos do começo
	document = re.sub(r'\^[a-zA-Z]\s+', ' ', document) 

	# Substitui múltiplos espaços para um espaço único
	document = re.sub(r'\s+', ' ', document, flags=re.I)

	# Remove 'b' no início
	document = re.sub(r'^b\s+', '', document)

	# Converte para letras minúsculas
	document = document.lower()

	# Lemmatization 
	document = nlp(document)

	document = [token.lemma_ for token in document]
	document = ' '.join(document)

	documents.append(document)
	
vectorizer = CountVectorizer(max_features=1500, min_df=5, max_df=0.7, stop_words=stopwords.words('portuguese'))
X = vectorizer.fit_transform(documents).toarray()

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=0)

# GaussianNB

naive_bayes = GaussianNB()
naive_bayes.fit(X_train, y_train) 

y_pred = naive_bayes.predict(X_test)

print('GaussianNB')
print(confusion_matrix(y_test,y_pred))
print(classification_report(y_test,y_pred))
print(accuracy_score(y_test, y_pred))

# GradientBoostingClassifier

gradient_boosting = GradientBoostingClassifier(n_estimators=500)
gradient_boosting.fit(X_train, y_train) 

y_pred = gradient_boosting.predict(X_test)

print('GradientBoostingClassifier')
print(confusion_matrix(y_test,y_pred))
print(classification_report(y_test,y_pred))
print(accuracy_score(y_test, y_pred))
