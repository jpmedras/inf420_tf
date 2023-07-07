import sys
import pandas as pd

year = sys.argv[1]
day = sys.argv[2]
number = sys.argv[3]
code1 = sys.argv[4]
code2 = sys.argv[5]
lang = sys.argv[6]
color = sys.argv[7]
output = sys.argv[8]

path_read = "ITENS_PROVA_"+ year + ".csv"

df = pd.read_csv(path_read, sep=';', encoding='latin-1')

if ((int) (day) == 1):
	if ((int) (number) <= 5):
		filt = df.loc[(df['CO_POSICAO'] == (int) (number)) & (df['TX_COR'] == color) & (df['TP_LINGUA'] == (int) (lang) ) & (df['CO_PROVA'] == (int) (code1))]
	elif (((int)(number)) <= 45):
		filt = df.loc[(df['CO_POSICAO'] == (int) (number)) & (df['TX_COR'] == color) & (df['CO_PROVA'] == (int) (code1) )]
	elif (((int)(number)) <= 90):
		filt = df.loc[(df['CO_POSICAO'] == (int) (number)) & (df['TX_COR'] == color) & (df['CO_PROVA'] == (int) (code2) )]
if ((int) (day) == 2):
	if (((int)(number)) <= 135):
		filt = df.loc[(df['CO_POSICAO'] == (int) (number)) & (df['TX_COR'] == color) & (df['CO_PROVA'] == (int) (code1) )]
	elif (((int)(number)) <= 180):
		filt = df.loc[(df['CO_POSICAO'] == (int) (number)) & (df['TX_COR'] == color) & (df['CO_PROVA'] == (int) (code2) )]

if (output == 'v'):
	print(filt)

filt = filt.loc[:,["CO_POSICAO", "SG_AREA","CO_HABILIDADE", "TX_GABARITO", "TP_LINGUA", "TX_COR", "CO_PROVA"]]

questao = filt.iloc[0]

area = questao["SG_AREA"] 
hab = questao["CO_HABILIDADE"]

if (output == 'h'):
	print(hab)
elif (output == 'a'):
	print(area)
