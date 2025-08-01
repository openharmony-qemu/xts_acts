import WebSocketTest from "./WebSocket.test";
import webSocketCreateTest from "./WebSocketCreate.test";
import webSocketJsunit from './WebSocketJsunit.test';
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';

let isDefaultNet: boolean = connection.hasDefaultNetSync();

export default function testsuite() {
    webSocketJsunit();
    if(isDefaultNet){
        webSocketCreateTest();
        WebSocketTest();
    }else{
        EmptyTest();
    }

}
