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
import { describe, it, expect, Level, Size, TestType, beforeEach, afterEach } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function expectSuccess(): void {
  expect(true).assertTrue();
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

let netAddress: socket.NetAddress = {
  address: '1.1.1.1',
  port: 80
};

let tcpConnectOptions: socket.TCPConnectOptions = {
  address: netAddress,
  timeout: 6000
};

let netFAddress: socket.NetAddress = {
  address: '192.168.1.132',
  port: 80
};

let tcpConnectFOptions: socket.TCPConnectOptions = {
  address: netFAddress,
  timeout: 6000
};

export default function TCPSocketAsyncConnectTest(): void {
  describe('TCPSocketAsyncConnectTest', () => {
    let tcpServer: socket.TCPSocketServer | undefined;
    let tcp: socket.TCPSocket | undefined;
    beforeEach(() => {
      tcpServer = socket.constructTCPSocketServerInstance();
      tcp = socket.constructTCPSocketInstance();
    })

    afterEach(async () => {
      tcpServer!.offTcpServerConnect();
      await tcp!.close().catch((err) => {
        hilog.info(domain, tag, '%{public}s', `afterEach tcp close fail, err:${JSON.stringify(err?.message)}`);
      });
    })

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0100
     * @tc.desc   Test 20 async TCP socket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14099,
            family: 1
          };
          let tcpConnectlocalFOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          let callbackFinished = 0;
          let totalFinished = 21;

          tcpServer!.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: ''
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
                expectSuccess();
              }
              if (callbackFinished == totalFinished) {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }
            });
          });

          await tcpServer!.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s', 'fail to listen' + err.code.toString());
          });

          for (let i = 0; i < 20; i++) {
            tcp!.connect(tcpConnectlocalFOptions, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail to connect code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success to connect`);
              }
              callbackFinished++;
              if (callbackFinished === totalFinished) {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }
            });
          }
          let tcpInstance: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcpInstance!.connect(tcpConnectlocalFOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail to connect ${err?.code.toString()}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success to connect`);
              expectSuccess();
            }
            callbackFinished++;
            if (callbackFinished == totalFinished) {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName}_catch fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0200
     * @tc.desc   Test 64 async TCP socket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14100,
            family: 1
          };
          let tcpConnectlocalFOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          let callbackFinished = 0;
          let totalFinished = 64;

          tcpServer!.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: ''
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
                expectSuccess();
              }
            });
          });

          await tcpServer!.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s', 'fail to listen' + err.code.toString());
          });

          for (let i = 0; i < 64; i++) {
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.connect(tcpConnectlocalFOptions, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} fail to connect ${err?.code.toString()}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success to connect`);
                expectSuccess();
              }
              callbackFinished++;
              if (callbackFinished == totalFinished) {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }
            });
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName}_catch fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0300
     * @tc.desc   Test 64 async TCP socket connections (63 fail + 1 success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14101,
            family: 1
          };
          let tcpConnectlocalFOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          let callbackFinished = 0;
          let totalFinished = 64;

          tcpServer!.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: ''
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
                expectSuccess();
              }
            });
          });

          await tcpServer!.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s', 'fail to listen' + err.code.toString());
          });

          for (let i = 0; i < 63; i++) {
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.connect(tcpConnectlocalFOptions, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} fail to connect ${err?.code.toString()}`);
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success to connect`);
              }
              callbackFinished++;
              if (callbackFinished == totalFinished) {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }
            });
          }
          let tcpInstance: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcpInstance.connect(tcpConnectlocalFOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail to connect ${err?.code.toString()}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success to connect`);
              expectSuccess();
            }
            callbackFinished++;
            if (callbackFinished == totalFinished) {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName}_catch fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketAsyncConnect_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_AsyncConnect_0400
     * @tc.desc   Test 65 async TCP socket connections (64 fail + 1 success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketAsyncConnect_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketAsyncConnect_static_0400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14102,
            family: 1
          };
          let tcpConnectlocalFOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          let callbackFinished = 0;
          let totalFinished = 64;

          tcpServer!.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: ''
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
                expectSuccess();
              }
            });
          });

          await tcpServer!.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s', 'fail to listen' + err.code.toString());
          });

          for (let i = 0; i < 64; i++) {
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.connect(tcpConnectlocalFOptions, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} fail to connect ${err?.code.toString()}`);
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success to connect`);
              }
              callbackFinished++;
              if (callbackFinished == totalFinished) {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }
            });
          }
          let tcpInstance: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcpInstance.connect(tcpConnectlocalFOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail to connect ${err?.code.toString()}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success to connect`);
              expectSuccess();
            }
            callbackFinished++;
            if (callbackFinished == totalFinished) {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName}_catch fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
  });
}
