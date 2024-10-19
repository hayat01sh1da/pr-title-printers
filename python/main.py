import sys
import os
import shutil
import glob
sys.path.append('./src')
from application import Application

_, branch_name, *_ = sys.argv
print(Application(branch_name).run())

pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)
for pycache in pycaches:
    if os.path.exists(pycache):
        shutil.rmtree(pycache)
