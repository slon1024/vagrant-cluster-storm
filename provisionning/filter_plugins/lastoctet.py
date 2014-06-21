class FilterModule(object):
    ''' Custom filters are loaded by FilterModule objects '''

    def filters(self):
        ''' FilterModule objects return a dict mapping filter names to
            filter functions. '''
        return {
            'myid': self.myid,
        }
     
    def myid(self, ip):
        sip = ip.split('.')
        last = sip[-1:]
        return ''.join(last)