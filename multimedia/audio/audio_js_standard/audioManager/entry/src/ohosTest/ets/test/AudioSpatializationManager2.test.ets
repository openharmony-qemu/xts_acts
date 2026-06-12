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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { fileIo } from '@kit.CoreFileKit';

const RENDERER_INFO: audio.AudioRendererInfo = {
    usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
    rendererFlags: 0
};

function handleCatchError(tag: string, err: ESObject): void {
    let code: number = err.code as number;
    let message: string = err.message as string;
    console.info(`${tag} caught error: code=${code}, message=${message}`);
    let hasCode: boolean = code != null && code > 0;
    let hasMsg: boolean = message != null && message.length > 0;
    expect(hasCode || hasMsg).assertTrue();
}

function handleCatchInvalidParam(tag: string, err: ESObject): void {
    let code: number = err.code as number;
    let message: string = err.message as string;
    console.info(`${tag} caught error: code=${code}, message=${message}`);
    let hasCode: boolean = code != null && code != undefined && Number(code) > 0;
    let hasMsg: boolean = message != null && message != undefined && String(message).length > 0;
    expect(hasCode || hasMsg).assertTrue();
}

function handlePermissionError(tag: string, err: ESObject, validCodes: number[]): void {
    let code: number = err.code as number;
    let message: string = err.message as string;
    console.info(`${tag} error: code=${code}, message=${message}`);
    let found: boolean = false;
    for (let i = 0; i < validCodes.length; i++) {
        if (code === validCodes[i]) {
            found = true;
            break;
        }
    }
    if (found) {
        expect(code).assertEqual(code);
    } else {
        expect(false).assertTrue();
    }
}

function getAudioSpatializationManager(): audio.AudioSpatializationManager {
    return audio.getAudioManager().getSpatializationManager();
}

function getAudioDeviceDescriptor(): audio.AudioDeviceDescriptor | null {
    let audioManager = audio.getAudioManager();
    let audioRoutingManager = audioManager.getRoutingManager();
    if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
        return null;
    }
    let descriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
    return descriptors[0];
}

function isSupported(): boolean {
    return getAudioSpatializationManager().isPersonalizedSpatializationSupported();
}

function checkSupportAndSkip(done: Function): boolean {
    if (!isSupported()) {
        console.info("[AudioSpatializationManager2JsTest] device not supported, skip");
        done();
        return true;
    }
    return false;
}

function checkRoutingAndSkip(done: Function): audio.AudioDeviceDescriptor | null {
    let desc = getAudioDeviceDescriptor();
    if (desc === null) {
        console.info("[AudioSpatializationManager2JsTest] RoutingManager not supported, skip");
        done();
    }
    return desc;
}

function cleanupFile(file: fileIo.File | null, filePath: string): void {
    if (file !== null) {
        fileIo.closeSync(file);
    }
    try {
        fileIo.unlinkSync(filePath);
    } catch (e) {
    }
}

