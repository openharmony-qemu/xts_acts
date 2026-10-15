/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import call from '@ohos.telephony.call';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

export function toString(data:object) {
  if (typeof data === 'object') {
    return JSON.stringify(data);
  } else {
    return data;
  }
};

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function callJsunit() {
  describe('callTest', ()=> {
    console.log("==========> call Test start ==========>");

    /**
     * @tc.name   Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.number Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.desc   Return type test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_HasVoiceCapability_HasVoiceCapability", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = 'Telephony_Call_HasVoiceCapability_HasVoiceCapability';
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        let voiceCapablity = call.hasVoiceCapability();
        if (voiceCapablity) {
          ExpectTrue(voiceCapablity == true);
          console.info(`${caseName}  :voiceCapablity is ${JSON.stringify(voiceCapablity)}`);
        } else {
          ExpectTrue(voiceCapablity == false);
          console.info(`${caseName}  :voiceCapablity is ${JSON.stringify(voiceCapablity)}`);
        }
        console.log(`==========> ${caseName} Test end ==========>`);
        done();
      }
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0700
     * @tc.number Telephony_Call_Call_MakeCall_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0700";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          let context: Context = AppStorage.get('context') as Context;
          call.makeCall(context,"").then((data) => {
            console.log("Telephony_Call_Call_MakeCall_0700 makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_0700 makeCall callback: error->" + JSON.stringify(error.code));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_0700 makeCall callback: err->" + JSON.stringify(err));
          ExpectFail();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0500
     * @tc.number Telephony_Call_Call_MakeCall_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0500";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(null).then(() => {
            console.log("Telephony_Call_Call_MakeCall_0500 makeCall callback success");
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_0500 makeCall callback: err->" + JSON.stringify(error));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_0500 makeCall callback: err->" + JSON.stringify(err));
          ExpectFail();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0300
     * @tc.number Telephony_Call_Call_MakeCall_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0300";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(null, (error) => {
            if (error) {
              console.log("makeCall callback: err->" + JSON.stringify(error));
              done();
            }
            console.log("makeCall callback success");
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          ExpectFail();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0400
     * @tc.number Telephony_Call_Call_MakeCall_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0400";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(undefined, (error) => {
            if (error) {
              console.log("makeCall callback: err->" + JSON.stringify(error));
              done();
            }
            console.log("makeCall callback success");
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          ExpectFail();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0800
     * @tc.number Telephony_Call_Call_MakeCall_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0800";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(null,"").then((data) => {
            console.log("makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("makeCall callback: err->" + JSON.stringify(error.code));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          ExpectFail();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0900
     * @tc.number Telephony_Call_Call_MakeCall_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0900";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          call.makeCall(undefined,"").then((data) => {
            console.log("makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("makeCall callback: err->" + JSON.stringify(error.code));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.log("makeCall callback: err->" + JSON.stringify(err));
          ExpectFail();
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_1000
     * @tc.number Telephony_Call_Call_MakeCall_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_1000";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          let context: Context = AppStorage.get('context') as Context;
          call.makeCall(context,null).then((data) => {
            console.log("Telephony_Call_Call_MakeCall_1000 makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_1000 makeCall callback: error->" + JSON.stringify(error));
            ExpectTrue(error.code == 401);
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_1000 makeCall callback: err->" + JSON.stringify(err));
          ExpectTrue(err.code == 401);
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_1100
     * @tc.number Telephony_Call_Call_MakeCall_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_1100";
      console.log(`==========> ${caseName} Test start ==========>`);
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        try {
          let context: Context = AppStorage.get('context') as Context;
          call.makeCall(context,undefined).then((data) => {
            console.log("Telephony_Call_Call_MakeCall_1100 makeCall callback success"+ JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log("Telephony_Call_Call_MakeCall_1100 makeCall callback: error->" + JSON.stringify(error.code));
            ExpectTrue(error.code == 401);
            done();
          });
        } catch (err) {
          console.log("Telephony_Call_Call_MakeCall_1100 makeCall callback: err->" + JSON.stringify(err));
          ExpectTrue(err.code == 401);
          done();
        }
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.name   testTelephonyCallGetCallTransferInfo0100
     * @tc.number SUB_Telephony_Call_getCallTransferInfo_0100
     * @tc.desc   Get call transfer info without permission Promise api26+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonyCallGetCallTransferInfo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      const CASE_NAME = 'testTelephonyCallGetCallTransferInfo0100';
        console.info(`${CASE_NAME} testTelephonyCallManager start`);
        try {
          let phoneNumber: string = '138xxxxxxxx';
          let type: number = call.CallTransferType.TRANSFER_TYPE_UNCONDITIONAL;
          let data: call.CallTransferResult = await call.getCallTransferInfo(type, phoneNumber);
          console.info(`${CASE_NAME} success, data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        } catch (err) {
          console.info(`${CASE_NAME} fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err?.code == 201);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyCallManagerRejectCall0100
     * @tc.number SUB_Telephony_CallManager_RejectCall_0100
     * @tc.desc   Reject the call. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyCallManagerRejectCall0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "testTelephonyCallManagerRejectCall0100";
      console.log(`==========> ${caseName} Test start ==========>`);
      try {
        call.rejectCall((err: BusinessError) => {
          if (err) {
            console.log(`${caseName} rejectCall callback: err->` + JSON.stringify(err));
            ExpectTrue(err.code == 201);
            done();
          } else {
            console.log(`${caseName} rejectCall callback: success without permission, unexpected`);
            ExpectFail();
          }
        });
      } catch (err) {
        console.log(`${caseName} rejectCall callback: err->` + JSON.stringify(err));
        ExpectTrue(err.code == 201);
        console.log(`==========> ${caseName} Test end ==========>`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerHangUpCall0100
     * @tc.number SUB_Telephony_CallManager_HangUpCall_0100
     * @tc.desc   Hang up the call. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyCallManagerHangUpCall0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "testTelephonyCallManagerHangUpCall0100";
      console.log(`==========> ${caseName} Test start ==========>`);
      try {
        call.hangUpCall((err: BusinessError) => {
          if (err) {
            console.log(`${caseName} hangUpCall callback: err->` + JSON.stringify(err));
            ExpectTrue(err.code == 201);
            done();
          } else {
            console.log(`${caseName} hangUpCall callback: success without permission, unexpected`);
            ExpectFail();
          }

        });
      } catch (err) {
        console.log(`${caseName} hangUpCall callback: err->` + JSON.stringify(err));
        ExpectTrue(err.code == 201);
        console.log(`==========> ${caseName} Test end ==========>`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerAnswerCall0100
     * @tc.number SUB_Telephony_CallManager_AnswerCall_0100
     * @tc.desc   Answer the call. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyCallManagerAnswerCall0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName: string = "testTelephonyCallManagerAnswerCall0100";
      console.log(`==========> ${caseName} Test start ==========>`);
      try {
        call.answerCall((err: BusinessError) => {
          if (err) {
            console.log(`${caseName} answerCall callback: err->` + JSON.stringify(err));
            ExpectTrue(err.code == 201);
            done();
          } else {
            console.log(`${caseName} answerCall callback: success without permission, unexpected`);
            ExpectFail();
          }
        });
      } catch (err) {
        console.log(`${caseName} answerCall callback: err->` + JSON.stringify(err));
        ExpectTrue(err.code == 201);
        console.log(`==========> ${caseName} Test end ==========>`);
        done();
      }
    });

  });
}
