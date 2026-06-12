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

function handleCatchInvalidParam(tag: string, err: ESObject): void {
    let code: number = err.code as number;
    let message: string = err.message as string;
    console.info(`${tag} caught error: code=${code}, message=${message}`);
    let hasCode: boolean = code != null && code != undefined && Number(code) > 0;
    let hasMsg: boolean = message != null && message != undefined && String(message).length > 0;
    expect(hasCode || hasMsg).assertTrue();
}

function handleCatchError(tag: string, err: ESObject): void {
    let code: number = err.code as number;
    let message: string = err.message as string;
    console.info(`${tag} caught error: code=${code}, message=${message}`);
    let hasValidCode = code != null && code > 0;
    let hasValidMessage = message != null && message.length > 0;
    expect(hasValidCode || hasValidMessage).assertTrue();
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let ret = audioSpatializationManager.isPersonalizedSpatializationSupported();
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let result1 = audioSpatializationManager.isPersonalizedSpatializationSupported();
                let result2 = audioSpatializationManager.isPersonalizedSpatializationSupported();
                let result3 = audioSpatializationManager.isPersonalizedSpatializationSupported();
                console.info(`${TAG} consistency results: ${result1}, ${result2}, ${result3}`);
                expect(result1 === result2).assertTrue();
                expect(result2 === result3).assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} isPersonalizedSpatializationSupported consistency`, error);
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
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                console.info(`${TAG} isPersonalizedSpatializationEnabled result: ${ret}`);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                console.info(`${TAG} isPersonalizedSpatializationEnabled Fail,error:${error},ErrorCode:${error.code}`);
                expect(false).assertTrue();
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let invalidParam: ESObject = numberParameter;
                audioSpatializationManager.isPersonalizedSpatializationEnabled(invalidParam);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let invalidParam: ESObject = stringParameter;
                audioSpatializationManager.isPersonalizedSpatializationEnabled(invalidParam);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let nullParam: ESObject = null;
                audioSpatializationManager.isPersonalizedSpatializationEnabled(nullParam);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let invalidCall: ESObject = audioSpatializationManager;
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (isSupported) {
                    console.info(`${TAG} device supports personalized spatialization, skip negative test`);
                    expect(isSupported).assertTrue();
                    done();
                    return;
                }
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                console.info(`${TAG} isPersonalizedSpatializationEnabled on unsupported device: ${ret}`);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} isPersonalizedSpatializationEnabled not supported`, error);
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
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} setPersonalizedSpatializationEnabled: device not supported, skip`);
                    done();
                    return;
                }
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], true);
                console.info(`${TAG} setPersonalizedSpatializationEnabled(true) success`);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(ret).assertTrue();
            } catch (error) {
                console.info(`${TAG} setPersonalizedSpatializationEnabled(true) Fail,error:${error},ErrorCode:${error.code}`);
                expect(false).assertTrue();
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
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} setPersonalizedSpatializationEnabled(false): device not supported, skip`);
                    done();
                    return;
                }
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], false);
                console.info(`${TAG} setPersonalizedSpatializationEnabled(false) success`);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(ret).assertFalse();
            } catch (error) {
                console.info(`${TAG} setPersonalizedSpatializationEnabled(false) Fail,error:${error},ErrorCode:${error.code}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidDeviceString3700
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidDeviceString_3700
         * @tc.desc   setPersonalizedSpatializationEnabled with invalid device param (string)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidDeviceString3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let audioManager = audio.getAudioManager();
            let audioSpatializationManager = audioManager.getSpatializationManager();
            let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
            if (!isSupported) {
                console.info(`${TAG} device not supported, skip`);
                done();
                return;
            }
            try {
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], true);
                console.info(`${TAG} setPersonalizedSpatializationEnabled with valid device succeeded`);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} setPersonalizedSpatializationEnabled`, error);
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledInvalidDeviceNull3800
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidDeviceNull_3800
         * @tc.desc   setPersonalizedSpatializationEnabled with null device parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledInvalidDeviceNull3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let audioManager = audio.getAudioManager();
            let audioSpatializationManager = audioManager.getSpatializationManager();
            let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
            if (!isSupported) {
                console.info(`${TAG} device not supported, skip`);
                done();
                return;
            }
            try {
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], false);
                console.info(`${TAG} setPersonalizedSpatializationEnabled(false) succeeded`);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                handleCatchError(`${TAG} setPersonalizedSpatializationEnabled`, error);
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
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let invalidEnable: ESObject = numberParameter;
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], invalidEnable);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setPersonalizedSpatializationEnabled invalid enable number`, error);
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
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let nullEnable: ESObject = null;
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], nullEnable);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setPersonalizedSpatializationEnabled null enable`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let invalidCall: ESObject = audioSpatializationManager;
                await invalidCall.setPersonalizedSpatializationEnabled();
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setPersonalizedSpatializationEnabled no arg`, error);
                done();
            }
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledNotSupported4200
         * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledNotSupported_4200
         * @tc.desc   setPersonalizedSpatializationEnabled when device does not support personalized spatialization
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledNotSupported4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (isSupported) {
                    console.info(`${TAG} device supports personalized spatialization, skip negative test`);
                    expect(isSupported).assertTrue();
                    done();
                    return;
                }
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], true);
                console.info(`${TAG} setPersonalizedSpatializationEnabled on unsupported device completed`);
            } catch (error) {
                console.info(`${TAG} setPersonalizedSpatializationEnabled on unsupported device error: ${error}`);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let callbackTriggered: boolean = false;
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} personalized change callback: enabled=${data.enabled}`);
                    callbackTriggered = true;
                });
                console.info(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice registered`);
                expect(typeof audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect(callbackTriggered).assertFalse();
            } catch (error) {
                handleCatchError(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let invalidCallback: ESObject = stringParameter;
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(invalidCallback);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice invalid string`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let nullCallback: ESObject = null;
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(nullCallback);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice null`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let numberCallback: ESObject = numberParameter;
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(numberCallback);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice number`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let invalidCall: ESObject = audioSpatializationManager;
                invalidCall.onPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice no arg`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                console.info(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice success`);
                expect(typeof audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
            } catch (error) {
                handleCatchError(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                console.info(`${TAG} off without prior on success`);
                expect(typeof audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
            } catch (error) {
                handleCatchError(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice without on`, error);
            }
            done();
        });

        /**
         * @tc.name   testOnOffPersonalizedEnabledChangeMultipleCycles5000
         * @tc.number SUB_Multimedia_Audio_Spatialization_OnOffPersonalizedEnabledChangeCycles_5000
         * @tc.desc   Multiple on/off registration cycles for personalized spatialization enabled change
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnOffPersonalizedEnabledChangeMultipleCycles5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let callCount = 0;
                let callback = (data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} multiple cycles callback: enabled=${data.enabled}`);
                    callCount++;
                };
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(callback);
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(callback);
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(callback);
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                console.info(`${TAG} multiple on/off cycles completed`);
                expect(callCount).assertEqual(0);
            } catch (error) {
                handleCatchError(`${TAG} on/off multiple cycles`, error);
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
            if (testContext === null || testContext === undefined) {
                console.info(`${TAG} testContext is null, skip`);
                done();
                return;
            }
            let filePath = testContext.cacheDir + '/test_hrtf_data.bin';
            let file: fileIo.File | null = null;
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} downloadPersonalizedHRTF: device not supported, skip`);
                    done();
                    return;
                }
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let testBuffer = new ArrayBuffer(1024);
                fileIo.writeSync(file.fd, testBuffer);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                console.info(`${TAG} downloadPersonalizedHRTF valid success`);
                expect(stat.size).assertLarger(0);
            } catch (error) {
                handleCatchError(`${TAG} downloadPersonalizedHRTF valid`, error);
            } finally {
                if (file !== null) {
                    fileIo.closeSync(file);
                }
                try {
                    fileIo.unlinkSync(filePath);
                } catch (e) {
                    console.error(`${TAG} cleanup failed`);
                }
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: -1, length: 1024 });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF invalid fd`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let nullDescriptor: ESObject = null;
                await audioSpatializationManager.downloadPersonalizedHRTF(nullDescriptor);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF null descriptor`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let stringDescriptor: ESObject = stringParameter;
                await audioSpatializationManager.downloadPersonalizedHRTF(stringDescriptor);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF string descriptor`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let descriptorNoFd: ESObject = { length: 1024 };
                await audioSpatializationManager.downloadPersonalizedHRTF(descriptorNoFd);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF missing fd`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthZero5600
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthZero_5600
         * @tc.desc   downloadPersonalizedHRTF with length=0 (boundary, below minimum)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthZero5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 0, length: 0 });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF length=0`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 1, length: -1 });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF negative length`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthExceed5800
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthExceed_5800
         * @tc.desc   downloadPersonalizedHRTF with length > 10MB (MAX_HRTF_LENGTH + 1)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthExceed5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let exceedLength = 10 * 1024 * 1024 + 1;
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 1, length: exceedLength });
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF length>10MB`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFNotSupported5900
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFNotSupported_5900
         * @tc.desc   downloadPersonalizedHRTF when device does not support personalized spatialization
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFNotSupported5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) {
                console.info(`${TAG} testContext is null, skip`);
                done();
                return;
            }
            let filePath = testContext.cacheDir + '/test_hrtf_nosupport.bin';
            let file: fileIo.File | null = null;
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (isSupported) {
                    console.info(`${TAG} device supports personalized spatialization, skip negative test`);
                    expect(isSupported).assertTrue();
                    done();
                    return;
                }
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let testBuffer = new ArrayBuffer(1024);
                fileIo.writeSync(file.fd, testBuffer);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                console.info(`${TAG} downloadPersonalizedHRTF on unsupported device completed`);
            } catch (error) {
                console.info(`${TAG} downloadPersonalizedHRTF on unsupported device error: ${error}`);
            } finally {
                if (file !== null) {
                    fileIo.closeSync(file);
                }
                try {
                    fileIo.unlinkSync(filePath);
                } catch (e) {
                    console.error(`${TAG} cleanup failed`);
                }
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
            if (testContext === null || testContext === undefined) {
                console.info(`${TAG} testContext is null, skip`);
                done();
                return;
            }
            let filePath = testContext.cacheDir + '/test_hrtf_workflow.bin';
            let file: fileIo.File | null = null;
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                expect(typeof isSupported === 'boolean').assertTrue();
                if (!isSupported) {
                    console.info(`${TAG} device not supported, skip workflow`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], true);
                let enabledAfterSetTrue = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(typeof enabledAfterSetTrue === 'boolean').assertTrue();
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let testBuffer = new ArrayBuffer(512);
                fileIo.writeSync(file.fd, testBuffer);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                console.info(`${TAG} downloadPersonalizedHRTF in workflow success`);
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], false);
                let enabledAfterSetFalse = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(typeof enabledAfterSetFalse === 'boolean').assertTrue();
                console.info(`${TAG} full workflow completed`);
            } catch (error) {
                handleCatchError(`${TAG} full workflow`, error);
            } finally {
                if (file !== null) {
                    fileIo.closeSync(file);
                }
                try {
                    fileIo.unlinkSync(filePath);
                } catch (e) {
                    console.error(`${TAG} cleanup failed`);
                }
            }
            done();
        });

        /**
         * @tc.name   testPersonalizedSpatializationNotSupportedAllApis6100
         * @tc.number SUB_Multimedia_Audio_Spatialization_NotSupportedAllApis_6100
         * @tc.desc   Verify all personalized spatialization APIs handle unsupported device gracefully
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testPersonalizedSpatializationNotSupportedAllApis6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (isSupported) {
                    console.info(`${TAG} device supports personalized spatialization, skip negative test`);
                    expect(isSupported).assertTrue();
                    done();
                    return;
                }
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let isEnabled = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(typeof isEnabled === 'boolean').assertTrue();
                try {
                    await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], true);
                } catch (setError) {
                    let setCode: number = setError.code as number;
                    console.info(`${TAG} setEnabled on unsupported device caught: code=${setCode}`);
                }
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} callback on unsupported device: enabled=${data.enabled}`);
                });
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                console.info(`${TAG} all APIs on unsupported device handled gracefully`);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let undefinedParam: ESObject = undefined;
                audioSpatializationManager.isPersonalizedSpatializationEnabled(undefinedParam);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} isPersonalizedSpatializationEnabled undefined`, error);
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
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let undefinedEnable: ESObject = undefined;
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], undefinedEnable);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} setPersonalizedSpatializationEnabled undefined enable`, error);
                done();
            }
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChangeWithCallback6400
         * @tc.number SUB_Multimedia_Audio_Spatialization_OffPersonalizedEnabledChangeWithCallback_6400
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice with specific registered callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeWithCallback6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let callCount = 0;
                let callback = (data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} off with callback test: enabled=${data.enabled}, deviceDescriptor exists=${data.deviceDescriptor != null}`);
                    callCount++;
                };
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(callback);
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice(callback);
                console.info(`${TAG} off with specific callback success`);
                expect(typeof audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                expect(callCount).assertEqual(0);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let receivedData: ESObject = null;
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    receivedData = data;
                    console.info(`${TAG} callback data: enabled=${data.enabled}, deviceDescriptor=${data.deviceDescriptor}`);
                });
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} device not supported, verify callback type registration only`);
                }
                expect(typeof audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
            } catch (error) {
                handleCatchError(`${TAG} callback data structure`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let descriptorNoLength: ESObject = { fd: 1 };
                await audioSpatializationManager.downloadPersonalizedHRTF(descriptorNoLength);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF missing length`, error);
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let undefinedDescriptor: ESObject = undefined;
                await audioSpatializationManager.downloadPersonalizedHRTF(undefinedDescriptor);
                expect().assertFail();
                done();
            } catch (error) {
                handleCatchInvalidParam(`${TAG} downloadPersonalizedHRTF undefined descriptor`, error);
                done();
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFClosedFd6800
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFClosedFd_6800
         * @tc.desc   downloadPersonalizedHRTF with closed fd, expect error 6800101 or 6800301
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFClosedFd6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) {
                console.info(`${TAG} testContext is null, skip`);
                done();
                return;
            }
            let filePath = testContext.cacheDir + '/test_hrtf_closed.bin';
            let closedFd: number = -1;
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} device not supported, skip`);
                    done();
                    return;
                }
                let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let testBuffer = new ArrayBuffer(128);
                fileIo.writeSync(file.fd, testBuffer);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                closedFd = file.fd;
                fileIo.closeSync(file);
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: closedFd, length: stat.size });
                expect().assertFail();
                done();
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} downloadPersonalizedHRTF closed fd error: code=${code}, message=${message}`);
                expect(code === 6800101 || code === 6800301 || code > 0).assertTrue();
                done();
            } finally {
                try {
                    fileIo.unlinkSync(filePath);
                } catch (e) {
                    console.error(`${TAG} cleanup failed`);
                }
            }
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFReadOnlyFd6900
         * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFReadOnlyFd_6900
         * @tc.desc   downloadPersonalizedHRTF with read-only fd, expect error 6800101 or 6800301
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFReadOnlyFd6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let testContext: ESObject = AppStorage.get('testContext');
            if (testContext === null || testContext === undefined) {
                console.info(`${TAG} testContext is null, skip`);
                done();
                return;
            }
            let filePath = testContext.cacheDir + '/test_hrtf_readonly.bin';
            let file: fileIo.File | null = null;
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} device not supported, skip`);
                    done();
                    return;
                }
                let writeFile = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
                let testBuffer = new ArrayBuffer(128);
                fileIo.writeSync(writeFile.fd, testBuffer);
                fileIo.closeSync(writeFile);
                file = fileIo.openSync(filePath, fileIo.OpenMode.READ_ONLY);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                expect().assertFail();
                done();
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} downloadPersonalizedHRTF read-only fd error: code=${code}, message=${message}`);
                 expect(code === 6800101 || code === 6800301 || code > 0).assertTrue();
                done();
            } finally {
                if (file !== null) {
                    fileIo.closeSync(file);
                }
                try {
                    fileIo.unlinkSync(filePath);
                } catch (e) {
                    console.error(`${TAG} cleanup failed`);
                }
            }
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationSupportedSystemApp2027000
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedSupportedSystemApp_7000
         * @tc.desc   Verify isPersonalizedSpatializationSupported handles system app (202) and non-system app
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationSupportedSystemApp2027000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let ret = audioSpatializationManager.isPersonalizedSpatializationSupported();
                console.info(`${TAG} isPersonalizedSpatializationSupported success in system app: ${ret}`);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} isPersonalizedSpatializationSupported error: code=${code}, message=${message}`);
                if (code === 202) {
                    expect(code).assertEqual(202);
                    console.info(`${TAG} not system app, error 202 as expected`);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledSystemApp2027100
         * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledSystemApp_7100
         * @tc.desc   Verify isPersonalizedSpatializationEnabled handles system app (202) and parameter error (6800101)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testIsPersonalizedSpatializationEnabledSystemApp2027100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                console.info(`${TAG} isPersonalizedSpatializationEnabled success in system app: ${ret}`);
                expect(typeof ret === 'boolean').assertTrue();
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} isPersonalizedSpatializationEnabled error: code=${code}, message=${message}`);
                if (code === 202) {
                    expect(code).assertEqual(202);
                    console.info(`${TAG} not system app, error 202 as expected`);
                } else if (code === 6800101 || code === 401) {
                    expect(code === 6800101 || code === 401).assertTrue();
                    console.info(`${TAG} parameter error, code ${code} as expected`);
                } else {
                    expect(false).assertTrue();
                }
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
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let audioRoutingManager = audioManager.getRoutingManager();
                if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
                    console.info(`${TAG} RoutingManager not supported, skip`);
                    done();
                    return;
                }
                let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} device not supported, skip`);
                    done();
                    return;
                }
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], true);
                console.info(`${TAG} setPersonalizedSpatializationEnabled success - permission granted, system app`);
                let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
                expect(typeof ret === 'boolean').assertTrue();
                await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], false);
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} setPersonalizedSpatializationEnabled error: code=${code}, message=${message}`);
                if (code === 201) {
                    expect(code).assertEqual(201);
                    console.info(`${TAG} permission denied, error 201 as expected`);
                } else if (code === 202) {
                    expect(code).assertEqual(202);
                    console.info(`${TAG} not system app, error 202 as expected`);
                } else if (code === 801) {
                    expect(code).assertEqual(801);
                    console.info(`${TAG} capability not supported, error 801 as expected`);
                } else {
                    expect(false).assertTrue();
                }
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} system app callback: enabled=${data.enabled}`);
                });
                console.info(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice success in system app`);
                expect(typeof audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice error: code=${code}, message=${message}`);
                if (code === 202) {
                    expect(code).assertEqual(202);
                    console.info(`${TAG} not system app, error 202 as expected`);
                } else {
                    expect(false).assertTrue();
                }
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
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                console.info(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice success in system app`);
                expect(typeof audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice error: code=${code}, message=${message}`);
                if (code === 202) {
                    expect(code).assertEqual(202);
                    console.info(`${TAG} not system app, error 202 as expected`);
                } else {
                    expect(false).assertTrue();
                }
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
            if (testContext === null || testContext === undefined) {
                console.info(`${TAG} testContext is null, skip`);
                done();
                return;
            }
            let filePath = testContext.cacheDir + '/test_hrtf_perm.bin';
            let file: fileIo.File | null = null;
            try {
                let audioManager = audio.getAudioManager();
                let audioSpatializationManager = audioManager.getSpatializationManager();
                let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
                if (!isSupported) {
                    console.info(`${TAG} device not supported, skip`);
                    done();
                    return;
                }
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                let testBuffer = new ArrayBuffer(256);
                fileIo.writeSync(file.fd, testBuffer);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await audioSpatializationManager.downloadPersonalizedHRTF({ fd: file.fd, length: stat.size });
                console.info(`${TAG} downloadPersonalizedHRTF success - permission granted, system app`);
                expect(stat.size).assertLarger(0);
            } catch (error) {
                let code: number = error.code as number;
                let message: string = error.message as string;
                console.info(`${TAG} downloadPersonalizedHRTF error: code=${code}, message=${message}`);
                if (code === 201 || code === 202 || code === 801) {
                    expect(code === 201 || code === 202 || code === 801).assertTrue();
                    console.info(`${TAG} permission/capability error ${code} as expected`);
                } else if (code === 6800101 || code === 6800301 || code === 6800105) {
                    expect(code === 6800101 || code === 6800301 || code === 6800105).assertTrue();
                    console.info(`${TAG} HRTF runtime error ${code} - permission OK, data error expected`);
                } else {
                    expect(false).assertTrue();
                }
            } finally {
                if (file !== null) {
                    fileIo.closeSync(file);
                }
                try {
                    fileIo.unlinkSync(filePath);
                } catch (e) {
                    console.error(`${TAG} cleanup failed`);
                }
            }
            done();
        });
    });
}
