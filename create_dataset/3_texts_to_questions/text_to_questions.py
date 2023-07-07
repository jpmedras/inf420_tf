import re
import os
import sys

year = sys.argv[1]
day = sys.argv[2]
page = sys.argv[3]
div = sys.argv[4]

cur_path = os.path.dirname(__file__)

path_r = "../2_pages_to_text" + "/" + year + "/" + day + "/" + "page" + page + ".txt"
path_w = "../3_texts_to_questions" + "/" + year + "/" + day

read_path = os.path.relpath(path_r, cur_path)
write_path = os.path.relpath(path_w, cur_path)

with open(read_path, 'r') as f:
	text = f.read()

result = re.sub(r"ENEM\n" + year + "\n", "", text)
result = re.sub(r"A\nA", "A", result)
result = re.sub(r"B\nB", "B", result)
result = re.sub(r"C\nC", "C", result)
result = re.sub(r"D\nD", "D", result)
result = re.sub(r"E\nE", "E", result)
result = re.sub(r"^(?:[\t ]*(?:\r?\n|\r))+", "", result)


separator="\n"+div+" "
questions = []
if (result.find(div) != -1):	
	questions = result.split(separator)

sub = r""+div+" "

for q in questions:
	q = re.sub(sub, "", q)
	number, text = q.split('\n', 1)
	if (number.isnumeric()):
		name = str((int)(number))+"-"+page
		w = open(write_path + "/" + name + ".txt", 'w')
		w.write(text)
