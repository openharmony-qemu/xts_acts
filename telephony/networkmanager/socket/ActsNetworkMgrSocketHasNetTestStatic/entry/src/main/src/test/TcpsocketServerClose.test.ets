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
import { describe, it, expect, Level, Size, TestType, afterEach } from "../../../hypium/index";
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'tcpsocketServerCloseTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


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
    hilog.info(domain, tag,
      ` exportFail failed err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
  }
};

let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
let tcpClient: socket.TCPSocket = socket.constructTCPSocketInstance();

export default function TcpSocketServerCloseTest(): void {
  describe("TcpSocketServerCloseTest", () => {
    afterEach(async () => {
      tcpServer = socket.constructTCPSocketServerInstance();
      tcpClient = socket.constructTCPSocketInstance();
    })

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 1
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
          tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, `${caseName} tcpServer on connect  `, JSON.stringify(tcpSocketConnection))
            tcpServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} tcpServer  close success`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpServer  close failed err is: ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
              hilog.info(domain, tag, `${caseName}---End`);
            })
          });
          await tcpClient.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, `${caseName} get connect err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).then(() => {
            hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
            tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
              hilog.info(domain, tag, `${caseName} tcpServer on connect  `, JSON.stringify(tcpSocketConnection))
              tcpServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer  close success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer  close failed` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              })
            });
            await tcpClient.connect(tcpConnectOptions).catch((err) => {
              hilog.info(domain, tag, `${caseName} get connect err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 1
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed :` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
          tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, `${caseName} tcpServer on connect  `, JSON.stringify(tcpSocketConnection))
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!'
            };   
            tcpSocketConnection.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag,
                  `${caseName} fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
              } else {
                hilog.info(domain, tag, `${caseName} client send success`);
                ExpectTrue(true);
                tcpServer.offTcpServerConnect();
                hilog.info(domain, tag, `${caseName} test end`);
              };
              tcpServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer  close success`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer  close failed: ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              })
            });
          });
          await tcpClient.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, `${caseName} get connect err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).then(() => {
            hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
            tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
              hilog.info(domain, tag, `${caseName} tcpServer on connect  `, JSON.stringify(tcpSocketConnection))
              let tcpSendOption: socket.TCPSendOptions = {
                data: 'Hello, client!'
              };
              tcpSocketConnection.send(tcpSendOption, (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  hilog.info(domain, tag,
                    `${caseName} fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  ExpectFail();
                } else {
                  hilog.info(domain, tag, `${caseName} client send success`);
                  ExpectTrue(true);
                  tcpServer.offTcpServerConnect();
                  hilog.info(domain, tag, `${caseName} test end`);
                };
                tcpServer.close().then(() => {
                  hilog.info(domain, tag, `${caseName} tcpServer  close success`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tcpServer  close failed: ` +
                    `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  ExpectFail();
                  done();
                  hilog.info(domain, tag, `${caseName}---End`);
                })  
              });
            });
            await tcpClient.connect(tcpConnectOptions).catch((err) => {
              hilog.info(domain, tag, `${caseName} get connect err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed: err is` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 1
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
          tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, `${caseName} tcpServer on connect  `, JSON.stringify(tcpSocketConnection))
            tcpServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} tcpServer  close success`);
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpServer  close failed` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
              hilog.info(domain, tag, `${caseName}---End`);
            })
            let tcpSendOptions: socket.TCPSendOptions = {
              data: 'Send a message after closing !'
            }
            tcpClient.send(tcpSendOptions).then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient  send message  success`);
              ExpectTrue(true);
              done();
              hilog.info(domain, tag, `${caseName}---End`);
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpClient  send message  failed err is` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
              hilog.info(domain, tag, `${caseName}---End`);
            })
          });
          await tcpClient.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, `${caseName} get connect err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).then(() => {
            hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0600
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
            tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
              hilog.info(domain, tag, `${caseName} tcpServer on connect  `, JSON.stringify(tcpSocketConnection));
              tcpServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer  close success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer  close failed` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              })
              let tcpSendOptions: socket.TCPSendOptions = {
                data: 'Send a message after closing !'
              }
              tcpClient.send(tcpSendOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tcpClient  send message  success`);
                ExpectTrue(true);
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpClient  send message  failed err is` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              })
            });
            await tcpClient.connect(tcpConnectOptions).catch((err) => {
              hilog.info(domain, tag, `${caseName} get connect err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0700
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0700';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 1
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
          tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, `${caseName} tcpServer on connect `, JSON.stringify(tcpSocketConnection));
            tcpServer.close().then(async () => {
              hilog.info(domain, tag, `${caseName} tcpServer  close success`);
              await tcpServer.listen(listenAddress).then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer again listen success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer  listen failed` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpServer  close failed` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
              hilog.info(domain, tag, `${caseName}---End`);
            })
          });
          await tcpClient.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, `${caseName} get connect err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).then(() => {
            hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0800
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0800';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen success`);
            tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
              hilog.info(domain, tag, `${caseName} tcpServer on connect  `, JSON.stringify(tcpSocketConnection));
              tcpServer.close().then(async () => {
                hilog.info(domain, tag, `${caseName} tcpServer  close success`);
                await tcpServer.listen(listenAddress).then(() => {
                  hilog.info(domain, tag, `${caseName} tcpServer again listen success`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tcpServer listen failed` +
                    `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  ExpectFail();
                  done();
                  hilog.info(domain, tag, `${caseName}---End`);
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer  close failed` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              })
            });
            await tcpClient.connect(tcpConnectOptions).catch((err) => {
              hilog.info(domain, tag, `${caseName} get connect err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_0900
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_0900';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 1
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, `${caseName} tcpServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is: ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
          tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, `${caseName} tcpServer on connect`, JSON.stringify(tcpSocketConnection));
            tcpClient.close().then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient close success `);
              tcpServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer close success `);
                ExpectTrue(true);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer close failed ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpClient close failed err is` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          });
          await tcpClient.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, `${caseName} get connect err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).then(() => {
            hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_1000
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_1000';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer listen success`);
            tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
              hilog.info(domain, tag, `${caseName} tcpServer on connect `, JSON.stringify(tcpSocketConnection));
              tcpClient.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpClient close success `);
                tcpServer.close().then(() => {
                  hilog.info(domain, tag, `${caseName} tcpServer close success `);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tcpServer close failed ` +
                    `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpClient close failed err is` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            });
            await tcpClient.connect(tcpConnectOptions).catch((err) => {
              hilog.info(domain, tag, `${caseName} get connect err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is: ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_1100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_1100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 1
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, `${caseName} tcpServer listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is: ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
          tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, `${caseName} tcpServer on connect `, JSON.stringify(tcpSocketConnection))
            tcpSocketConnection.close().then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient close success `);
              tcpServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer close success `);
                ExpectTrue(true);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer close failed ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpClient close failed err is` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          });
          await tcpClient.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, `${caseName} get connect err is ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).then(() => {
            hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_1200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_1200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer listen success`);
            tcpServer.onTcpServerConnect((tcpSocketConnection: socket.TCPSocketConnection) => {
              hilog.info(domain, tag, `${caseName} tcpServer on connect `, JSON.stringify(tcpSocketConnection))
              tcpSocketConnection.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpClient close success `);
                tcpServer.close().then(() => {
                  hilog.info(domain, tag, `${caseName} tcpServer close success `);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tcpServer close failed ` +
                    `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpClient close failed err is` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            });
            await tcpClient.connect(tcpConnectOptions).catch((err) => {
              hilog.info(domain, tag, `${caseName} get connect err is ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).then(() => {
              hilog.info(domain, tag, `${caseName} tcpClient  connect success`);
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is: ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_1300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_1300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer listen success`);
            await tcpServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} tcpServer close success `);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpServer close failed ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is: ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_1400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_1400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress01: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          let listenAddress02: socket.NetAddress = {
            address: '127.0.0.1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 1
          };
          await tcpServer.listen(listenAddress01).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer listen listenAddress01 success`);
            await tcpServer.listen(listenAddress02).then(async () => {
              hilog.info(domain, tag, `${caseName} tcpServer listen listenAddress02 success`);
              await tcpServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer close success `);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer close failed ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag,
                `${caseName} tcpServer  listen listenAddress02 failed err is: ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
              hilog.info(domain, tag, `${caseName}---End`);
            })
          }).catch((err) => {
            hilog.info(domain, tag,
              `${caseName} tcpServer  listen listenAddress01 failed err is: ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_1500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_1500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let listenAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          };
          await tcpServer.listen(listenAddress).then(async () => {
            hilog.info(domain, tag, `${caseName} tcpServer listen success`);
            await tcpServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} tcpServer close success `);
              tcpServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tcpServer close again success `);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tcpServer close again failed ` +
                  `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tcpServer close failed ` +
                `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  listen failed err is: ` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerClose_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Close_1600
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerClose_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerClose_static_1600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          tcpServer.close().then(() => {
            hilog.info(domain, tag, `${caseName} tcpServer  close success`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tcpServer  close failed` +
              `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
  });
}

