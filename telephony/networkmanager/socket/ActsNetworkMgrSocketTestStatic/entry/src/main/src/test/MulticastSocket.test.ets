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
import hilog from '@ohos.hilog';
import {
  expectFail,
  expectEqual,
  expectTrue,
  SocketInfo,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let addr: socket.NetAddress = {
  address: '239.255.0.1',
  port: 0,
  family: 1
};

const REUSE_ADDRESS_TEST_PORT: int = 45678;

function createReuseAddressBindAddr(): socket.NetAddress {
  return {
    address: '0.0.0.0',
    port: REUSE_ADDRESS_TEST_PORT,
    family: 1
  };
}

async function bindAndGetLocalPort(caseName: string, socketName: string,
  multicast: socket.MulticastSocket): Promise<int> {
  try {
    await multicast.bind(createReuseAddressBindAddr());
    const localAddress: socket.NetAddress = await multicast.getLocalAddress();
    const localPort: int = localAddress.port ?? -1;
    hilog.info(domain, tag, '%{public}s', `${caseName} ${socketName} localAddress: ${JSON.stringify(localAddress)}`);
    return localPort;
  } catch (err) {
    hilog.info(domain, tag, '%{public}s',
      `${caseName} ${socketName} bindAndGetLocalPort err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
    return -1;
  }
}

async function closeReuseAddressSocket(caseName: string, socketName: string,
  multicast?: socket.MulticastSocket): Promise<void> {
  if (!multicast) {
    return;
  }
  try {
    await multicast.close();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s',
      `${caseName} ${socketName} close err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
  }
}

export default function MulticastSocket(): void {
  describe('MulticastSocket', () => {
    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketConstructMulticastSocketInstance_static_0100
     * @tc.number SUB_NetworkMgr_Socket_ConstructMulticastSocketInstance_0100
     * @tc.desc   Create a MulticastSocket object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketMulticastSocketConstructMulticastSocketInstance_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketConstructMulticastSocketInstance_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          hilog.info(domain, tag, '%{public}s', `${caseName} ${JSON.stringify(multicast)}`);
          expectTrue(multicast != null);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_0100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0100
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          multicast.addMembership(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
              multicast.dropMembership(addr).then(() => {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
                expectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_0200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0200
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '239.255.0.1'
          };
          multicast.addMembership(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
              multicast.dropMembership(addr).then(() => {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
                expectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_0300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0300
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '239.255.0.1',
            port: -1,
            family: 1
          };
          multicast.addMembership(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
              multicast.dropMembership(addr).then(() => {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
                expectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_0400
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0400
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '239.255.0.1',
            port: 100000,
            family: 1
          };
          multicast.addMembership(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
              multicast.dropMembership(addr).then(() => {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
                expectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_0500
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0500
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '239.255.0.1',
            port: 0,
            family: -1
          };
          multicast.addMembership(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(true);
              multicast.dropMembership(addr).then(() => {
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
                expectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_0600
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0600
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          multicast.addMembership(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301022);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_0700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0700
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '23424253',
            port: 0,
            family: 1
          };
          multicast.addMembership(addr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301022);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_1200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1200
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_1200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          multicast.addMembership(addr).then(() => {
            expectTrue(true);
            multicast.dropMembership(addr).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s', caseName + 
                'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
              expectFail();
              done();
            });
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_1300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1300
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_1300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '239.255.0.1'
          };
          multicast.addMembership(addr).then(() => {
            expectTrue(true);
            multicast.dropMembership(addr).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s', caseName + 
                'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
              expectFail();
              done();
            });
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_1600
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1600
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_1600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '239.255.0.1',
            port: 0,
            family: -1
          };
          multicast.addMembership(addr).then(() => {
            expectTrue(true);
            multicast.dropMembership(addr).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s', caseName + 
                'fail to dropMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
              expectFail();
              done();
            });
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_1700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1700
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          multicast.addMembership(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_1800
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1800
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: '23424253',
            port: 0,
            family: 1
          };
          multicast.addMembership(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_2100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_2100
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_2100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: 'fe80::95f1:6adf:b93c:d39a%11', // todo 填写正确的ipv6地址
          };
          multicast.addMembership(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301022);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketAddMembership_static_2200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_2200
     * @tc.desc   Join a multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership_static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership_static_2200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let addr: socket.NetAddress = {
            address: 'fe80::95f1:6adf:b93c:d39a%11', // todo 填写正确的ipv6地址
            port: 0,
            family: 1
          };
          multicast.addMembership(addr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301022);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_0100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0100
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.dropMembership(addr, (err: BusinessError | null) => {
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
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_0500
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0500
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let dropAddr: socket.NetAddress = {
            address: '239.255.0.1',
            port: 0,
            family: -1
          };
          multicast.dropMembership(dropAddr, (err: BusinessError | null) => {
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
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_0600
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0600
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let dropAddr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          multicast.dropMembership(dropAddr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301099);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_0700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0700
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let dropAddr: socket.NetAddress = {
            address: '23424243',
            port: 0,
            family: 1
          };
          multicast.dropMembership(dropAddr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301099);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_1000
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1000
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_1000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let dropAddr: socket.NetAddress = {
            address: 'fe80::95f1:6adf:b93c:d39a%11' // todo 填写正确的ipv6地址
          };
          multicast.dropMembership(dropAddr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301099);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_1200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1200
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_1200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.dropMembership(addr).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_1700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1700
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let dropAddr: socket.NetAddress = {
            address: '127.0.0.1',
            port: 0,
            family: 1
          };
          multicast.dropMembership(dropAddr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301099);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_1800
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1800
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let dropAddr: socket.NetAddress = {
            address: '23424243',
            port: 0,
            family: 1
          };
          multicast.dropMembership(dropAddr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301099);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketDropMembership_static_2100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_2100
     * @tc.desc   Exit multicast group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership_static_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership_static_2100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let dropAddr: socket.NetAddress = {
            address: 'fe80::95f1:6adf:b93c:d39a%11' // todo 填写正确的ipv6地址
          };
          multicast.dropMembership(dropAddr).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301099);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0100
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 8;
          multicast.setMulticastTTL(ttl, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done();
            } else {
              multicast.getMulticastTTL().then((value: int) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  `${caseName} value: ${JSON.stringify(value)}`);
                expectTrue(value === ttl);
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              })
                .catch((err) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  expectFail();
                  done();
                })
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0200
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = -1;
          multicast.setMulticastTTL(ttl, (err: BusinessError | null) => {
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
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0300
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 256;
          multicast.setMulticastTTL(ttl, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301022);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0400
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0400
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let ttl: int = 8;
          multicast.setMulticastTTL(ttl, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0700
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 8;
          multicast.setMulticastTTL(ttl).then(() => {
            multicast.getMulticastTTL().then((value: int) => {
              hilog.info(domain, tag, '%{public}s', caseName + 
                `${caseName} value: ${JSON.stringify(value)}`);
              expectEqual(value, ttl);
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            })
              .catch((error) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  `${caseName} err: ${JSON.stringify(error)}`);
                expectFail();
                done();
              });
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0800
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0800
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = -1;
          multicast.setMulticastTTL(ttl).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0900
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0900
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_0900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 256;
          multicast.setMulticastTTL(ttl).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301022);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1000
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_1000
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let ttl: int = 8;
          multicast.setMulticastTTL(ttl).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_1100
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let ttl: int = 0;
          multicast.setMulticastTTL(ttl).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_1200
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let ttl: int = 255;
          multicast.setMulticastTTL(ttl).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_1300
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let ttl: int = 0;
          multicast.setMulticastTTL(ttl, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1400
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_1400
     * @tc.desc   Set the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL_static_1400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let ttl: int = 255;
          multicast.setMulticastTTL(ttl, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0100
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 8;
          await multicast.setMulticastTTL(ttl).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to setMulticastTTL' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getMulticastTTL((err: BusinessError | null, value: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(value === ttl);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0200
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          multicast.getMulticastTTL((err: BusinessError | null, value: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0300
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getMulticastTTL((err: BusinessError | null, value: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(value === 1);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0400
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0400
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 8;
          await multicast.setMulticastTTL(ttl).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to setMulticastTTL' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
          });
          multicast.getMulticastTTL().then((value: int) => {
            expectTrue(value === ttl);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0500
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0500
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          multicast.getMulticastTTL().then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0600
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0600
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getMulticastTTL().then((value: int) => {
            expectTrue(value === 1);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0100
     * @tc.desc   Set the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let mode: boolean = true;
          multicast.setLoopbackMode(mode, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            } else {
              multicast.getLoopbackMode().then((value: boolean) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  `${caseName} value: ${JSON.stringify(value)}`);
                expectTrue(value === mode);
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              })
                .catch((err) => {
                  hilog.info(domain, tag, '%{public}s', caseName + 
                    `${caseName} err: ${JSON.stringify(err)}`);
                  expectFail();
                  done();
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0200
     * @tc.desc   Set the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let mode: boolean = false;
          multicast.setLoopbackMode(mode, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            } else {
              multicast.getLoopbackMode().then((value: boolean) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  `${caseName} value: ${JSON.stringify(value)}`);
                expectTrue(value === mode);
                hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
                done();
              })
                .catch((err) => {
                  hilog.info(domain, tag, '%{public}s', caseName + 
                    `${caseName} err: ${JSON.stringify(err)}`);
                  expectFail();
                  done();
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0300
     * @tc.desc   Set the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let mode: boolean = false;
          multicast.setLoopbackMode(mode, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0600
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0600
     * @tc.desc   Set the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let mode: boolean = true;
          multicast.setLoopbackMode(mode).then(() => {
            multicast.getLoopbackMode().then((value: boolean) => {
              hilog.info(domain, tag, '%{public}s', caseName + 
                `${caseName} value: ${JSON.stringify(value)}`);
              expectTrue(value === mode);
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            })
              .catch((err) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  `${caseName} err: ${JSON.stringify(err)}`);
                expectFail();
                done();
              });
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0700
     * @tc.desc   Set the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let mode: boolean = false;
          multicast.setLoopbackMode(mode).then(() => {
            multicast.getLoopbackMode().then((value: boolean) => {
              hilog.info(domain, tag, '%{public}s', caseName + 
                `${caseName} value: ${JSON.stringify(value)}`);
              expectTrue(value === mode);
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            })
              .catch((err) => {
                hilog.info(domain, tag, '%{public}s', caseName + 
                  `${caseName} err: ${JSON.stringify(err)}`);
                expectFail();
                done();
              });
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0800
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0800
     * @tc.desc   Set the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          let mode: boolean = false;
          multicast.setLoopbackMode(mode).then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0100
     * @tc.desc   Get the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let mode: boolean = false;
          await multicast.setLoopbackMode(mode).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to setLoopbackMode' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getLoopbackMode((err: BusinessError | null, value: boolean | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(value === mode);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0200
     * @tc.desc   Get the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getLoopbackMode((err: BusinessError | null, value: boolean | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
            } else {
              expectTrue(value === true);
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0300
     * @tc.desc   Get the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          multicast.getLoopbackMode((err: BusinessError | null, value: boolean | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
            } else {
              expectFail();
            }
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0400
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0400
     * @tc.desc   Get the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let mode: boolean = false;
          await multicast.setLoopbackMode(mode).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to setLoopbackMode' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
          });
          multicast.getLoopbackMode().then((value: boolean) => {
            expectTrue(value === false);
            hilog.info(domain, tag, '%{public}s', `${caseName} getLoopbackMode success, value:${JSON.stringify(value)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0500
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0500
     * @tc.desc   Get the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getLoopbackMode().then((value: boolean) => {
            expectTrue(value === true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0600
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0600
     * @tc.desc   Get the loopback mode flag in multicast communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          multicast.getLoopbackMode().then(() => {
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSend_static_0700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_Send_0700
     * @tc.desc   Send data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSend_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSend_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let sendOption: socket.UDPSendOptions = {
            data: stringToArrayBuffer('Hello, server!'),
            address: {
              address: '239.255.0.1',
              port: -1,
              family: 1
            }
          };
          multicast.send(sendOption, (err: BusinessError | null) => {
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
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSend_static_0800
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_Send_0800
     * @tc.desc   Send data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSend_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSend_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let sendOption: socket.UDPSendOptions = {
            data: stringToArrayBuffer('Hello, server!'),
            address: {
              address: '239.255.0.1',
              port: 100000,
              family: 1
            }
          };
          multicast.send(sendOption, (err: BusinessError | null) => {
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
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSend_static_2400
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_Send_2400
     * @tc.desc   Send data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSend_static_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSend_static_2400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let sendOption: socket.UDPSendOptions = {
            data: stringToArrayBuffer('Hello, server!'),
            address: {
              address: '239.255.0.1',
              port: -1,
              family: 1
            }
          };
          multicast.send(sendOption).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSend_static_2500
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_Send_2500
     * @tc.desc   Send data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSend_static_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSend_static_2500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let sendOption: socket.UDPSendOptions = {
            data: stringToArrayBuffer('Hello, server!'),
            address: {
              address: '239.255.0.1',
              port: 100000,
              family: 1
            }
          };
          multicast.send(sendOption).then(() => {
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0700
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0700
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 0;
          await multicast.setMulticastTTL(ttl).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              `fail to setMulticastTTL` + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getMulticastTTL().then((value: int) => {
            expectTrue(value === ttl);
            hilog.info(domain, tag, '%{public}s', `${caseName} getMulticastTTL success, value:${JSON.stringify(value)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0800
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0800
     * @tc.desc   Get the maximum number of hops for the router
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
          await multicast.addMembership(addr).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              'fail to addMembership' + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          let ttl: int = 255;
          await multicast.setMulticastTTL(ttl).catch((err) => {
            hilog.info(domain, tag, '%{public}s', caseName + 
              `fail to setMulticastTTL` + JSON.stringify(err?.code) + JSON.stringify(err?.message));
            expectFail();
          });
          multicast.getMulticastTTL().then((value: int) => {
            expectTrue(value === ttl);
            hilog.info(domain, tag, '%{public}s', `${caseName} getMulticastTTL success, value:${JSON.stringify(value)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0100
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetReuseAddress_0100
     * @tc.desc   Verify that only the socket with reuse enabled binds the target port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0100';
        let socketA: socket.MulticastSocket | undefined = undefined;
        let socketB: socket.MulticastSocket | undefined = undefined;
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          socketA = socket.constructMulticastSocketInstance();
          socketB = socket.constructMulticastSocketInstance();
          socketA.setReuseAddress(true);
          const portA: int = await bindAndGetLocalPort(caseName, 'socketA', socketA);
          const portB: int = await bindAndGetLocalPort(caseName, 'socketB', socketB);
          expectTrue(portA === REUSE_ADDRESS_TEST_PORT);
          expectTrue(portB !== REUSE_ADDRESS_TEST_PORT);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
        }
        await closeReuseAddressSocket(caseName, 'socketB', socketB);
        await closeReuseAddressSocket(caseName, 'socketA', socketA);
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        done();
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0200
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetReuseAddress_0200
     * @tc.desc   Verify that a later socket cannot reuse the port when the first one did not enable reuse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0200';
        let socketA: socket.MulticastSocket | undefined = undefined;
        let socketB: socket.MulticastSocket | undefined = undefined;
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          socketA = socket.constructMulticastSocketInstance();
          socketB = socket.constructMulticastSocketInstance();

          const portA: int = await bindAndGetLocalPort(caseName, 'socketA', socketA);
          socketB.setReuseAddress(true);
          const portB: int = await bindAndGetLocalPort(caseName, 'socketB', socketB);
          expectTrue(portA === REUSE_ADDRESS_TEST_PORT);
          expectTrue(portB !== REUSE_ADDRESS_TEST_PORT);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
        }
        await closeReuseAddressSocket(caseName, 'socketB', socketB);
        await closeReuseAddressSocket(caseName, 'socketA', socketA);
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        done();
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0300
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetReuseAddress_0300
     * @tc.desc   Verify that enabling reuse after bind updates the reuse state for later sockets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0300';
        let socketA: socket.MulticastSocket | undefined = undefined;
        let socketB: socket.MulticastSocket | undefined = undefined;
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          socketA = socket.constructMulticastSocketInstance();
          socketB = socket.constructMulticastSocketInstance();

          const portA: int = await bindAndGetLocalPort(caseName, 'socketA', socketA);
          socketA.setReuseAddress(true);
          socketB.setReuseAddress(true);
          const portB: int = await bindAndGetLocalPort(caseName, 'socketB', socketB);
          expectTrue(portA === REUSE_ADDRESS_TEST_PORT);
          expectTrue(portB === REUSE_ADDRESS_TEST_PORT);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
        }
        await closeReuseAddressSocket(caseName, 'socketB', socketB);
        await closeReuseAddressSocket(caseName, 'socketA', socketA);
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        done();
      });

    /**
     * @tc.name   testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0400
     * @tc.number SUB_NetworkMgr_Socket_MulticastSocket_SetReuseAddress_0400
     * @tc.desc   Verify that a recreated socket can bind the target port after enabling reuse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketMulticastSocketSetReuseAddress_static_0400';
        let socketA: socket.MulticastSocket | undefined = undefined;
        let socketB: socket.MulticastSocket | undefined = undefined;
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          socketA = socket.constructMulticastSocketInstance();
          socketB = socket.constructMulticastSocketInstance();

          socketA.setReuseAddress(true);
          const portA: int = await bindAndGetLocalPort(caseName, 'socketA', socketA);
          const firstPortB: int = await bindAndGetLocalPort(caseName, 'socketB-first', socketB);
          await closeReuseAddressSocket(caseName, 'socketB-first', socketB);
          socketB = socket.constructMulticastSocketInstance();
          socketB.setReuseAddress(true);
          const secondPortB: int =
            await bindAndGetLocalPort(caseName, 'socketB-second', socketB);
          expectTrue(portA === REUSE_ADDRESS_TEST_PORT);
          expectTrue(firstPortB !== REUSE_ADDRESS_TEST_PORT);
          expectTrue(secondPortB === REUSE_ADDRESS_TEST_PORT);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectFail();
        }
        await closeReuseAddressSocket(caseName, 'socketB', socketB);
        await closeReuseAddressSocket(caseName, 'socketA', socketA);
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
        done();
      });
  });
}