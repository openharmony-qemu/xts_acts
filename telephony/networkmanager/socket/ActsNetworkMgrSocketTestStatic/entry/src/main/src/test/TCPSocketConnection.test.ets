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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import hilog from '@ohos.hilog';
import { ArrayBufferToString } from './utils';

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


function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}


export default function TCPSocketConnectionTest(): void {
  describe('ActsTCPSocketConnectionTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0100
     * @tc.desc   Sending data through TCP Socket Connection connection,Sending data as a string;callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14000,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!'
            };
            client.onTcpConnError((err: BusinessError | null) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} on error, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            });
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              client.offTcpConnError((err: BusinessError | null) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} off error, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              });
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0200
     * @tc.desc   Sending data through TCP Socket Connection connection,input parameter type is arrayBuffer;callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14001,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: new ArrayBuffer(234)
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0300
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is an empty string; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14002,
            family: 1
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: ''
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0400
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-8; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14003,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-8'
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0500
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16BE; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14004,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-16BE'
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0600
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16LE; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14005,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-16LE'
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0700
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14006,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-16'
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0800
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is US-AECII; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14007,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'US-AECII'
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0900
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is ISO-8859-1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_0900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14008,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'ISO-8859-1'
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1000
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is GB2312; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14009,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'GB2312'
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1100
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is undefined; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14010,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: undefined
            };
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1200
     * @tc.desc   Sending data through TCP Socket Connection connection,Sending data as a string; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14011,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1300
     * @tc.desc   Sending data through TCP Socket Connection connection,input parameter type is arrayBuffer; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14012,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: new ArrayBuffer(234)
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1400
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is an empty string; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14013,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: ''
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1500
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-8; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14014,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-8'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1600
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16BE; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14015,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-16BE'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1700
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16LE; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14016,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-16LE'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1800
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14017,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'UTF-16'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_1900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1900
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is US-AECII;promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_1900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14018,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'US-AECII'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_2000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2000
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is ISO-8859-1;promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_2000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14019,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'US-AECII'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2100
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is GB2312; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_2100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14020,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: 'GB2312'
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2200
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is undefined; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_2200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14021,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!',
              encoding: undefined
            };
            client.send(tcpSendOption).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Close_0100
     * @tc.desc   Close a connection established with TCP Socket; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionClose_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14022,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.close((err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Close_0200
     * @tc.desc   Close a connection established with TCP Socket; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionClose_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14023,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.close().then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0100
     * @tc.desc   Get the Opposite Socket Address; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14024,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.getRemoteAddress((err: BusinessError | null, data: socket.NetAddress | undefined) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0200
     * @tc.desc   Get the Opposite Socket Address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14025,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.getRemoteAddress().then((data: socket.NetAddress) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetSocketFd_0100
     * @tc.desc   Get TCPSocketConnection FD; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14050,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.getSocketFd().then((fd: int) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success fd:${fd}`);
              expectTrue(fd !== -1);
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetSocketFd_0200
     * @tc.desc   Get TCPSocketConnection FD; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14051,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.close().then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} client close success`);
              client.getSocketFd().then((fd: int) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} success fd:${fd}`);
                expectTrue(fd === -1);
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              }).finally(() => {
                tcpServer.offTcpServerConnect();
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              });
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} client close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done();
            });
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffMessage_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffMessage_0100
     * @tc.desc   UnSubscription to receive message events for TCPSocketConnection connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffMessage_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffMessage_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14026,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let clientSendOptions: socket.TCPSendOptions = {
              data: 'Hello, server!'
            };
            const callback: Callback<socket.SocketMessageInfo> = (data: socket.SocketMessageInfo) => {
              expectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            client.onTcpConnMessage(callback);
            client.offTcpConnMessage(callback);
            tcp.send(clientSendOptions).then(() => {
              client.close().then(() => {
                expectSuccess();
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} close fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
                done();
              });
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffMessage_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffMessage_0200
     * @tc.desc   Cancel multiple subscriptions to receive message events for TCP Socket Connection connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffMessage_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffMessage_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14027,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let clientSendOptions: socket.TCPSendOptions = {
              data: 'Hello, server!'
            };
            const callback1: Callback<socket.SocketMessageInfo> = () => {
              expectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            const callback2: Callback<socket.SocketMessageInfo> = () => {
              expectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            client.onTcpConnMessage(callback1);
            client.onTcpConnMessage(callback2);
            client.offTcpConnMessage();
            tcp.send(clientSendOptions).then(() => {
              client.close().then(() => {
                expectSuccess();
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} close fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
                done();
              });
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOnClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OnClose_0100
     * @tc.desc   Subscription to the closure event of TCPSocketConnection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOnClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOnClose_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14028,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            const callback: Callback<void> = () => {
              expectSuccess();
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            client.onTcpConnClose(callback);
            client.close().catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} close fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffClose_0100
     * @tc.desc   UnSubscription to the closure event of TCPSocketConnection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffClose_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffClose_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14029,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            const callback: Callback<void> = () => {
              expectFail();
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            client.onTcpConnClose(callback);
            client.offTcpConnClose(callback);
            client.close().then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              expectSuccess();
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} close fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffClose_0200
     * @tc.desc   Cancel multiple subscriptions to the TCP Socket Connection shutdown event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffClose_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffClose_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14030,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            const callback1: Callback<void> = () => {
              expectFail();
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            const callback2: Callback<void> = () => {
              expectFail();
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            client.onTcpConnClose(callback1);
            client.onTcpConnClose(callback2);
            client.offTcpConnClose();
            client.close().then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              expectSuccess();
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} close fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetSocketFd_0300
     * @tc.desc   Get TCPSocketConnection FD; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetSocketFd_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14052,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.getSocketFd().then((fd: int) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success fd:${fd}`);
              expectTrue(fd !== -1);
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code == 201);
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcp.connect(tcpConnectOptions).catch((error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0300
     * @tc.desc   Get the Opposite Socket Address; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14053,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.getRemoteAddress((err: BusinessError | null, data: socket.NetAddress | undefined) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
                expectTrue(data?.address != null);
                expectTrue(data?.port != null);
                expectTrue(data?.family != null);
                expectSuccess();
              }
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0400
     * @tc.desc   Get the Opposite Socket Address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress_static_0400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14054,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.getRemoteAddress().then((data: socket.NetAddress) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data?.address != null);
              expectTrue(data?.port != null);
              expectTrue(data?.family != null);
              expectSuccess();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            }).finally(() => {
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffMessage_static_9900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffMessage_9900
     * @tc.desc   UnSubscription to receive message events for TCPSocketConnection connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffMessage_static_9900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffMessage_static_9900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14055,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            let clientSendOptions: socket.TCPSendOptions = {
              data: 'Hello, server!'
            };
            const callback: Callback<socket.SocketMessageInfo> = (data: socket.SocketMessageInfo) => {
              expectTrue(data?.message != null);
              expectTrue(data?.remoteInfo != null);
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            };
            client.onTcpConnMessage(callback);
            client.offTcpConnMessage(callback);
            tcp.send(clientSendOptions).then(() => {
              client.close().then(() => {
                expectSuccess();
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} close fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
                done();
              });
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend_static_9900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_9900
     * @tc.desc   Sending data through TCP Socket Connection connection,Sending data as a string;callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend_static_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend_static_9900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 14056,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            expectTrue(client.clientId != null);
            let tcpSendOption: socket.TCPSendOptions = {
              data: 'Hello, client!'
            };
            client.onTcpConnError((err: BusinessError | null) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} on error, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            });
            client.send(tcpSendOption, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} success`);
                expectSuccess();
              }
              client.offTcpConnError((err: BusinessError | null) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} off error, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              });
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
          });
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} 'fail to connect, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
  })
}