export default function audioSpatializationManager2() {
    const TAG = "[AudioSpatializationManager2JsTest]";
    const stringParameter: ESObject = 'stringParameter';
    const numberParameter = 12345678;

    describe("AudioSpatializationManager2JsTest", () => {

        beforeAll(async () => {
            console.info(TAG + " beforeAll called");
        });

        afterAll(() => {
            console.info(TAG + ' afterAll called');
        });

        beforeEach(() => {
            console.info(TAG + ' beforeEach called');
        });

        afterEach(() => {
            console.info(TAG + ' afterEach called');
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationSupported2700
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedSupported_2700
         * @tc.desc   Verify isPersonalizedSpatializationSupported returns boolean type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testIsPersonalizedSpatializationSupported2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            try {
                let ret = getAudioSpatializationManager().isPersonalizedSpatializationSupported();
                console.info(`${TAG} isPersonalizedSpatializationSupported result: ${ret}`);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} isPersonalizedSpatializationSupported`, error);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationSupportedConsistency2800
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedSupportedConsistency_2800
         * @tc.desc   Verify isPersonalizedSpatializationSupported returns consistent result across multiple calls
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationSupportedConsistency2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                let r1 = mgr.isPersonalizedSpatializationSupported();
                let r2 = mgr.isPersonalizedSpatializationSupported();
                let r3 = mgr.isPersonalizedSpatializationSupported();
                expect(r1 === r2).assertTrue();
                expect(r2 === r3).assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} consistency`, error);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabled2900
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabled_2900
         * @tc.desc   Verify isPersonalizedSpatializationEnabled with valid AudioDeviceDescriptor returns boolean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabled2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            try {
                let ret = getAudioSpatializationManager().isPersonalizedSpatializationEnabled(desc);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} isPersonalizedSpatializationEnabled`, error);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledInvalidNumber3000
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledInvalidNumber_3000
         * @tc.desc   isPersonalizedSpatializationEnabled with invalid param type (number)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledInvalidNumber3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let invalidParam: ESObject = numberParameter;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(invalidParam);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} isPersonalizedSpatializationEnabled invalid number`, error);
                done();
            }
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledInvalidString3100
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledInvalidString_3100
         * @tc.desc   isPersonalizedSpatializationEnabled with invalid param type (string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledInvalidString3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let invalidParam: ESObject = stringParameter;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(invalidParam);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} isPersonalizedSpatializationEnabled invalid string`, error);
                done();
            }
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledNullParam3200
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledNull_3200
         * @tc.desc   isPersonalizedSpatializationEnabled with null parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledNullParam3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let nullParam: ESObject = null;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(nullParam);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} isPersonalizedSpatializationEnabled null`, error);
                done();
            }
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledNoArg3300
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledNoArg_3300
         * @tc.desc   isPersonalizedSpatializationEnabled with no arguments
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledNoArg3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let invalidCall: ESObject = getAudioSpatializationManager();
                let ret: ESObject = invalidCall.isPersonalizedSpatializationEnabled();
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} isPersonalizedSpatializationEnabled no arg`, error);
                done();
            }
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledNotSupported3400
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledNotSupported_3400
         * @tc.desc   isPersonalizedSpatializationEnabled when device does not support personalized spatialization
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledNotSupported3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                let supported = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                let desc = getAudioDeviceDescriptor();
                if (desc === null) {
                    done();
                    return;
                }
                let ret = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} not supported`, error);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledTrue3500
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledTrue_3500
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledTrue3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            if (checkSupportAndSkip(done)) return;
            try {
                let mgr = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let ret = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} setEnabled(true)`, error);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledFalse3600
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledFalse_3600
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledFalse3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            if (checkSupportAndSkip(done)) return;
            try {
                let mgr = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                handleCatchError(`${TAG} setEnabled(false)`, error);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidDeviceString3700
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidDeviceString_3700
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device param
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidDeviceString3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            try {
                let mgr = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let ret = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} setEnabled`, error);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidDeviceNull3800
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidDeviceNull_3800
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device param
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidDeviceNull3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            try {
                let mgr = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} setEnabled`, error);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidEnableNumber3900
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidEnableNumber_3900
         * @tc.desc   setPersonalizedSpatializationEnabled with invalid enable param (number)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidEnableNumber3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            try {
                let invalidEnable: ESObject = numberParameter;
                await getAudioSpatializationManager().setPersonalizedSpatializationEnabled(desc, invalidEnable);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setEnabled invalid enable number`, error);
                done();
            }
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidEnableNull4000
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidEnableNull_4000
         * @tc.desc   setPersonalizedSpatializationEnabled with null enable parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidEnableNull4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            try {
                let nullEnable: ESObject = null;
                await getAudioSpatializationManager().setPersonalizedSpatializationEnabled(desc, nullEnable);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setEnabled null enable`, error);
                done();
            }
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledNoArg4100
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledNoArg_4100
         * @tc.desc   setPersonalizedSpatializationEnabled with no arguments
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledNoArg4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let invalidCall: ESObject = getAudioSpatializationManager();
                await invalidCall.setPersonalizedSpatializationEnabled();
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setEnabled no arg`, error);
                done();
            }
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledNotSupported4200
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledNotSupported_4200
         * @tc.desc   setPersonalizedSpatializationEnabled when device does not support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledNotSupported4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                let supported = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                let desc = getAudioDeviceDescriptor();
                if (desc === null) {
                    done();
                    return;
                }
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
            } catch (error) {
                console.info(`${TAG} setEnabled on unsupported: ${error}`);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChange4300
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChange_4300
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with valid callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChange4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                let triggered: boolean = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    triggered = true;
                });
                expect(typeof mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect(triggered).assertFalse();
            } catch (error) {
                handleCatchError(`${TAG} on`, error);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeInvalidString4400
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChangeInvalidString_4400
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with invalid param (string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeInvalidString4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let invalidCallback: ESObject = stringParameter;
                getAudioSpatializationManager().onPersonalizedSpatializationEnabledChangeForAnyDevice(invalidCallback);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} on invalid string`, error);
                done();
            }
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeInvalidNull4500
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChangeInvalidNull_4500
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with null callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeInvalidNull4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let nullCallback: ESObject = null;
                getAudioSpatializationManager().onPersonalizedSpatializationEnabledChangeForAnyDevice(nullCallback);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} on null`, error);
                done();
            }
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeInvalidNumber4600
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChangeInvalidNumber_4600
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with number type callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeInvalidNumber4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let numberCallback: ESObject = numberParameter;
                getAudioSpatializationManager().onPersonalizedSpatializationEnabledChangeForAnyDevice(numberCallback);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} on number`, error);
                done();
            }
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeNoArg4700
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChangeNoArg_4700
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with no arguments
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeNoArg4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let invalidCall: ESObject = getAudioSpatializationManager();
                invalidCall.onPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} on no arg`, error);
                done();
            }
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChange4800
         * @tc.number SUB_Multimedia_Audio_Spatialization_OffPersonalizedEnabledChange_4800
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice basic
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChange4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect(typeof mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
            } catch (error) {
                handleCatchError(`${TAG} off`, error);
            }
            done();
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChangeWithoutOn4900
         * @tc.number SUB_Multimedia_Audio_Spatialization_OffPersonalizedEnabledChangeWithoutOn_4900
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice without prior on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeWithoutOn4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect(typeof mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
            } catch (error) {
                handleCatchError(`${TAG} off without on`, error);
            }
            done();
        });

        /**
         * @tc.name   testOnOffPersonalizedEnabledChangeMultipleCycles5000
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnOffPersonalizedEnabledChangeCycles_5000
         * @tc.desc   Multiple on/off registration cycles
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnOffPersonalizedEnabledChangeMultipleCycles5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                let count = 0;
                let cb = (data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => { count++; };
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect(count).assertEqual(0);
            } catch (error) {
                handleCatchError(`${TAG} on/off cycles`, error);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTF5100
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTF_5100
         * @tc.desc   downloadPersonalizedHRTF with valid fd and length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTF5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath = testContext.cacheDir + '/test_hrtf_data.bin';
            let file: fileIo.File | null = null;
            try {
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let buf = new ArrayBuffer(1024);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                expect(stat.size).assertLarger(0);
            } catch (error) {
                handleCatchError(`${TAG} downloadHRTF valid`, error);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFInvalidFd5200
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFInvalidFd_5200
         * @tc.desc   downloadPersonalizedHRTF with invalid fd (-1)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFInvalidFd5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: -1, length: 1024 });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF invalid fd`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFNullDescriptor5300
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFNullDescriptor_5300
         * @tc.desc   downloadPersonalizedHRTF with null descriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFNullDescriptor5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let nullDescriptor: ESObject = null;
                await getAudioSpatializationManager().downloadPersonalizedHRTF(nullDescriptor);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF null`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFStringDescriptor5400
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFStringDescriptor_5400
         * @tc.desc   downloadPersonalizedHRTF with string type descriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFStringDescriptor5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let stringDescriptor: ESObject = stringParameter;
                await getAudioSpatializationManager().downloadPersonalizedHRTF(stringDescriptor);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF string`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFMissingFd5500
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFMissingFd_5500
         * @tc.desc   downloadPersonalizedHRTF with descriptor missing fd field
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFMissingFd5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let descriptorNoFd: ESObject = { length: 1024 };
                await getAudioSpatializationManager().downloadPersonalizedHRTF(descriptorNoFd);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF missing fd`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthZero5600
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthZero_5600
         * @tc.desc   downloadPersonalizedHRTF with length=0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthZero5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: 0, length: 0 });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF length=0`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthNegative5700
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthNegative_5700
         * @tc.desc   downloadPersonalizedHRTF with negative length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthNegative5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: 1, length: -1 });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF negative length`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthExceed5800
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthExceed_5800
         * @tc.desc   downloadPersonalizedHRTF with length > 10MB
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthExceed5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let exceedLength = 10 * 1024 * 1024 + 1;
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: 1, length: exceedLength });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF length>10MB`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFNotSupported5900
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFNotSupported_5900
         * @tc.desc   downloadPersonalizedHRTF when device does not support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFNotSupported5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            let filePath = testContext.cacheDir + '/test_hrtf_nosupport.bin';
            let file: fileIo.File | null = null;
            try {
                let mgr = getAudioSpatializationManager();
                let supported = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let buf = new ArrayBuffer(1024);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await mgr.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
            } catch (error) {
                console.info(`${TAG} downloadHRTF unsupported: ${error}`);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testPersonalizedSpatializationFullWorkflow6000
         * @tc.number SUB_Multimedia_Audio_Spatialization_FullWorkflow_6000
         * @tc.desc   Full lifecycle: check support, enable, verify, download HRTF, disable, verify
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testPersonalizedSpatializationFullWorkflow6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            let filePath = testContext.cacheDir + '/test_hrtf_workflow.bin';
            let file: fileIo.File | null = null;
            try {
                let mgr = getAudioSpatializationManager();
                let supported = mgr.isPersonalizedSpatializationSupported();
                expect(typeof supported === 'boolean').assertTrue();
                if (!supported) { done(); return; }
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let enabled1 = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(typeof enabled1 === 'boolean').assertTrue();
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let buf = new ArrayBuffer(512);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await mgr.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let enabled2 = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(typeof enabled2 === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} full workflow`, error);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testPersonalizedSpatializationNotSupportedAllApis6100
         * @tc.number SUB_Multimedia_Audio_Spatialization_NotSupportedAllApis_6100
         * @tc.desc   Verify all APIs handle unsupported device gracefully
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testPersonalizedSpatializationNotSupportedAllApis6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                let supported = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                let desc = getAudioDeviceDescriptor();
                if (desc === null) { done(); return; }
                let isEnabled = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(typeof isEnabled === 'boolean').assertTrue();
                try {
                    await mgr.setPersonalizedSpatializationEnabled(desc, true);
                } catch (setError) {
                    console.info(`${TAG} setEnabled unsupported: code=${setError.code}`);
                }
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {});
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
            } catch (error) {
                handleCatchError(`${TAG} not supported all APIs`, error);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledUndefinedParam6200
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledUndefined_6200
         * @tc.desc   isPersonalizedSpatializationEnabled with undefined parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledUndefinedParam6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let undefinedParam: ESObject = undefined;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(undefinedParam);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} isPersonalizedEnabled undefined`, error);
                done();
            }
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledUndefinedEnable6300
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledUndefinedEnable_6300
         * @tc.desc   setPersonalizedSpatializationEnabled with undefined enable parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledUndefinedEnable6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            try {
                let undefinedEnable: ESObject = undefined;
                await getAudioSpatializationManager().setPersonalizedSpatializationEnabled(desc, undefinedEnable);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setEnabled undefined`, error);
                done();
            }
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChangeWithCallback6400
         * @tc.number SUB_Multimedia_Audio_Spatialization_OffPersonalizedEnabledChangeWithCallback_6400
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice with specific callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeWithCallback6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                let count = 0;
                let cb = (data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => { count++; };
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                expect(typeof mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                expect(count).assertEqual(0);
            } catch (error) {
                handleCatchError(`${TAG} off with callback`, error);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeCallbackData6500
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChangeCallbackData_6500
         * @tc.desc   Verify callback data structure has deviceDescriptor and enabled fields
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeCallbackData6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} callback data: enabled=${data.enabled}`);
                });
                expect(typeof mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
            } catch (error) {
                handleCatchError(`${TAG} callback data`, error);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFMissingLength6600
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFMissingLength_6600
         * @tc.desc   downloadPersonalizedHRTF with descriptor missing length field
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFMissingLength6600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let descriptorNoLength: ESObject = { fd: 1 };
                await getAudioSpatializationManager().downloadPersonalizedHRTF(descriptorNoLength);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF missing length`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFUndefinedDescriptor6700
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFUndefinedDescriptor_6700
         * @tc.desc   downloadPersonalizedHRTF with undefined descriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFUndefinedDescriptor6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let undefinedDescriptor: ESObject = undefined;
                await getAudioSpatializationManager().downloadPersonalizedHRTF(undefinedDescriptor);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadHRTF undefined`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFClosedFd6800
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFClosedFd_6800
         * @tc.desc   downloadPersonalizedHRTF with closed fd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFClosedFd6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath = testContext.cacheDir + '/test_hrtf_closed.bin';
            let closedFd: number = -1;
            try {
                let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let buf = new ArrayBuffer(128);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                closedFd = file.fd;
                fileIo.closeSync(file);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: closedFd, length: stat.size });
                expect().assertFail();
                done();
            } catch (error) {
                let code: number = error.code as number;
                expect(code === 6800101 || code === 6800301 || code > 0).assertTrue();
                done();
            } finally {
                try { fileIo.unlinkSync(filePath); } catch (e) {}
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFReadOnlyFd6900
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFReadOnlyFd_6900
         * @tc.desc   downloadPersonalizedHRTF with read-only fd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFReadOnlyFd6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath = testContext.cacheDir + '/test_hrtf_readonly.bin';
            let file: fileIo.File | null = null;
            try {
                let writeFile = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let buf = new ArrayBuffer(128);
                fileIo.writeSync(writeFile.fd, buf);
                fileIo.closeSync(writeFile);
                file = fileIo.openSync(filePath, fileIo.OpenMode.READ_ONLY);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                expect().assertFail();
                done();
            } catch (error) {
                let code: number = error.code as number;
                expect(code === 6800101 || code === 6800301 || code > 0).assertTrue();
                done();
            } finally {
                cleanupFile(file, filePath);
            }
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationSupportedSystemApp2027000
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedSupportedSystemApp_7000
         * @tc.desc   Verify isPersonalizedSpatializationSupported handles system app (202)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationSupportedSystemApp2027000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                let ret = getAudioSpatializationManager().isPersonalizedSpatializationSupported();
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handlePermissionError(`${TAG} isSupported`, error, [202]);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledSystemApp2027100
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledSystemApp_7100
         * @tc.desc   Verify isPersonalizedSpatializationEnabled handles system app (202) and parameter error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationEnabledSystemApp2027100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            try {
                let ret = getAudioSpatializationManager().isPersonalizedSpatializationEnabled(desc);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handlePermissionError(`${TAG} isEnabled`, error, [202, 401, 6800101]);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledPermission201And2027200
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledPermission_7200
         * @tc.desc   Verify setPersonalizedSpatializationEnabled handles permission (201) and system app (202)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testSetPersonalizedSpatializationEnabledPermission201And2027200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let desc = checkRoutingAndSkip(done);
            if (desc === null) return;
            if (checkSupportAndSkip(done)) return;
            try {
                let mgr = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let ret = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(typeof ret === 'boolean').assertTrue();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                handlePermissionError(`${TAG} setEnabled`, error, [201, 202, 801]);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedSpatializationEnabledChangeSystemApp2027300
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChangeSystemApp_7300
         * @tc.desc   Verify onPersonalizedSpatializationEnabledChangeForAnyDevice handles system app (202)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testOnPersonalizedSpatializationEnabledChangeSystemApp2027300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {});
                expect(typeof mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
            } catch (error) {
                handlePermissionError(`${TAG} on`, error, [202]);
            }
            done();
        });

        /**
         * @tc.name   testOffPersonalizedSpatializationEnabledChangeSystemApp2027400
         * @tc.number SUB_Multimedia_Audio_Spatialization_OffPersonalizedEnabledChangeSystemApp_7400
         * @tc.desc   Verify offPersonalizedSpatializationEnabledChangeForAnyDevice handles system app (202)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testOffPersonalizedSpatializationEnabledChangeSystemApp2027400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                let mgr = getAudioSpatializationManager();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect(typeof mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
            } catch (error) {
                handlePermissionError(`${TAG} off`, error, [202]);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFPermission201And2027500
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFPermission_7500
         * @tc.desc   Verify downloadPersonalizedHRTF handles permission (201) and system app (202)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testDownloadPersonalizedHRTFPermission201And2027500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath = testContext.cacheDir + '/test_hrtf_perm.bin';
            let file: fileIo.File | null = null;
            try {
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                let buf = new ArrayBuffer(256);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                expect(stat.size).assertLarger(0);
            } catch (error) {
                handlePermissionError(`${TAG} downloadHRTF`, error, [201, 202, 801, 6800101, 6800301, 6800105]);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });
    });
}
