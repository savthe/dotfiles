from ranger.api.commands import *


class ben(Command):
    """:echo <text>

    Display the text in the statusbar.
    """

    def execute(self):
        #self.fm.run(['/home/sav/git/benny_converter/benny_conv.py', self.fm.thisfile])
        self.fm.run(['cat', self.fm.thisfile])
