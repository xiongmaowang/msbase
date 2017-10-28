class MsbaseBootStrap {
	def systemService
    def init = { servletContext ->
		systemService.systemInit()
        systemService.utilInit()
    }
    def destroy = {
    }
}
