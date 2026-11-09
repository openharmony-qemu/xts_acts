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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

let domain: int = 0x0000;
let tag: string = 'ConnectionTestTag';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionUnMeteredTest(): void {
  describe("ConnectionUnMeteredTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'ConnectionUnMeteredTest describe start');

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0200
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMetered_Callback_0200
     * @tc.desc   test check if the data traffic usage on the current unmetered network returns false and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0200";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          connection.isDefaultNetMetered((err: BusinessError | null, data: boolean | undefined) => {
            hilog.info(domain, tag,
              `${caseName} isDefaultNetMetered callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
            if (err?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              ExpectTrue(data === false);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0200
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMetered_Promise_0200
     * @tc.desc   test check if the data traffic usage on the current unmetered network returns false and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0200";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let data = await connection.isDefaultNetMetered();
            hilog.info(domain, tag, `${caseName} isDefaultNetMetered: data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            hilog.info(domain, tag,
              `${caseName} isDefaultNetMetered: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(
                err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0200
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMeteredSync_0200
     * @tc.desc   test check if the data traffic usage on the current unmetered network returns false and return it using synchronous mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0200";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let isMetered: boolean = connection.isDefaultNetMeteredSync();
          ExpectTrue(isMetered === false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
  })
}
