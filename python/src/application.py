import re

class Application:
    def __init__(self, branch_name):
        self.branch_name = branch_name

    def run(self):
        string_array = re.split(r'\/', self.branch_name)
        *prefixes, branch_topic = string_array[-3:] if string_array[2] == 'hotfix' else string_array[-2:]
        return f'{self.__labels__(prefixes)} {self.__pr_topic__(branch_topic)}'

    # private

    def __labels__(self, prefixes):
        if 'hotfix' in prefixes:
            prefixes[0] = f'[{prefixes[0].capitalize()}]'
            prefixes[-1] = f'[{prefixes[-1]}]'
            return ''.join(prefixes)
        else:
            prefixes[0] = f'[{prefixes[0]}]'
            return ''.join(prefixes)

    def __pr_topic__(self, branch_topic):
        _branch_topic = []
        for word in re.split(r'[\-\_]', branch_topic):
            _branch_topic.append(word.capitalize())
        return ' '.join(_branch_topic)
