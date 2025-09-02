/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium/index';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};


export default function Sim3Public() {
  describe('Sim3Public', (): void => {


    /**
     * @tc.number : SUB_Telephony_Sim_GetMaxSimCount_0100
     * @tc.name   : testTelephonySimGetMaxSimCount0100
     * @tc.desc   : Obtain the number of card slots.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimGetMaxSimCount0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetMaxSimCount0100';
      console.info(`${caseName} test start `);
      let maxSimCount: number = sim.getMaxSimCount();
      ExpectTrue(maxSimCount >= 0);
      console.info(`${caseName} test end `);
      done();
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0400
     * @tc.name   : testTelephonySimHasSimCard0400
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimHasSimCard0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(-1, (err: BusinessError | null, data: boolean | undefined) => {
        if (err?.code === 8300001) {
          console.info(`${caseName}	Invalid parameter value: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0900
     * @tc.name   : testTelephonySimHasSimCard0900
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimHasSimCard0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(-1).then((data: boolean) => {
        console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }).catch((err: BusinessError): void => {
        if (err?.code === 8300001) {
          console.info(`${caseName}	Invalid parameter value: err->${JSON.stringify(err)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}:data->`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

  });
}