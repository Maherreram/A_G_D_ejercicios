
##! /usr/local/bin/python3
r"""Test cases
>>> run_answer() # doctest: +NORMALIZE_WHITESPACE
ROBIN,NEWYORK
BOB,KOLKATA
MAYA,TOKYO
SARA,LONDON
DAVID,BHUWANESHWAR
MAGGY,CHENNAI
ROBERT,NEWYORK
SYAM,KOLKATA
MARY,TOKYO
SARAN,LONDON
STACY,BHUWANESHWAR
KELLY,CHENNAI
PETER,TOKYO
LUCAS,LONDON
JOPHIER,BHUWANESHWAR
HANNAH,CHENNAI
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
