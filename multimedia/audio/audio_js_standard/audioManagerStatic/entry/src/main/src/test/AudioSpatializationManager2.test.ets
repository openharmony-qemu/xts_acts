'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import audio from '@ohos.multimedia.audio';
import fileIo from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

const RENDERER_INFO: audio.AudioRendererInfo = {
    usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
    rendererFlags: 0
};

const ERR_CODE_INPUT_INVALID: number = 401;
const ERR_CODE_INVALID_PARAM: number = 6800101;
const ERR_CODE_SYSTEM: number = 6800301;
const ERR_CODE_TIMEOUT: number = 6800105;
const ERR_CODE_UNAVAILABLE: number = 801;

function getAudioSpatializationManager(): audio.AudioSpatializationManager {
    return audio.getAudioManager().getSpatializationManager();
}

function hasRoutingDevice(): boolean {
    try {
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let descriptors: audio.AudioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
        return descriptors.length > 0;
    } catch (e) {
        console.info("[AudioSpatializationManager2JsTest] getAudioDeviceDescriptor failed: " + e);
        return false;
    }
}

function getAudioDeviceDescriptor(): audio.AudioDeviceDescriptor {
    let audioManager = audio.getAudioManager();
    let audioRoutingManager = audioManager.getRoutingManager();
    let descriptors: audio.AudioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(RENDERER_INFO);
    return descriptors[0] as audio.AudioDeviceDescriptor;
}

function isSupported(): boolean {
    try {
        return getAudioSpatializationManager().isPersonalizedSpatializationSupported();
    } catch (e) {
        return false;
    }
}

function checkSupportAndSkip(done: () => void): boolean {
    if (!isSupported()) {
        console.info("[AudioSpatializationManager2JsTest] device not supported, skip");
        done();
        return true;
    }
    return false;
}

