import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import webSocket from '@ohos.net.webSocket';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'webSocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let ws: webSocket.WebSocket = webSocket.createWebSocket();
let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
let serverConfig: webSocket.WebSocketServerConfig ={
  serverIP: "0.0.0.0",
  serverPort: 8088,
  maxConcurrentClientsNumber: 10,
  maxConnectionsForOneClient: 4,
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test sucess`);
  }
}
export default function webSocketNoPTest() {

  describe("WebSocketNoPTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ConnectCode201Callback_0100
     * @tc.name  : testNetworkMgrWebSocketConnectCode201Callback_static_0100
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketConnectCode201Callback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCode201Callback_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let url: string = 'ws://';
        ws.connect(url, (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, '%{public}s', caseName +': test result error ->'+JSON.stringify(error)+' and value is '+value);
          ExpectTrue(error !== null && error?.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ConnectOptionsCode201Callback_0200
     * @tc.name  : testNetworkMgrWebSocketConnectOptionsCode201Callback_static_0200
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketConnectOptionsCode201Callback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnectOptionsCode201Callback_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let url: string = 'ws://';
        let options: webSocket.WebSocketRequestOptions = {};
        ws.connect(url, options, (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, '%{public}s', caseName +' value -> '+value +' err -> '+JSON.stringify(error));
          ExpectTrue(error !== null && error?.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ConnectOptionsCode201Promise_0300
     * @tc.name  : testNetworkMgrWebSocketConnectOptionsCode201Promise_static_0300
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketConnectOptionsCode201Promise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnectOptionsCode201Promise_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let url: string = 'ws://';
        let options: webSocket.WebSocketRequestOptions = {};
        let result: boolean = await ws.connect(url, options);
        hilog.info(domain, tag, '%{public}s', caseName +': result ->'+result);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCode201Callback_0100
     * @tc.name  : testNetworkMgrWebSocketSendCode201Callback_static_0100
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketSendCode201Callback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCode201Callback_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ws.send('hello world', (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          ExpectTrue(error !== undefined && error?.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error : '+ JSON.stringify(err))
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCode201Promise_0200
     * @tc.name  : testNetworkMgrWebSocketSendCode201Promise_static_0200
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketSendCode201Promise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCode201Promise_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let result: boolean = await ws.send('hello world');
        hilog.info(domain, tag, '%{public}s', caseName +':test result ->'+result);
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error : '+ JSON.stringify(err))
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCode201Callback_0100
     * @tc.name  : testNetworkMgrWebSocketCloseCode201Callback_static_0100
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketCloseCode201Callback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketCloseCode201Callback_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          ws.close((error: BusinessError<void> | null, value: boolean | undefined) => {
            hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
            ExpectTrue(error !== undefined && error?.code === 201);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseOptionsCode201Callback_0200
     * @tc.name  : testNetworkMgrWebSocketCloseOptionsCode201Callback_static_0200
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketCloseOptionsCode201Callback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseOptionsCode201Callback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let options: webSocket.WebSocketCloseOptions = {
          code: 10000011,
          reason: 'permission denied'
        };
        ws.close(options, (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          ExpectTrue(error !== undefined && error?.code === 201);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerClose201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerClose201Error_static_0100
     * @tc.desc  : WebSocketServer close a connection(201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerClose201Error_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerClose201Error_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ 'test start');
      try {
        if(!server) {
          hilog.info(domain, tag, '%{public}s', caseName+ 'Server is nullptr');
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        } else {
          server.start(serverConfig).then((success: boolean | undefined) => {
            if (success){
              hilog.info(domain, tag, '%{public}s', caseName+ 'webSocketServer start success');
            }else {
              ExpectFail();
              done()
              hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
            }
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName + ' test result error : '+ JSON.stringify(err))
            ExpectTrue(err.code == 201)
            done()
            hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          })
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          hilog.info(domain, tag,`${caseName}client-- >${client}`)

          await Utils.msSleep(20);
          let connections = server.listAllConnections()
          hilog.info(domain, tag,`${caseName} connections-->+ ${JSON.stringify(connections[0])}`)
          server.close(connections[0]).then((success: boolean | undefined) => {
            if (success) {
              ExpectTrue(true)
              hilog.info(domain, tag, `${caseName} server close success`)
              done()
              server.stop()
              hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
            } else{
              ExpectFail();
              done()
              server.stop()
              hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
            }
          }).catch((err: Error) => {
            let error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 201)
            done();
            hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          })
        }
      } catch (error: Error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201)
        done();
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerSend201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerSend201Error_static_0100
     * @tc.desc  : WebSocketServer send a massage(201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerSend201Error_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerSend201Error_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8088,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        if(!server) {
          hilog.info(domain, tag, `${caseName} Server is nullptr`);
          ExpectTrue(true);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }else {
          server.start(serverConfig).then((success: boolean | undefined) => {
            if (success){
              hilog.info(domain, tag, `${caseName} webSocketServer start success`)
            }else {
              ExpectFail();
              done()
              hilog.info(domain, tag, `${caseName} test end`);
            }
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 201)
            done()
            hilog.info(domain, tag, `${caseName} test end`);
          })
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          hilog.info(domain, tag, `${caseName}client-- >${client}`)
          await Utils.msSleep(20);
          let connections = server.listAllConnections()
          server.send("hello client", connections[0]).then((success: boolean | undefined) => {
            if (success){
              hilog.info(domain, tag, `${caseName} send success`)
              ExpectTrue(success)
              done()
              hilog.info(domain, tag, `${caseName} test end`);
            }else{
              hilog.info(domain, tag, `${caseName} send fail`);
              ExpectFail();
              done()
              hilog.info(domain, tag, `${caseName} test end`);
            }
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} test send fail ${JSON.stringify(err)}`);
            ExpectTrue(err?.code == 201)
            server.stop()
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        }
      } catch (error: Error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err?.code == 201)
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerListAllConnections201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerListAllConnections201Error_static_0100
     * @tc.desc  : WebSocketServer list all connections(201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerListAllConnections201Error_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerListAllConnections201Error_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ 'test start');
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8088,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        if(!server) {
          hilog.info(domain, tag, `${caseName} Server is nullptr`);
          ExpectTrue(true);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }else {
          server.start(serverConfig).then((success: boolean | undefined) => {
            if (success) {
              hilog.info(domain, tag, `${caseName}start success`)
            }else{
              hilog.info(domain, tag, `${caseName}start fail`)
              done()
              hilog.info(domain, tag, `${caseName} test end`);
            }
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} server.start test result error ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201)
            done()
            hilog.info(domain, tag, `${caseName} test end`);
          })
          let callback = (connection: webSocket.WebSocketConnection) => {
            hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);
          }
          server.onConnect(callback);
          await Utils.msSleep(100);
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          hilog.info(domain, tag, `${caseName} client-- >${client}`)
          client.connect('ws://127.0.0.1:8088', (err: BusinessError<void> | null, value: Boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
            } else {
              hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
              ExpectFail();
              done()
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
          await Utils.msSleep(100);
          let connections = server.listAllConnections()
          hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connections[0])}`);
          if (connections.length != 0) {
            hilog.info(domain, tag, `${connections}`)
            ExpectTrue(true)
            done()
            hilog.info(domain, tag, `${caseName} test end1`)
          }else{
            ExpectFail();
            done()
            hilog.info(domain, tag, `${caseName} test end2`)
          }
        }
      }catch (error: Error){
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} error--${err}`)
        ExpectTrue(err.code == 201)
        hilog.info(domain, tag, `${caseName} test end3`)
      }
    })
  })
}