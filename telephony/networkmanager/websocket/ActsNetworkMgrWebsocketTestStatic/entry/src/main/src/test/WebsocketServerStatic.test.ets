/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'WebSocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${caseName} expect error ${JSON.stringify(err)}`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

export default function WebsocketServerStaticTest() {
  describe("WebsocketServerStaticTest", (): void => {
    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStartStatic0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStartStatic_0100
     * @tc.desc   Start a WebSocketServer(errorCode:2302002)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStartStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStartStatic0100';
      hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        hilog.info(domain, tag, '%{public}s', `${caseName} --> ${server}`);
        let serverCert: webSocket.ServerCert = {
          certPath: "./index.test",
          keyPath: "./index.test"
        }
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 9055,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
          serverCert: serverCert,
        }
        server.start(serverConfig).then(async (success: boolean) => {
          if (success){
            hilog.info(domain, tag, '%{public}s', `${caseName} webSocketServer start success`)
            expectFail(`${caseName} webSocketServer start success`);
            done()
            server.stop()
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          }
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(err.code === 2302002, `${caseName} test result error ${JSON.stringify(error)}`)
          done()
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        })
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStartStatic0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStartStatic_0200
     * @tc.desc   Start a WebSocketServer(errorCode:2302005)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStartStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStartStatic0200';
      hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        hilog.info(domain, tag, '%{public}s', `${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 88889999,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
        };

        await server.start(serverConfig).then(async (success: boolean) => {
          if (success) {
            hilog.info(domain, tag, '%{public}s', `${caseName} webSocketServer start success`)
            expectFail(`${caseName} webSocketServer start`);
            done();
            server.stop();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          } else {
            expectFail(`${caseName} webSocketServer start fail`);
            done();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          }
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(err.code === 2302005, `${caseName} test result error ${JSON.stringify(error)}`);
          done();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStartStatic0300
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStartStatic_0300
     * @tc.desc   Start a WebSocketServer (errorCode:2302004)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStartStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStartStatic0300';
      hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        hilog.info(domain, tag, '%{public}s', `${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0..",
          serverPort: 9056,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        };

        server.start(serverConfig).then(async (success: boolean) => {
          if (success) {
            hilog.info(domain, tag, '%{public}s', `${caseName} webSocketServer start success`);
            expectFail(`${caseName} webSocketServer start`);
            done();
            server.stop();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          } else {
            expectFail(`${caseName} webSocketServer start fail`);
            done();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          }
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(err.code === 2302004, `${caseName} test result error ${JSON.stringify(error)}`);
          done();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStartStatic0400
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStartStatic_0400
     * @tc.desc   Start a WebSocketServer (errorCode:2302999)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStartStatic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStartStatic0400';
      hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        hilog.info(domain, tag, '%{public}s', `${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 9057,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 11,
        };

        server.start(serverConfig).then(async (success: boolean) => {
          if (success) {
            hilog.info(domain, tag, '%{public}s', `${caseName} webSocketServer start success`);
            expectFail(`${caseName} webSocketServer start`);
            done();
            server.stop();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          } else {
            expectFail(`${caseName} webSocketServer start fail`);
            done();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          }
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(err.code === 2302999, `${caseName} test result error ${JSON.stringify(error)}`);
          done();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      }
    });
    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStartStatic0500
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStartStatic_0500
     * @tc.desc   Start a WebSocketServer with port already occupied (errorCode:2302007)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStartStatic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStartStatic0500';
      hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
      try {
        let testPort: number = 80;
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        hilog.info(domain, tag, '%{public}s', `${caseName} --> server: ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: testPort,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        };

        server.start(serverConfig).then(async (success: boolean) => {
          if (success) {
            hilog.info(domain, tag, '%{public}s', `${caseName} server start success`);
            expectFail(`${caseName} server should fail with port occupied`);
            server.stop();
            done();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          } else {
            hilog.info(domain, tag, '%{public}s', `${caseName} server start fail`);
            expectFail(`${caseName} server start failed`);
            done();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          }
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} server error ${JSON.stringify(error)}`);
          ExpectTrue(err.code === 2302007, `${caseName} test result error ${JSON.stringify(error)}`);
          done();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      }
    });
  })
}