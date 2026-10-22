'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll,it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import statistics from '@ohos.net.statistics';
import connection from '@ohos.net.connection';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'netStatisticsNoDataTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const bundleName: string = 'com.example.m.static';

const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `${caseName} expect error ${JSON.stringify(err)}`);
  }
}

async function getApplicationUid(): Promise<int> {
  try {
    let userId: int = await account.getAccountManager().getOsAccountLocalId();
    hilog.info(domain, tag, `getOsAccountLocalId ${JSON.stringify(userId)}`)
    let applicationFlags: int = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync(bundleName, applicationFlags, userId);
    hilog.info(domain, tag, `getApplicationUid applicationInfo ${JSON.stringify(applicationInfo)}`)
    return applicationInfo.uid as int;
  } catch (err) {
    let error = err as BusinessError;
    hilog.info(domain, tag, `getApplicationUid catch error.code: ${JSON.stringify(error.code)}, error.message: ${JSON.stringify(error.message)}`)
    return 0;
  }
}

export default function netStatisticsNoDataTest(): void {

  describe('NetStatisticsNoDataTest', (): void => {
    
    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytes_static_0700
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_0700
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes_static_0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let uid: int = await getApplicationUid();
        hilog.info(domain, tag, `${caseName} ${uid}`);
        statistics.getUidRxBytes(uid, (err: BusinessError | null, stats: long | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} err.code: ${JSON.stringify(err?.code)}, err.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err?.code === 2103005, caseName);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(true, caseName);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytes_static_0800
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_0800
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let uid: int = await getApplicationUid();
        hilog.info(domain, tag, `${caseName} ${uid}`);
        try {
          let rxBytesRes = await statistics.getUidRxBytes(uid);
          hilog.info(domain, tag, `${caseName} succes ${JSON.stringify(rxBytesRes)}`);
          ExpectTrue(true, caseName);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        } catch (error) {
          hilog.info(domain, tag, `${caseName} err.code: ${JSON.stringify(error?.code)}, err.message: ${JSON.stringify(error?.message)}`);
          ExpectTrue(error.code === 2103005, caseName);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidTxBytes_static_0700
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_0700
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes_static_0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let uid: int = await getApplicationUid();
        hilog.info(domain, tag, `${caseName} ${uid}`);
        statistics.getUidTxBytes(uid, (err: BusinessError | null, stats: long | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} err.code: ${JSON.stringify(err?.code)}, err.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err?.code === 2103005, caseName);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(true, caseName);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidTxBytes_static_0800
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_0800
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let uid: int = await getApplicationUid();
        hilog.info(domain, tag, `${caseName} ${uid}`);
        try {
          let stats = await statistics.getUidTxBytes(uid);
          hilog.info(domain, tag, `${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(true, caseName);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} err.code: ${JSON.stringify(err?.code)}, err.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 2103005, caseName);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });
        
    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0001
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats_static_0001
     * @tc.desc   get SelfTrafficStats(BEARER_CELLULAR)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats_static_0001';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: (Math.floor(Date.now() / 1000)- 86400 * 31).toInt(),
          endTime: Math.floor(Date.now() / 1000).toInt(),
          simId: 1,
        }

        try {
          let stats = await statistics.getSelfTrafficStats(networkInfo);
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(stats.rxBytes === 0 && stats.txBytes === 0)
          done()
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(error)}`);
          done()
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0002
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats_static_0002
     * @tc.desc   get SelfTrafficStats(BEARER_WIFI)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats_static_0002';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_WIFI,
          startTime: (Math.floor(Date.now() / 1000)- 86400 * 31).toInt(),
          endTime: Math.floor(Date.now() / 1000).toInt(),
          simId: 1,
        }

        try {
          let stats = await statistics.getSelfTrafficStats(networkInfo);
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(stats.rxBytes === 0 && stats.txBytes === 0)
          done()
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(error)}`);
          done()
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0003
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats_static_0003
     * @tc.desc   get SelfTrafficStats(BEARER_CELLULAR 2100001)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats_static_0003';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: (Math.floor(Date.now() / 1000) + 86400 * 31).toInt(),
          endTime: Math.floor(Date.now() / 1000).toInt(),
          simId: 1,
        }

        try {
          let stats = await statistics.getSelfTrafficStats(networkInfo);
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(false, `${caseName}`)
          done()
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(error.code === 2100001);
          done()
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0004
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats_static_0004
     * @tc.desc   get SelfTrafficStats(BEARER_WIFI 2100001)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats_static_0004';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_WIFI,
          startTime: Math.floor(Date.now() / 1000).toInt(),
          endTime: (Math.floor(Date.now() / 1000)-86400 * 31).toInt(),
          simId: 1,
        }

        try {
          let stats = await statistics.getSelfTrafficStats(networkInfo);
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(false, `${caseName}`)
          done()
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(error.code === 2100001);
          done()
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });
  })
}
