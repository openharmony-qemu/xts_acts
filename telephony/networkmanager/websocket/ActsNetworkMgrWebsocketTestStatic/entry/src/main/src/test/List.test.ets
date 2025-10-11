import WebSocketTest from "./WebSocket.test";
import webSocketCreateTest from "./WebSocketCreate.test";
import webSocketJsunit from './WebSocketJsunit.test';
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';
import WebsocketServerTestStatic from './WebsocketServerTestStatic.test';
import WebsocketTestStatic from './WebsocketTestStatic.test';

let isDefaultNet: boolean = connection.hasDefaultNetSync();

export default function testsuite() {
    webSocketJsunit();
    if(isDefaultNet){
        webSocketCreateTest();
        WebSocketTest();
        WebsocketTestStatic();
        WebsocketServerTestStatic();
    }else{
        EmptyTest();
    }

}
