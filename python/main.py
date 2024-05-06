import sys
sys.path.append('./src')
from application import Application

_, branch_name, *_ = sys.argv
print(Application(branch_name).run())
