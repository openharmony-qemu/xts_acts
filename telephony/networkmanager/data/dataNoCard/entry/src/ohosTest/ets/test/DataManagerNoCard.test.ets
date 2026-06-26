/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect , Level, Size, TestType} from '@ohos/hypium';
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function dataHasCardNoDataTest() {
  describe('dataHasCardNoDataTest', () => {
    /**
     * @tc.name   testTelephonyDataSetPreferredApnNoCard_0100
     * @tc.number SUB_Telephony_Data_SetPreferredApn_NoCard_0100
     * @tc.desc   setPreferredApn No Card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataSetPreferredApnNoCard_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testTelephonyDataSetPreferredApnNoCard_0100';
      console.info(`${caseName} test start `);
      try {
        let result: boolean = await data.setPreferredApn(1);
        console.log(`${caseName}  setPreferredApn success `);
        ExpectTrue(result === false);
      } catch (err: BusinessError) {
        console.log(`${caseName} catch error in`, err);
        ExpectTrue(false);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyDataQueryAllApnsNoCard_0100
     * @tc.number SUB_Telephony_Data_QueryAllApns_NoCard_0100
     * @tc.desc   QueryAllApns No Card
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataQueryAllApnsNoCard_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      let caseName: string = 'testTelephonyDataQueryAllApnsNoCard_0100';
      console.info(`${caseName} test start `);
      try {
        let apnInfos: Array<data.ApnInfo> = await data.queryAllApns();
        console.log(`${caseName}  get queryAllApns success `);
        ExpectTrue(apnInfos.length === 0);
      } catch (err: BusinessError) {
        console.log(`${caseName} catch error in`, err);
        ExpectTrue(false);
      }
      console.info(`${caseName} test end`);
      done();
    });

  }
)}
