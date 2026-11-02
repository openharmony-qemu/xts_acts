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

import { describe, it, Level, Size, TestType, beforeEach, afterEach } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import {
  expectFail,
  expectEqual,
  expectTrue,
  expectFalse,
  SocketInfo,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 0,
  family: 1
};

export default function TLSSocketTest(): void {
  describe('TLSSocketTest', () => {
    let tlsSocket: socket.TLSSocket | undefined
    beforeEach(() => {
      tlsSocket = socket.constructTLSSocketInstance();
      hilog.info(domain, tag, '%{public}s', `beforeEach tlsSocket init success`);
    })

    afterEach(async () => {
      await tlsSocket!.close().then(() => {
        hilog.info(domain, tag, '%{public}s', `beforeEach tlsSocket close success`);
      }).catch((err) => {
        hilog.info(domain, tag, '%{public}s', `beforeEach tlsSocket close fail, err:${JSON.stringify(err?.message)}`);
      });
    })

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketConstructTLSSocketInstance_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_ConstructTLSSocketInstance_0100
     * @tc.desc   Create and return a TLSSocket object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketConstructTLSSocketInstance_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketConstructTLSSocketInstance_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          expectTrue(tlsSocket != null);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_0100
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          tlsSocket!.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_0300
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
          };
          tlsSocket!.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_0400
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          tlsSocket!.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_0500
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 6565656,
            family: 1
          };
          tlsSocket!.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_0600
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 3
          };
          tlsSocket!.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_0700
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 2
          };
          tlsSocket!.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1100
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          tlsSocket!.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1300
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
          };
          tlsSocket!.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1400
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          tlsSocket!.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1500
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 6565656,
            family: 1
          };
          tlsSocket!.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1600
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 3
          };
          tlsSocket!.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1700
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 2
          };
          tlsSocket!.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1800
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1800
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 1
          };
          tlsSocket!.bind(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectTrue(true);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketBind_static_1900
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_Bind_1900
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketBind_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketBind_static_1900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let addr: socket.NetAddress = {
            address: 'www.baidu.com',
          };
          tlsSocket!.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketGetState_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_GetState_0100
     * @tc.desc   Get TLSSocket Status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketGetState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketGetState_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tlsSocket!.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
              expectTrue(data != null);
              expectTrue(data?.isBound as boolean);
              expectFalse(data?.isClose as boolean);
              expectFalse(data?.isConnected as boolean);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketGetState_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_GetState_0300
     * @tc.desc   Get TLSSocket Status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketGetState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketGetState_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          tlsSocket!.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
              expectTrue(data != null);
              expectFalse(data?.isBound as boolean);
              expectFalse(data?.isClose as boolean);
              expectFalse(data?.isConnected as boolean);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketGetState_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_GetState_0500
     * @tc.desc   Get TLSSocket Status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketGetState_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketGetState_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          tlsSocket!.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectTrue(data?.isBound as boolean);
            expectFalse(data?.isClose as boolean);
            expectFalse(data?.isConnected as boolean);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketGetState_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_GetState_0700
     * @tc.desc   Get TLSSocket Status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketGetState_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketGetState_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          tlsSocket!.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectFalse(data?.isBound as boolean);
            expectFalse(data?.isClose as boolean);
            expectFalse(data?.isConnected as boolean);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0100
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: { on: true, linger: 10 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);

            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0200
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0300
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: { on: true, linger: 10 },
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0400
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: -1,
            sendBufferSize: -1,
            reuseAddress: false,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0500
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: 100000,
            sendBufferSize: 100000,
            reuseAddress: false,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0600
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: -1
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} set err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0700
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: true, linger: -1 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 0
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} set err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0800
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: true, linger: 100000 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 0
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} set err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1100
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: true,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: { on: true, linger: 10 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1200
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1300
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            socketLinger: { on: true, linger: 10 },
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1400
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: -1,
            sendBufferSize: -1,
            reuseAddress: false,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1500
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: 100000,
            sendBufferSize: 100000,
            reuseAddress: false,
            socketTimeout: 3000
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1600
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: false, linger: 10 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: -1
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1700
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1700
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: true, linger: -1 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 0
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1800
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1800
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: true, linger: 100000 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 0
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1990
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1990
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1990';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: true, linger: 100000 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 0,
            tcpFastOpen: true
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketSetExtraOptions_static_1991
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1991
     * @tc.desc   Set other properties for TCPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions_static_1991', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions_static_1991';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsSocket!.bind(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: false,
            TCPNoDelay: false,
            socketLinger: { on: true, linger: 100000 },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 0,
            tcpFastOpen: false
          };
          tlsSocket!.setExtraOptions(tcpExtraOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });
  });
}
