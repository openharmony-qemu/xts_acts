/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[AudioSessionManagerSpecErrorTest]';

export default function AudioSessionManagerSpecErrorTest() {
  describe('audioSessionManagerSpecErrorTest', () => {
    let audioManager: audio.AudioManager | null = null;
    let sessionManager: audio.AudioSessionManager | null = null;

    beforeAll(() => {
      console.info(`${TAG} beforeAll`);
      audioManager = audio.getAudioManager();
      sessionManager = audioManager.getSessionManager();
    });

    beforeEach(() => {
      console.info(`${TAG} beforeEach`);
    });

    afterEach(() => {
      console.info(`${TAG} afterEach`);
    });

    afterAll(() => {
      console.info(`${TAG} afterAll`);
      sessionManager = null;
      audioManager = null;
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_NULL_0100
     * @tc.name     setAudioSessionScene_Null_0100
     * @tc.desc     setAudioSessionScene scene param null, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.setAudioSessionScene(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_NULL_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_UNDEFINED_0200
     * @tc.name     setAudioSessionScene_Undefined_0200
     * @tc.desc     setAudioSessionScene scene param undefined, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_UNDEFINED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.setAudioSessionScene(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_UNDEFINED_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_CAPTURER_MUTE_HINT_NULL_0100
     * @tc.name     setCapturerMuteHint_Null_0100
     * @tc.desc     setCapturerMuteHint mute param null, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_CAPTURER_MUTE_HINT_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager!.setCapturerMuteHint(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_CAPTURER_MUTE_HINT_NULL_0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_CAPTURER_MUTE_HINT_UNDEFINED_0200
     * @tc.name     setCapturerMuteHint_Undefined_0200
     * @tc.desc     setCapturerMuteHint mute param undefined, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_CAPTURER_MUTE_HINT_UNDEFINED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager!.setCapturerMuteHint(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_CAPTURER_MUTE_HINT_UNDEFINED_0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_NULL_0100
     * @tc.name     setDefaultOutputDevice_Null_0100
     * @tc.desc     setDefaultOutputDevice deviceType param null, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager!.setDefaultOutputDevice(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_NULL_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_UNDEFINED_0200
     * @tc.name     setDefaultOutputDevice_Undefined_0200
     * @tc.desc     setDefaultOutputDevice deviceType param undefined, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_UNDEFINED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager!.setDefaultOutputDevice(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_UNDEFINED_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_NULL_0100
     * @tc.name     getAvailableDevices_Null_0100
     * @tc.desc     getAvailableDevices deviceUsage param null, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.getAvailableDevices(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_NULL_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_UNDEFINED_0200
     * @tc.name     getAvailableDevices_Undefined_0200
     * @tc.desc     getAvailableDevices deviceUsage param undefined, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_UNDEFINED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.getAvailableDevices(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_UNDEFINED_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ENUM_OUT_OF_RANGE_0300
     * @tc.name     getAvailableDevices_EnumOutOfRange_0300
     * @tc.desc     getAvailableDevices deviceUsage param 999 out of range, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ENUM_OUT_OF_RANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.getAvailableDevices(999 as audio.DeviceUsage);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ENUM_OUT_OF_RANGE_0300 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_NULL_0100
     * @tc.name     on_availableDeviceChange_Null_0100
     * @tc.desc     on availableDeviceChange deviceUsage param null, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.on('availableDeviceChange', null, (action: audio.DeviceChangeAction) => {});
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_NULL_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_UNDEFINED_0200
     * @tc.name     on_availableDeviceChange_Undefined_0200
     * @tc.desc     on availableDeviceChange deviceUsage param undefined, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_UNDEFINED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.on('availableDeviceChange', undefined, (action: audio.DeviceChangeAction) => {});
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_UNDEFINED_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ENUM_OUT_OF_RANGE_0300
     * @tc.name     on_availableDeviceChange_EnumOutOfRange_0300
     * @tc.desc     on availableDeviceChange deviceUsage param 999 out of range, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ENUM_OUT_OF_RANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.on('availableDeviceChange', 999, (action: audio.DeviceChangeAction) => {});
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ENUM_OUT_OF_RANGE_0300 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_BLUETOOTH_AND_NEARLINK_PREFERRED_RECORD_CATEGORY_NULL_0100
     * @tc.name     setBluetoothAndNearlinkPreferredRecordCategory_Null_0100
     * @tc.desc     setBluetoothAndNearlinkPreferredRecordCategory category param null, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_BLUETOOTH_AND_NEARLINK_PREFERRED_RECORD_CATEGORY_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager!.setBluetoothAndNearlinkPreferredRecordCategory(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_BLUETOOTH_AND_NEARLINK_PREFERRED_RECORD_CATEGORY_NULL_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('GetValueInt32');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_BLUETOOTH_AND_NEARLINK_PREFERRED_RECORD_CATEGORY_UNDEFINED_0200
     * @tc.name     setBluetoothAndNearlinkPreferredRecordCategory_Undefined_0200
     * @tc.desc     setBluetoothAndNearlinkPreferredRecordCategory category param undefined, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_BLUETOOTH_AND_NEARLINK_PREFERRED_RECORD_CATEGORY_UNDEFINED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager!.setBluetoothAndNearlinkPreferredRecordCategory(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_SET_BLUETOOTH_AND_NEARLINK_PREFERRED_RECORD_CATEGORY_UNDEFINED_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('GetValueInt32');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ENABLE_MUTE_SUGGESTION_WHEN_MIX_WITH_OTHERS_NULL_0100
     * @tc.name     enableMuteSuggestionWhenMixWithOthers_Null_0100
     * @tc.desc     enableMuteSuggestionWhenMixWithOthers enable param null, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ENABLE_MUTE_SUGGESTION_WHEN_MIX_WITH_OTHERS_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ENABLE_MUTE_SUGGESTION_WHEN_MIX_WITH_OTHERS_NULL_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('system');
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ENABLE_MUTE_SUGGESTION_WHEN_MIX_WITH_OTHERS_UNDEFINED_0200
     * @tc.name     enableMuteSuggestionWhenMixWithOthers_Undefined_0200
     * @tc.desc     enableMuteSuggestionWhenMixWithOthers enable param undefined, expect 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ENABLE_MUTE_SUGGESTION_WHEN_MIX_WITH_OTHERS_UNDEFINED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_SESSION_MANAGER_ENABLE_MUTE_SUGGESTION_WHEN_MIX_WITH_OTHERS_UNDEFINED_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('system');
        done();
      }
    });

  });
}
