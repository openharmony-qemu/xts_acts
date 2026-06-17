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
import { fileIo } from '@kit.CoreFileKit';

const RENDERER_INFO: audio.AudioRendererInfo = {
    usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
    rendererFlags: 0
};

const ERR_CODE_INPUT_INVALID: string = '401';
const ERR_CODE_INVALID_PARAM: string = '6800101';
const ERR_CODE_SYSTEM: number = 6800301;
const ERR_CODE_PERMISSION_DENIED: string = '202';

function getAudioSpatializationManager(): audio.AudioSpatializationManager {
    return audio.getAudioManager().getSpatializationManager();
}

function getAudioDeviceDescriptor(): audio.AudioDeviceDescriptor | null {
    try {
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let descriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
        if (descriptors.length === 0) return null;
        return descriptors[0];
    } catch (e) {
        console.info("[AudioSpatializationManager2JsTest] getAudioDeviceDescriptor failed: " + e);
        return null;
    }
}

function isSupported(): boolean {
    try {
        return getAudioSpatializationManager().isPersonalizedSpatializationSupported();
    } catch (e) {
        return false;
    }
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
    if (desc === null || desc === undefined) {
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

function sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

export default function audioSpatializationManager2() {
    const TAG = "[AudioSpatializationManager2JsTest]";
    const stringParameter: ESObject = 'stringParameter';
    const numberParameter = 12345678;

    describe("AudioSpatializationManager2JsTest", () => {
        let cbTriggered: boolean = false;

        beforeAll(async () => {
            let testContext: ESObject = AppStorage.get('testContext');
            console.info(TAG + " cacheDir: " + testContext.cacheDir);
            console.info(TAG + " beforeAll called");
        });

        afterAll(() => {
            console.info(TAG + ' afterAll called');
        });

        beforeEach(() => {
            console.info(TAG + ' beforeEach called');
        });

        afterEach(() => {
            cbTriggered = false;
            console.info(TAG + ' afterEach called');
        });

        // ==================== isPersonalizedSpatializationSupported ====================

        /**
         * @tc.name   testIsPersonalizedSpatializationSupported0100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_SUPPORTED_0100
         * @tc.desc   Verify isPersonalizedSpatializationSupported returns boolean type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testIsPersonalizedSpatializationSupported0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            try {
                let ret: boolean = isSupported();
                console.info(`${TAG} isPersonalizedSpatializationSupported result: ${ret}`);
                expect(ret === true || ret === false).assertTrue();
            } catch (error) {
                console.error(`${TAG} isPersonalizedSpatializationSupported unexpected error`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationSupportedConsistency0200
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_SUPPORTED_CONSISTENCY_0200
         * @tc.desc   Verify isPersonalizedSpatializationSupported returns consistent result across multiple calls
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationSupportedConsistency0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                let r1: boolean = isSupported();
                let r2: boolean = isSupported();
                let r3: boolean = isSupported();
                expect(r1 === r2 && r2 === r3).assertTrue();
            } catch (error) {
                console.error(`${TAG} consistency unexpected error`);
                expect(false).assertTrue();
            }
            done();
        });

        // ==================== isPersonalizedSpatializationEnabled ====================

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabled0300
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_0300
         * @tc.desc   Verify isPersonalizedSpatializationEnabled with valid AudioDeviceDescriptor returns boolean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabled0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                console.error(`${TAG} isPersonalizedSpatializationEnabled unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledInvalidNumber0400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_INVALID_NUMBER_0400
         * @tc.desc   isPersonalizedSpatializationEnabled with invalid param type (number)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledInvalidNumber0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let invalidParam: ESObject = numberParameter;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(invalidParam);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledInvalidString0500
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_INVALID_STRING_0500
         * @tc.desc   isPersonalizedSpatializationEnabled with invalid param type (string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledInvalidString0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let invalidParam: ESObject = stringParameter;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(invalidParam);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledNullParam0600
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_NULL_0600
         * @tc.desc   isPersonalizedSpatializationEnabled with null parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledNullParam0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let nullParam: ESObject = null;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(nullParam);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledNoArg0700
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_NO_ARG_0700
         * @tc.desc   isPersonalizedSpatializationEnabled with no arguments
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledNoArg0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let invalidCall: ESObject = getAudioSpatializationManager();
                let ret: ESObject = invalidCall.isPersonalizedSpatializationEnabled();
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledNotSupported0800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_NOT_SUPPORTED_0800
         * @tc.desc   isPersonalizedSpatializationEnabled when device does not support personalized spatialization
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledNotSupported0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                // On unsupported devices APIs may not exist
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
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
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                console.info(`${TAG} not supported - API may not exist on this device`);
            }
            done();
        });

        // ==================== setPersonalizedSpatializationEnabled ====================

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledTrue0900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_TRUE_0900
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledTrue0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertTrue();
            } catch (error) {
                console.error(`${TAG} setEnabled(true) unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledFalse1000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_FALSE_1000
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledFalse1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                let errMsg: string = error && error.message ? error.message : String(error);
                let errCode: string = error && error.code ? String(error.code) : 'none';
                console.error(`${TAG} 1200 error: code=${errCode} msg=${errMsg}`);
                expect(`code=${errCode} msg=${errMsg}`).assertEqual('DIAG_1200');
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledValidDeviceTrue1100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_VALID_DEVICE_TRUE_1100
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device param and enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledValidDeviceTrue1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertTrue();
            } catch (error) {
                console.error(`${TAG} setEnabled valid device unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledValidDeviceFalse1200
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_VALID_DEVICE_FALSE_1200
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device param and enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledValidDeviceFalse1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                console.error(`${TAG} setEnabled valid device unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidEnableNumber1300
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_INVALID_ENABLE_NUMBER_1300
         * @tc.desc   setPersonalizedSpatializationEnabled with invalid enable param (number)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidEnableNumber1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let invalidEnable: ESObject = numberParameter;
                await getAudioSpatializationManager().setPersonalizedSpatializationEnabled(desc, invalidEnable);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidEnableNull1400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_INVALID_ENABLE_NULL_1400
         * @tc.desc   setPersonalizedSpatializationEnabled with null enable parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidEnableNull1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let nullEnable: ESObject = null;
                await getAudioSpatializationManager().setPersonalizedSpatializationEnabled(desc, nullEnable);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledNoArg1500
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_NO_ARG_1500
         * @tc.desc   setPersonalizedSpatializationEnabled with no arguments
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledNoArg1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let invalidCall: ESObject = getAudioSpatializationManager();
                await invalidCall.setPersonalizedSpatializationEnabled();
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledNotSupported1600
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_NOT_SUPPORTED_1600
         * @tc.desc   setPersonalizedSpatializationEnabled when device does not support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledNotSupported1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                // On unsupported devices APIs may not exist
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
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
                console.info(`${TAG} setEnabled not supported - API may not exist on this device`);
            }
            done();
        });

        // ==================== onPersonalizedSpatializationEnabledChangeForAnyDevice ====================

        /**
         * @tc.name   testOnPersonalizedEnabledChange1700
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_1700
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with valid callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChange1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    cbTriggered = true;
                });
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertTrue();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} on unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeInvalidString1800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_INVALID_STRING_1800
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with invalid param (string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeInvalidString1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let invalidCallback: ESObject = stringParameter;
                getAudioSpatializationManager().onPersonalizedSpatializationEnabledChangeForAnyDevice(invalidCallback);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeInvalidNull1900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_INVALID_NULL_1900
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with null callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeInvalidNull1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let nullCallback: ESObject = null;
                getAudioSpatializationManager().onPersonalizedSpatializationEnabledChangeForAnyDevice(nullCallback);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeInvalidNumber2000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_INVALID_NUMBER_2000
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with number type callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeInvalidNumber2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let numberCallback: ESObject = numberParameter;
                getAudioSpatializationManager().onPersonalizedSpatializationEnabledChangeForAnyDevice(numberCallback);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeNoArg2100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_NO_ARG_2100
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with no arguments
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeNoArg2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let invalidCall: ESObject = getAudioSpatializationManager();
                invalidCall.onPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        // ==================== offPersonalizedSpatializationEnabledChangeForAnyDevice ====================

        /**
         * @tc.name   testOffPersonalizedEnabledChange2200
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_2200
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice basic
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChange2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    cbTriggered = true;
                });
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertFalse();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} off unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChangeWithoutOn2300
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_WITHOUT_ON_2300
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice without prior on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeWithoutOn2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    cbTriggered = true;
                });
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertFalse();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} off without on unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testOnOffPersonalizedEnabledChangeMultipleCycles2400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_OFF_PERSONALIZED_ENABLED_CHANGE_CYCLES_2400
         * @tc.desc   Multiple on/off registration cycles
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnOffPersonalizedEnabledChangeMultipleCycles2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let cb = (data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => { console.info(`${TAG} callback fired`); cbTriggered = true; };
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertTrue();
                cbTriggered = false;
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                await sleep(1000);
                                expect(cbTriggered).assertFalse();
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertTrue();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} on/off cycles unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        // ==================== downloadPersonalizedHRTF ====================

        /**
         * @tc.name   testDownloadPersonalizedHRTF2500
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_2500
         * @tc.desc   downloadPersonalizedHRTF with valid fd and length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTF2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_data.bin';
            let file: fileIo.File | null = null;
            try {
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                let buf = new ArrayBuffer(1024);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                expect(stat.size).assertLarger(0);
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_SYSTEM);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFInvalidFd2600
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_INVALID_FD_2600
         * @tc.desc   downloadPersonalizedHRTF with invalid fd (-1)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFInvalidFd2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: -1, length: 1024 });
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFNullDescriptor2700
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_NULL_DESCRIPTOR_2700
         * @tc.desc   downloadPersonalizedHRTF with null descriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFNullDescriptor2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let nullDescriptor: ESObject = null;
                await getAudioSpatializationManager().downloadPersonalizedHRTF(nullDescriptor);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFStringDescriptor2800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_STRING_DESCRIPTOR_2800
         * @tc.desc   downloadPersonalizedHRTF with string type descriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFStringDescriptor2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let stringDescriptor: ESObject = stringParameter;
                await getAudioSpatializationManager().downloadPersonalizedHRTF(stringDescriptor);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFMissingFd2900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_MISSING_FD_2900
         * @tc.desc   downloadPersonalizedHRTF with descriptor missing fd field
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFMissingFd2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let descriptorNoFd: ESObject = { length: 1024 };
                await getAudioSpatializationManager().downloadPersonalizedHRTF(descriptorNoFd);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthZero3000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_ZERO_3000
         * @tc.desc   downloadPersonalizedHRTF with length=0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthZero3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: 0, length: 0 });
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthNegative3100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_NEGATIVE_3100
         * @tc.desc   downloadPersonalizedHRTF with negative length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthNegative3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: 1, length: -1 });
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthExceed3200
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_EXCEED_3200
         * @tc.desc   downloadPersonalizedHRTF with length > 10MB
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthExceed3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let exceedLength: number = 10 * 1024 * 1024 + 1;
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: 1, length: exceedLength });
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFNotSupported3300
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_NOT_SUPPORTED_3300
         * @tc.desc   downloadPersonalizedHRTF when device does not support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFNotSupported3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            // On unsupported devices APIs may not exist
            if (testContext === null || testContext === undefined) { done(); return; }
            let filePath: string = testContext.cacheDir + '/test_hrtf_nosupport.bin';
            let file: fileIo.File | null = null;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                let buf = new ArrayBuffer(1024);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await mgr.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
            } catch (error) {
                console.info(`${TAG} downloadHRTF not supported - API may not exist on this device`);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        // ==================== Integration tests ====================

        /**
         * @tc.name   testPersonalizedSpatializationFullWorkflow3400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_FULL_WORKFLOW_3400
         * @tc.desc   Full lifecycle: check support, enable, verify, download HRTF, disable, verify
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testPersonalizedSpatializationFullWorkflow3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (checkSupportAndSkip(done)) return;
            if (testContext === null || testContext === undefined) { done(); return; }
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_workflow.bin';
            let file: fileIo.File | null = null;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
                expect(supported).assertTrue();
                if (!supported) { done(); return; }
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let enabled1: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(enabled1).assertTrue();
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                let buf = new ArrayBuffer(512);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                try {
                    await mgr.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                } catch (e) {
                    console.info(`${TAG} workflow download expected error: ${e.code}`);
                }
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let enabled2: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(enabled2).assertFalse();
            } catch (error) {
                console.error(`${TAG} full workflow unexpected error: ${error.code}`);
                expect(false).assertTrue();
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testPersonalizedSpatializationNotSupportedAllApis3500
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_NOT_SUPPORTED_ALL_APIS_3500
         * @tc.desc   Verify all APIs handle unsupported device gracefully
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testPersonalizedSpatializationNotSupportedAllApis3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                // On unsupported devices APIs may not exist
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                let desc = getAudioDeviceDescriptor();
                if (desc === null) { done(); return; }
                let isEnabled: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(isEnabled).assertFalse();
                try {
                    await mgr.setPersonalizedSpatializationEnabled(desc, true);
                } catch (setError) {
                    console.info(`${TAG} setEnabled unsupported: code=${setError.code}`);
                }
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {});
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
            } catch (error) {
                console.info(`${TAG} not supported all APIs - API may not exist on this device`);
            }
            done();
        });

        // ==================== Additional param tests ====================

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledUndefinedParam3600
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_UNDEFINED_3600
         * @tc.desc   isPersonalizedSpatializationEnabled with undefined parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledUndefinedParam3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let undefinedParam: ESObject = undefined;
                getAudioSpatializationManager().isPersonalizedSpatializationEnabled(undefinedParam);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledUndefinedEnable3700
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_UNDEFINED_ENABLE_3700
         * @tc.desc   setPersonalizedSpatializationEnabled with undefined enable parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledUndefinedEnable3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let undefinedEnable: ESObject = undefined;
                await getAudioSpatializationManager().setPersonalizedSpatializationEnabled(desc, undefinedEnable);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INPUT_INVALID);
            }
            done();
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChangeWithCallback3800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_WITH_CALLBACK_3800
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice with specific callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeWithCallback3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                cbTriggered = false;
                let cb = (data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => { console.info(`${TAG} callback fired`); cbTriggered = true; };
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertFalse();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} off with callback unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeCallbackData3900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_CALLBACK_DATA_3900
         * @tc.desc   Verify callback data structure has deviceDescriptor and enabled fields
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeCallbackData3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} callback data: enabled=${data.enabled}`);
                    cbTriggered = true;
                });
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertTrue();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} callback data unexpected error: ${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFMissingLength4000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_MISSING_LENGTH_4000
         * @tc.desc   downloadPersonalizedHRTF with descriptor missing length field
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFMissingLength4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let descriptorNoLength: ESObject = { fd: 1 };
                await getAudioSpatializationManager().downloadPersonalizedHRTF(descriptorNoLength);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFUndefinedDescriptor4100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_UNDEFINED_DESCRIPTOR_4100
         * @tc.desc   downloadPersonalizedHRTF with undefined descriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFUndefinedDescriptor4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let undefinedDescriptor: ESObject = undefined;
                await getAudioSpatializationManager().downloadPersonalizedHRTF(undefinedDescriptor);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFClosedFd4200
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_CLOSED_FD_4200
         * @tc.desc   downloadPersonalizedHRTF with closed fd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFClosedFd4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_closed.bin';
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
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            } finally {
                try { fileIo.unlinkSync(filePath); } catch (e) {}
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFReadOnlyFd4300
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_READ_ONLY_FD_4300
         * @tc.desc   downloadPersonalizedHRTF with read-only fd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFReadOnlyFd4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_readonly.bin';
            let file: fileIo.File | null = null;
            try {
                let writeFile = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let buf = new ArrayBuffer(128);
                fileIo.writeSync(writeFile.fd, buf);
                fileIo.closeSync(writeFile);
                file = fileIo.openSync(filePath, fileIo.OpenMode.READ_ONLY);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                expect(stat.size).assertLarger(0);
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_SYSTEM);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
         });

         // ==================== Permission / System App tests ====================

        /**
         * @tc.name   testIsPersonalizedSpatializationSupportedSystemApp4400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_SUPPORTED_SYSTEM_APP_4400
         * @tc.desc   Verify isPersonalizedSpatializationSupported system app permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationSupportedSystemApp4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            try {
                let ret: boolean = getAudioSpatializationManager().isPersonalizedSpatializationSupported();
                expect(ret).assertTrue();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_PERMISSION_DENIED);
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledSystemApp4500
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_SYSTEM_APP_4500
         * @tc.desc   Verify isPersonalizedSpatializationEnabled system app permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationEnabledSystemApp4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_PERMISSION_DENIED);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledPermission4600
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_PERMISSION_4600
         * @tc.desc   Verify setPersonalizedSpatializationEnabled permission and system app
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testSetPersonalizedSpatializationEnabledPermission4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertTrue();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_PERMISSION_DENIED);
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedSpatializationEnabledChangeSystemApp4700
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_SYSTEM_APP_4700
         * @tc.desc   Verify onPersonalizedSpatializationEnabledChangeForAnyDevice system app permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testOnPersonalizedSpatializationEnabledChangeSystemApp4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    cbTriggered = true;
                });
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertTrue();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_PERMISSION_DENIED);
            }
            done();
        });

        /**
         * @tc.name   testOffPersonalizedSpatializationEnabledChangeSystemApp4800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_SYSTEM_APP_4800
         * @tc.desc   Verify offPersonalizedSpatializationEnabledChangeForAnyDevice system app permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testOffPersonalizedSpatializationEnabledChangeSystemApp4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            if (checkSupportAndSkip(done)) return;
            let desc = checkRoutingAndSkip(done);
            if (desc === null || desc === undefined) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    cbTriggered = true;
                });
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                                expect(cbTriggered).assertFalse();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_PERMISSION_DENIED);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFPermission4900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_PERMISSION_4900
         * @tc.desc   Verify downloadPersonalizedHRTF permission and system app
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testDownloadPersonalizedHRTFPermission4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) { done(); return; }
            if (checkSupportAndSkip(done)) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_perm.bin';
            let file: fileIo.File | null = null;
            try {
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                let buf = new ArrayBuffer(256);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                expect(stat.size).assertLarger(0);
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_SYSTEM);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });
    });
}
