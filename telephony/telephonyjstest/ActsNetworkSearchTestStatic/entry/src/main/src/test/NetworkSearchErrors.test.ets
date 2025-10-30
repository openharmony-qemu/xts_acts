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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'EsimPublic1';

export default function ActsNetworkSearchTest() {
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
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Async_0400
     * @tc.name    SlotId parameter input is -1, test getSignalInformation() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Async_0700
     * @tc.name    SlotId parameter input is -1, test getNetworkState() query function go to the error
     * @tc.desc    Function test
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
                expect(data.isCaActive != true).assertTrue();
                expect(data.regState != radio.RegState.REG_STATE_IN_SERVICE).assertTrue();
                expect(data.nsaState != radio.NsaState.NSA_STATE_SA_ATTACHED).assertTrue();
                expect().assertFail();
            }
        });
    });


    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Async_0400
     * @tc.name    Telephony_NetworkSearch_getRadioTech_Async_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getRadioTech_Async_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
        radio.getRadioTech(SLOT_2, (err: BusinessError<void> | null, data: radio.NetworkRadioTech | undefined) => {
            if (err?.code !== 0) {
                hilog.info(domain, tag, `Telephony_NetworkSearch_getRadioTech_Async_static_0400 finish err: ${err}`);
                expect(err?.code).assertEqual(8300001);
                done();
            } else {
                hilog.info(domain, tag, `Telephony_NetworkSearch_getRadioTech_Async_static_0400 fail not go to err ${data}`);
                expect().assertFail();
                done();
            }
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0400
     * @tc.name    Telephony_NetworkSearch_getOperatorName_Async_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Async_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        radio.getOperatorName(SLOT_2, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code !== 0) {
                hilog.info(domain, tag, 'Telephony_NetworkSearch_getOperatorName_Async_static_0400 fail err:' + JSON.stringify(err));
                expect(err?.code).assertEqual(8300001);
                done();
            } else{
                hilog.info(domain, tag, 'Telephony_NetworkSearch_getOperatorName_Async_static_0400 finish  data:' + data);
                expect(data === '').assertTrue();
                done();
            }
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Promise_0400
     * @tc.name    Telephony_NetworkSearch_getOperatorName_Promise_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Promise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
            let data: string = await radio.getOperatorName(SLOT_2);
            hilog.info(domain, tag, 'Telephony_NetworkSearch_getOperatorName_Promise_static_0400 finish data: ' + data);
            expect(data === '').assertTrue();
            done();
        } catch (error) {
            let err = error as BusinessError;
            hilog.info(domain, tag,'Telephony_NetworkSearch_getOperatorName_Promise_static_0400 fail err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(8300001);
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0500
     * @tc.name    Telephony_NetworkSearch_getOperatorName_Async_static_0500
     * @tc.desc    Test getOperatorName api by callback.
     */
    it('Telephony_NetworkSearch_getOperatorName_Async_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        radio.getOperatorName(0, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code !== 0) {
                hilog.info(domain, tag, `Telephony_NetworkSearch_getOperatorName_Async_static_0500 fail err: ${err}`);
                expect().assertFail();
                done();
            } else{
                hilog.info(domain, tag,`Telephony_NetworkSearch_getOperatorName_Async_static_0500 finish  data: ${data}`);
                ExpectTrue(true);
                done();
            }
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0600
     * @tc.name    Telephony_NetworkSearch_getOperatorName_Promise_static_0500
     * @tc.desc    Test getOperatorName api by promise.
     */
    it('Telephony_NetworkSearch_getOperatorName_Promise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            let data: string = await radio.getOperatorName(0);
            hilog.info(domain, tag, `Telephony_NetworkSearch_getOperatorName_Promise_static_0500 finish data: ${data}`);
            ExpectTrue(true);
            done();
        } catch (err) {
            hilog.info(domain, tag, `Telephony_NetworkSearch_getOperatorName_Promise_static_0500 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Promise_0400
     * @tc.name    Telephony_NetworkSearch_getSignalInformation_Promise_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Promise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
            let data = await radio.getSignalInformation(SLOT_2);
            hilog.info(domain, tag,
                'Telephony_NetworkSearch_getSignalInformation_Promise_static_0400 finish data: ' + JSON.stringify(data));
            expect(data.length === 0).assertTrue();
        } catch (error) {
            let err = error as BusinessError;
            hilog.info(domain, tag, 'Telephony_NetworkSearch_getSignalInformation_Promise_static_0400 fail err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(8300001);
            done();
            return;
        }
        done();
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0400
     * @tc.name    Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
        radio.getISOCountryCodeForNetwork(SLOT_2, (err: BusinessError<void> | null, data: string | undefined) => {
            if (err?.code !== 0) {
                hilog.info(domain, tag, 'Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0400 fail err:' + JSON.stringify(err));
                expect(err?.code).assertEqual(8300001);
                done();
            } else {
                hilog.info(domain, tag, 'Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_static_0400 finish data: ' + JSON.stringify(data));
                expect(data?.length === 0).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0400
     * @tc.name    Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
        try {
            let data = await radio.getISOCountryCodeForNetwork(SLOT_2);
            hilog.info(domain, tag,
                'Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_static_0400 finish data:' + JSON.stringify(data));
            expect(data?.length === 0).assertTrue();
            done();
        } catch (error) {
            let err = error as BusinessError;
            hilog.info(domain, tag, 'Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0400 fail err:' + JSON.stringify(err));
            expect(err.code).assertEqual(8300001);
            done();
        }
    });


    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Async_0500
     * @tc.name    Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0500
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
        radio.getNetworkSelectionMode(SLOT_2, (err: BusinessError<void> | null, data: radio.NetworkSelectionMode | undefined) => {
            if (err?.code !== 0) {
                hilog.info(domain, tag, `Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0500 err: ${err}`);
                expect(err?.code).assertEqual(8300001);
                done();
            } else {
                hilog.info(domain, tag, 'Telephony_NetworkSearch_getNetworkSelectionMode_Async_static_0500 fail not go to err');
                expect().assertFail();
                done();
            }
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0500
     * @tc.name    Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0500
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
        try {
            await radio.getNetworkSelectionMode(SLOT_2);
            hilog.info(domain, tag, 'Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0500 fail not go to err');
            expect().assertFail();
        } catch (error) {
            let err = error as BusinessError;
            hilog.info(domain, tag, 'Telephony_NetworkSearch_getNetworkSelectionMode_Promise_static_0500 finish');
            expect(err.code).assertEqual(8300001);
            done();
        }
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Promise_0400
     * @tc.name    Telephony_NetworkSearch_getRadioTech_Promise_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getRadioTech_Promise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
            await radio.getRadioTech(SLOT_2);
            hilog.info(domain, tag,'Telephony_NetworkSearch_getRadioTech_Promise_static_0400 fail not go to err');
            expect().assertFail();
        } catch (error) {
            let err = error as BusinessError;
            expect(err.code).assertEqual(8300001);
            done();
        }
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTechSync_0400
     * @tc.name    Telephony_NetworkSearch_getRadioTechSync_static_0400
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getRadioTechSync_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
            let data: radio.NetworkRadioTech = radio.getRadioTechSync(SLOT_2);
            hilog.info(domain, tag,'Telephony_NetworkSearch_getRadioTechSync_static_0400 fail not go to err');
            expect().assertFail();
        } catch (error) {
            let err = error as BusinessError;
            expect(err.code).assertEqual(8300001);
            done();
        }
    });

});
}