'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 
import { describe, expect, it, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionWithoutPermissionTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const NOT_PERMISSION = 201

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, ` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function ConnectionWithoutPermissionTest(): void {
  describe('ConnectionWithoutPermissionTest', () => {

    /**
     * @tc.name   testNetworkMgrConnectionAddCustomDnsRule_static_0700
     * @tc.number SUB_NetworkMgr_Connection_AddCustomDnsRule_0700
     * @tc.desc   Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionAddCustomDnsRule_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError | null) => {
          hilog.error(domain, tag, `${caseName} error:${JSON.stringify(error)}`);
          if (error?.code !== 0) {
            ExpectTrue(error?.code === 201);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionAddCustomDnsRule_static_0800
     * @tc.number SUB_NetworkMgr_Connection_AddCustomDnsRule_0800
     * @tc.desc   Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionAddCustomDnsRule_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          await connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} error:${JSON.stringify(error)}`);
          ExpectTrue(err?.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err?.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRemoveCustomDnsRule_static_0700
     * @tc.number SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0700
     * @tc.desc   Delete custom DNS rules for the corresponding host in the current application.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule_static_0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError | null) => {
          hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
          if (error?.code !== 0) {
            ExpectTrue(error?.code === 201);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRemoveCustomDnsRule_static_0800
     * @tc.number SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0800
     * @tc.desc   Delete custom DNS rules for the corresponding host in the current application.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule_static_0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          await connection.removeCustomDnsRule("127.0.0.1");
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrConnectionClearCustomDnsRules_static_0300
     * @tc.number SUB_NetworkMgr_Connection_ClearCustomDnsRules_0300
     * @tc.desc   Delete all custom DNS rules for the current application.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionClearCustomDnsRules_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.clearCustomDnsRules((error: BusinessError | null) => {
          hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
          if (error?.code !== 0) {
            ExpectTrue(error?.code === 201);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionClearCustomDnsRules_static_0400
     * @tc.number SUB_NetworkMgr_Connection_ClearCustomDnsRules_0400
     * @tc.desc   Delete all custom DNS rules for the current application . Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionClearCustomDnsRules_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          await connection.clearCustomDnsRules();
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressByNameCallbackNop_static_100
     * @tc.number SUB_NetworkMgr_Connection_GetAddressByNameCallbackNop_0100
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAddressByNameCallbackNop_static_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop_static_100 begin');
      try {
        let host = "xxxx";
        connection.getDefaultNetSync().getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
          if (error?.code !== 0) {
            hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop_static_100 fail' + JSON.stringify(error));
            ExpectTrue(error?.code === NOT_PERMISSION)
            done();
          } else {
            hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop_static_100 success');
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop_static_100 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressByNamePromiseNop_static_200
     * @tc.number SUB_NetworkMgr_Connection_GetAddressByNamePromiseNop_0200
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetAddressByNamePromiseNop_static_200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop_static_200 begin');
      try {
        let host = "xxxx";
        try {
          let data = await connection.getDefaultNetSync().getAddressByName(host);
          hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop_static_200 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop_static_200 fail' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        }
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop_static_200 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop_static_300
     * @tc.number SUB_NetworkMgr_Connection_GetAddressesByNamePromiseArrayNetAddressNop_0300
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop_static_300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop_static_300 begin');
      try {
        let host = "xxxx";
        try {
          let data = await connection.getDefaultNetSync().getAddressesByName(host);
          hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop_static_300 success');
          expect().assertFail();
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop_static_300 fail' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        }
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop_static_300 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop_static_400
     * @tc.number SUB_NetworkMgr_Connection_GetAddressesByNameCallbackArrayNetAddressNop_0400
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop_static_400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop_static_400 begin');
      try {
        let host = "xxxx";
        connection.getDefaultNetSync()
          .getAddressesByName(host, (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
            if (error?.code !== 0) {
              hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop_static_400 fail' + JSON.stringify(error));
              expect(error?.code).assertEqual(NOT_PERMISSION);
              done();
            } else {
              hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop_static_400 success');
              expect().assertFail();
              done();
            }
          });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop_static_400 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectOwnerUidPromiseNop_static_100
     * @tc.number SUB_NetworkMgr_Connection_GetConnectOwnerUidPromiseNop_0100
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectOwnerUidPromiseNop_static_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionGetConnectOwnerUidPromiseNop_static_100';
      hilog.info(domain, tag, `${caseName} begin`);
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: "192.168.1.100", family: 1, port: 12345 },
          { address: "192.168.1.101", family: 1, port: 8888 });
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(domain, tag, `${caseName} failed ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectOwnerUidSyncNop_static_100
     * @tc.number SUB_NetworkMgr_Connection_GetConnectOwnerUidSyncNop_0100
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectOwnerUidSyncNop_static_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionGetConnectOwnerUidSyncNop_static_100';
      hilog.info(domain, tag, `${caseName} begin`);
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: "192.168.1.100", family: 1, port: 12345 },
          { address: "192.168.1.101", family: 1, port: 8888 });
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(domain, tag, `${caseName} failed ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_0100
     * @tc.number  SUB_NetworkMgr_Connection_GetAddressesByNameWithOptions_0100
     * @tc.desc    Using the getAddressesByNameWithOptions method without permission
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done:() => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      let host = "www.baidu.com";
      try {
        try {
          let data = await connection.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL });
          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch(err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0600
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMetered_Callback_0600
     * @tc.desc   test check if the data traffic usage on the current network is being measured and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0600";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        connection.isDefaultNetMetered((err: BusinessError | null, data: boolean | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} isDefaultNetMetered callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 201);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isDefaultNetMetered callback: data->${JSON.stringify(data)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0600
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMetered_Promise_0600
     * @tc.desc   test check if the data traffic usage on the current network is being measured and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0600";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        try {
          let data = await connection.isDefaultNetMetered();
          hilog.info(domain, tag, `${caseName} isDefaultNetMetered: data->${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0200
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMeteredSync_0200
     * @tc.desc   test check if the data traffic usage on the current network is being measured and return it using synchronous mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0200";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let isMetered: boolean = connection.isDefaultNetMeteredSync();
        hilog.info(domain, tag, `${caseName} isMetered ->${JSON.stringify(isMetered)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testRefreshGlobalRefreshGlobalHttpProxyNoPermission_static_0100
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxyNoPermission_0100
     * @tc.desc   test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalRefreshGlobalHttpProxyNoPermission_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testRefreshGlobalRefreshGlobalHttpProxyNoPermission_static_0100";
      console.info(`${caseName} test start`);
      try {
        await connection.refreshGlobalHttpProxy();
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} Promise rejected with: code: ${JSON.stringify(err?.code)}, message: ${JSON.stringify(err?.message)}`);
        ExpectTrue(err.code === 201);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testRefreshGlobalRefreshGlobalHttpProxyNoPermission_static_0200
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxyNoPermission_0200
     * @tc.desc   test refreshGlobalHttpProxy returns 201 (Permission denied) using Promise way
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalRefreshGlobalHttpProxyNoPermission_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testRefreshGlobalRefreshGlobalHttpProxyNoPermission_static_0200';
        console.info(`${caseName}---Start`);
        try {
          await connection.refreshGlobalHttpProxy();
          console.info(`${caseName} Promise resolved unexpectedly`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        } catch (err) {
          console.info(`${caseName} Promise rejected with: code: ${JSON.stringify(err?.code)}, message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 201);
          console.info(`${caseName}---End`);
          done();
        }
      });
  });
}