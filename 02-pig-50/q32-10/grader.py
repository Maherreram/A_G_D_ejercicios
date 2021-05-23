
##! /usr/local/bin/python3
r"""Test cases
>>> run_answer() # doctest: +NORMALIZE_WHITESPACE
18,Chadwick,Knight,1973-04-29,yellow,1
17,Chanda,Boyer,1973-04-01,green,4
16,Ayanna,Jarvis,1974-02-11,orange,5
15,Hope,Silva,1970-07-01,blue,5
14,Clio,Noel,1972-12-12,red,5
13,Vivian,Crane,1970-08-27,gray,5
12,Hope,Coffey,1973-12-24,green,5
11,Jordan,Estes,1969-12-07,indigo,4
10,Kylan,Sexton,1975-02-28,black,4
9,Merritt,Guy,1974-10-17,indigo,4
8,Karyn,Diaz,1969-02-24,red,1
7,Driscoll,Klein,1970-10-05,blue,5
6,Gretchen,Kinney,1974-10-18,viole,1
5,Zoe,Conway,1974-07-03,blue,2
4,Roth,Fry,1975-01-29,black,1
3,Cody,Garrett,1973-04-22,orange,1
2,Karen,Holcomb,1974-05-23,green,4
1,Vivian,Hamilton,1971-07-08,green,1
<BLANKLINE>

"""
import doctest
import subprocess
import os

def run_answer():
    '''Codigo especifico para ejecutar la respuesta'''
    #----------------------------------------------------------------------------------------------
    # Ejecuta el código del estudiante
    #----------------------------------------------------------------------------------------------
    result = os.popen("pig -execute 'run question.pig'").read()
    result = os.popen("cat output/*").read()
    print(result)

#--------------------------------------------------------------------------------------------------
# Grader (generic)
#--------------------------------------------------------------------------------------------------
subprocess.run(['rm', '-f', '_SUCCESS']) # borra el flag de exito de la corrida
RESULT = doctest.testmod()               # ejecuta el doctest
FAIL, _ = RESULT                         # fail, total
if FAIL == 0:                            # grading
    open('_SUCCESS', 'a').close()        #
else:
    print('\n')
#--------------------------------------------------------------------------------------------------
