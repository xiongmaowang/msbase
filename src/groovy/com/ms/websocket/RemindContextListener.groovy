package com.ms.websocket

import com.ms.base.User
import grails.converters.JSON
import grails.util.Environment
import org.apache.tomcat.websocket.WsSession
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes as GA
import org.slf4j.Logger
import org.slf4j.LoggerFactory

import javax.servlet.ServletContext
import javax.servlet.ServletContextEvent
import javax.servlet.ServletContextListener
import javax.servlet.annotation.WebListener
import javax.servlet.http.HttpSession
import javax.websocket.*
import javax.websocket.server.ServerContainer
import javax.websocket.server.ServerEndpoint

@WebListener
@ServerEndpoint(value="/remind")
public class RemindContextListener implements ServletContextListener {
	
	private final Logger log = LoggerFactory.getLogger(getClass().name)
	
	static final Map<Session, String> userMap = new HashMap<String, String>()

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext servletContext = event.servletContext
		final ServerContainer serverContainer = servletContext.getAttribute("javax.websocket.server.ServerContainer")
		try {
			try {
				if (Environment.current == Environment.DEVELOPMENT) {
					serverContainer.addEndpoint(RemindContextListener)
				}
			} catch (Exception e) {
				log.info "addEndpoint failed for DEVELOPMENT --RemindContextListener"
			}

			def ctx = servletContext.getAttribute(GA.APPLICATION_CONTEXT)

			def grailsApplication = ctx.grailsApplication

			def config = grailsApplication.config
			int defaultMaxSessionIdleTimeout = config.myservlet.timeout ?: 0
			serverContainer.defaultMaxSessionIdleTimeout = defaultMaxSessionIdleTimeout
		}
		catch (IOException e) {
			log.error e.message, e
		}
	}
	


    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    }
	
	@OnOpen
	public void handleOpen(Session session) {

	}


	@OnMessage
	public void handleMessage(String message, Session session) throws IOException {
		def json = JSON.parse(message)
		if (json.connect) {  //连接  {connect: true, uid: "xxxx"}
			userMap.put(session, json.uid)
		} else { //获取提醒  {to: "xxxx"}
			def isSend = false
			String to = json.to  //接收人(有新提醒,即消息或回复时)
			for (Session curr : userMap.keySet()) {
				if (userMap.get(curr) == to) {
					isSend = true
					curr.getBasicRemote().sendText(([remind: true] as JSON ) as String) //给对应的人发送更新提醒的消息
				}
			}
			if (!isSend) {  //没有找到对应的人
				session.getBasicRemote().sendText(([remind: false, info: "要提醒的人不在线"] as JSON ) as String)
			}
		}

	}

	@OnClose
	public void handeClose(Session session) {
		Iterator<Map.Entry<Session, String>> it = userMap.entrySet().iterator()
		while(it.hasNext()){
			Map.Entry<Integer, String> entry = it.next()
			Session key = entry.getKey()
			if(key == session){
				it.remove()
				break
			}
		}

	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace()
	}
	
}
