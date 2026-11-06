'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, TestType, Size, Level, expect, beforeAll, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import hilog from '@ohos.hilog';
import Context from "application.Context";
import { ArrayBufferToString, stringToArrayBuffer } from './utils';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let context: Context | undefined;

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

export default function LocalSocketTest(): void {
  describe('LocalSocketTest', () => {
    beforeAll(() => {
      context = abilityDelegator.getAppContext();
      hilog.info(domain, tag, `context : ${JSON.stringify(context)}`);
    })

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind_static_0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_Bind_0100
     * @tc.desc   Bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketBind_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let sandboxPath: string = context?.filesDir + '/testSocket';
          hilog.info(domain, tag, '%{public}s', `${sandboxPath}`)
          let address: socket.LocalAddress = {
            address: sandboxPath
          }
          await client.bind(address).then(() => {
            hilog.info(domain, tag, '%{public}s', 'bind success')
            expectTrue(true)
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} failed to bind: , code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          client.close()
          done()
        } catch (error) {
          expectFail();
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_Connect_0100
     * @tc.desc   Connect to the specified socket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketConnect_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let sandboxPath: string = context?.filesDir + '/testSocket';
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`)
            let client: socket.LocalSocket = socket.constructLocalSocketInstance();
            let connectOpt: socket.LocalConnectOptions = {
              address: localAddr,
              timeout: 6000
            }
            client.connect(connectOpt).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect success`)
              expectTrue(true)
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code: ${JSON.stringify(err.code)}, msg:${JSON.stringify(err.message)}`);
              expectFail()
              done();
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest_static_0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0100
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`)
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} connect success`)
            let sendOpt: socket.LocalSendOptions = {
              data: 'Hello world!'
            }
            return client.send(sendOpt)
          }).then(() => {
            hilog.info(domain, tag, '%{public}s', 'client send success')
            expectTrue(true)
          })
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          client.close()
          done()
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest_static_0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0200
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
            let sendOpt: socket.LocalSendOptions = {
              data: 'Hello world!',
              encoding: 'UTF-8',
            }
            return client.send(sendOpt)
          }).then(() => {
            hilog.info(domain, tag, '%{public}s', 'client send success')
            expectTrue(true)
          })
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          client.close()
          done()
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest_static_0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0300
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
            let sendOpt: socket.LocalSendOptions = {
              data: stringToArrayBuffer('Hello, server!'),
              encoding: 'UTF-8',
            }
            return client.send(sendOpt)
          }).then(() => {
            hilog.info(domain, tag, '%{public}s', 'client send success')
            expectTrue(true)
          })
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          client.close()
          done()
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketGetState_static_0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_getState_0100
     * @tc.desc   test LocalConnection connection GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketGetState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketGetState_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
            return client.getState()
          }).then(() => {
            hilog.info(domain, tag, '%{public}s', 'get state success')
            expectTrue(true)
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail()
          })
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          client.close()
          done()
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_getSocketFd_0100
     * @tc.desc   test LocalConnection connection GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketGetSocketFd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketGetSocketFd_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
            return client.getSocketFd()
          }).then((data: int) => {
            hilog.info(domain, tag, '%{public}s', 'fd' + data)
            expectTrue(data != null)
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail()
          })
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          client.close()
          done()
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSetExtraOptions_static_0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_setExtraOptions_0100
     * @tc.desc   test LocalSocket connection SetExtraOptions function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSetExtraOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketSetExtraOptions_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
            return client.getSocketFd()
          }).then((data: int) => {
            hilog.info(domain, tag, '%{public}s', 'fd' + data)
            expectTrue(true)
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            client.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            client.close();
            done();
          })
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketServerGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_GetSocketFd_0100
     * @tc.desc   test LocalSocketServer getSocketFd function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketServerGetSocketFd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testLocalSocketServerGetSocketFd_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let sandboxPath: string = context?.filesDir + '/testSocket';
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            expectFail();
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          })
          await server.getSocketFd().then((serverFd: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success fd:${JSON.stringify(serverFd)}`);
            expectTrue(serverFd !== -1);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen or getSocketFd err: ${JSON.stringify(err)}`);
            expectFail();
          });
          await server.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} close server err: ${err.message}`);
            expectFail();
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketServerGetSocketFd_static_0200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_GetSocketFd_0200
     * @tc.desc   test LocalSocketServer getSocketFd function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketServerGetSocketFd_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testLocalSocketServerGetSocketFd_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          await server.getSocketFd().then((serverFd: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success fd:${JSON.stringify(serverFd)}`);
            expectTrue(serverFd === -1);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen or getSocketFd err: ${JSON.stringify(err)}`);
            expectFail();
          });
          await server.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} close server err: ${err.message}`);
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketConnectionGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketConnection_GetSocketFd_0100
     * @tc.desc   test LocalSocketConnection getSocketFd function (Promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketConnectionGetSocketFd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testLocalSocketConnectionGetSocketFd_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let client: socket.LocalSocket = socket.constructLocalSocketInstance();
          let sandboxPath: string = context?.filesDir + '/testSocket';
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          };
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          server.onConnect((connection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} server accept connection success`);
            connection.getSocketFd().then((fd: int) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} get Connection FD success: ${fd}`);
              expectTrue(fd !== -1);
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getSocketFd err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              server.offConnect();
              connection.close().catch(() => {
                expectFail();
              });
              client.close();
              server.close().catch(() => {
                expectFail();
              });
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });

          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          };
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          })
          // hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          // done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketConnectionGetSocketFd_static_0200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketConnection_GetSocketFd_0200
     * @tc.desc   test LocalSocketConnection getSocketFd function (Promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketConnectionGetSocketFd_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testLocalSocketConnectionGetSocketFd_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let client: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket';
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          };
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          server.onConnect((connection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} server accept connection success`);
            connection.getSocketFd().then((fd: int) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} get Connection FD success: ${fd}`);
              expectTrue(fd !== -1);
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getSocketFd err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              server.offConnect();
              connection.close().catch(() => {
                expectFail();
              });
              client.close();
              server.close().catch(() => {
                expectFail();
              });
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });

          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          };
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail()
            done()
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          })
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketOn_static_0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_On_Message_0100
     * @tc.desc   test LocalSocket On message function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketOn_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testLocalSocketOn_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          let callback: Callback<socket.LocalSocketMessageInfo> = (data: socket.LocalSocketMessageInfo) => {
            let messageView = ArrayBufferToString(data.message);
            hilog.info(domain, tag, '%{public}s', `${caseName} total: ` + JSON.stringify(data));
            hilog.info(domain, tag, '%{public}s', `${caseName} message infomation: ` + messageView);
            expectTrue(data.message != undefined && data.address != undefined && data.size != undefined);
            server.offConnect();
            client.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          client.onLocalSocketMessage(callback);
          let sendOpt: socket.LocalSendOptions = {
            data: 'Hello world!'
          }
          server.onConnect((connection: socket.LocalSocketConnection) => {
            connection.send(sendOpt).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connection send success`);
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} 'fail to send, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              done();
            });
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
          }).catch(() => {
            hilog.info(domain, tag, '%{public}s', 'err:')
            done();
          })
        } catch (error) {
          expectFail();
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketConnectionClientId_static_0100
     * @tc.number SUB_Socket_LocalSocketConnection_ClintId_0100
     * @tc.desc   test localSocketConnection ClientId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketConnectionClientId_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testLocalSocketConnectionClientId_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

          let sandboxPath: string = context?.filesDir + '/testSocket';
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let localAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(localAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          server.onConnect((connection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', "Connection clientId:" + connection.clientId)
            expectTrue(connection.clientId != undefined)
          });
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          await client.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', 'connect success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail()
          })
          done()
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind_static_0400
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_Bind_0400
     * @tc.desc   test localSocket Bind function (401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketBind_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let client: socket.LocalSocket = socket.constructLocalSocketInstance()
          let addr: socket.LocalAddress = {
            address: ''
          }
          await client.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'bind success')
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} failed to bind: , code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectEqual(2301098, err.code)
            done()
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          client.close()
          done()
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2301098)
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
  });
}

