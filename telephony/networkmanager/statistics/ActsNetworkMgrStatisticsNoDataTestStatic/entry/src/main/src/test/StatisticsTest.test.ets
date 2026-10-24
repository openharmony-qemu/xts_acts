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
import { describe, it, expect, Level, Size, TestType } from "../../../hypium/index";
import statistics from '@ohos.net.statistics';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'statisticsTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function expectFalse(): void {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, 'assertion failure');
  }
}

function ExpectTrue(n: boolean): void {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` export exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
export default function StatisticsTest(): void {
  describe("StatisticsTest", (): void => {
    
    /**
     * @tc.name   testNetworkManagerGetUidRxBytesAsync_static_0100
     * @tc.number SUB_NetworkManager_GetUidRxBytes_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetUidRxBytesAsync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerGetUidRxBytesAsync_static_0100';
      try{
        let uid: int = 20010084;
        statistics.getUidRxBytes(uid, (err: BusinessError | null, data: long | undefined) => {
        if (err?.code !== 0) {
          hilog.info(domain, tag, `${caseName} getUidRxBytes fail err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)} `);
          ExpectTrue(err?.code === 2103005);
          done();
        } else {
          hilog.info(domain, tag, `${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
      }catch(err){
      	hilog.info(domain, tag, `${caseName} catch err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkManagerGetUidRxBytesPromise_static_0100
     * @tc.number SUB_NetworkManager_GetUidRxBytes_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetUidRxBytesPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerGetUidRxBytesPromise_static_0100';
      try{
      	let uid: int = 20010084;
        try {
          let data = await statistics.getUidRxBytes(uid);
          hilog.info(domain, tag, `${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} getUidRxBytes fail err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)} `);
          ExpectTrue(err?.code === 2103005);
          done();
        }
      }catch(err){
      	hilog.info(domain, tag, `${caseName} catch err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
        expectFalse();
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerGetUidTxBytesAsync_static_0100
     * @tc.number SUB_NetworkManager_GetUidTxBytes_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetUidTxBytesAsync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerGetUidTxBytesAsync_static_0100';
      try{
      	let uid: int = 20010084;
        statistics.getUidTxBytes(uid, (err: BusinessError | null, data: long | undefined) => {
        if (err?.code !== 0) {
          hilog.info(domain, tag, `${caseName} getUidTxBytes fail, err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err?.code === 2103005);
          done();
        } else {
          hilog.info(domain, tag, `${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
      }catch(err){
      	hilog.info(domain, tag, `${caseName} catch err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkManagerGetUidTxBytesPromise_static_0100
     * @tc.number SUB_NetworkManager_GetUidTxBytes_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetUidTxBytesPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerGetUidTxBytesPromise_static_0100';
      try{
      	let uid: int = 20010084;
        try {
          let data = await statistics.getUidTxBytes(uid);
          hilog.info(domain, tag, `${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} getUidTxBytes fail, err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)} `);
          ExpectTrue(err?.code === 2103005);
          done();
        }
      }catch(err){
      	hilog.info(domain, tag, `${caseName} catch err?.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
        expectFalse();
        done();
      }
    });
  })
}