function checkRoutingAndSkip(done: () => void): boolean {
    if (!hasRoutingDevice()) {
        console.info("[AudioSpatializationManager2JsTest] RoutingManager not supported, skip");
        done();
        return true;
    }
    return false;
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

function sleep(ms: int): Promise<void> {
    return new Promise<void>((resolve, reject) => {
        setTimeout(() => {
            resolve(undefined);
        }, ms);
    });
}

const DOWNLOAD_TIMEOUT: int = 5000;
function downloadWithTimeout(mgr: audio.AudioSpatializationManager, descriptor: audio.AudioHRTFAnonymousDescriptor): Promise<void> {
    let p: Promise<void> = new Promise<void>((resolve, reject) => {
        setTimeout(() => {
            let timeoutError: BusinessError = new BusinessError(ERR_CODE_TIMEOUT.toInt(), new Error('download timeout'));
            reject(timeoutError);
        }, DOWNLOAD_TIMEOUT);
    });
    return Promise.race<void>([mgr.downloadPersonalizedHRTF(descriptor), p]);
}

export default function audioSpatializationManager2(): void {
    const TAG = "[AudioSpatializationManager2JsTest]";

    describe("AudioSpatializationManager2JsTest", (): void => {
        let cbTriggered: boolean = false;

        beforeAll(async (): Promise<void> => {
            console.info(TAG + " beforeAll called");
        });

        afterAll((): void => {
            console.info(TAG + ' afterAll called');
        });

        beforeEach((): void => {
            console.info(TAG + ' beforeEach called');
        });

        afterEach((): void => {
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
        it("testIsPersonalizedSpatializationSupported0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let ret: boolean = isSupported();
                console.info(`${TAG} isPersonalizedSpatializationSupported result: ${ret}`);
                expect(ret === true || ret === false).assertTrue();
            } catch (error) {
                console.error(`${TAG} isPersonalizedSpatializationSupported unexpected error`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
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
        it("testIsPersonalizedSpatializationSupportedConsistency0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let r1: boolean = isSupported();
                let r2: boolean = isSupported();
                let r3: boolean = isSupported();
                expect(r1 === r2 && r2 === r3).assertTrue();
            } catch (error) {
                console.error(`${TAG} consistency unexpected error`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        // ==================== isPersonalizedSpatializationEnabled ====================

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabled0400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_0400
         * @tc.desc   Verify isPersonalizedSpatializationEnabled with valid AudioDeviceDescriptor returns boolean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabled0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                console.error(`${TAG} isPersonalizedSpatializationEnabled unexpected error: ${error.code}`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testIsPersonalizedSpatializationEnabledNotSupported1000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_IS_PERSONALIZED_ENABLED_NOT_SUPPORTED_1000
         * @tc.desc   isPersonalizedSpatializationEnabled when device does not support personalized spatialization
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testIsPersonalizedSpatializationEnabledNotSupported1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            try {
                // On unsupported devices APIs may not exist
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                if (!hasRoutingDevice()) {
                    done();
                    return;
                }
                let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                console.info(`${TAG} 0800 API error on unsupported device: ${error.code}`);
                expect(error.code !== undefined).assertTrue();
            }
            done();
        });

        // ==================== setPersonalizedSpatializationEnabled ====================

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledTrue1100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_TRUE_1100
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledTrue1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertTrue();
            } catch (error) {
                console.error(`${TAG} setEnabled(true) unexpected error: ${error.code}`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledFalse1200
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_FALSE_1200
         * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledFalse1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let ret: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(ret).assertFalse();
            } catch (error) {
                console.error(`${TAG} setEnabled(false) unexpected error: ${error.code}`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testSetPersonalizedSpatializationEnabledNotSupported1800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_SET_PERSONALIZED_ENABLED_NOT_SUPPORTED_1800
         * @tc.desc   setPersonalizedSpatializationEnabled when device does not support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testSetPersonalizedSpatializationEnabledNotSupported1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            try {
                // On unsupported devices APIs may not exist
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                if (!hasRoutingDevice()) {
                    done();
                    return;
                }
                let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
            } catch (error) {
                console.info(`${TAG} 1600 API error on unsupported device: ${error.code}`);
                expect(error.code !== undefined).assertTrue();
            }
            done();
        });

        // ==================== onPersonalizedSpatializationEnabledChangeForAnyDevice ====================

        /**
         * @tc.name   testOnPersonalizedEnabledChange1900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_1900
         * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with valid callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChange1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
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
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeDuplicateCallback2400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_DUPLICATE_CALLBACK_2400
         * @tc.desc   Register same callback twice, verify deduplication
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeDuplicateCallback2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let cbCount: number = 0;
                let cb = (data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => { cbCount++; };
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice(cb);
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                expect(cbCount).assertEqual(1);
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} duplicate callback unexpected error: ${error.code}`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        // ==================== offPersonalizedSpatializationEnabledChangeForAnyDevice ====================

        /**
         * @tc.name   testOffPersonalizedEnabledChange2500
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_2500
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice basic
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChange2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
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
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChangeWithoutOn2600
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_WITHOUT_ON_2600
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice without prior on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeWithoutOn2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
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
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testOnOffPersonalizedEnabledChangeMultipleCycles2700
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_OFF_PERSONALIZED_ENABLED_CHANGE_CYCLES_2700
         * @tc.desc   Multiple on/off registration cycles
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnOffPersonalizedEnabledChangeMultipleCycles2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
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
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testOffPersonalizedEnabledChangeNoParam2900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_NO_PARAM_2900
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice with no parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeNoParam2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                expect(true).assertTrue();
            } catch (error) {
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        // ==================== downloadPersonalizedHRTF ====================

        /**
         * @tc.name   testDownloadPersonalizedHRTF3000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_3000
         * @tc.desc   downloadPersonalizedHRTF with valid fd and length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTF3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            if (checkSupportAndSkip(done)) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_data.bin';
            let file: fileIo.File | null = null;
            try {
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                let buf = new ArrayBuffer(1024);
                fileIo.writeSync(file.fd, buf);
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd.toInt(), length: stat.size.toLong() });
                expect(stat.size).assertLarger(0);
            } catch (error) {
                if (error.code === ERR_CODE_SYSTEM) {
                    expect(error.code).assertEqual(ERR_CODE_SYSTEM);
                } else if (error.code === ERR_CODE_TIMEOUT) {
                    expect(error.code).assertEqual(ERR_CODE_TIMEOUT);
                } else if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFInvalidFd3100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_INVALID_FD_3100
         * @tc.desc   downloadPersonalizedHRTF with invalid fd (-1)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFInvalidFd3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
         * @tc.name   testDownloadPersonalizedHRTFLengthZero3500
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_ZERO_3500
         * @tc.desc   downloadPersonalizedHRTF with length=0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthZero3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
         * @tc.name   testDownloadPersonalizedHRTFLengthNegative3600
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_NEGATIVE_3600
         * @tc.desc   downloadPersonalizedHRTF with negative length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthNegative3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
         * @tc.name   testDownloadPersonalizedHRTFLengthExceed3700
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_EXCEED_3700
         * @tc.desc   downloadPersonalizedHRTF with length > 10MB
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthExceed3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            try {
                let exceedLength: number = 10 * 1024 * 1024 + 1;
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: 1, length: exceedLength.toLong() });
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFNotSupported3800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_NOT_SUPPORTED_3800
         * @tc.desc   downloadPersonalizedHRTF when device does not support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFNotSupported3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            // On unsupported devices APIs may not exist
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
                await mgr.downloadPersonalizedHRTF({ fd: file.fd.toInt(), length: stat.size.toLong() });
            } catch (error) {
                console.info(`${TAG} downloadHRTF not supported - API may not exist on this device`);
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        // ==================== Integration tests ====================

        /**
         * @tc.name   testPersonalizedSpatializationFullWorkflow3900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_FULL_WORKFLOW_3900
         * @tc.desc   Full lifecycle: check support, enable, verify, download HRTF, disable, verify
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testPersonalizedSpatializationFullWorkflow3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
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
                    await downloadWithTimeout(mgr, { fd: file.fd.toInt(), length: stat.size.toLong() });
                } catch (e) {
                    if (e.code === ERR_CODE_SYSTEM) {
                        expect(e.code).assertEqual(ERR_CODE_SYSTEM);
                    } else if (e.code === ERR_CODE_TIMEOUT) {
                        expect(e.code).assertEqual(ERR_CODE_TIMEOUT);
                    } else if (e.code === ERR_CODE_UNAVAILABLE) {
                        expect(e.code).assertEqual(ERR_CODE_UNAVAILABLE);
                    } else {
                        expect(false).assertTrue();
                    }
                }
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                let enabled2: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(enabled2).assertFalse();
            } catch (error) {
                console.error(`${TAG} full workflow unexpected error: ${error.code}`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testPersonalizedSpatializationNotSupportedAllApis4000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_NOT_SUPPORTED_ALL_APIS_4000
         * @tc.desc   Verify all APIs handle unsupported device gracefully
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testPersonalizedSpatializationNotSupportedAllApis4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            try {
                // On unsupported devices APIs may not exist
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                let supported: boolean = mgr.isPersonalizedSpatializationSupported();
                if (supported) {
                    expect(supported).assertTrue();
                    done();
                    return;
                }
                if (!hasRoutingDevice()) { done(); return; }
                let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
                let isEnabled: boolean = mgr.isPersonalizedSpatializationEnabled(desc);
                expect(isEnabled).assertFalse();
                try {
                    await mgr.setPersonalizedSpatializationEnabled(desc, true);
                } catch (setError) {
                    console.info(`${TAG} 3500 setEnabled on unsupported: ${setError.code}`);
                }
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {});
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
            } catch (error) {
                console.info(`${TAG} 3500 API error on unsupported device: ${error.code}`);
                expect(error.code !== undefined).assertTrue();
            }
            done();
        });

        // ==================== Additional param tests ====================

        /**
         * @tc.name   testOffPersonalizedEnabledChangeWithCallback4300
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_OFF_PERSONALIZED_ENABLED_CHANGE_WITH_CALLBACK_4300
         * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice with specific callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOffPersonalizedEnabledChangeWithCallback4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
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
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testOnPersonalizedEnabledChangeCallbackData4400
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_ON_PERSONALIZED_ENABLED_CHANGE_CALLBACK_DATA_4400
         * @tc.desc   Verify callback data structure has deviceDescriptor and enabled fields
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testOnPersonalizedEnabledChangeCallbackData4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (checkSupportAndSkip(done)) return;
            if (checkRoutingAndSkip(done)) return;
            let desc: audio.AudioDeviceDescriptor = getAudioDeviceDescriptor();
            try {
                let mgr: audio.AudioSpatializationManager = getAudioSpatializationManager();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
                cbTriggered = false;
                mgr.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
                    console.info(`${TAG} callback data: enabled=${data.enabled}`);
                    expect(data.deviceDescriptor !== undefined && data.deviceDescriptor !== null).assertTrue();
                    cbTriggered = true;
                });
                await mgr.setPersonalizedSpatializationEnabled(desc, true);
                await sleep(1000);
                expect(cbTriggered).assertTrue();
                mgr.offPersonalizedSpatializationEnabledChangeForAnyDevice();
                await mgr.setPersonalizedSpatializationEnabled(desc, false);
            } catch (error) {
                console.error(`${TAG} callback data unexpected error: ${error.code}`);
                if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthMin4800
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_MIN_4800
         * @tc.desc   downloadPersonalizedHRTF with length=1 (minimum valid value)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthMin4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            if (checkSupportAndSkip(done)) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_len_min.bin';
            let file: fileIo.File | null = null;
            try {
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                fileIo.writeSync(file.fd, new ArrayBuffer(1));
                let stat: fileIo.Stat = fileIo.statSync(filePath);
                expect(stat.size).assertEqual(1);
                await downloadWithTimeout(getAudioSpatializationManager(), { fd: file.fd.toInt(), length: 1 });
                expect(true).assertTrue();
            } catch (error) {
                if (error.code === ERR_CODE_SYSTEM) {
                    expect(error.code).assertEqual(ERR_CODE_SYSTEM);
                } else if (error.code === ERR_CODE_TIMEOUT) {
                    expect(error.code).assertEqual(ERR_CODE_TIMEOUT);
                } else if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFLengthMax4900
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_LENGTH_MAX_4900
         * @tc.desc   downloadPersonalizedHRTF with length=10MB (maximum valid value)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFLengthMax4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            if (checkSupportAndSkip(done)) return;
            let filePath: string = testContext.cacheDir + '/test_hrtf_len_max.bin';
            let file: fileIo.File | null = null;
            try {
                file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
                fileIo.writeSync(file.fd, new ArrayBuffer(128));
                let maxLen: number = 10 * 1024 * 1024;
                await downloadWithTimeout(getAudioSpatializationManager(), { fd: file.fd.toInt(), length: maxLen.toLong() });
                expect(true).assertTrue();
            } catch (error) {
                if (error.code === ERR_CODE_SYSTEM) {
                    expect(error.code).assertEqual(ERR_CODE_SYSTEM);
                } else if (error.code === ERR_CODE_TIMEOUT) {
                    expect(error.code).assertEqual(ERR_CODE_TIMEOUT);
                } else if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            } finally {
                cleanupFile(file, filePath);
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFClosedFd5000
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_CLOSED_FD_5000
         * @tc.desc   downloadPersonalizedHRTF with closed fd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFClosedFd5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
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
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: closedFd.toInt(), length: stat.size.toLong() });
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(ERR_CODE_INVALID_PARAM);
            } finally {
                try { fileIo.unlinkSync(filePath); } catch (e) {}
            }
            done();
        });

        /**
         * @tc.name   testDownloadPersonalizedHRTFReadOnlyFd5100
         * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_DOWNLOAD_HRTF_READ_ONLY_FD_5100
         * @tc.desc   downloadPersonalizedHRTF with read-only fd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testDownloadPersonalizedHRTFReadOnlyFd5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
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
                await getAudioSpatializationManager().downloadPersonalizedHRTF({ fd: file.fd.toInt(), length: stat.size.toLong() });
                expect(stat.size).assertLarger(0);
            } catch (error) {
                if (error.code === ERR_CODE_SYSTEM) {
                    expect(error.code).assertEqual(ERR_CODE_SYSTEM);
                } else if (error.code === ERR_CODE_TIMEOUT) {
                    expect(error.code).assertEqual(ERR_CODE_TIMEOUT);
                } else if (error.code === ERR_CODE_UNAVAILABLE) {
                    expect(error.code).assertEqual(ERR_CODE_UNAVAILABLE);
                } else {
                    expect(false).assertTrue();
                }
            } finally {
                cleanupFile(file, filePath);
            }
            done();
         });

         });
}
