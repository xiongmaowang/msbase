<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/1/22
  Time: 9:26
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<button type="button" onclick="sendRemind()">发送更新提醒</button>
<script type="text/javascript">

    function connect(address, path) {
        var currWebsocket;
        if ('WebSocket' in window) {
            currWebsocket = new WebSocket("ws://" + address + path);
        } else if ('MozWebSocket' in window) {
            currWebsocket = new MozWebSocket("ws://" + address + path);
        } else {
            console.log("不支持websocket");
        }
        return currWebsocket;
    }

    var address = "${request.serverName}:${request.serverPort}${request.contextPath}/";
    var websocket = connect(address, "remind");

    if(websocket) {
        websocket.onopen = function (evnt) {
            console.log("连接成功,发送测试帐号test的信息..");
            var info = {uid: "test", connect: true};
            websocket.send(JSON.stringify(info));  //发送用户信息
        };

        websocket.onmessage = function (evnt) {
            var json = JSON.parse(evnt.data);
            if (json.remind) {  //接收到新消息或回复
                //重新获取提醒
                //refreshRemind(url);
                console.log("接收到更新提醒的消息,test将重新获取提醒");
            }
        };

        websocket.onerror = function (evnt) {

        };
        websocket.onclose = function (evnt) {
            console.log("关闭成功..");
        }
    }
    //给对应的人发送要更新提醒的消息
    function sendRemind() {
        if(websocket) {
            var info = {to: "admin"};
            websocket.send(JSON.stringify(info));
            console.log("给admin发送要更新提醒的消息")
        }
    }

</script>
</body>
</html>