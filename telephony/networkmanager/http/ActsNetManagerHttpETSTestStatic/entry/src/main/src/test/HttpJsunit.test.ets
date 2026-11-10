'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, expect, it, beforeEach, afterEach, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import connection from "@ohos.net.connection";
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import http from '@ohos.net.http';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
};

function expectTrue(n: boolean) {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
};

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  });
}

export default function httpJsunit(): void {
  describe("httpJsunitTest", () => {
    let multicastSocket = socket.constructMulticastSocketInstance();
    let multicastAddress: connection.NetAddress = {
      address: '239.255.0.1',
      family: 1,
      port: 32123
    };
    let multicastAddress_invalid: connection.NetAddress = {
      address: '1.1.1.1',
      family: 1,
      port: 32123
    };
    let multicastAddress_null: connection.NetAddress = {
      address: '',
      family: 1,
      port: 32123
    };
    let ttl = 100;
    let ttl_invalid = 256;

    /**
     * @tc.name   testNetworkMgrIsDefaultNetMeteredAsync_static_0100
     * @tc.number SUB_NetworkMgr_IsDefaultNetMetered_Async_0100
     * @tc.desc   Test isDefaultNetMetered() to check return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrIsDefaultNetMeteredAsync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrIsDefaultNetMeteredAsync_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.isDefaultNetMetered((error: BusinessError | null, data: boolean | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} isDefaultNetMetered  error`);
              expectFalse();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} isDefaultNetMetered success`);
              expectTrue(error == undefined);
              expectTrue(data == true);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrIsDefaultNetMeteredPromise_static_0100
     * @tc.number SUB_NetworkMgr_IsDefaultNetMetered_Promise_0100
     * @tc.desc   Test isDefaultNetMetered() to check return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrIsDefaultNetMeteredPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrIsDefaultNetMeteredPromise_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.isDefaultNetMetered().then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} isDefaultNetMetered success`);
            expectTrue(data == true);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRequestSocket_static_0100
     * @tc.number SUB_NetworkMgr_Connection_Request_Socket_0100
     * @tc.desc   Create socket and HttpRequest success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionRequestSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrConnectionRequestSocket_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let tcpSocket: socket.TCPSocket = socket.constructTCPSocketInstance();
          let udpSocket: socket.UDPSocket = socket.constructUDPSocketInstance();
          let httpRequest: http.HttpRequest = http.createHttp();

          expectTrue(httpRequest != null);
          expectTrue(tcpSocket != null);
          expectTrue(udpSocket != null);
          httpRequest.destroy();
          tcpSocket.close();
          udpSocket.close();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketAddMembershipPromise_static_0100
     * @tc.number SUB_NetworkMgr_UDPSocket_AddMembership_Promise_0100
     * @tc.desc   Test addMembership property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketAddMembershipPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketAddMembershipPromise_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.addMembership(multicastAddress).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} addMembership success, data: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketAddMembershipPromise_static_0200
     * @tc.number SUB_NetworkMgr_UDPSocket_AddMembership_Promise_0200
     * @tc.desc   Test addMembership property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketAddMembershipPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketAddMembershipPromise_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.addMembership(multicastAddress_invalid).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} addMembership success, data: ${JSON.stringify(data)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
            expectTrue(err.code !== undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketAddMembershipPromise_static_0300
     * @tc.number SUB_NetworkMgr_UDPSocket_AddMembership_Promise_0300
     * @tc.desc   Test addMembership property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketAddMembershipPromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketAddMembershipPromise_static_0300";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.addMembership(multicastAddress_null).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} addMembership success, data: ${JSON.stringify(data)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
            expectTrue(err.code !== undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0100
     * @tc.number SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0100
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setMulticastTTL(ttl).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0200
     * @tc.number SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0200
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setMulticastTTL(ttl_invalid).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
            expectTrue(err.code !== undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrUDPSocketGetMulticastTTLPromise_static_0100
     * @tc.number SUB_NetworkMgr_UDPSocket_GetMulticastTTL_Promise_0100
     * @tc.desc   Test getMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketGetMulticastTTLPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketGetMulticastTTLPromise_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.getMulticastTTL().then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} getMulticastTTL success, data: ${JSON.stringify(data)}`);
            expectTrue(data == 100);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} getMulticastTTL failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketSetLoopbackModePromise_static_0100
     * @tc.number SUB_NetworkMgr_UDPSocket_SetLoopbackMode_Promise_0100
     * @tc.desc   Test setLoopbackMode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetLoopbackModePromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetLoopbackModePromise_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setLoopbackMode(true).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketSetLoopbackModePromise_static_0200
     * @tc.number SUB_NetworkMgr_UDPSocket_SetLoopbackMode_Promise_0200
     * @tc.desc   Test setLoopbackMode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetLoopbackModePromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetLoopbackModePromise_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setLoopbackMode(false).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(err)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrUDPSocketGetLoopbackModePromise_static_0100
     * @tc.number SUB_NetworkMgr_UDPSocket_GetLoopbackMode_Promise_0100
     * @tc.desc   Test getLoopbackMode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketGetLoopbackModePromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketGetLoopbackModePromise_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setLoopbackMode(true).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
            multicastSocket.getLoopbackMode().then((data) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getLoopbackMode success, data: ${JSON.stringify(data)}`);
              expectTrue(data == true);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }).catch((error) => {
              const err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', `${caseName} getLoopbackMode failed, err: ${JSON.stringify(err)}`);
              expectFalse();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            });
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketGetLoopbackModePromise_static_0200
     * @tc.number SUB_NetworkMgr_UDPSocket_GetLoopbackMode_Promise_0200
     * @tc.desc   Test getLoopbackMode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketGetLoopbackModePromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketGetLoopbackModePromise_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setLoopbackMode(false).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
            multicastSocket.getLoopbackMode().then((data) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getLoopbackMode success, data: ${JSON.stringify(data)}`);
              expectTrue(data == false);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }).catch((error) => {
              const err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', `${caseName} getLoopbackMode failed, err: ${JSON.stringify(err)}`);
              expectFalse();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            });
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketDropMembershipPromise_static_0100
     * @tc.number SUB_NetworkMgr_UDPSocket_DropMembership_Promise_0100
     * @tc.desc   Test dropMembership property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketDropMembershipPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketDropMembershipPromise_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.dropMembership(multicastAddress).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
          await sleep(2000);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketDropMembershipPromise_static_0200
     * @tc.number SUB_NetworkMgr_UDPSocket_DropMembership_Promise_0200
     * @tc.desc   Test dropMembership property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketDropMembershipPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketDropMembershipPromise_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.dropMembership(multicastAddress_invalid).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
            expectTrue(err.code !== undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrUDPSocketDropMembershipPromise_static_0300
     * @tc.number SUB_NetworkMgr_UDPSocket_DropMembership_Promise_0300
     * @tc.desc   Test dropMembership property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketDropMembershipPromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketDropMembershipPromise_static_0300";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.dropMembership(multicastAddress_null).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
            expectTrue(err.code !== undefined);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0500
     * @tc.number SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0500
     * @tc.desc   Test setMulticastTTL401 property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0500";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setMulticastTTL(0).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          expectTrue(true);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0600
     * @tc.number SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0600
     * @tc.desc   Test setMulticastTTL401 property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0600";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setMulticastTTL(-1).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          expectTrue(true);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0700
     * @tc.number SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0700
     * @tc.desc   Test setMulticastTTL401 property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0700";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setMulticastTTL(255).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          expectTrue(true);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0800
     * @tc.number SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0800
     * @tc.desc   Test setMulticastTTL401 property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrUDPSocketSetMulticastTTLPromise_static_0800";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          multicastSocket.setMulticastTTL(256).then((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            expectTrue(true);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err:${JSON.stringify(error)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          expectTrue(true);
          done();
        }
      });

    hilog.info(domain, tag, '%{public}s', "************* socket Test end*************");
  });
}