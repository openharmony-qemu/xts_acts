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
     * @tc.name Telephony_CallManager_getCallState_Async_0100
     * @tc.desc To get the idle call status, call getCallState() to get the current call status.call.CALL_STATE_IDLE is returned
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

  });
}