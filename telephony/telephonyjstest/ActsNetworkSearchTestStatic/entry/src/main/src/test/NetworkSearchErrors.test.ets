'use static';
/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import radio from '@ohos.telephony.radio';
import observer from '@ohos.telephony.observer';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic'
export default function ActsNetworkSearchTest() {

describe('ActsNetworkSearchTest',  () => {

    const SLOT_0 = 0;
    const SLOT_2 = -1;

    afterEach(async (done: () => void): Promise<void> => {
        try {
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN === 0).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_GSM === 1).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_1XRTT === 2).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_WCDMA === 3).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_HSPA === 4).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_HSPAP === 5).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_TD_SCDMA === 6).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_EVDO === 7).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_EHRPD === 8).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_LTE === 9).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_LTE_CA === 10).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_IWLAN === 11).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_NR === 12).assertTrue();

            expect(radio.NetworkType.NETWORK_TYPE_UNKNOWN === 0).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_GSM === 1).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_CDMA === 2).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_WCDMA === 3).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_TDSCDMA === 4).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_LTE === 5).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_NR === 6).assertTrue();

            expect(radio.RegState.REG_STATE_NO_SERVICE === 0).assertTrue();
            expect(radio.RegState.REG_STATE_IN_SERVICE === 1).assertTrue();
            expect(radio.RegState.REG_STATE_EMERGENCY_CALL_ONLY === 2).assertTrue();
            expect(radio.RegState.REG_STATE_POWER_OFF === 3).assertTrue();

            expect(radio.NsaState.NSA_STATE_NOT_SUPPORT === 1).assertTrue();
            expect(radio.NsaState.NSA_STATE_NO_DETECT === 2).assertTrue();
            expect(radio.NsaState.NSA_STATE_CONNECTED_DETECT === 3).assertTrue();
            expect(radio.NsaState.NSA_STATE_IDLE_DETECT === 4).assertTrue();
            expect(radio.NsaState.NSA_STATE_DUAL_CONNECTED === 5).assertTrue();
            expect(radio.NsaState.NSA_STATE_SA_ATTACHED === 6).assertTrue();

            // expect(radio.NetworkSelectionMode.NETWORK_SELECTION_UNKNOWN === 0).assertTrue();
            // expect(radio.NetworkSelectionMode.NETWORK_SELECTION_MANUAL === 2).assertTrue();
        } catch (error) {
            console.info(`Telephony_NetworkSearch error`);
        }
        done();
    });

    /**
     * @tc.name   testTelephonyRadioRadioTechnology0100
     * @tc.number SUB_Telephony_Radio_RadioTechnology_0100
     * @tc.desc   Subscribe to RadioTechnology events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyRadioRadioTechnology0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioRadioTechnology0100';
        console.info(`${caseName} test start`);
        try {
            console.info(`${caseName}RADIO_TECHNOLOGY_UNKNOWN result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN === 0).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_GSM result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_GSM);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_GSM === 1).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_1XRTT result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_1XRTT);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_1XRTT === 2).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_WCDMA result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_WCDMA);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_WCDMA === 3).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_HSPA result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_HSPA);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_HSPA === 4).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_HSPAP result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_HSPAP);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_HSPAP === 5).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_TD_SCDMA result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_TD_SCDMA);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_TD_SCDMA === 6).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_EVDO result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_EVDO);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_EVDO === 7).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_EHRPD result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_EHRPD);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_EHRPD === 8).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_LTE result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_LTE);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_LTE === 9).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_LTE_CA result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_LTE_CA);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_LTE_CA === 10).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_IWLAN result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_IWLAN);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_IWLAN === 11).assertTrue();
            console.info(`${caseName}RADIO_TECHNOLOGY_NR result:` + radio.RadioTechnology.RADIO_TECHNOLOGY_NR);
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_NR === 12).assertTrue();
            done();
        } catch (error) {
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.name   testTelephonyRadioNetworkType0100
     * @tc.number SUB_Telephony_Radio_NetworkType_0100
     * @tc.desc   Subscribe to NetworkType events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyRadioNetworkType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioNetworkType0100';
        console.info(`${caseName} test start`);
        try {
            console.info(`${caseName}NETWORK_TYPE_UNKNOWN result:` + radio.NetworkType.NETWORK_TYPE_UNKNOWN);
            expect(radio.NetworkType.NETWORK_TYPE_UNKNOWN === 0).assertTrue();
            console.info(`${caseName}NETWORK_TYPE_GSM result:` + radio.NetworkType.NETWORK_TYPE_GSM);
            expect(radio.NetworkType.NETWORK_TYPE_GSM === 1).assertTrue();
            console.info(`${caseName}NETWORK_TYPE_CDMA result:` + radio.NetworkType.NETWORK_TYPE_CDMA);
            expect(radio.NetworkType.NETWORK_TYPE_CDMA === 2).assertTrue();
            console.info(`${caseName}NETWORK_TYPE_WCDMA result:` + radio.NetworkType.NETWORK_TYPE_WCDMA);
            expect(radio.NetworkType.NETWORK_TYPE_WCDMA === 3).assertTrue();
            console.info(`${caseName}NETWORK_TYPE_TDSCDMA result:` + radio.NetworkType.NETWORK_TYPE_TDSCDMA);
            expect(radio.NetworkType.NETWORK_TYPE_TDSCDMA === 4).assertTrue();
            console.info(`${caseName}NETWORK_TYPE_LTE result:` + radio.NetworkType.NETWORK_TYPE_LTE);
            expect(radio.NetworkType.NETWORK_TYPE_LTE === 5).assertTrue();
            console.info(`${caseName}NETWORK_TYPE_NR result:` + radio.NetworkType.NETWORK_TYPE_NR);
            expect(radio.NetworkType.NETWORK_TYPE_NR === 6).assertTrue();
            done();
        } catch (error) {
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.name   testTelephonyRadioRegState0100
     * @tc.number SUB_Telephony_Radio_RegState_0100
     * @tc.desc   Subscribe to RegState events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyRadioRegState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioRegState0100';
        console.info(`${caseName} test start`);
        try {
            console.info(`${caseName}REG_STATE_NO_SERVICE result:` + radio.RegState.REG_STATE_NO_SERVICE);
            expect(radio.RegState.REG_STATE_NO_SERVICE === 0).assertTrue();
            console.info(`${caseName}REG_STATE_IN_SERVICE result:` + radio.RegState.REG_STATE_IN_SERVICE);
            expect(radio.RegState.REG_STATE_IN_SERVICE === 1).assertTrue();
            console.info(`${caseName}REG_STATE_EMERGENCY_CALL_ONLY result:` + radio.RegState.REG_STATE_EMERGENCY_CALL_ONLY);
            expect(radio.RegState.REG_STATE_EMERGENCY_CALL_ONLY === 2).assertTrue();
            console.info(`${caseName}REG_STATE_POWER_OFF result:` + radio.RegState.REG_STATE_POWER_OFF);
            expect(radio.RegState.REG_STATE_POWER_OFF === 3).assertTrue();
            done();
        } catch (error) {
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.name   testTelephonyRadioNsaState0100
     * @tc.number SUB_Telephony_Radio_NsaState_0100
     * @tc.desc   Subscribe to NsaState events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyRadioNsaState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioNsaState0100';
        console.info(`${caseName} test start`);
        try {
            console.info(`${caseName}NSA_STATE_NOT_SUPPORT result:` + radio.NsaState.NSA_STATE_NOT_SUPPORT);
            expect(radio.NsaState.NSA_STATE_NOT_SUPPORT === 1).assertTrue();
            console.info(`${caseName}NSA_STATE_NO_DETECT result:` + radio.NsaState.NSA_STATE_NO_DETECT);
            expect(radio.NsaState.NSA_STATE_NO_DETECT === 2).assertTrue();
            console.info(`${caseName}NSA_STATE_CONNECTED_DETECT result:` + radio.NsaState.NSA_STATE_CONNECTED_DETECT);
            expect(radio.NsaState.NSA_STATE_CONNECTED_DETECT === 3).assertTrue();
            console.info(`${caseName}NSA_STATE_IDLE_DETECT result:` + radio.NsaState.NSA_STATE_IDLE_DETECT);
            expect(radio.NsaState.NSA_STATE_IDLE_DETECT === 4).assertTrue();
            console.info(`${caseName}NSA_STATE_DUAL_CONNECTED result:` + radio.NsaState.NSA_STATE_DUAL_CONNECTED);
            expect(radio.NsaState.NSA_STATE_DUAL_CONNECTED === 5).assertTrue();
            console.info(`${caseName}NSA_STATE_SA_ATTACHED result:` + radio.NsaState.NSA_STATE_SA_ATTACHED);
            expect(radio.NsaState.NSA_STATE_SA_ATTACHED === 6).assertTrue();
            done();
        } catch (error) {
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getSignalInformation_Async_0400
     * @tc.number Telephony_NetworkSearch_getSignalInformation_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        radio.getSignalInformation(SLOT_2, (err, data) => {
            if (err) {
                console.info('Telephony_NetworkSearch_getSignalInformation_Async_0400 fail err:' + JSON.stringify(err));
                expect(err.code).assertEqual(8300001);
                done();
                return;
            }
            if (data) {
                console.info('getSignalInformation_Async_0400 data: ' + JSON.stringify(data));
                if (data.length > 0) {
                    expect(data[0].signalLevel != -1).assertTrue();
                    expect(data[0].signalType != radio.NetworkType.NETWORK_TYPE_WCDMA).assertTrue();
                }
                expect(data.length === 0).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getNetworkState_Async_0700
     * @tc.number Telephony_NetworkSearch_getNetworkState_Async_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getNetworkState_Async_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        radio.getNetworkState(SLOT_2, (err, data) => {
            if (err) {
                console.info(`Telephony_NetworkSearch_getNetworkState_Async_0700 finish err: ${err}`);
                done();
                return;
            }
            if (data) {
                console.info(`Telephony_NetworkSearch_getNetworkState_Async_0700 fail not go to err ${data}`);
                expect(data.longOperatorName != 'longOperatorName').assertTrue();
                expect(data.shortOperatorName != 'shortOperatorName').assertTrue();
                expect(data.plmnNumeric != 'plmnNumeric').assertTrue();
                expect(data.isRoaming != true).assertTrue();
                expect(data.regState != radio.RegState.REG_STATE_IN_SERVICE).assertTrue();
                expect(data.nsaState != radio.NsaState.NSA_STATE_SA_ATTACHED).assertTrue();
                expect().assertFail();
            }
        });
    });
});
}