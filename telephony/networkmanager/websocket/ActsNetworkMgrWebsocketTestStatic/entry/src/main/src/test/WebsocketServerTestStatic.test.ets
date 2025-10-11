import { describe, it, expect, beforeAll, Level, TestType, Size,beforeEach } from '../../../hypium';
import { AsyncCallback, BusinessError, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';
import webSocket from '@ohos.net.webSocket';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = ' WebsocketServerTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let PERMISSION_DENIED_CODE:number =201;
let PARAMETER_ERROR_CODE:number =401;

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `${info} test failed ${JSON.stringify(err)}`);
  }
}

function sleep(time: number): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    let delay: Int = Math.floor(time).toInt();
    setTimeout(() => {
      resolve('ok')
    }, delay)
  });
}

export default function WebsocketServerTestStatic() {

  describe('WebsocketServerTestStatic', () => {

    /* *
   * @tc.number: SUB_NetworkMgr_WebSocket_CreateWebSocketServer_0100
   * @tc.name  : testNetworkMgrWebSocketCreateWebSocketServer_static_0100
   * @tc.desc  : Create a WebSocketServer
   * @tc.size  : MediumTest
   * @tc.type  : Function
   * @tc.level : level 3
   */
    it('testNetworkMgrWebSocketCreateWebSocketServer_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketServer_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
       try {
          let wss: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!wss) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${wss}`);
            expect(true).assertEqual(wss !== null);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_CreateWebSocketServerCallback_0200
    * @tc.name  : testNetworkMgrWebSocketCreateWebSocketServer_static_0200
    * @tc.desc  : Create two WebSocketServers
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testNetworkMgrWebSocketCreateWebSocketServer_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketServer_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server1: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server1) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            let server2: webSocket.WebSocketServer = webSocket.createWebSocketServer();
            hilog.info(domain, tag, `${caseName} --> ${server1}`);
            hilog.info(domain, tag, `${caseName} --> ${server2}`);
            expect(true).assertEqual(server1 !== server2);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });
    /* *
        * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0100
        * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0100
        * @tc.desc  : Start a WebSocketServer (serverConfig without cert and protocol)
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
    it('testNetworkMgrWebSocketWebSocketServerStart_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8088,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                ExpectTrue(true);
                done()
                server.stop()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
      * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0200
      * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0200
      * @tc.desc  : Start a WebSocketServer (serverConfig contain protocol)
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it("testNetworkMgrWebSocketWebSocketServerStart_static_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8089,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
              protocol: "my-protocol",
            }
            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                ExpectTrue(true);
                done()
                server.stop()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.info(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /* *
   * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0300
   * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0300
   * @tc.desc  : Start a WebSocketServer (serverConfig contain protocol and cert)
   * @tc.size  : MediumTest
   * @tc.type  : Function
   * @tc.level : level 3
   */
    it("testNetworkMgrWebSocketWebSocketServerStart_static_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0300';
        console.info(`${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverCert: webSocket.ServerCert = {
              certPath: "",
              keyPath: ""
            }
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8090,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
              protocol: "my-protocol",
              serverCert: serverCert,
            }
            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                ExpectTrue(true);
                done()
                server.stop()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0400
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0400
     * @tc.desc  : Start a WebSocketServer
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketWebSocketServerStart_static_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverCert: webSocket.ServerCert = {
              certPath: "",
              keyPath: ""
            }
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: undefined,
              serverPort: 8091,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
              protocol: "my-protocol",
              serverCert: serverCert,
            }
            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                ExpectTrue(true);
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expectFail(`${caseName} webSocketServer start fail`)
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName}  error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0500
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0500
     * @tc.desc  : Start a WebSocketServer(errorCode:2302002)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketWebSocketServerStart_static_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverCert: webSocket.ServerCert = {
              certPath: "./index.test",
              keyPath: "./index.test"
            }
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8092,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
              protocol: "my-protocol",
              serverCert: serverCert,
            }

            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                expect().assertTrue();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((err: Error) => {
              let error = err as  BusinessError;
              hilog.error(domain, tag, `${caseName} code ${error.code}  error ${JSON.stringify(error)}`);
              expect(true).assertEqual(error.code === 2302002);
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });
    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0600
    * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0600
    * @tc.desc  : Start a WebSocketServer(errorCode:2302005)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkMgrWebSocketWebSocketServerStart_static_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {

        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 123456489,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
              protocol: "my-protocol",
            }
            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((err: Error) => {
              let error = err as  BusinessError;
              hilog.error(domain, tag, `${caseName}  error ${JSON.stringify(error)}`);
              expect(true).assertEqual(error.code === 2302005);
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0700
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0700
     * @tc.desc  : Start a WebSocketServer (errorCode:2302004)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketWebSocketServerStart_static_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0700';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0..",
              serverPort: 8093,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((err: Error) => {
              let error = err as  BusinessError;
              hilog.info(domain, tag, `${caseName}  error ${JSON.stringify(error)}`);
              expect(true).assertEqual(error.code === 2302004);
              done()
              hilog.info(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart_0800
    * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart_static_0800
    * @tc.desc  : Start a WebSocketServer (errorCode:2302999)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkMgrWebSocketWebSocketServerStart_static_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart_static_0800';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8094,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 11,
            }
            server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((err: Error) => {
              let error = err as  BusinessError;
              hilog.error(domain, tag, `${caseName}  error ${JSON.stringify(error)}`);
              expect(true).assertEqual(error.code === 2302999);
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
   * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerListAllConnections_0100
   * @tc.name  : testNetworkMgrWebSocketWebSocketServerListAllConnections_static_0100
   * @tc.desc  : WebSocketServer list all connections
   * @tc.size  : MediumTest
   * @tc.type  : Function
   * @tc.level : level 3
   */
    it("testNetworkMgrWebSocketWebSocketServerListAllConnections_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerListAllConnections_static_0100';
        hilog.info(domain, tag, `${caseName} test start`)
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8095,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let callback = (connection: webSocket.WebSocketConnection) => {
              hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);
            }
            hilog.info(domain, tag, `${caseName} connections on connect callback start`);
            server.onConnect(callback)
            hilog.info(domain, tag, `${caseName} connections on connect callback end`);
            await sleep(100)
            let client: webSocket.WebSocket = webSocket.createWebSocket()
            hilog.info(domain, tag, `${caseName}client-- >${client}`)
            client.connect('ws://127.0.0.1:8095', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
              } else {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            })
            await sleep(100);
            let connections = server.listAllConnections()
            hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connections[0])}`);
            if (connections.length != 0) {
              hilog.info(domain, tag, `${connections}`)
              ExpectTrue(true)
              done()
              hilog.info(domain, tag, `${caseName} test end1`)
            } else {
              expect().assertFail();
              done()
              hilog.info(domain, tag, `${caseName} test end2`)
            }
          }
        } catch (error) {
          hilog.error(domain, tag, `${caseName} error--${error}`)
          expect().assertFail();
          hilog.error(domain, tag, `${caseName} test end3`)
        }
      })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerSend_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerSend_static_0100
     * @tc.desc  : WebSocketServer send a massage
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketWebSocketServerSend_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerSend_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8096,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
              } else {
                expect().assertFail();
                ;
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
            await new Promise<string>((resolve) => {
              let client: webSocket.WebSocket = webSocket.createWebSocket()
              hilog.info(domain, tag, `${caseName}client-- >${client}`)
              client.connect('ws://127.0.0.1:8096', (err: BusinessError<void> | null, value: Boolean | undefined) => {
                if (value) {
                  hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
                } else {
                  hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                  expect().assertFail();
                  ;
                  done()
                  hilog.info(domain, tag, `${caseName} test end test end`);
                }
                resolve('ok')
              });

            })
            await sleep(20)

            let connections = server.listAllConnections();
            // 方法 A：使用 for...of（适用于数组或可迭代对象）
            let firstConnection: Object | null = null;
            for (const conn of (Array.isArray(connections) ? connections : Object.values(connections))) {
              firstConnection = conn as Object;
              break;
            }
            if (firstConnection) {
              server.send("hello client", connections[0]).then((success: boolean) => {
                if (success) {
                  hilog.info(domain, tag, `${caseName} send success`)
                  ExpectTrue(success)
                  done()
                  hilog.info(domain, tag, `${caseName} test end`);
                } else {
                  hilog.info(domain, tag, `${caseName} send fail`);
                  expect().assertFail();
                  ;
                  done()
                  hilog.info(domain, tag, `${caseName} test end`);
                }
              }).catch((error: Error) => {
                hilog.error(domain, tag, `${caseName} test send fail ${JSON.stringify(error)}`);
                expect().assertFail();
                server.stop()
                done();
                hilog.error(domain, tag, `${caseName} test end`);
              })
            }
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerSend_0200
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerSend_static_0200
     * @tc.desc  : WebSocketServer send a massage(errorCode:2302006)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketWebSocketServerSend_static_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerSend_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8097,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
              } else {
                expectFail(`${caseName} webSocketServer start fail`)
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
            await new Promise<string>((resolve) => {
              let client: webSocket.WebSocket = webSocket.createWebSocket()
              hilog.info(domain, tag, `${caseName}client-- >${client}`)
              client.connect('ws://127.0.0.1:8097', (err: BusinessError<void> | null, value: Boolean | undefined) => {
                if (value) {
                  hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
                } else {
                  hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                  expect().assertFail();
                  done()
                  hilog.info(domain, tag, `${caseName} test end test end`);
                }
                resolve('ok')
              });

            })
            await sleep(20)
            let wrongConnection: webSocket.WebSocketConnection = {
              clientIP: '1.1.1.1',
              clientPort: 8888
            }
            server.send("hello client", wrongConnection).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} send success`)
                expect().assertFail();
                done()
                console.info(`${caseName} test end`);
              } else {
                hilog.info(domain, tag, `${caseName} send fail`);
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((err: Error) => {
              let error = err as  BusinessError;
              hilog.error(domain, tag, `${caseName} test send fail ${JSON.stringify(error)}`);
              expect(true).assertEqual(error.code === 2302006);
              server.stop()
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err: Error) {
          let error = err as  BusinessError;
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(error)}`);
          expect(true).assertEqual(error?.code === 2302006);
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });
    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerClose_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerClose_static_0100
     * @tc.desc  : WebSocketServer close a connection
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketWebSocketServerClose_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerClose_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8098,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
        }
        try {
         let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
         if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            await server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let client: webSocket.WebSocket = webSocket.createWebSocket()
            hilog.info(domain, tag, `${caseName}client-- >${client}`)
            client.connect('ws://127.0.0.1:8098', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
              } else {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end test end`);
              }
            });
            await sleep(20);
            let connections = server.listAllConnections()
            hilog.info(domain, tag, `${caseName} connections`)
            server.close(connections[0]).then((success: boolean) => {
              if (success) {
                ExpectTrue(true)
                hilog.info(domain, tag, `${caseName} server close success`)
                done()
                server.stop()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                server.stop()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
  * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerClose_0200
  * @tc.name  : testNetworkMgrWebSocketWebSocketServerClose_static_0200
  * @tc.desc  : WebSocketServer close a connection(errorCode:2302006)
  * @tc.size  : MediumTest
  * @tc.type  : Function
  * @tc.level : level 3
  */
    it('testNetworkMgrWebSocketWebSocketServerClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerClose_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8099,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
        }
        try {
         let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
         if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            console.info(`${caseName} test end`);
          } else {
            await server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let client: webSocket.WebSocket = webSocket.createWebSocket()
            hilog.info(domain, tag, `${caseName}client-- >${client}`)
            client.connect('ws://127.0.0.1:8099', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
              } else {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end test end`);
              }
            });
            await sleep(20)
            let wrongConnection: webSocket.WebSocketConnection = {
              clientIP: '1.1.1.1',
              clientPort: 8888
            }
            server.close(wrongConnection).then((success: boolean) => {
              if (success) {
                expectFail(`${caseName} server close success`)
                hilog.info(domain, tag, `${caseName} server close success`)
                done()
                server.stop()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                hilog.info(domain, tag, `${caseName} server close failed`)
                expect().assertFail();
                done()
                server.stop()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((err: Error) => {
              let error = err as BusinessError;
              hilog.error(domain, tag, `${caseName} test close fail ${JSON.stringify(error)}`);
              expect(true).assertEqual(error?.code === 2302006);
              done()
              server.stop()
              hilog.error(domain, tag, `${caseName} test end`);
            })
          }
        } catch (err: Error) {
          let error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} test close catch fail ${JSON.stringify(error)}`);
          expect(true).assertEqual(error?.code === 2302006);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
      * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStop_0100
      * @tc.name  : testNetworkMgrWebSocketWebSocketServerStop_static_0100
      * @tc.desc  : Stop WebSocketServer
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it('testNetworkMgrWebSocketWebSocketServerStop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStop_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8100,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} webSocketServer start success`)
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} test result error ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
              hilog.error(domain, tag, `${caseName} test end`);
            })
            await server.stop().then((success: boolean) => {
              if (success) {
                ExpectTrue(true)
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            })
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOnConnect_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerOnConnect_static_0100
     * @tc.desc  : Subscript to websocket server connect event
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerOnConnect_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnConnect_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8101,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let callback = (connection: webSocket.WebSocketConnection) => {
              hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);
              expect(true).assertEqual(connection !== undefined);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
            server.onConnect(callback);
            await sleep(100);
            let client = webSocket.createWebSocket()
            client.connect('ws://127.0.0.1:8101', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} connect success`)
              } else {
                hilog.info(domain, tag, `${caseName} connect fail`)
              }

            })
            await sleep(100)
            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });
    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffConnect_0100
    * @tc.name  : testNetworkMgrWebSocketWebSocketServerOffConnect_static_0100
    * @tc.desc  : Unsubscript to websocket server connect event
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testNetworkMgrWebSocketWebSocketServerOffConnect_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffConnect_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8102,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let callback = (connection: webSocket.WebSocketConnection) => {
              hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);
              expect(true).assertEqual(connection !== undefined);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
            server.onConnect(callback);
            server.offConnect(callback);
            sleep(100);
            let client = webSocket.createWebSocket();
            client.connect('ws://127.0.0.1:8102', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} connect success`)
              } else {
                hilog.info(domain, tag, `${caseName} connect fail`)
              }

            })
            await sleep(100)
            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
      * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffConnect_0200
      * @tc.name  : testNetworkMgrWebSocketWebSocketServerOffConnect_static_0200
      * @tc.desc  : UnSubscript to websocket server connect event
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it('testNetworkMgrWebSocketWebSocketServerOffConnect_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffConnect_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8103,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let callback = (connection: webSocket.WebSocketConnection) => {
              hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);
              expect(true).assertEqual(connection !== undefined);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
            server.onConnect(callback);
            server.offConnect();
            sleep(100);

            let client = webSocket.createWebSocket()
            client.connect('ws://127.0.0.1:8103', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} connect success`)
              } else {
                hilog.info(domain, tag, `${caseName} connect fail`)
              }

            })
            await sleep(100)
            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOnMsg_0100
    * @tc.name  : testNetworkMgrWebSocketWebSocketServerOnMsg_static_0100
    * @tc.desc  : Subscript to websocket server message received event
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testNetworkMgrWebSocketWebSocketServerOnMsg_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnMsg_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8104,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let callback = (massage: webSocket.WebSocketMessage) => {
              if (massage.data == "hello server") {
                hilog.info(domain, tag, `${caseName} test onMassage success. connection is ${massage.clientConnection}`)
                ExpectTrue(true)
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }
            server.onMessageReceive(callback)
            sleep(100)

            let client: webSocket.WebSocket = webSocket.createWebSocket()
            hilog.info(domain, tag, `${caseName}client-- >${client}`)
            client.onOpen((value: webSocket.OpenResult | undefined) => {
              hilog.info(domain, tag, `${caseName} onopen is ${value?.status} ${value?.message}}`);

              client.send('hello server', (err: BusinessError<void> | null, data: Boolean | undefined) => {
                if (err?.code === 0) {
                  hilog.info(domain, tag, `${caseName} client send message successfully`)
                } else {
                  hilog.info(domain, tag, `${caseName} Failed to send the message. Err:` + JSON.stringify(err));
                  expect().assertFail();
                  done()
                  hilog.info(domain, tag, `${caseName} test end`);
                }
              })
            })
            await sleep(100)
            client.connect('ws://127.0.0.1:8104', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
              } else {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
              }
            });
            await sleep(100)

            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }

        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
* @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffMsg_0100
* @tc.name  : testNetworkMgrWebSocketWebSocketServerOffMsg_static_0100
* @tc.desc  : UnSubscript to websocket server message received event
* @tc.size  : MediumTest
* @tc.type  : Function
* @tc.level : level 3
*/
    it('testNetworkMgrWebSocketWebSocketServerOffMsg_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffMsg_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8105,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let callback = (massage: webSocket.WebSocketMessage) => {
              if (massage.data == "hello server") {
                hilog.info(domain, tag, `${caseName} test onMassage success`)
                ExpectTrue(true)
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }
            server.onMessageReceive(callback);
            server.offMessageReceive(callback);
            sleep(100);
            let client: webSocket.WebSocket = webSocket.createWebSocket()
            hilog.info(domain, tag, `${caseName}client-- >${client}`)
            client.onOpen((value: webSocket.OpenResult | undefined) => {
              hilog.info(domain, tag, `${caseName} onopen is ${value?.status} ${value?.message}}`);

              client.send('hello server', (err: BusinessError<void> | null, data: Boolean | undefined) => {
                if (err?.code === 0) {
                  hilog.info(domain, tag, `${caseName} client send message successfully`)
                } else {
                  hilog.info(domain, tag, `${caseName} Failed to send the message. Err:` + JSON.stringify(err));
                  expect().assertFail();
                  done()
                  hilog.info(domain, tag, `${caseName} test end`);
                }
              })
            })
            sleep(100);
            client.connect('ws://127.0.0.1:8105', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
              } else {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
              }
            });
            await sleep(100)

            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
   * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffMsg_0200
   * @tc.name  : testNetworkMgrWebSocketWebSocketServerOffMsg_static_0200
   * @tc.desc  : UnSubscript to websocket server message received event
   * @tc.size  : MediumTest
   * @tc.type  : Function
   * @tc.level : level 3
   */
    it('testNetworkMgrWebSocketWebSocketServerOffMsg_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffMsg_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8106,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })
            let callback = (massage: webSocket.WebSocketMessage) => {
              if (massage.data == "hello server") {
                hilog.info(domain, tag, `${caseName} test onMassage success`)
                ExpectTrue(true)
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`);
              }
            }
            server.onMessageReceive(callback);
            server.offMessageReceive();
            sleep(100);

            let client: webSocket.WebSocket = webSocket.createWebSocket()
            hilog.info(domain, tag, `${caseName}client-- >${client}`)
            client.onOpen((value: webSocket.OpenResult | undefined) => {
              hilog.info(domain, tag, `${caseName} onopen is ${value?.status} ${value?.message}}`);

              client.send('hello server', (err: BusinessError<void> | null, data: Boolean | undefined) => {
                hilog.info(domain, tag, `${caseName} client send message 111 ${data}` + JSON.stringify(err));
                if (err?.code === 0) {
                  hilog.info(domain, tag, `${caseName} client send message successfully`)
                } else {
                  hilog.info(domain, tag, `${caseName} Failed to send the message. Err:` + JSON.stringify(err));
                  expect().assertFail();
                  done()
                  hilog.info(domain, tag, `${caseName} test end`);
                }
              })
            })
            await sleep(100)
            client.connect('ws://127.0.0.1:8106', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
              } else {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
              }
            });
            await sleep(100)

            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOnErr_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerOnErr_static_0100
     * @tc.desc  : Subscript to websocket server error event
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerOnErr_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnErr_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8107,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            })
            let callback = (err: Error) => {
              hilog.info(domain, tag, `${caseName} err,errcode == ${err.code}`)
              ExpectTrue(true)
              done()
              hilog.info(domain, tag, `${caseName} test end1`);
            }
            server.onWebSocketServerError(callback);
            await sleep(100)
            let wrongConnection: webSocket.WebSocketConnection = {
              clientIP: '1.1.1.1',
              clientPort: 8888
            }
            await server.send("hi", wrongConnection).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} send success`)
              } else {
                hilog.info(domain, tag, `${caseName} send fail`);
              }
            })
            await sleep(100)
            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end2`);
          }
        } catch (err: Error) {
          let error = err as  BusinessError;
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(error)}`);
          expect(true).assertEqual(error?.code === 2302006);
          done()
          hilog.error(domain, tag, `${caseName} test end3`);
        }
      });

    /* *
        * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffErr_0100
        * @tc.name  : testNetworkMgrWebSocketWebSocketServerOffErr_static_0100
        * @tc.desc  : UnSubscript to websocket server error event
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */

    it('testNetworkMgrWebSocketWebSocketServerOffErr_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffErr_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8108,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${caseName} test end`)
              }
            })
            let callback = (err: Error) => {
              hilog.info(domain, tag, `${caseName} err,errcode == ${err.code}`)
              ExpectTrue(true);
              done();
              hilog.info(domain, tag, `${caseName} test end1`);
            }
            server.onWebSocketServerError(callback);
            server.offWebSocketServerError(callback);
            await sleep(100);
            let wrongConnection: webSocket.WebSocketConnection = {
              clientIP: '1.1.1.1',
              clientPort: 8888
            }
            await server.send("hi", wrongConnection).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} send success`)
              } else {
                hilog.info(domain, tag, `${caseName} send fail`);
              }
            })
            await sleep(100);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end2`);
          }
        } catch (err: Error) {
          let error = err as  BusinessError;
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(error)}`);
          expect(true).assertEqual(error?.code === 2302006);
          done();
          hilog.error(domain, tag, `${caseName} test end3`);
        }
      });
    /* *
         * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffErr_0200
         * @tc.name  : testNetworkMgrWebSocketWebSocketServerOffErr_static_0200
         * @tc.desc  : UnSubscript to websocket server error event
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
    it('testNetworkMgrWebSocketWebSocketServerOffErr_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffErr_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} --> ${server}`);
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8109,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            })
            let callback = (err: Error) => {
              let error = err as  BusinessError;
              hilog.info(domain, tag, `${caseName} err,errcode == ${error.code}`)
              ExpectTrue(true);
              done();
              hilog.info(domain, tag, `${caseName} test end1`);
            }
            server.onWebSocketServerError(callback);
            server.offWebSocketServerError();
            await sleep(100)
            let wrongConnection: webSocket.WebSocketConnection = {
              clientIP: '1.1.1.1',
              clientPort: 8888
            }
            await server.send("hi", wrongConnection).then((success: boolean) => {
              if (success) {
                hilog.info(domain, tag, `${caseName} send success`)
              } else {
                hilog.info(domain, tag, `${caseName} send fail`);
              }
            })
            await sleep(100);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end2`);
          }
        } catch (err: Error) {
          let error = err as  BusinessError;
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(error)}`);
          expect(true).assertEqual(error?.code === 2302006);
          done();
          hilog.error(domain, tag, `${caseName} test end3`);
        }
      });

    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOnClose_0100
    * @tc.name  : testNetworkMgrWebSocketWebSocketServerOnClose_static_0100
    * @tc.desc  : Subscript to websocket server close event
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testNetworkMgrWebSocketWebSocketServerOnClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnClose_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8110,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })

            let closeCallback =
              (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
                hilog.info(domain, tag,
                  `${caseName} onclose connection is ${JSON.stringify(clientConnection)} and closeReason is ${JSON.stringify(closeReason)}`);
                expect(true).assertEqual(clientConnection !== undefined);
                done();
                hilog.info(domain, tag, `${caseName} test end1`);
              }
            server.onWebSocketServerClose(closeCallback);
            server.onConnect((connection: webSocket.WebSocketConnection) => {
              hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);

              let closeOption: webSocket.WebSocketCloseOptions = {
                code: 1000,
                reason: "normal"
              }
              server.close(connection, closeOption).then((value: boolean) => {
                hilog.info(domain, tag, `${caseName} close value is ${JSON.stringify(value)}`)
              })
            })
            await sleep(100)
            let client = webSocket.createWebSocket()
            client.connect('ws://127.0.0.1:8110', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} connect success`)
              } else {
                hilog.info(domain, tag, `${caseName} connect fail`)
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              }

            })
            await sleep(100)
            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      }
    );

    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffClose_0100
    * @tc.name  : testNetworkMgrWebSocketWebSocketServerOffClose_static_0100
    * @tc.desc  : UnSubscript to websocket server close event
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testNetworkMgrWebSocketWebSocketServerOffClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffClose_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8111,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })

            let closeCallback =
              (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
                hilog.info(domain, tag,
                  `${caseName} onclose connection is ${JSON.stringify(clientConnection)} and closeReason is ${JSON.stringify(closeReason)}`);
                expect(true).assertEqual(clientConnection !== undefined);
                done();
                hilog.info(domain, tag, `${caseName} test end1`);
              }
            server.onWebSocketServerClose(closeCallback);
            server.offWebSocketServerClose(closeCallback);
            server.onConnect((connection: webSocket.WebSocketConnection) => {
              hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);

              let closeOption: webSocket.WebSocketCloseOptions = {
                code: 1000,
                reason: "normal"
              }
              server.close(connection, closeOption).then((value: boolean) => {
                hilog.info(domain, tag, `${caseName} close value is ${JSON.stringify(value)}`)
              })
            })
            await sleep(100)
            let client = webSocket.createWebSocket()
            client.connect('ws://127.0.0.1:8111', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} connect success`)
              } else {
                hilog.info(domain, tag, `${caseName} connect fail`)
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              }
            })
            await sleep(100)
            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });
    /* *
 * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerOffClose_0200
 * @tc.name  : testNetworkMgrWebSocketWebSocketServerOffClose_static_0200
 * @tc.desc  : UnSubscript to websocket server close event
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : level 3
 */
    it('testNetworkMgrWebSocketWebSocketServerOffClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffClose_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          if (!server) {
            hilog.info(domain, tag, `${caseName} Server is nullptr`);
            ExpectTrue(true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            let serverConfig: webSocket.WebSocketServerConfig = {
              serverIP: "0.0.0.0",
              serverPort: 8112,
              maxConcurrentClientsNumber: 10,
              maxConnectionsForOneClient: 4,
            }
            await server.start(serverConfig).then((value: boolean) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} server start`)
              } else {
                hilog.info(domain, tag, `${caseName} server start fail`)
                expect().assertFail();
                done()
                hilog.info(domain, tag, `${caseName} test end`)
              }
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
              hilog.error(domain, tag, `${caseName} test end`);
            })

            let closeCallback =
              (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
                hilog.info(domain, tag,
                  `${caseName} onclose connection is ${JSON.stringify(clientConnection)} and closeReason is ${JSON.stringify(closeReason)}`);
                expect(true).assertEqual(clientConnection !== undefined);
                done();
                hilog.info(domain, tag, `${caseName} test end1`);
              }
            server.onWebSocketServerClose(closeCallback);
            server.offWebSocketServerClose();
            server.onConnect((connection: webSocket.WebSocketConnection) => {
              hilog.info(domain, tag, `${caseName} connections-->+ ${JSON.stringify(connection)}`);

              let closeOption: webSocket.WebSocketCloseOptions = {
                code: 1000,
                reason: "normal"
              }
              server.close(connection, closeOption).then((value: boolean) => {
                hilog.info(domain, tag, `${caseName} close value is ${JSON.stringify(value)}`)
              })
            })
            await sleep(100)
            let client = webSocket.createWebSocket()
            client.connect('ws://127.0.0.1:8112', (err: BusinessError<void> | null, value: Boolean | undefined) => {
              if (value) {
                hilog.info(domain, tag, `${caseName} connect success`)
              } else {
                hilog.info(domain, tag, `${caseName} connect fail`)
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              }
            })
            await sleep(100)
            ExpectTrue(true)
            done();
            hilog.info(domain, tag, `${caseName} test end1`);
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      });
  })
}