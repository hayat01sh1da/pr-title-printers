import unittest
import sys
sys.path.append('./src')
from application import Application

class TestApplication(unittest.TestCase):
    def test_run(self):
        branch_name = 'hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch'
        self.assertEqual(Application(branch_name = branch_name).run(), '[service] This Is A Test Branch')

    def test_run_in_the_case_of_hotfix(self):
        branch_name = 'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch'
        self.assertEqual(Application(branch_name = branch_name).run(), '[Hotfix][service] This Is A Test Branch')

if __name__ == '__main__':
    unittest.main()
