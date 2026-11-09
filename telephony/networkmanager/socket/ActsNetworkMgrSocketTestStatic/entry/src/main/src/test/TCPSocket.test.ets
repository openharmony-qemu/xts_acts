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
import socket from "@ohos.net.socket";
import { BusinessError, Callback } from '@ohos.base';
import { ArrayBufferToString, expectEqual } from './utils/index';
import connection from '@ohos.net.connection';
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
};


function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
};

export default function TCPSocketTest(): void {
  describe('ActsTCPSocketTest', () => {
    let tcp: socket.TCPSocket | undefined;
    beforeEach(() => {
      tcp = socket.constructTCPSocketInstance();
      expect(tcp).assertInstanceOf('Object');
    })

    afterEach(async () => {
      await tcp!.close().catch((err) => {
        hilog.info(domain, tag, '%{public}s',
          `afterEach fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
      });
    })

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConstructTCPSocketInstance_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_ConstructTCPSocketInstance_0100
     * @tc.desc   Create a TCP Socket object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConstructTCPSocketInstance_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConstructTCPSocketInstance_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} success`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_0100
     * @tc.desc   Bind IP address and port,Only fill in IPV4 address;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketTCPSocketBind_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1'
          };
          tcp!.bind(bindAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
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
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_0500
     * @tc.desc   Bind IP address and port,bad address;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_0500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '100.0.0.0',
            port: 4444,
            family: 1
          };
          tcp!.bind(bindAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301099);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_0600
     * @tc.desc   Bind IP address and port,Port is boundary -1;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          tcp!.bind(bindAddress, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_0700
     * @tc.desc   Bind IP address and port,port is boundary 0;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          tcp!.bind(bindAddress, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_0800
     * @tc.desc   Bind IP address and port,Port is boundary 65535;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          };
          tcp!.bind(bindAddress, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_0900
     * @tc.desc   Bind IP address and port,Port is boundary 65536;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_0900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          };
          tcp!.bind(bindAddress, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1000
     * @tc.desc   Bind IP address and port, bad family;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4554,
            family: 4
          };
          tcp!.bind(bindAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1300
     * @tc.desc   Bind IP address and port,Only fill in IPV4 address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1'
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1400
     * @tc.desc   Bind IP address and port,Only fill in IPV6 address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: 'fe80::b3b:ecb5:77f:88dc%12'
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectSuccess();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1500
     * @tc.desc   Bind IP address and port,The address and protocol are both IPV6; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: 'fe80::b3b:ecb5:77f:88dc%12',
            family: 2
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1600
     * @tc.desc   Bind IP address and port,Address and protocol inversion; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 7458,
            family: 2
          };
          tcp!.bind(bindAddress).then(() => {
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1700
     * @tc.desc   Bind IP address and port, bad address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let bindAddress: socket.NetAddress = {
            address: '100.0.0.1',
            port: 7586,
            family: 1
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301099);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1800
     * @tc.desc   Bind IP address and port,Port number is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_1900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_1900
     * @tc.desc   Bind IP address and port,Port number is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_1900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_2000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_2000
     * @tc.desc   Bind IP address and port,Port number is 65535; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_2000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_2100
     * @tc.desc   Bind IP address and port,Port number is 65536; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_2100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_2200
     * @tc.desc   Bind IP address and port, bad family; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_2200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 6335,
            family: 4
          };
          tcp!.bind(bindAddress).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end `);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketBind_static_2500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Bind_2500
     * @tc.desc   Bind IP address and port,Address is Domain name ; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketBind_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketBind_static_2500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: 'www.baidu.com',
            port: 80,
            family: 1
          };
          tcp!.bind(bindAddress).then(() => {
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_0100
     * @tc.desc   Connect to the specified server IP address and port; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4001,
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
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_0400
     * @tc.desc   Connect to the specified IP address and port,Set timeout and address; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_0400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4004,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4004,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            // address: {
            //   address: '127.0.0.1',
            //   port: 4004,
            //   family: 1
            // },
            address: listenAddress,
            timeout: 5000
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_0500
     * @tc.desc   Connect to the specified IP address and port,hour is undefined; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_0500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4005,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
            timeout: undefined
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_0600
     * @tc.desc   Connect to the specified IP address and port, only has an IPV4 address; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4006,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1'
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301115);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_0700
     * @tc.desc   Connect to the specified IP address and port,Port is -65536; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: -65536,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: -65536,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code === 2301115) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectSuccess();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_0800
     * @tc.desc   Connect to the specified IP address and port,The address and protocol  are both IPV6; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: 'fe80::b3b:ecb5:77f:88dc%12',
            port: 4008,
            family: 2
          };
          await tcp!.bind(bindAddress);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
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
          expectTrue(err?.code === 2301022);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_0900
     * @tc.desc   Connect to the specified IP address and port,Port is -65535; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_0900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: -65535,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: -65535,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code === 2301115) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectSuccess();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301115);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_1000
     * @tc.desc   Connect to the specified IP address and port,bad address; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_1000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4010,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '100.0.0.0',
              port: 4010,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301022);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_1200
     * @tc.desc   Connect to the specified IP address and port,Port is -0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_1200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 0,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code === 2301115) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectSuccess();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_1300
     * @tc.desc   Connect to the specified IP address and port,Port is 65535; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_1300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 65535,
              family: 1
            }
          };
          hilog.info(domain, tag, '%{public}s', 'ready to connect');
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', 'ready to close');

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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_1400
     * @tc.desc   Connect to the specified IP address and port,Port is 65536; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_1400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 65536,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectSuccess();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_1500
     * @tc.desc   Connect to the specified IP address and port,bad family; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_1500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4015,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4015,
              family: 3
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_1600
     * @tc.desc   Connect to the specified IP address and port,Connect without binding or listening; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_1600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4016,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301115);
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
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_1700
     * @tc.desc   Connect to the specified server IP address and port; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_1700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4017
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4017
            },
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}  fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2000
     * @tc.desc   Connect to the specified IP address and port,Set timeout and address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4020,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4020,
              family: 1
            },
            timeout: 5000
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}  fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2100
     * @tc.desc   Connect to the specified IP address and port,hour is undefined; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4021,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4021
            },
            timeout: undefined
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}  fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2200
     * @tc.desc   Connect to the specified IP address and port, only has an IPV4 address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4022,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1'
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301115);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2300
     * @tc.desc   Connect to the specified IP address and port,Port is 65537; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65537,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectSuccess();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 65537,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectSuccess();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2400
     * @tc.desc   Connect to the specified IP address and port,Port is 66561; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 66561,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 66561,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
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
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2500
     * @tc.desc   Connect to the specified IP address and port,Address and protocol inversion; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4025,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4025,
              family: 2
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2600
     * @tc.desc   Connect to the specified IP address and port,bad address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4026,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '100.0.0.0',
              port: 4026,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}  fail err:${JSON.stringify(err)}`);
            expectTrue(err?.code === 2301022);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_2800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_2800
     * @tc.desc   Connect to the specified IP address and port,Port is -0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_2800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 0,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}  fail err:${JSON.stringify(err)}`);
            expectSuccess();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_3000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_3000
     * @tc.desc   Connect to the specified IP address and port,Port is 65536; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_3000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 65536,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectSuccess();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_3100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_3100
     * @tc.desc   Connect to the specified IP address and port,Port is 65537; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_3100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 65537,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectSuccess();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 65537,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectSuccess();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_3200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_3200
     * @tc.desc   Connect to the specified IP address and port,bad family; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_3200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4031,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4031,
              family: 3
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_3300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_3300
     * @tc.desc   Connect to the specified IP address and port,Connect without binding or listening; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_3300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: {
              address: '127.0.0.1',
              port: 4032,
              family: 1
            }
          };
          tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301115);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_0100
     * @tc.desc   Sending data through TCP Socket connection,To the client; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4033
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_0200
     * @tc.desc   Sending data through TCP Socket connection,To the server; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4034
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_0600
     * @tc.desc   Sending data through TCP Socket connection,Send data of arraybuffer type; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4038
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: new ArrayBuffer(123)
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_0700
     * @tc.desc   Sending data through TCP Socket connection,Set data format to empty string; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4039
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: ''
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_0800
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-8; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4040
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-8'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_0900
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-16BE; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_0900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4041
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-16BE'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1000
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-16LE; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4042
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-16LE'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1100
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-16; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4043
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-16'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1200
     * @tc.desc   Sending data through TCP Socket connection,Set data format to US-AECII; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4044
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'US-AECII'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1300
     * @tc.desc   Sending data through TCP Socket connection,Set data format to ISO-8859-1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4045
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'ISO-8859-1'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1400
     * @tc.desc   Sending data through TCP Socket connection,Set data format to GB2312; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4046
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'GB2312'
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1500
     * @tc.desc   Sending data through TCP Socket connection,Set data format to undefined; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4047
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: undefined
          };
          tcp!.send(tcpSendOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1600
     * @tc.desc   Sending data through TCP Socket connection,To the client; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4049
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_1700
     * @tc.desc   Sending data through TCP Socket connection,To the server; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_1700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4048
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2100
     * @tc.desc   Sending data through TCP Socket connection,Send data of arraybuffer type; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4052
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: new ArrayBuffer(123)
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2200
     * @tc.desc   Sending data through TCP Socket connection,Set data format to empty string; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4053
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: ''
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2300
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-8; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4054
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-8'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2400
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-16BE; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4055
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-16BE'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2500
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-16LE; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4056
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-16LE'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2600
     * @tc.desc   Sending data through TCP Socket connection,Set data format to UTF-16; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4057
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-16'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2700
     * @tc.desc   Sending data through TCP Socket connection,Set data format to US-AECII; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4058
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'US-AECII'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2800
     * @tc.desc   Sending data through TCP Socket connection,Set data format to ISO-8859-1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4059
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'ISO-8859-1'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_2900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_2900
     * @tc.desc   Sending data through TCP Socket connection,Set data format to GB2312; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_2900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4060
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'GB2312'
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSend_static_3000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Send_3000
     * @tc.desc   Sending data through TCP Socket connection,Set data format to undefined; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSend_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSend_static_3000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4061
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: undefined
          };
          tcp!.send(tcpSendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Close_0100
     * @tc.desc   Close the TCP Socket connection,Call close before binding or listening; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketClose_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          tcp!.close((err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2300999);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
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
     * @tc.name   testNetworkMgrSocketTCPSocketClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Close_0200
     * @tc.desc   Close the TCP Socket connection,After bind and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketClose_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4062
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.close((err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketClose_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Close_0300
     * @tc.desc   Close the TCP Socket connection ,after listen and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketClose_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketClose_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4063,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.close((err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketClose_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Close_0400
     * @tc.desc   Close the TCP Socket connection,Call close before binding or listening; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketClose_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketClose_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          tcp!.close().then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2300999);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketClose_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Close_0500
     * @tc.desc   Close the TCP Socket connection,after bind and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketClose_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketClose_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4064
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.close().then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketClose_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Close_0600
     * @tc.desc   Close the TCP Socket connection,after listen and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketClose_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketClose_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4065,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.close().then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0100
     * @tc.desc   Get the Opposite Socket Address,before bind or listen; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          tcp!.getRemoteAddress((err: BusinessError | null, data: socket.NetAddress | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectFail();
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
     * @tc.name   testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0200
     * @tc.desc   Get the Opposite Socket Address,after bind and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4066,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getRemoteAddress((err: BusinessError | null, data: socket.NetAddress | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data?.address === '127.0.0.1');
              expectTrue(data?.port === 4066);
              expectTrue(data?.family === 1);
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
     * @tc.name   testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0300
     * @tc.desc   Get the Opposite Socket Address, after listen and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4067,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getRemoteAddress((err: BusinessError | null, data: socket.NetAddress | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data?.address === '127.0.0.1');
              expectTrue(data?.port === 4067);
              expectTrue(data?.family === 1);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err:${JSON.stringify(err)}`)
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0400
     * @tc.desc   Get the Opposite Socket Address,before bind or listen; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          tcp!.getRemoteAddress().then((data: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectTrue(err?.code === 2301009);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_2 fail err:${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0500
     * @tc.desc   Get the Opposite Socket Address, after bind and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4068,
            family: 1
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getRemoteAddress().then((data: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.address === '127.0.0.1');
            expectTrue(data?.port === 4068);
            expectTrue(data?.family === 1);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0600
     * @tc.desc   Get the Opposite Socket Address,after listen and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4069,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getRemoteAddress().then((data: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.address === '127.0.0.1');
            expectTrue(data?.port === 4069);
            expectTrue(data?.family === 1);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0100
     * @tc.desc   Get TCPSocket status,before bind or listen; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          tcp!.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0200
     * @tc.desc   Get TCPSocket status,after bind; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4070
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data?.isBound === true);
              expectTrue(data?.isClose === false);
              expectTrue(data?.isConnected === false);
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
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0300
     * @tc.desc   Get TCPSocket status,after bind and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4071
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
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
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0400
     * @tc.desc   Get TCPSocket status,after listen and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4072,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
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
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0500
     * @tc.desc   Get TCPSocket status,before bind or listen; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          tcp!.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.isBound === false);
            expectTrue(data?.isClose === false);
            expectTrue(data?.isConnected === false);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0600
     * @tc.desc   Get TCPSocket status; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0600'
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4073
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.isBound === true);
            expectTrue(data?.isClose === false);
            expectTrue(data?.isConnected === false);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0700
     * @tc.desc   Get TCPSocket status; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4074
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.isBound === true);
            expectTrue(data?.isClose === false);
            expectTrue(data?.isConnected === true);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetState_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetState_0800
     * @tc.desc   Get TCPSocket status; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetState_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetState_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4075,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data?.isBound === true);
            expectTrue(data?.isClose === false);
            expectTrue(data?.isConnected === true);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0100
     * @tc.desc   Get TCPSocket status,before bind or listen; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          tcp!.getSocketFd((err: BusinessError | null, data: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success: ${JSON.stringify(data)}`);
              expectTrue(data === -1);
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
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0200
     * @tc.desc   Get TCPSocket status,after bind; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4076
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getSocketFd((err: BusinessError | null, data: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data !== undefined);
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
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0300
     * @tc.desc   Get TCPSocket status,after bind and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4077
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getSocketFd((err: BusinessError | null, data: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data !== undefined);
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
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0400
     * @tc.desc   Get TCPSocket status,after listen and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4078,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getSocketFd((err: BusinessError | null, data: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
              expectTrue(data !== undefined);
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
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0500
     * @tc.desc   Get TCPSocket status, before bind or listen; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          tcp!.getSocketFd().then((data: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail data:${JSON.stringify(data)}`);
            expectTrue(data === -1);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0600
     * @tc.desc   Get TCPSocket status,after bind; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4079
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getSocketFd().then((data: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data !== undefined);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0700
     * @tc.desc   Get TCPSocket status,after bind and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4080
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getSocketFd().then((data: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data !== undefined);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketGetSocketFd_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0800
     * @tc.desc   Get TCPSocket status,after listen and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object')
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4081,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tcp!.getSocketFd().then((data: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data !== undefined);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0100
     * @tc.desc   Get TCPSocket status,after bind;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4082
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0200
     * @tc.desc   Get TCPSocket status,after bind and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4083
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0300
     * @tc.desc   Get TCPSocket status,after listen and connect; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4084,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0600
     * @tc.desc   Get TCPSocket status,Input parameter keepAlive is false; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_0600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9001
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0700
     * @tc.desc   Get TCPSocket status,Input parameter keepAlive is true; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_0700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9002
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0800
     * @tc.desc   Get TCPSocket status,Input parameter OOBlnLine is false ; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_0800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9003
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0900
     * @tc.desc   Get TCPSocket status, Input parameter OOBlnLine is true; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_0900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9004
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1000
     * @tc.desc   Get TCPSocket status,Input parameter TCPNoDelay is false;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9005
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1100
     * @tc.desc   Get TCPSocket status,Input parameter TCPNoDelay is true;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9006
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1200
     * @tc.desc   Get TCPSocket status,Input parameter receiveBufferSize is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9007
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1300
     * @tc.desc   Get TCPSocket status,Input parameter receiveBufferSize is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9008
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1400
     * @tc.desc   Get TCPSocket status,Input parameter receiveBufferSize is 100; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9009
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1500
     * @tc.desc   Get TCPSocket status,Input parameter sendBufferSize is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9010
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1600
     * @tc.desc   Get TCPSocket status,Input parameter sendBufferSize is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9011
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1700
     * @tc.desc   Get TCPSocket status,Input parameter sendBufferSize is 100; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1700';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9012
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1800
     * @tc.desc   Get TCPSocket status,Input parameter reuseAddress is true; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9013
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: true,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_1900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1900
     * @tc.desc   Get TCPSocket status,Input parameter reuseAddress is false; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_1900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9014
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: false,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2000
     * @tc.desc   Get TCPSocket status,Input parameter socketTimeout is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2000';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9015
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: -1,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301033);
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} success`);
              expectFail();
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2100
     * @tc.desc   Get TCPSocket status,Input parameter socketTimeout is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9016
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 0,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2200
     * @tc.desc   Get TCPSocket status,Input parameter socketTimeout is 100; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9017
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 100,
            socketLinger: {
              on: true, linger: 10
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2300
     * @tc.desc   Get TCPSocket status,Input parameter linger is -1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9018
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: -1
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2400
     * @tc.desc   Get TCPSocket status,Input parameter linger is 0; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9019
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 0
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2500
     * @tc.desc   Get TCPSocket status,Input parameter linger is 65535; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2500';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9020
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65535
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2600
     * @tc.desc   Get TCPSocket status,Input parameter linger is 65536; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9021
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65536
            }
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2700
     * @tc.desc   Get TCPSocket status,after bind; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9022
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2800
     * @tc.desc   Get TCPSocket status,after bind and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: String = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4088
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_2900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2900
     * @tc.desc   Get TCPSocket status,after listen and connect; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: String = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_2900';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4089,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3200
     * @tc.desc   Get TCPSocket status,Input parameter keepAlive is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10001
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3300
     * @tc.desc   Get TCPSocket status,Input parameter keepAlive is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10002
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            socketLinger: {
              on: false, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3400
     * @tc.desc   Get TCPSocket status,Input parameter OOBlnLine is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10003
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: false,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3500
     * @tc.desc   Get TCPSocket status, Input parameter OOBlnLine is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10004
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            OOBInline: true,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3600
     * @tc.desc   Get TCPSocket status,Input parameter TCPNoDelay is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10005
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: false,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3700
     * @tc.desc   Get TCPSocket status,Input parameter TCPNoDelay is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10005
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            TCPNoDelay: false,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3800
     * @tc.desc   Get TCPSocket status,Input parameter receiveBufferSize is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10007
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_3900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3900
     * @tc.desc   Get TCPSocket status,Input parameter receiveBufferSize is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_3900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10008
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4000
     * @tc.desc   Get TCPSocket status,Input parameter receiveBufferSize is 100; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10009
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            receiveBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4100
     * @tc.desc   Get TCPSocket status,Input parameter sendBufferSize is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10010
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: -1,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4200
     * @tc.desc   Get TCPSocket status,Input parameter sendBufferSize is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10011
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 0,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4300
     * @tc.desc   Get TCPSocket status,Input parameter sendBufferSize is 100; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10012
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            sendBufferSize: 100,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4400
     * @tc.desc   Get TCPSocket status,Input parameter reuseAddress is true; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10013
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: true,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4500
     * @tc.desc   Get TCPSocket status,Input parameter reuseAddress is false; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10014
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            reuseAddress: false,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4600
     * @tc.desc   Get TCPSocket status,Input parameter socketTimeout is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10015
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: -1,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301033);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4700
     * @tc.desc   Get TCPSocket status,Input parameter socketTimeout is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10016
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 0,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4800
     * @tc.desc   Get TCPSocket status,Input parameter socketTimeout is 100; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10017
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketTimeout: 100,
            socketLinger: {
              on: true, linger: 10
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_4900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4900
     * @tc.desc   Get TCPSocket status,Input parameter linger is -1; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_4900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10018
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: -1
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_5000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5000
     * @tc.desc   Get TCPSocket status,Input parameter linger is 0; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_5000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10019
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 0
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_5100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5100
     * @tc.desc   Get TCPSocket status,Input parameter linger is 65535; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_5100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10020
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65535
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_5200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5200
     * @tc.desc   Get TCPSocket status,Input parameter linger is 65536; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_5200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10021
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: {
              on: true, linger: 65536
            },
          };
          tcp!.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success `);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOnMessage_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OnMessage_0100
     * @tc.desc   Subscription to receive message events for TCPSocket connections,after listen and connect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOnMessage_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOnMessage_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4093
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          let clientSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-8'
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.send(clientSendOptions).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            });
          });
          const callback: Callback<socket.SocketMessageInfo> = (value: socket.SocketMessageInfo) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} value:${ArrayBufferToString(value.message)}`);
            tcpServer.offTcpServerConnect();
            done();
          };
          tcp!.onTcpMessage(callback);
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOffMessage_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OffMessage_0100
     * @tc.desc   Unsubscribe from receiving message events for TCPSocket connections,After a subscription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOffMessage_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOffMessage_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4094
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-8'
          };
          const callback: Callback<socket.SocketMessageInfo> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpMessage(callback);
          tcp!.offTcpMessage(callback);
          await tcp!.send(tcpSendOptions).then(() => {
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
     * @tc.name   testNetworkMgrSocketTCPSocketOffMessage_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OffMessage_0200
     * @tc.desc   Unsubscribe from receiving message events for TCPSocket connections,After Subscribing multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOffMessage_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOffMessage_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4095
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-8'
          };
          const callback1: Callback<socket.SocketMessageInfo> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} callback1 test end`);
            done();
          };
          const callback2: Callback<socket.SocketMessageInfo> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} callback2 test end`);
            done();
          };
          tcp!.onTcpMessage(callback1);
          tcp!.onTcpMessage(callback2);
          tcp!.offTcpMessage();
          await tcp!.send(tcpSendOptions).then(() => {
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
     * @tc.name   testNetworkMgrSocketTCPSocketOnConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OnConnect_0100
     * @tc.desc   Subscription to connection events for TCPSocket after bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOnConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOnConnect_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4096
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          const callback: Callback<void> = () => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpConnect(callback);
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectSuccess();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOnConnect_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OnConnect_0200
     * @tc.desc   Subscription to connection events for TCPSocket,after listen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOnConnect_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOnConnect_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4097
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          const callback: Callback<void> = () => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          };
          tcp!.onTcpConnect(callback);
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectSuccess();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOffConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OffConnect_0100
     * @tc.desc   Unsubscribe from TCP Socket connection events,After a subscription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOffConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOffConnect_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4098
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          const callback: Callback<void> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpConnect(callback);
          tcp!.offTcpConnect(callback);
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOffConnect_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OffConnect_0200
     * @tc.desc   Unsubscribe from TCP Socket connection events,After Subscribing multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOffConnect_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOffConnect_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4099
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          const callback1: Callback<void> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          const callback2: Callback<void> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpConnect(callback1);
          tcp!.onTcpConnect(callback2);
          tcp!.offTcpConnect();
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOnClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OnClose_0100
     * @tc.desc   Subscribe to the closure event of TCPSocket, after bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOnClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOnClose_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4100
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          const callback: Callback<void> = () => {
            expectSuccess();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpClose(callback);
          await tcp!.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOnClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OnClose_0200
     * @tc.desc   Subscribe to the closure event of TCPSocket,after listen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOnClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOnClose_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4101
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
            timeout: 6000
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          const callback: Callback<void> = () => {
            expectSuccess();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpClose(callback);
          await tcp!.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOffClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OffClose_0100
     * @tc.desc   Unsubscribe from the closing event of TCPSocket,After a subscription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOffClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOffClose_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4102
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          const callback: Callback<void> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpError((err: BusinessError) => {
            hilog.error(domain, tag, '%{public}s',
              "on error,err:" + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          tcp!.onTcpClose(callback);
          tcp!.offTcpClose(callback);
          tcp!.offTcpError((err: BusinessError) => {
            hilog.error(domain, tag, '%{public}s',
              "off error,err:" + `code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          await tcp!.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOffClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OffClose_0200
     * @tc.desc   Unsubscribe from the closing event of TCPSocket,After Subscribing multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOffClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOffClose_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4103
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          const callback1: Callback<void> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          const callback2: Callback<void> = () => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          tcp!.onTcpClose(callback1);
          tcp!.onTcpClose(callback2);
          tcp!.offTcpClose();
          await tcp!.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          expectSuccess();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_9500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_9500
     * @tc.desc   Unsubscribe from the closing event of TCPSocket,After Subscribing multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_9500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4104
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
          let result = tcp!.setExtraOptions(tcpExtraOptions)
          hilog.info(domain, tag, '%{public}s', '${caseName} result : ${(result)}');
          result.then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} success : ${JSON.stringify(data)}`);
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err : ${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_9600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_9600
     * @tc.desc   Connect to the specified server IP address and port; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_9600';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5020
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let proxyOption: socket.ProxyOptions = {
            type: socket.ProxyTypes.NONE,
            address: listenAddress,
            username: '',
            password: ''
          }
          let listenAddress1: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5020
          };
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress1,
            proxy: proxyOption
          };
          await tcp!.connect(tcpConnectOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', '${caseName} success');
            expectSuccess();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} fail err: ${JSON.stringify(err)}`);
            expectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err: ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_9700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_9700
     * @tc.desc   Connect to the specified server IP address and port; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_9700';
        try {
          let port: int = (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt();
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: port
          }
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 8001,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          });
          let proxyOption: socket.ProxyOptions = {
            type: socket.ProxyTypes.SOCKS5,
            address: netAddress,
            username: '',
            password: ''
          }
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
            proxy: proxyOption
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301206)
            } else {
              hilog.info(domain, tag, '%{public}s', '${caseName} success');
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', '${caseName} test end')
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err: ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnect_static_9800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_Connect_9800
     * @tc.desc   Connect to the specified server IP address and port; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnect_static_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketConnect_static_9800';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 8002,
            family: 1
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let proxyOption: socket.ProxyOptions = {
            type: socket.ProxyTypes.NONE,
            address: listenAddress,
            username: ''
          }
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
            proxy: proxyOption
          };
          tcp!.connect(tcpConnectOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', '${caseName} success');
              expectSuccess();
            }
            hilog.info(domain, tag, '%{public}s', '${caseName} test end')
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName}_catch fail err: ${JSON.stringify(err)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOnMessage_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OnMessage_0200
     * @tc.desc   Subscription to receive message events for TCPSocket connections,after listen and connect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOnMessage_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOnMessage_static_0200';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          expect(tcpServer).assertInstanceOf('Object');
          let listenAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 5095
          };
          await tcpServer.listen(listenAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
          };
          let clientSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!',
            encoding: 'UTF-8'
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.send(clientSendOptions).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            });
          });
          const callback: Callback<socket.SocketMessageInfo> = (value: socket.SocketMessageInfo) => {
            expectTrue(value.message != null);
            hilog.info(domain, tag, '%{public}s', `${caseName} value:${ArrayBufferToString(value.message)}`);
            expectTrue(value.remoteInfo != null);
            tcpServer.offTcpServerConnect();
            done();
          };
          tcp!.onTcpMessage(callback);
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketTCPSocketOffMessage_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_OffMessage_0300
     * @tc.desc   Unsubscribe from receiving message events for TCPSocket connections,After Subscribing multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketOffMessage_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketOffMessage_static_0300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 4092
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: bindAddress,
          };
          await tcp!.connect(tcpConnectOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpSendOptions: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-8'
          };
          const callback: Callback<socket.SocketMessageInfo> = (data: socket.SocketMessageInfo) => {
            expectTrue(data.message != null);
            expectTrue(data.remoteInfo != null);
            hilog.info(domain, tag, '%{public}s', `${caseName} callback1 test end`);
            done();
          };
          tcp!.onTcpMessage(callback);
          tcp!.offTcpMessage(callback);
          await tcp!.send(tcpSendOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} send fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectSuccess();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_5300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5300
     * @tc.desc   Get TCPSocket status,after bind;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_5300';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10019
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
            socketTimeout: 3000,
            tcpFastOpen: true
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
     * @tc.name   testNetworkMgrSocketTCPSocketSetExtraOptions_static_5400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5400
     * @tc.desc   Get TCPSocket status,after bind;  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions_static_5400';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start `);
          let bindAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 10020
          };
          await tcp!.bind(bindAddress).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
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
            socketTimeout: 3000,
            tcpFastOpen: false
          };
          tcp!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
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
  })
}
