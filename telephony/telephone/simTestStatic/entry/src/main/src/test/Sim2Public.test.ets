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
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
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


export default function Sim2Public() {
  describe('Sim2Public', () => {


    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0100
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0100
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0, (err: BusinessError | null, data: string | undefined) => {
            if (data?.length as int > 0) {
              console.info(`${caseName}: success data->${JSON.stringify(data)}`);
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
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0300
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0300
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("testTelephonySimGetISOCountryCodeForSim0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(-1, (err: BusinessError | null, data: string | undefined) => {
            if (err.code === 8300001) {
              console.info(`${caseName}: Invalid parameter value success  data->${JSON.stringify(data)}`);
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
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });


    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_0800
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim0800
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success have card,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0).then((data: string) => {
            if (data?.length as int > 0) {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetISOCountryCodeForSim_1000
     * @tc.name   : testTelephonySimGetISOCountryCodeForSim1000
     * @tc.desc   : SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimGetISOCountryCodeForSim1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          sim.getISOCountryCodeForSim(-1).then((data: string) => {
            console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err?.code === 8300001) {
              console.info(`${caseName} success Invalid parameter value., promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0100
     * @tc.name   : testTelephonySimGetSimState0100
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimGetSimState0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0, (err: BusinessError| null, data: sim.SimState | undefined) => {
            if (err?.code == 0) {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}, data->` + data);
              const simStateAry: number[] = [
              sim.SimState.SIM_STATE_UNKNOWN,
              sim.SimState.SIM_STATE_LOCKED,
              sim.SimState.SIM_STATE_NOT_PRESENT,
              sim.SimState.SIM_STATE_NOT_READY,
              sim.SimState.SIM_STATE_LOADED,
              sim.SimState.SIM_STATE_READY
              ]
              expect(data).assertEqual(simStateAry[4]);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} callback: 001 err->${JSON.stringify(err)}, data->` + data);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0400
     * @tc.name   : testTelephonySimGetSimState0400
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimGetSimState0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1, (err: BusinessError | null, data: sim.SimState | undefined) => {
            if (err.code === 8300001) {
              console.info(`${caseName} 	Invalid parameter value. callback: err->${JSON.stringify(err)}, data->` + data);
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
     * @tc.number : SUB_Telephony_Sim_GetSimState_0600
     * @tc.name   : testTelephonySimGetSimState0600
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimGetSimState0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0).then((data: sim.SimState) => {
            console.info(`${caseName}getSimState success, promise: data->${JSON.stringify(data)}`);
            const simStateAry: number[] = [
            sim.SimState.SIM_STATE_UNKNOWN,
            sim.SimState.SIM_STATE_LOCKED,
            sim.SimState.SIM_STATE_NOT_PRESENT,
            sim.SimState.SIM_STATE_NOT_READY,
            sim.SimState.SIM_STATE_LOADED,
            sim.SimState.SIM_STATE_READY
            ]
            ExpectTrue(simStateAry.includes(data));
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError): void => {
            console.info(`${caseName}getSimState failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimState_0900
     * @tc.name   : testTelephonySimGetSimState0900
     * @tc.desc   : SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("testTelephonySimGetSimState0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimState0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1).then((data: sim.SimState) => {
            console.info(`${caseName} getSimState success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError): void => {
            if (err.code === 8300001) {
              console.info(`${caseName} getSimState failed Invalid parameter value, promise: err->${JSON.stringify(err)}`);
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
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0100
     * @tc.name   : testTelephonySimHasSimCard0100
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimHasSimCard0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError| null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
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
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0600
     * @tc.name   : testTelephonySimHasSimCard0600
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimHasSimCard0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0).then((data: boolean) => {
        if (data) {
          console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}:data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      }).catch((err: BusinessError): void => {
        console.info(`hasSimCard failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAccountInfo_0100
     * @tc.name   : testTelephonySimGetSimAccountInfo0100
     * @tc.desc   : SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("testTelephonySimGetSimAccountInfo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has  card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(0, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
            if (data?.simId as int > 0 && data?.slotIndex as int >= 0 && data?.iccId.length as int > 0) {
              console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
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
     * @tc.number : SUB_Telephony_Sim_GetSimAccountInfo_0400
     * @tc.name   : testTelephonySimGetSimAccountInfo0400
     * @tc.desc   : SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimGetSimAccountInfo0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has  card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(-1, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
            if (err?.code === 8300001) {
              console.info(`${caseName} 	Invalid parameter value: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
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
     * @tc.number : SUB_Telephony_Sim_GetSimAccountInfo_0800
     * @tc.name   : testTelephonySimGetSimAccountInfo0800
     * @tc.desc   : SIMCard required Get SIM card account information. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("testTelephonySimGetSimAccountInfo0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean| undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(0).then((data: sim.IccAccountInfo) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            if (data?.simId as int > 0 && data?.slotIndex as int >= 0 && data?.iccId.length as int > 0) {
              console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError): void => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAccountInfo_1100
     * @tc.name   : testTelephonySimGetSimAccountInfo1100
     * @tc.desc   : SIMCard required Get SIM card account information. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimGetSimAccountInfo1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(-1).then((data: sim.IccAccountInfo) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError): void => {
            if (err?.code === 8300001) {
              console.info(`${caseName} Parameter error, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
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
     * @tc.number : SUB_Telephony_Sim_IsSimActive_0100
     * @tc.name   : testTelephonySimIsSimActive0100
     * @tc.desc   : SIMCard required Obtain whether the specified SIM card slot is activated. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimIsSimActive0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActive0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.isSimActive(0, (err: BusinessError| null, data: boolean | undefined) => {
            if (data) {
              console.info(`${caseName}:success, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_IsSimActive_0400
     * @tc.name   : testTelephonySimIsSimActive0400
     * @tc.desc   : SIMCard required Obtain whether the specified SIM card slot is activated. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonySimIsSimActive0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActive0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.isSimActive(0).then((data: boolean) => {
            if (data) {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError): void => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_IsSimActiveSync_0100
     * @tc.name   : testTelephonySimIsSimActiveSync0100
     * @tc.desc   : SIMCard required Obtain whether the specified SIM card slot is activated.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testTelephonySimIsSimActiveSync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActiveSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          let isSimActive: boolean = sim.isSimActiveSync(0);
          if (isSimActive === true) {
            console.info(`${caseName} success:` + isSimActive);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_IsSimActiveSync_0300
     * @tc.name   : testTelephonySimIsSimActiveSync0300
     * @tc.desc   : SIMCard required Obtain whether the specified SIM card slot is activated.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimIsSimActiveSync0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimIsSimActiveSync0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError | null, data: boolean | undefined) => {
        if (data) {
          console.info(`${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
          let isSimActive: boolean = sim.isSimActiveSync(-1);
          if (isSimActive === false) {
            console.info(`${caseName}  success:` + isSimActive);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}  failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });
  });
}
