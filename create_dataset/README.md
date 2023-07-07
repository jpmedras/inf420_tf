# Etapas

x = ANO

1. Copiar "ENEM_x_P1_CAD_01_DIA_1_AZUL.pdf" e "ENEM_x_P1_CAD_07_DIA_2_AZUL.pdf" para brute_data/x/1 e brute_data/x/2 respectivamente
2. Copiar ITENS_PROVA_x.csv para itens_prova/x
3. Definir lista de páginas a serem utilizadas em list_of_pages/x/1/list e list_of_pages/x/2/list
4. Definir lista de questões a serem *removidas* em list_of_questions/x/1/list e list_of_questions/x/2/list
5. Definir codigos da prova em codigo_prova/x/1/code1 e codigo_prova/x/1/code1 consultando itens_prova/x/ITENS_PROVA_x.csv e comparando com o gabarito de cada prova disponível em data/microdados_enem_x/PROVAS E GABARITOS (no formato "ENEM_x_P1_GAB_01_DIA_1_AZUL.pdf" e "ENEM_x_P1_GAB_07_DIA_2_AZUL.pdf")
6. Modificar year e day em run.sh
7. Executar run.sh
