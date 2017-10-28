import org.codehaus.groovy.grails.documentation.MetadataGeneratingExpandoMetaClass

class BootStrap {
	def systemService
    def init = { servletContext ->
		systemService.systemInit()
        systemService.utilInit()
    }
    def destroy = {
    }
}
