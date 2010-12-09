import win32serviceutil, win32service, servicemanager
from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
from win32api import GetUserName

# because we don't want to change testCase here
# redir stdout to echo back to the calling client

class IECOMRPCHandler(SimpleXMLRPCRequestHandler):
	def __init__(self, *args):
		SimpleXMLRPCRequestHandler.__init__(self, *args)
		
	def _dispatch(self, method, params):
		SimpleXMLRPCRequestHandler._dispatch(method, params)

	def log_message(self, format, *args):
		LogInfoMsg("""%s, %s"""% (format, ", "+join(args)))

class win32TestFunctions:
	def svn_action(self, action, dir="c:\\docume~1\\%s\\svn\\"% GetUserName(), localdir=""):
		# localdir used for svn checkout
		serviceCommand = ""	

		if lower(action) == "update":
			serviceCommand = "python c:\\Documents and Settings\\%s\\svn\\tests\\common\\win32\\win32RpcTestServer.py"% GetUserName()
			os.system("%s %s"% (serviceCommand, "stop"))

		svnHandle = os.popen("svn %s %s %s"% (action, dir, localdir))
		svnResult = svnHandle.read()
		svnHandle.close()

		if lower(action) == "update":
			os.system("%s %s"% (serviceCommand, "update"))
			os.system("%s %s"% (serviceCommand, "start"))

		return svnHandle

	def run_tests(self):
		testsHandle = os.popen("run_tests.py") # requires windows env_var c:\userhome\svn\tests
		testsResult = testsHandle.read()
		testsHandle.close()
		return testResult

class Win32TestServer (win32serviceutil.ServiceFramework):
	_svc_name_ = "PyRPCTestService"
	_svc_display_name_ = "Python RPC Test Service"
	_svc_description_ = "Python RPC Testing Framework Service"

	def __init__(self, args):
		win32serviceutil.ServiceFramework.__init__(self, args)
		servicemanager.LogMsg(servicemanager.EVENTLOG_INFORMATION_TYPE, servicemanager.PYS_SERVICE_STARTED, (self._svc_name_, ' Finished __init__().'))

	def SvcDoRun(self):
		cStation = win32service.OpenWindowStation("Winsta0", True, 1) 
		#need the default stations since this is running from a service
		cStation.SetProcessWindowStation()
		server = SimpleXMLRPCServer(("192.168.254.116", 96449), IECOMRPCHandler)
		server.register_introspection_functions()
		server.register_instance(win32TestFunctions)
		server.serve_forever()

	def SvcStop(self):
		self.ReportServiceStatus(win32service.SERVICE_STOP_PENDING)
		server.server_close()
		del server
		servicemanager.LogInfoMsg("Killed %s"% sys.argv[0])


if __name__=='__main__':
    win32serviceutil.HandleCommandLine(Win32TestServer)
