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

import { describe, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import {
  expectFail,
  expectEqual,
  expectTrue,
  expectFalse,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let UDPAddr1: socket.NetAddress = {
  address: '127.0.0.1',
  port: 0,
  family: 1
};

let UDPAddr2: socket.NetAddress = {
  address: '127.0.0.1',
  port: 8080,
  family: 1
};

function isValidIp(ip: string): boolean {
  if (typeof ip !== 'string' || ip.length === 0) {
    return false;
  }

  const ipv4Regex =
    new RegExp('^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
  if (ipv4Regex.test(ip)) {
    return true;
  }

  const ipv6Regex = new RegExp(
    '^(' +
      '([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|' +
      '([0-9a-fA-F]{1,4}:){1,7}:|' +
      '([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|' +
      '([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|' +
      '([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|' +
      '([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|' +
      '([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|' +
      '[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|' +
      ':((:[0-9a-fA-F]{1,4}){1,7}|:)|' +
      'fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|' +
      '::(ffff(:0{1,4}){0,1}:){0,1}' +
      '((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}' +
      '(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|' +
      '([0-9a-fA-F]{1,4}:){1,4}:' +
      '((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}' +
      '(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])' +
      ')$'
  );
  if (ipv6Regex.test(ip)) {
    return true;
  }

  return false;
}

export default function UDPSocketTest(): void {
  describe('UDPSocketTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketConstructUDPSocketInstance_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_ConstructUDPSocketInstance_0100
     * @tc.desc   Create a UDPSocket object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketUDPSocketConstructUDPSocketInstance_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketConstructUDPSocketInstance_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          hilog.info(domain, tag, '%{public}s', `${caseName} ${JSON.stringify(udp)}`);
          expectTrue(udp != null);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_0100
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.onUdpError((err: BusinessError | null) => {
            hilog.error(domain, tag, '%{public}s', "on error,err:" + JSON.stringify(err?.message));
          });
          udp.onListening(() => {
            hilog.info(domain, tag, '%{public}s', "on listening success");
          });
          udp.bind(UDPAddr1, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.offUdpError((err: BusinessError | null) => {
              hilog.error(domain, tag, '%{public}s', "off error,err:" + JSON.stringify(err?.message));
            });
            udp.offListening();
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_0200
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '4564646',
            port: 0,
            family: 1
          };
          udp.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301099);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_0300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_0300
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
          };
          udp.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_0400
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_0400
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          udp.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_0500
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_0500
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 6565656,
            family: 1
          };
          udp.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_0600
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_0600
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 2
          };
          udp.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_0700
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_0700
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 2
          };
          udp.bind(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1100
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.bind(UDPAddr1).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1200
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '4564646',
            port: 0,
            family: 1
          };
          udp.bind(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301099);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1300
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
          };
          udp.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1400
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1400
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: -1,
            family: 1
          };
          udp.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1500
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1500
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 6565656,
            family: 1
          };
          udp.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1600
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1600
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 2
          };
          udp.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1700
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1700
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 2
          };
          udp.bind(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_1800
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_1800
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: '::1',
            port: 0,
            family: 1
          };
          udp.bind(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketBind_static_2100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Bind_2100
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketBind_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketBind_static_2100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let addr: socket.NetAddress = {
            address: 'www.baidu.com',
            port: 0,
            family: 2
          };
          udp.bind(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_0100
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: UDPAddr2
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_0200
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: stringToArrayBuffer('Hello, server!'),
            address: UDPAddr2
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_0500
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_0500
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '4564646',
              port: 0,
              family: 1
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301022);
            } else {
              expectFail();
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_0700
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_0700
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '127.0.0.1',
              port: -1,
              family: 1
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_0800
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_0800
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '127.0.0.1',
              port: 6565656,
              family: 1
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_0900
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_0900
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_0900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '127.0.0.1',
              port: 0,
              family: 3
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectTrue(true, caseName);
            } else {
              expectTrue(false, caseName);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectTrue(true, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_1500
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_1500
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_1500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: UDPAddr2
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_1600
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_1600
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_1600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: stringToArrayBuffer('Hello, server!'),
            address: UDPAddr2
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_1700
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_1700
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: '',
            address: UDPAddr2
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_1800
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_1800
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: new ArrayBuffer(0),
            address: UDPAddr2
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_1900
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_1900
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketUDPSocketSend_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_1900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '4564646',
              port: 0,
              family: 1
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_2100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_2100
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_2100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '127.0.0.1',
              port: -1,
              family: 1
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_2200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_2200
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_2200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '127.0.0.1',
              port: 6565656,
              family: 1
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_2300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_2300
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_2300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '127.0.0.1',
              port: 0,
              family: 3
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSend_static_2500
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_2500
     * @tc.desc   Sending data through UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSend_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSend_static_2500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: {
              address: '::1',
              port: 0,
              family: 1
            }
          };
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.send(sendOptions).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 401);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Close_0100
     * @tc.desc   Close UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketClose_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.close((err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Close_0200
     * @tc.desc   Close UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketClose_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.close((err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2300999);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketClose_static_0300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Close_0300
     * @tc.desc   Close UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketClose_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketClose_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.close().then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketClose_static_0400
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Close_0400
     * @tc.desc   Close UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketClose_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketClose_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.close().then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2300999);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetState_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetState_0100
     * @tc.desc   Get UDPSocket status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetState_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
              udp.close();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
              expectTrue(data != null);
              expectTrue(data!.isBound);
              expectFalse(data!.isClose);
              expectFalse(data!.isConnected);
              udp.close();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetState_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetState_0200
     * @tc.desc   Get UDPSocket status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetState_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          await udp.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
              expectTrue(data != null);
              expectFalse(data!.isBound);
              expectTrue(data!.isClose);
              expectFalse(data!.isConnected);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetState_static_0300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetState_0300
     * @tc.desc   Get UDPSocket status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetState_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.getState((err: BusinessError | null, data: socket.SocketStateBase | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
              expectTrue(data != null);
              expectFalse(data!.isBound);
              expectFalse(data!.isClose);
              expectFalse(data!.isConnected);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetState_static_0400
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetState_0400
     * @tc.desc   Get UDPSocket status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetState_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetState_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectTrue(data!.isBound);
            expectFalse(data!.isClose);
            expectFalse(data!.isConnected);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetState_static_0500
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetState_0500
     * @tc.desc   Get UDPSocket status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetState_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetState_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          await udp.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          });
          udp.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectFalse(data!.isBound);
            expectTrue(data!.isClose);
            expectFalse(data!.isConnected);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetState_static_0600
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetState_0600
     * @tc.desc   Get UDPSocket status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetState_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetState_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectFalse(data!.isBound);
            expectFalse(data!.isClose);
            expectFalse(data!.isConnected);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0100
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 6000,
            broadcast: true
          }
          udp.setExtraOptions(udpextraoptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0200
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            sendBufferSize: 100,
          }
          udp.setExtraOptions(udpextraoptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} setExtraOptions err: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_0300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0300
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: 0,
            sendBufferSize: 0,
            reuseAddress: true,
            socketTimeout: 0,
            broadcast: false
          }
          udp.setExtraOptions(udpextraoptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_0400
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0400
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: -1,
            sendBufferSize: -1,
            reuseAddress: true,
            socketTimeout: 0,
            broadcast: false
          }
          udp.setExtraOptions(udpextraoptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} set err: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_0500
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0500
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: 0,
            sendBufferSize: 0,
            reuseAddress: true,
            socketTimeout: -1,
            broadcast: false
          }
          udp.setExtraOptions(udpextraoptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} set err: ${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301033);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_0800
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0800
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: false,
            socketTimeout: 6000,
            broadcast: true
          }
          udp.setExtraOptions(udpextraoptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_0900
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0900
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_0900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            sendBufferSize: 100,
          }
          udp.setExtraOptions(udpextraoptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setExtraOptions err: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_1000
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1000
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_1000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: 0,
            sendBufferSize: 0,
            reuseAddress: true,
            socketTimeout: 0,
            broadcast: false
          }
          udp.setExtraOptions(udpextraoptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setExtraOptions err: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_1100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1100
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_1100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: -1,
            sendBufferSize: -1,
            reuseAddress: true,
            socketTimeout: 0,
            broadcast: false
          }
          udp.setExtraOptions(udpextraoptions).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setExtraOptions err: ${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSetExtraOptions_static_1200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1200
     * @tc.desc   Set other properties of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions_static_1200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let udpextraoptions: socket.UDPExtraOptions = {
            receiveBufferSize: 0,
            sendBufferSize: 0,
            reuseAddress: true,
            socketTimeout: -1,
            broadcast: false
          }
          udp.setExtraOptions(udpextraoptions).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setExtraOptions err: ${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301033);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetSocketFd_0100
     * @tc.desc   Get Socket FD after successful bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetSocketFd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetSocketFd_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          udp.getSocketFd().then((fd: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} get Socket FD: ${fd}`);
            expectTrue(fd !== -1);
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} getSocketFd err: ${JSON.stringify(err?.message)}`);
            udp.close();
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetSocketFd_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetSocketFd_0200
     * @tc.desc   Get Socket FD after without bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketGetSocketFd_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetSocketFd_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.getSocketFd().then((fd: int) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} get Socket FD: ${fd}`);
            expectTrue(fd === -1);
            udp.close();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} getSocketFd err: ${JSON.stringify(err?.message)}`);
            udp.close();
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOnMessage_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_On_Message_0100
     * @tc.desc   Subscription to receive message events for UDPSocket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOnMessage_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOnMessage_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
          let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp1.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          await udp2.bind(UDPAddr2).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: UDPAddr2
          };
          udp2.onUdpMessage((value: socket.SocketMessageInfo) => {
            let str: string = ArrayBufferToString(value.message);
            hilog.info(domain, tag, '%{public}s', `${caseName} message: ${str}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
            expectEqual(str, sendOptions.data as string);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp1.close();
            udp2.close();
            done();
          });
          udp1.send(sendOptions);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOffMessage_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Off_Message_0100
     * @tc.desc   Unsubscribe from receiving message events for UDPSocket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOffMessage_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOffMessage_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
          let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp1.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          await udp2.bind(UDPAddr2).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: UDPAddr2
          };
          let callback: Callback<socket.SocketMessageInfo> = (value: socket.SocketMessageInfo) => {
            let str: string = ArrayBufferToString(value.message);
            hilog.info(domain, tag, '%{public}s', `${caseName} message: ${str}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp1.close();
            udp2.close();
            done();
          };
          udp2.onUdpMessage(callback);
          udp2.offUdpMessage(callback);
          await udp1.send(sendOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to send, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectTrue(true);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOffMessage_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Off_Message_0200
     * @tc.desc   Unsubscribe from receiving message events for UDPSocket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOffMessage_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOffMessage_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
          let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp1.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          await udp2.bind(UDPAddr2).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: UDPAddr2
          };
          let callback1: Callback<socket.SocketMessageInfo> = (value: socket.SocketMessageInfo) => {
            let str: string = ArrayBufferToString(value.message);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb1 message: ${str}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb1 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          let callback2: Callback<socket.SocketMessageInfo> = (value: socket.SocketMessageInfo) => {
            let str: string = ArrayBufferToString(value.message);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb2 message: ${str}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb2 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          udp2.onUdpMessage(callback1);
          udp2.onUdpMessage(callback2);
          udp2.offUdpMessage(callback2);
          await udp1.send(sendOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to send, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectTrue(true);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          udp1.close();
          udp2.close();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOffMessage_static_0300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Off_Message_0300
     * @tc.desc   Unsubscribe from receiving message events for UDPSocket connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOffMessage_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOffMessage_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
          let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp1.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          await udp2.bind(UDPAddr2).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: UDPAddr2
          };
          let callback1: Callback<socket.SocketMessageInfo> = (value: socket.SocketMessageInfo) => {
            let str: string = ArrayBufferToString(value.message);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb1 message: ${str}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb1 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          let callback2: Callback<socket.SocketMessageInfo> = (value: socket.SocketMessageInfo) => {
            let str: string = ArrayBufferToString(value.message);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb2 message: ${str}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} cb2 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          udp2.onUdpMessage(callback1);
          udp2.onUdpMessage(callback2);
          udp2.offUdpMessage();
          await udp1.send(sendOptions).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to send, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectTrue(true);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          udp1.close();
          udp2.close();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOnClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_On_Close_0100
     * @tc.desc   Subscription to UDPSocket connection closure event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOnClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOnClose_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp1.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let callback: Callback<void> = () => {
            hilog.info(domain, tag, '%{public}s', `${caseName} closed`);
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          udp1.onClose(callback);
          udp1.close();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOffClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Off_Close_0200
     * @tc.desc   Unsubscribe from the closing event of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOffClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOffClose_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp1.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let callback1: Callback<void> = () => {
            hilog.info(domain, tag, '%{public}s', `${caseName} cb1 closed`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          let callback2: Callback<void> = () => {
            hilog.info(domain, tag, '%{public}s', `${caseName} cb2 closed`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          udp1.onClose(callback1);
          udp1.onClose(callback2);
          udp1.offClose(callback2);
          await udp1.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();

          });
          expectTrue(true);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOffClose_static_0300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Off_Close_0300
     * @tc.desc   Unsubscribe from the closing event of UDPSocket connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOffClose_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOffClose_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
          await udp1.bind(UDPAddr1).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to bind code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
            expectFail();
          });
          let callback1: Callback<void> = () => {
            hilog.info(domain, tag, '%{public}s', `${caseName} closed`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          let callback2: Callback<void> = () => {
            hilog.info(domain, tag, '%{public}s', `${caseName} closed`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          };
          udp1.onClose(callback1);
          udp1.onClose(callback2);
          udp1.offClose();
          await udp1.close().catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          });
          expectTrue(true);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketUDPSocketOnListening_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_OnListening_0100
     * @tc.desc   Bind IP address and port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketUDPSocketOnListening_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketOnListening_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.onUdpError((err: BusinessError | null) => {
            hilog.error(domain, tag, '%{public}s', "on error,err:" + JSON.stringify(err?.message));
          });
          udp.onListening(() => {
            hilog.info(domain, tag, '%{public}s', "on listening success");
          });
          udp.bind(UDPAddr1, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
              expectTrue(true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            udp.offUdpError((err: BusinessError | null) => {
              hilog.error(domain, tag, '%{public}s', "off error,err:" + JSON.stringify(err?.message));
            });
            udp.offListening();
            udp.close();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrGetListeningUdpInfo_static_0100
     * @tc.number SUB_NetworkMgr_Get_Listening_Udp_Info_0100
     * @tc.desc   Get current UDP port states
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrGetListeningUdpInfo_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrGetListeningUdpInfo_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getSystemNetPortStates().then((data: connection.NetPortStatesInfo) => {
            if (data !== undefined && data.udpPortStatesInfo !== undefined) {
              let udpPortStatesInfoList: Array<connection.UdpNetPortStatesInfo> = data.udpPortStatesInfo!;
              hilog.info(domain, tag, '%{public}s',
                `${caseName} udpPortStatesInfo length: ${udpPortStatesInfoList.length}`);
              for (let i = 0; i < udpPortStatesInfoList.length; i++) {
                const udpItem = udpPortStatesInfoList[i];
                hilog.info(domain, tag, '%{public}s', `${caseName} udpItem[${i}]: ${JSON.stringify(udpItem)}`);
                expectTrue(typeof udpItem.udpLocalIp === 'string');
                expectTrue(isValidIp(udpItem.udpLocalIp));
                expectTrue(typeof udpItem.udpLocalPort === 'int');
                expectTrue(udpItem.udpLocalPort >= 0 && udpItem.udpLocalPort <= 65535);
                expectTrue(typeof udpItem.udpUid === 'int');
                expectTrue(udpItem.udpUid >= 0);
                expectTrue(typeof udpItem.udpPid === 'int');
                expectTrue(udpItem.udpPid >= 0);
              }
              expectTrue(udpPortStatesInfoList.length >= 0);
            } else {
              expectTrue(data === undefined);
              hilog.info(domain, tag, '%{public}s', `${caseName} error: data or its port states info is undefined`);
              expectFail();
            }
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} error fetching system net port states, errorCode:${err.code} msg:${JSON.stringify(err.message)}`);
            expectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
  });
}
