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

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


function expectSuccess(): void {
  try {
    expect(true).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${err} test failed`);
  }

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

function expectFalse(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertFalse();
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


export default function TCPSocketServerTest(): void {
  describe('TCPSocketServerTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerConstructTCPSocketServerInstance_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_ConstructTCPSocketServerInstance_0100
     * @tc.desc   Create a TCP Socket Server object; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerConstructTCPSocketServerInstance_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerConstructTCPSocketServerInstance_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          hilog.info(domain, tag, '%{public}s', 'testConstructTCPSocketInstance0100 success');
          expect(tcpServer).assertInstanceOf('Object');
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0100
     * @tc.desc   Bind IP address and port,Only fill in the address for IPV4; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1'
          };
          tcpServer.onTcpServerError((err: BusinessError | null) => {
            hilog.error(domain, tag, '%{public}s', "on error,err:" + JSON.stringify(err));
          });
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectSuccess();
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            }
            tcpServer.offTcpServerError((err: BusinessError | null) => {
              hilog.error(domain, tag, '%{public}s', "off error,err:" + JSON.stringify(err));
              expectFail();
            });
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0300
     * @tc.desc   Bind IP address and port,The address and protocol are both IPV6; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: 'fe80::b3b:ecb5:77f:88dc%12',
            family: 2
          };
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2303122);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0500
     * @tc.desc   Bind IP address and port, bad address; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_0500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '100.0.0.1',
            port: 5001,
            family: 1
          };
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2303199);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0600
     * @tc.desc   Bind IP address and port,Port number is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0700
     * @tc.desc   Bind IP address and port,Port number is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0800
     * @tc.desc   Bind IP address and port,Port number is 65535; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          };
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0900
     * @tc.desc   Bind IP address and port,Port number is 65536; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_0900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          };
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1000
     * @tc.desc   Bind IP address and port,bad family; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5002,
            family: 4
          };
          tcpServer.listen(listenAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1300
     * @tc.desc   Bind IP address and port,Only fill in the address for IPV4; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1'
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1400
     * @tc.desc   Bind IP address and port,Only fill in the address for IPV6; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: 'fe80::b3b:ecb5:77f:88dc%12'
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectSuccess();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1500
     * @tc.desc   Bind IP address and port,The address and protocol are both IPV6; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: 'fe80::b3b:ecb5:77f:88dc%12',
            family: 2
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2303122);
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1600
     * @tc.desc   Bind IP address and port,Address and protocol inversion; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5003,
            family: 2
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectSuccess();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1700
     * @tc.desc   Bind IP address and port, bad address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '100.0.0.1',
            port: 65535,
            family: 1
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail`);
            expectFail();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2303199);
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1800
     * @tc.desc   Bind IP address and port,Port number is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_1900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1900
     * @tc.desc   Bind IP address and port,Port number is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_1900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_2000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2000
     * @tc.desc   Bind IP address and port,Port number is 65535; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_2000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2100
     * @tc.desc   Bind IP address and port,Port number is 65536; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_2100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerListen_static_2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2200
     * @tc.desc   Bind IP address and port,bad family; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerListen_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen_static_2200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5010,
            family: 4
          };
          await tcpServer.listen(listenAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err)}`)
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err)}`)
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerGetState_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0100
     * @tc.desc   Obtain TCPSocketService status without listening; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState_static_0100'
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          tcpServer.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data?.isBound === false);
              expectTrue(data?.isClose === false);
              expectTrue(data?.isConnected === false);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerGetState_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0300
     * @tc.desc   Obtain the TCP Socket Server status after connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5013,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
            timeout: 2000
          };
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
          tcpServer.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data?.isBound === true);
              expectTrue(data?.isClose === false);
              expectTrue(data?.isConnected === true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerGetState_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0400
     * @tc.desc   Obtain TCPSocketService status without listening; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState_static_0400'
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          tcpServer.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.isBound === false);
            expectTrue(data?.isClose === false);
            expectTrue(data?.isConnected === false);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerGetState_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0500
     * @tc.desc   Obtain the TCP Socket Server status after listening; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState_static_0500'
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5014,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcpServer.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.isBound === true);
            expectTrue(data?.isClose === false);
            expectTrue(data?.isConnected === false);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerGetState_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0600
     * @tc.desc   Obtain the TCP Socket Server status after connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerGetState_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5015,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
            timeout: 2000
          };
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
          tcpServer.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.isBound === true);
            expectTrue(data?.isClose === false);
            expectTrue(data?.isConnected === true);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0100
     * @tc.desc   Set other properties of the TCP Socket Server connection,before listen; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2303109);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch error code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0200
     * @tc.desc   Set other properties of the TCP Socket Server connection after listening; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5016,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0500
     * @tc.desc   Set other properties of the TCP Socket Server connection,keepAlive is true; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11001,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0600
     * @tc.desc   Set other properties of the TCP Socket Server connection,keepAlive is false; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11002,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0700
     * @tc.desc   Set other properties of the TCP Socket Server connection,OOBlnLine is true; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11003,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: true,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0800
     * @tc.desc   Set other properties of the TCP Socket Server connection,OOBlnLine is false; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11004,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0900
     * @tc.desc   Set other properties of the TCP Socket Server connection,TCPNoDelay is true; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_0900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11005,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1000
     * @tc.desc   Set other properties of the TCP Socket Server connection,TCPNoDelay is false; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11006,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: false,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1100
     * @tc.desc   Set other properties of the TCP Socket Server connection,receiveBufferSize is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11007,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1200
     * @tc.desc   Set other properties of the TCP Socket Server connection,receiveBufferSize is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11008,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1300
     * @tc.desc   Set other properties of the TCP Socket Server connection,receiveBufferSize is 100; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11009,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1400
     * @tc.desc   Set other properties of the TCP Socket Server connection,sendBufferSize is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11010,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1500
     * @tc.desc   Set other properties of the TCP Socket Server connection,sendBufferSize is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11011,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1600
     * @tc.desc   Set other properties of the TCP Socket Server connection,sendBufferSize is 100; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11012,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1700
     * @tc.desc   Set other properties of the TCP Socket Server connection,reuseAddress is true; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11013,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: true,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1800
     * @tc.desc   Set other properties of the TCP Socket Server connection,reuseAddress is false; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11014,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: false,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1900
     * @tc.desc   Set other properties of the TCP Socket Server connection,socketTimeout is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_1900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11014,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: -1,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
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
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2000
     * @tc.desc   Set other properties of the TCP Socket Server connection,socketTimeout is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11015,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 0,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2100
     * @tc.desc   Set other properties of the TCP Socket Server connection,socketTimeout is 100; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11016,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 100,
            socketLinger: {
              on: true, linger: 10
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2200
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11017,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: -1
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2300
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11018,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 0
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2400
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is 65535; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11019,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65535
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2500
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is 65536; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11020,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65536
            }
          }
          tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2600
     * @tc.desc   Set other properties of the TCP Socket Server connection,before listen; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2303109);
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch error code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2700
     * @tc.desc   Set other properties of the TCP Socket Server connection after listening; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_2700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5019,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3000
     * @tc.desc   Set other properties of the TCP Socket Server connection,keepAlive is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10101,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3100
     * @tc.desc   Set other properties of the TCP Socket Server connection,keepAlive is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10102,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3200
     * @tc.desc   Set other properties of the TCP Socket Server connection,OOBlnLine is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10103,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3300
     * @tc.desc   Set other properties of the TCP Socket Server connection,OOBlnLine is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10104,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3400
     * @tc.desc   Set other properties of the TCP Socket Server connection,TCPNoDelay is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10105,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3500
     * @tc.desc   Set other properties of the TCP Socket Server connection,TCPNoDelay is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10106,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3600
     * @tc.desc   Set other properties of the TCP Socket Server connection,receiveBufferSize is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10107,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3700
     * @tc.desc   Set other properties of the TCP Socket Server connection,receiveBufferSize is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10108,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3800
     * @tc.desc   Set other properties of the TCP Socket Server connection,receiveBufferSize is 100; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10109,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3900
     * @tc.desc   Set other properties of the TCP Socket Server connection,sendBufferSize is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_3900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10110,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4000
     * @tc.desc   Set other properties of the TCP Socket Server connection,sendBufferSize is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10111,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4100
     * @tc.desc   Set other properties of the TCP Socket Server connection,sendBufferSize is 100; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10112,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4200
     * @tc.desc   Set other properties of the TCP Socket Server connection,reuseAddress is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10113,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4300
     * @tc.desc   Set other properties of the TCP Socket Server connection,reuseAddress is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10114,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4400
     * @tc.desc   Set other properties of the TCP Socket Server connection,socketTimeout is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10115,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: -1,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
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
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4500
     * @tc.desc   Set other properties of the TCP Socket Server connection,socketTimeout is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10116,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 0,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4600
     * @tc.desc   Set other properties of the TCP Socket Server connection,socketTimeout is 100; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10117,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 100,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4700
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10118,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: -1
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4800
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10119,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 0
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4900
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is 65535; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_4900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10120,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65535
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_5000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_5000
     * @tc.desc   Set other properties of the TCP Socket Server connection,linger is 65536; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions_static_5000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10121,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65536
            }
          };
          tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_GetSocketFd_0100
     * @tc.desc   Obtain TCPSocketServer FD after listening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerGetSocketFd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetSocketFd_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 11110,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });

          tcpServer.getSocketFd().then((data: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data !== -1);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_GetSocketFd_0200
     * @tc.name   testNetworkMgrSocketTCPSocketServerGetSocketFd_static_0200
     * @tc.desc   Obtain TCPSocketServer FD without listening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerGetSocketFd_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetSocketFd_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          tcpServer.getSocketFd().then((data: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data === -1);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerOnConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_OnConnect_0100
     * @tc.desc   Subscription to TCP Socket Server connection events;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerOnConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerOnConnect_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5022,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let callback: Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data.clientId !== null);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcpServer.onTcpServerConnect(callback);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerOffConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_OffConnect_0100
     * @tc.desc   Unsubscribe from TCP Socket Server connection events;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerOffConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerOffConnect_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5023,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let callback: Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }
          tcpServer.onTcpServerConnect(callback);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.offTcpServerConnect();
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketServerOffConnect_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketServer_OffConnect_0200
     * @tc.desc   Unsubscribe from all connection events of TCP Socket Server;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketServerOffConnect_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketServerOffConnect_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5024,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let callback1: Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          let callback2: Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcpServer.onTcpServerConnect(callback1);
          tcpServer.onTcpServerConnect(callback2);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          tcpServer.offTcpServerConnect();
          await tcp.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
  })
}

