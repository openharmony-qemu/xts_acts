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
import { describe, it, expect, Level, TestType, Size} from '../../../hypium/index';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

export default function SimNoCardPublic() {
  describe('SimNoCardPublic', (): void => {

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0600
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0600
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName}:success have card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getISOCountryCodeForSim(0, (err: BusinessError | null, data: string | undefined) => {
            if (err?.code === 8300004) {
              console.info(`${caseName}: Do not have sim card1. success  data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed  have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_1300
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim1300
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName}:success  have sim card,data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getISOCountryCodeForSim(0).then((data: string) => {
            console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError): void => {
            if (err?.code === 8300004) {
              console.info(`${caseName} success Do not have sim card.1, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
            }
          });
        } else {
          console.info(`${caseName}:failed Do not have card>${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAccountInfo_0600
     * @tc.name   : testTelephonySimGetSimAccountInfo0600
     * @tc.desc   : SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimGetSimAccountInfo0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getSimAccountInfo(0, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
            if (err?.code === 8300004) {
              console.info(`${caseName} 	Do not have sim card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetActiveSimAccountInfoList_0300
     * @tc.name   : testTelephonySimGetActiveSimAccountInfoList0300
     * @tc.desc   : SIMCard required Get a list of activated SIM card account information. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetActiveSimAccountInfoList0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getActiveSimAccountInfoList((err: BusinessError | null, data: Array<sim.IccAccountInfo> | undefined) => {
            if (err?.code === 8300004) {
              console.info(`${caseName}  callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetActiveSimAccountInfoList_0700
     * @tc.name   : testTelephonySimGetActiveSimAccountInfoList0700
     * @tc.desc   : SIMCard required Get a list of activated SIM card account information. Use promise for asynchronous callback..
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetActiveSimAccountInfoList0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList0700';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data === false) {
          console.info(`${caseName} success has not card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          sim.getActiveSimAccountInfoList().then((data: Array<sim.IccAccountInfo>) => {
            console.info(`${caseName} getActiveSimAccountInfoList success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError): void => {
            if (err?.code === 8300004) {
              console.info(`${caseName} has not card1  callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} getActiveSimAccountInfoList failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

  });
}
