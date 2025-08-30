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

import call from '@ohos.telephony.call';
import radio from '@ohos.telephony.radio';
import { describe, it, expect, TestType, Size, Level, afterEach} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
const AUTO_ACCEPT_NUMBER = '10010';
const CALL_STATUS_DIALING = 2;
const DEFAULT_SLOT_ID = 0;
const DIAL_TYPE_OTT = 2;
const MEDIA_TYPE_VOICE = 0;
const TEL_CONFERENCE_IDLE = 0;
const ERR_SLOT_ID = -1;
const CALL_NUMBER = '10086';
class EmergencyNumberOptions {
  slotId: int;
  constructor(num: int) {
    this.slotId = num;
  }
}

class NumberFormatOptions {
  countryCode: string;
  constructor(str: string) {
    this.countryCode = str;
  }
}

class CallAttributeOptions {
  accountNumber: string;
  speakerphoneOn: boolean;
  accountId: number;
  startTime: number;
  isEcc: boolean;
  callId: number;

  constructor(accountNumber: string, speakerphoneOn: boolean, accountId: number, startTime: number,
    isEcc: boolean, callId: number) {
    this.accountNumber = accountNumber;
    this.speakerphoneOn = speakerphoneOn;
    this.accountId = accountId;
    this.startTime = startTime;
    this.isEcc = isEcc;
    this.callId = callId;
  }
}

