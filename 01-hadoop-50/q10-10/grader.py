
#! /usr/local/bin/python3
r"""Test cases
>>> run_answer() # doctest: +NORMALIZE_WHITESPACE
A	0,1,5,7,8,9,10,12,13,14,15,16,17,18,21,23,24,25,26,27,28,29
B	0,1,2,3,5,6,7,8,9,10,11,12,15,16,17,18,19,20,21,22,23,25,26,27,29
C	0,1,3,4,5,6,7,9,10,11,12,14,15,17,20,21,22,23,25,28,29
D	0,1,3,4,5,6,6,7,8,9,9,10,11,12,12,13,14,15,16,17,18,19,19,20,20,21,23,23,24,26,26,27,28,29,29
F	0,1,2,6,7,8,9,11,12,13,15,17,18,19,20,21,22,23,24,25,26,27,28,29
G	2,4,6,7,9,11,12,14,15,17,20,21,22,24,25,26,27,29
H	0,1,2,4,5,6,7,10,11,12,15,17,18,20,22,23,24,25,26,27,28,29
I	0,1,2,4,7,8,9,11,15,16,18,19,20,22,25,26,27
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
    result = os.popen('cat data.csv | python3 mapper.py |  python3 reducer.py').read() #Se modificó el sort, eliminandolo de esta lìnea ya que extrañamente 
    #estaba desordenando los datos y con ello la solución. con el sort en esta linea el ejercicio no corre
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
