'use static';
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
import socket from '@ohos.net.socket'
import { describe, it, expect, Level, Size, TestType, afterEach, beforeAll, Hypium } from "../../../hypium/index";
import Context from "application.Context";
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context: Context | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'localSocketServerCloseTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}
const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, ` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

export default function LocalSocketServerCloseTest(): void {
  describe("LocalSocketServerCloseTest", () => {
    beforeAll(() => {
      context = abilityDelegator.getAppContext();
      hilog.info(domain, tag, `context : ${JSON.stringify(context)}`);
    })

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket01';
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on connect`, JSON.stringify(localSocketConnection));
            localServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} localServer close success`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag,
                `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          });
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          await localClient.connect(connectOpt).then(() => {
            hilog.info(domain, tag, `${caseName} localClient connect success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} localClient connect fail , err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0200';
      hilog.info(domain, tag,`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

        let sandboxPath: string = context?.filesDir + '/testSocket02';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
          hilog.info(domain, tag,`${caseName} localServer on connect`, JSON.stringify(localSocketConnection));
          let sendOptions: socket.LocalSendOptions = {
            data: 'Hello, client!'
          }
          localSocketConnection.send(sendOptions).then(()=>{
            hilog.info(domain, tag,`${caseName} localSocketConnection send success`);
            ExpectTrue(true);
            localServer.close().then(()=>{
            hilog.info(domain, tag,`${caseName} localServer close success`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag,`${caseName} get err is `+`code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag,`${caseName}---End`);
            done();
          })
          }).catch((err) => {
            hilog.info(domain, tag,`${caseName} connection send err is `+`code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            localServer.close().then(()=>{
            hilog.info(domain, tag,`${caseName} localServer close success`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag,`${caseName} get err is `+`code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag,`${caseName}---End`);
            done();
          })
          })
        });
        await localServer.listen(listenAddr).then(() => {
          hilog.info(domain, tag,`${caseName} localServer listen success`);
        }).catch((err) => {
          hilog.info(domain, tag,`${caseName} catch listen err is `+`code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag,`${caseName}---End`);
          done();
        });
        let localAddress : socket.LocalAddress = {
          address: sandboxPath
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddress,
        }
        let sendOpt: socket.LocalSendOptions = {
          data: 'Hello world!'
        }
        await localClient.connect(connectOpt).then(() => {
          hilog.info(domain, tag,`${caseName} localClient connect success`);
        }).catch((err) => {
          hilog.info(domain, tag,`${caseName} localClient connect fail , err is` +`code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag,`${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag,`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag,`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0300
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket03';
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((connection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on connect`, JSON.stringify(connection));
            let sendOpt: socket.LocalSendOptions = {
              data: 'Hello world!'
            }
            localClient.send(sendOpt).then(() => {
              hilog.info(domain, tag, `${caseName} localClient send success`);
              ExpectTrue(true);
              localServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} localServer close success`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag,
                `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} localClient send failed, error is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              localServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} localServer close success`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag,
                `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
            })

          });
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          await localClient.connect(connectOpt).then(() => {
            hilog.info(domain, tag, `${caseName} localClient connect success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} localClient connect fail , err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0400
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket04';
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((connection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on connect`, JSON.stringify(connection));
            localServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} localServer close success`);
              localServer.listen(listenAddr).then(() => {
                hilog.info(domain, tag, `${caseName} localServer again listen success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName}  again listen catch err is ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} localServer close get err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName} ---End`);
              done();
            })
          });
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          await localClient.connect(connectOpt).then(() => {
            hilog.info(domain, tag, `${caseName} localClient connect success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} localClient connect fail , err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0500
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket05';
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on connect`, JSON.stringify(localSocketConnection));
            localClient.close().then(() => {
              hilog.info(domain, tag, `${caseName} localClient close success`);
              localServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} localServer close success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} localServer close failed err is ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} localClient close failed err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          });
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          await localClient.connect(connectOpt).then(() => {
            hilog.info(domain, tag, `${caseName} localClient connect success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} localClient connect fail , err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0600
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0600
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket06';
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on connect`);
            localSocketConnection.close().then(() => {
              hilog.info(domain, tag, `${caseName} localSocketConnection close success`);
              localServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} localServer close success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} localServer close failed err is ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} localSocketConnection close failed err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          });
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          await localClient.connect(connectOpt).then(() => {
            hilog.info(domain, tag, `${caseName} localClient connect success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} localClient connect fail , err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0700
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0700
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0700';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket07';
          hilog.info(domain, tag, `${caseName} --- sandboxPath is ` + sandboxPath)
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          await localServer.close().then(() => {
            hilog.info(domain, tag, `${caseName} localServer close success`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag,
              `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0800
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0800
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0800';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();

          let sandboxPath: string = context?.filesDir + '/testSocket08';
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          await localServer.close().then(() => {
            hilog.info(domain, tag, `${caseName} localServer close success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} localServer close get err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName} ---End`);
            done();
          })
          await localServer.close().then(() => {
            hilog.info(domain, tag, `${caseName} localServer close success`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} localServer close get err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_0900
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0900
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_0900';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          localServer.close().then(() => {
            hilog.info(domain, tag, `${caseName} localServer close success`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag,
              `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectTrue(err.code == 2300002);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_1000
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_1000
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_1000';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + `/testSocket01`;
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on  connect`, JSON.stringify(localSocketConnection));
            localServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} localServer close success`);
              localClient.getExtraOptions().then((options: socket.ExtraOptionsBase) => {
                hilog.info(domain, tag, `${caseName} connect options ` + JSON.stringify(options));
                ExpectTrue(options.receiveBufferSize != null);
                ExpectTrue(options.sendBufferSize != null);
                ExpectTrue(options.socketTimeout == undefined);
                done();
              }).catch((err) => {
                hilog.info(domain, tag,
                  `getExtraOptions fail: ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
              });
            }).catch((err) => {
              hilog.info(domain, tag,
                `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
            })
          });
          try {
            await localServer.listen(listenAddr)
            hilog.info(domain, tag, `${caseName} localServer listen success`);
            localServer.getState().then((options: socket.SocketStateBase) => {
              hilog.info(domain, tag, `${caseName} listen options ` + JSON.stringify(options));
              ExpectTrue(options.isBound != null);
              ExpectTrue(options.isClose != null);
              ExpectTrue(options.isConnected != null);
            }).catch((err) => {
              hilog.info(domain, tag,
                `getExtraOptions fail: ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
            });
          } catch(err) {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }

          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          try {
            await localClient.connect(connectOpt).then(() => {
              hilog.info(domain, tag, `${caseName} localClient connect success`);
            }).catch((err) => {
              hilog.info(domain, tag,
                `connect fail: ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
            });
          } catch(err) {
            hilog.info(domain, tag, `${caseName} localClient Connect fail, err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_1100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_1100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_1100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + `/testSocket01`;
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on  connect`, JSON.stringify(localSocketConnection));
            localServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} localServer close success`);
              localClient.getExtraOptions().then((options: socket.ExtraOptionsBase) => {
                hilog.info(domain, tag, `options ` + JSON.stringify(options));
                ExpectTrue(options.receiveBufferSize != null);
                ExpectTrue(options.sendBufferSize != null);
                ExpectTrue(options.reuseAddress != null);
                ExpectTrue(options.socketTimeout == undefined);
                done();
              }).catch((err) => {
                hilog.info(domain, tag,
                  `getExtraOptions fail: ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
              });
            }).catch((err) => {
              hilog.info(domain, tag,
                `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          });
          try {
            await localServer.listen(listenAddr)
            hilog.info(domain, tag, `${caseName} localServer listen success`);
            localServer.getExtraOptions().then((options: socket.ExtraOptionsBase) => {
              hilog.info(domain, tag, `options ` + JSON.stringify(options));
              ExpectTrue(options.receiveBufferSize != null);
              ExpectTrue(options.sendBufferSize != null);
              ExpectTrue(options.reuseAddress != null);
              ExpectTrue(options.socketTimeout == undefined);
            }).catch((err) => {
              hilog.info(domain, tag,
                `getExtraOptions fail: ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            });
          } catch (err) {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }

          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          try {
            await localClient.connect(connectOpt)
            hilog.info(domain, tag, `${caseName} localClient connect success`);
          } catch (err) {
            hilog.info(domain, tag, `${caseName} localClient Connect fail, err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose_static_1200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_1200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose_static_1200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();

          let sandboxPath: string = context?.filesDir + `/testSocket01`;
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, `${caseName} localServer on  connect`, JSON.stringify(localSocketConnection));
            localServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} localServer close success`);
              localClient.getExtraOptions().then((options: socket.ExtraOptionsBase) => {
                hilog.info(domain, tag, `options ` + JSON.stringify(options));
                ExpectTrue(options.receiveBufferSize != null);
                ExpectTrue(options.sendBufferSize != null);
                ExpectTrue(options.reuseAddress != null);
                ExpectTrue(options.socketTimeout == undefined);
                done();
              }).catch((err) => {
                hilog.info(domain, tag,
                  `getExtraOptions fail: ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
              });
            }).catch((err) => {
              hilog.info(domain, tag,
                `${caseName} get err is ` + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          });
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, `${caseName} localServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} catch listen err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          })
          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          try {
            await localClient.connect(connectOpt)
            hilog.info(domain, tag, `${caseName} localClient connect success`);
          } catch (err) {
            hilog.info(domain, tag, `${caseName} localClient Connect fail, err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch fail err:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
  });
}

