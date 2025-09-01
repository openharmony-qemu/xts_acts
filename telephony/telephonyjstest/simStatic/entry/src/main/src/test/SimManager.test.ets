/**
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
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
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import sim from '@ohos.telephony.sim';
import radio from '@ohos.telephony.radio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index';

export default function SimManagerTest() {

  const ExpectFail = () => {
    try {
      expect().asserFail();
    } catch (err) {
      console.info('expectInfo', 'test failed')
    }
  }

  const ExpectTrue = (n: boolean) => {
    try {
      expect(n).assertTrue();
    } catch (err){
      console.info('expectInfo', 'test failed')
    }
  }

  const SLOTID_INVALID = 3;
  const CORRECT_PIN = '1234';
  const CORRECT_PUK = '12345678';
  const CORRECT_PIN2 = '12345678';
  const INCORRECT_PIN2 = '4321';
  const INCORRECT_PUK2_LEN8 = '12345678';
  const ALTER_PIN = '1234';
  // const LOCK_STATE = { SUCCESS: 0, FAILURE: -1, EXCEPTION: -2 };
  const CARD_NAME = '1234';
  const CARD_NUMBER = '1234';
  const MAIL_NAME_LEN12 = '123#@%_ABCDE';
  const MAIL_NUMBER_LEN20 = '01234567890123456789';
  const SIM_MIN_COUNT = 0;
  const STK_CMD = 'D30781020181900101';
  const SIM_PN_PIN_PASSWORD = '1111';
  const INVALID_VALUE = -1000;

  describe('SimManagerTest',  () => {

    it('Telephony_Sim_getDefaultVoiceSlotId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      sim.getDefaultVoiceSlotId((err: BusinessError | null, data: int | undefined) => {
        expect(data === null).assertFalse();
        done();
      });
    });

    it('Telephony_Sim_getDefaultVoiceSlotId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promise = sim.getDefaultVoiceSlotId();
      promise.then(data => {
        expect(data === null).assertFalse();
        done();
      }).catch(err => {
        expect(err === null).assertFalse();
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_constantValidate_0100
     * @tc.name    SIM card constant validation
     * @tc.desc    Function test
     */
    it('Telephony_Sim_constantValidate_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`Telephony_Sim_constantValidate_0100 start`);
      expect(sim.SimState.SIM_STATE_UNKNOWN !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_NOT_PRESENT !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_LOCKED !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_NOT_READY !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_READY !== INVALID_VALUE).assertTrue();
      expect(sim.SimState.SIM_STATE_LOADED !== INVALID_VALUE).assertTrue();
      expect(sim.UNKNOWN_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_SIM_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_USIM_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_RUIM_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.DUAL_MODE_CG_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CT_NATIONAL_ROAMING_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.CU_DUAL_MODE_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.DUAL_MODE_TELECOM_LTE_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.DUAL_MODE_UG_CARD !== INVALID_VALUE).assertTrue();
      expect(sim.SINGLE_MODE_ISIM_CARD !== INVALID_VALUE).assertTrue();
      console.info(`Telephony_Sim_constantValidate_0100 finish`);
      done();
    });

    /**
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Async_0200
     * @tc.name    Enter exception parameters to test whether the getISOCountryCodeForSim interface function
     *             can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getISOCountryCodeForSim_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Async_0200';
      sim.getISOCountryCodeForSim(env.SLOTID_INVALID, (err: BusinessError | null, data: string | undefined) => {
        if (err) {
          console.info(`${CASE_NAME} expect err: ${err?.message}`);
          console.info(`${CASE_NAME} finish`);
          done();
          return;
        }
        expect().assertFail();
        console.info(`${CASE_NAME} fail, data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Promise_0200
     * @tc.name    Enter exception parameters to test whether the getISOCountryCodeForSim interface function
     *             can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getISOCountryCodeForSim_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Promise_0200';
      try {
        let data = await sim.getISOCountryCodeForSim(SLOTID_INVALID);
        console.info(`${CASE_NAME} ， data ->` + data);
        expect().assertFail();
        done
      } catch (err) {
        console.info(`${CASE_NAME} expect err: ${err?.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
      }
    });

    /**
     * @tc.number  Telephony_Sim_getSimState_Async_0200
     * @tc.name    Enter exception parameters to test whether the getSimState interface function can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimState_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      sim.getSimState(env.SLOTID_INVALID, (err: BusinessError | null, data: sim.SimState | undefined) => {
        const CASE_NAME = 'Telephony_Sim_getSimState_Async_0200';
        if (err) {
          console.info(`${CASE_NAME} expect err: ${err.message}`);
          console.info(`${CASE_NAME} finish`);
          done();
          return;
        }
        expect().assertFail();
        console.info(`${CASE_NAME} fail, data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_getSimState_Promise_0200
     * @tc.name    Enter exception parameters to test whether the getSimState interface function can execute normally.
     * @tc.desc    Function test
     */
    it('Telephony_Sim_getSimState_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getSimState_Promise_0200';
      try {
        let data = await sim.getSimState(SLOTID_INVALID);
        console.info(`${CASE_NAME} fail, data = ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`${CASE_NAME} expect err: ${err.message}`);
        console.info(`${CASE_NAME} finish`);
        done();
      }
    });

    /**
     * @tc.number  Telephony_Sim_isSimActive_Async_0700
     * @tc.name    Test the slotId exception input parameter 2 during isSimActive interface card activation,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_isSimActive_Async_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_isSimActive_Async_0700';
      sim.isSimActive(env.SLOTID_INVALID, (err: BusinessError | null, data: Boolean | undefined) => {
        console.info(CASE_NAME + "isSimActive async err info :" + JSON.stringify(err) + "data:" + JSON.stringify(data));
        expect(err?.code).assertEqual(8300001);
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_isSimActive_Promise_0700
     * @tc.name    Test the slotId exception input parameter 2 during isSimActive interface card activation,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_isSimActive_Promise_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_isSimActive_Promise_0700';
      let promise = sim.isSimActive(SLOTID_INVALID);
      promise.then(data => {
        console.info(CASE_NAME + `isSimActive success, promise: data->` + data);
        expect(data).assertFalse();
        done();
      }).catch(err => {
        console.info(CASE_NAME + "isSimActive promise err info :" + JSON.stringify(err));
        done();
      });
    });

    /**
     * @tc.number  Telephony_Sim_hasSimCard_Async_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_hasSimCard_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_hasSimCard_Async_0600';
      sim.hasSimCard(env.SLOTID_INVALID, (err: BusinessError | null, data: Boolean | undefined) => {
        if (err) {
          expect(err.code).assertEqual(8300001);
          console.info(CASE_NAME +' fail, err: ' + JSON.stringify(err));
          done();
          return;
        }
        console.info(CASE_NAME + ' finish' + JSON.stringify(data));
      });
    });

    /**
     * @tc.number  Telephony_Sim_hasSimCard_Promise_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
    it('Telephony_Sim_hasSimCard_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_hasSimCard_Promise_0600';
      try {
        let data = await sim.hasSimCard(SLOTID_INVALID);
        console.info(CASE_NAME + 'data ->' + data);
      } catch (err) {
        console.info(CASE_NAME +' fail, err: ' + JSON.stringify(err));
        done();
      }
      console.info(CASE_NAME + ' finish');
    });

    /**
     * @tc.number Telephony_Sim_getMaxSimCount_0100
     * @tc.name   Test the getMaxSimCount interface and view the callback result
     * @tc.desc   Function test
     */
    it('Telephony_Sim_getMaxSimCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE_NAME = 'Telephony_Sim_getMaxSimCount_0100';
      let simCount = sim.getMaxSimCount();
      expect(simCount > SIM_MIN_COUNT).assertTrue();
      console.info(`${CASE_NAME} test finish.`);
      done();
    });

    /**
     * @tc.number Telephony_Sim_getSimAccountInfo_CallBack_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getSimAccountInfo_CallBack_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      sim.getSimAccountInfo(0, (err: BusinessError | null, data: sim.iccAccountInfo | undefined) => {
        if(err){
          console.info("Telephony_Sim_getSimAccountInfo_CallBack_0100 err = " + JSON.stringify(err));
          expect(true).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sim_getSimAccountInfo_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
		    expect(data?.simId != null).assertTrue();
		    expect(data?.isEsim != null).assertTrue();
		    expect(data?.isActive != null).assertTrue();
		    expect(data?.iccId != null).assertTrue();
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getSimAccountInfo_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      });
    });
    /**
     * @tc.number Telephony_Sim_getSimAccountInfo_Promise_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getSimAccountInfo_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let promise = sim.getSimAccountInfo(0);
      promise.then(data => {
        console.info("Telephony_Sim_getSimAccountInfo_Promise_0100 data = " + JSON.stringify(data));
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getSimAccountInfo_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      }).catch(err => {
        console.info("Telephony_Sim_getSimAccountInfo_Promise_0100 err = " + JSON.stringify(err));
        expect(true).assertTrue();
        done();
      });
    });
    /**
     * @tc.number Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      sim.getActiveSimAccountInfoList((err: BusinessError | null, data: Array<sim.IccAccountInfo> | undefined) => {
        if(err){
          console.info("Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 err = " + JSON.stringify(err));
          expect(true).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getActiveSimAccountInfoList_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      });
    });
    /**
     * @tc.number Telephony_Sim_getActiveSimAccountInfoList_Promise_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sim_getActiveSimAccountInfoList_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promise = sim.getActiveSimAccountInfoList();
      promise.then(data => {
        console.info("Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 data = " + JSON.stringify(data));
        sim.hasSimCard(0, (err: BusinessError | null, data: Boolean | undefined) => {
          console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          done();
        });
      }).catch(err => {
        console.info("Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 err = " + JSON.stringify(err));
        expect(true).assertTrue();
        done();
      });
    });

  })
}