export default function CallManageImsCall() {
  describe('CallManageImsCall', (): void => {

    afterEach(async (): void => {
      try {
        const CURRENT_TIME = new Date().valueOf();
        const TEMP_CALL_ID = 10;
        const IS_ECC = true;
        const SPEAK_ON = true;
        let callAttributeOptions = new CallAttributeOptions(AUTO_ACCEPT_NUMBER, SPEAK_ON, DEFAULT_SLOT_ID, CURRENT_TIME, IS_ECC, TEMP_CALL_ID);
        expect(callAttributeOptions.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
        expect(callAttributeOptions.speakerphoneOn === SPEAK_ON).assertTrue();
        expect(callAttributeOptions.accountId === DEFAULT_SLOT_ID).assertTrue();
        expect(callAttributeOptions.startTime === CURRENT_TIME).assertTrue();
        expect(callAttributeOptions.isEcc === IS_ECC).assertTrue();
        expect(callAttributeOptions.callId === TEMP_CALL_ID).assertTrue();
      } catch (err) {
        console.log(JSON.stringify(err));
      }
    });

    /**
     * @tc.number Telephony_CallManager_getCallState_Async_0100
     * @tc.name To get the idle call status, call getCallState() to get the current call status.
     *             call.CALL_STATE_IDLE is returned
     * @tc.desc Function test
     */
    it('Telephony_CallManager_getCallState_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      call.getCallState((err, data) => {
        if (err) {
          console.log("Telephony_CallManager_getCallState_Async_0100 : err =" + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        expect(call.CallState.CALL_STATE_UNKNOWN).assertEqual(-1);
        expect(call.CallState.CALL_STATE_IDLE).assertEqual(0);
        expect(call.CallState.CALL_STATE_RINGING).assertEqual(1);
        expect(call.CallState.CALL_STATE_OFFHOOK).assertEqual(2);
        expect(call.CallState.CALL_STATE_ANSWERED).assertEqual(3);
        console.log(`Telephony_CallManager_getCallState_Async_0100 finish data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number Telephony_CallManager_getCallState_Promise_0100
     * @tc.name To get the idle call status, call getCallState() to get the current call status.
     *             call.CALL_STATE_IDLE is returned
     * @tc.desc Function test
     */
    it('Telephony_CallManager_getCallState_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let promise = call.getCallState();
      promise.then(data => {
        console.log("Telephony_CallManager_getCallState_Promise_0100 : data =" + JSON.stringify(data));
        done();
      }).catch(err => {
        console.log("Telephony_CallManager_getCallState_Promise_0100 : err =" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number Telephony_CallManager_hasCall_Async_0400
     * @tc.name When idle, hasCall() is called to confirm that there is no current call,returning false
     * @tc.desc Function test
     */
    it('Telephony_CallManager_hasCall_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      call.hasCall((err, data) => {
        if (err) {
          console.log('Telephony_CallManager_hasCall_Async_0400 fail');
          expect().assertFail();
          done();
        }
        console.log(`Telephony_CallManager_hasCall_Async_0400 finish data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number Telephony_CallManager_hasCall_Promise_0400
     * @tc.name When idle, hasCall() is called to confirm that there is no current call, returning false
     * @tc.desc Function test
     */
    it('Telephony_CallManager_hasCall_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = await call.hasCall();
        console.log(`Telephony_CallManager_hasCall_Promise_0400 finish data = ${data}`);
        done();
      } catch (err) {
        console.log('Telephony_CallManager_hasCall_Promise_0400 fail');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0100
     * @tc.name PhoneNumber is 100000000000. Call formatPhoneNumber() to format the number.
     *             The return value is 10 000 000 0000
     * @tc.desc Function test
     */
    it('Telephony_CallManager_formatPhoneNumber_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      call.formatPhoneNumber('100000000000', (err, data) => {
        if (err) {
          console.log(`Telephony_CallManager_formatPhoneNumber_Async_0100 err = ${err.message}`);
          console.log('Telephony_CallManager_formatPhoneNumber_Async_0100 fail');
          expect().assertFail();
          done();
        }
        expect(data === '10 000 000 0000').assertTrue();
        console.log(`Telephony_CallManager_formatPhoneNumber_Async_0100 finish data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0100
     * @tc.name PhoneNumber is 2000000. Call formatPhoneNumber() to format the number.
     *             The return value is 200 0000
     * @tc.desc Function test
     */
    it('Telephony_CallManager_formatPhoneNumber_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = await call.formatPhoneNumber('2000000');
        expect(data === '200 0000').assertTrue();
        console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0100 finish data = ${data}`);
        done();
      } catch (err) {
        console.log('Telephony_CallManager_formatPhoneNumber_Promise_0100 fail');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Async_0100
     * @tc.name PhoneNumber is 010-0000-0000, options: CN, call formatPhoneNumberToE164() to format the number,
     *             and return +861000000000
     * @tc.desc Function test
     */
    it('Telephony_CallManager_formatPhoneNumberToE164_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let numberFormatOptions = new NumberFormatOptions('CN');
      call.formatPhoneNumberToE164('010-0000-0000', numberFormatOptions.countryCode, (err, data) => {
        if (err) {
          console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0100 fail');
          expect().assertFail();
          done();
        }
        expect(data === '+861000000000').assertTrue();
        console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0100 finish data = ${data}`);
        done();
      });
    });

    /**
     * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Promise_0100
     * @tc.name PhoneNumber is 52300000000, options: CN, call formatPhoneNumberToE164() to format the number,
     *             return +8652300000000
     * @tc.desc Function test
     */
    it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let numberFormatOptions = new NumberFormatOptions('CN');
      try {
        let data = await call.formatPhoneNumberToE164('52300000000', numberFormatOptions.countryCode);
        expect(data === '+8652300000000').assertTrue();
        console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0100 finish data = ${data}`);
        done();
      } catch (err) {
        console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0100 fail');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_1400
     * @tc.name testIsEmergencyPhoneNumber_1400
     * @tc.desc PhoneNumber: 110, no options. Call isEmergencyPhoneNumber() api by callback.
     *             The return value is true
     */
    it('Telephony_CallManager_isEmergencyPhoneNumber_Async_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      call.isEmergencyPhoneNumber('110', (err) => {
        if (err) {
          console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_1400 finish err = ${err}`);
          expect().assertFail();
          done();
        }
        expect(true).assertTrue();
        console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_1400 PASSED ');
        done();
      });
    });

    /**
     * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_1500
     * @tc.name testIsEmergencyPhoneNumber_1500
     * @tc.desc PhoneNumber: 120, no options. Call isEmergencyPhoneNumber() api by promise.
     *             The return value is true
     */
    it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await call.isEmergencyPhoneNumber('120');
        expect(true).assertTrue();
        console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400 PASSED ');
        done();
      } catch (err) {
        console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400 finish err = ${err}`);
        expect().assertFail();
        done();
      }
    });

  });
}