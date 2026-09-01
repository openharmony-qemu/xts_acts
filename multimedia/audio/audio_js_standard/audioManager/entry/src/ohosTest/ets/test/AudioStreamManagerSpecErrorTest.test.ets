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

const TAG = '[AudioStreamManagerSpecErrorTest]';

export default function AudioStreamManagerSpecErrorTest() {
  describe('audioStreamManagerSpecErrorTest', () => {
    let audioManager: audio.AudioManager | null = null;
    let streamManager: audio.AudioStreamManager | null = null;

    beforeAll(() => {
      console.info(`${TAG} beforeAll`);
      audioManager = audio.getAudioManager();
      streamManager = audioManager.getStreamManager();
    });

    beforeEach(() => {
      console.info(`${TAG} beforeEach`);
    });

    afterEach(() => {
      console.info(`${TAG} afterEach`);
    });

    afterAll(() => {
      console.info(`${TAG} afterAll`);
      streamManager = null;
      audioManager = null;
    });

    /**
     * @tc.name   testGetAudioEffectInfoArrayCallbackNull001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_GET_AUDIO_EFFECT_INFO_ARRAY_CALLBACK_0100
     * @tc.desc   getAudioEffectInfoArray 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAudioEffectInfoArrayCallbackNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.getAudioEffectInfoArray(null, (err: BusinessError, data: audio.AudioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} testGetAudioEffectInfoArrayCallbackNull001 error: ${err.code}, ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${TAG} testGetAudioEffectInfoArrayCallbackNull001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
      done();
    });

    /**
     * @tc.name   testGetAudioEffectInfoArrayCallbackUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_GET_AUDIO_EFFECT_INFO_ARRAY_CALLBACK_0200
     * @tc.desc   getAudioEffectInfoArray 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAudioEffectInfoArrayCallbackUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.getAudioEffectInfoArray(undefined, (err: BusinessError, data: audio.AudioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} testGetAudioEffectInfoArrayCallbackUndefined001 error: ${err.code}, ${err.message}`);
            expect(err.code).assertEqual(6800101);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${TAG} testGetAudioEffectInfoArrayCallbackUndefined001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
      done();
    });

    /**
     * @tc.name   testGetAudioEffectInfoArraySyncNull001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_GET_AUDIO_EFFECT_INFO_ARRAY_SYNC_0100
     * @tc.desc   getAudioEffectInfoArraySync 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAudioEffectInfoArraySyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.getAudioEffectInfoArraySync(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetAudioEffectInfoArraySyncNull001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testGetAudioEffectInfoArraySyncUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_GET_AUDIO_EFFECT_INFO_ARRAY_SYNC_0200
     * @tc.desc   getAudioEffectInfoArraySync 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAudioEffectInfoArraySyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.getAudioEffectInfoArraySync(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetAudioEffectInfoArraySyncUndefined001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsActiveCallbackNull001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACTIVE_CALLBACK_0100
     * @tc.desc   isActive 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveCallbackNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      streamManager!.isActive(null, (err: BusinessError, data: boolean) => {
        if (err) {
          console.error(`${TAG} testIsActiveCallbackNull001 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsActiveCallbackUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACTIVE_CALLBACK_0200
     * @tc.desc   isActive 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveCallbackUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
        streamManager!.isActive(undefined, (err: BusinessError, data: boolean) => {
        if (err) {
          console.error(`${TAG} testIsActiveCallbackUndefined001 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name   testIsActiveCallbackInvalidEnum001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACTIVE_CALLBACK_0300
     * @tc.desc   isActive 6800104 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveCallbackInvalidEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      streamManager!.isActive(999 as audio.AudioVolumeType, (err: BusinessError, data: boolean) => {
        if (err) {
          console.error(`${TAG} testIsActiveCallbackInvalidEnum001 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   testIsActivePromiseNull001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACTIVE_PROMISE_0100
     * @tc.desc   isActive 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActivePromiseNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await streamManager!.isActive(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsActivePromiseNull001 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsActivePromiseUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACTIVE_PROMISE_0200
     * @tc.desc   isActive 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActivePromiseUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await streamManager!.isActive(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsActivePromiseUndefined001 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name   testIsActivePromiseInvalidEnum001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACTIVE_PROMISE_0300
     * @tc.desc   isActive 6800104 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActivePromiseInvalidEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await streamManager!.isActive(999 as audio.AudioVolumeType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsActivePromiseInvalidEnum001 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name   testIsActiveSyncUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACTIVE_SYNC_0100
     * @tc.desc   isActiveSync 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsActiveSyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.isActiveSync(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsActiveSyncUndefined001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsStreamActiveNull001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_STREAM_ACTIVE_SYNC_0100
     * @tc.desc   isStreamActive 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsStreamActiveNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.isStreamActive(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsStreamActiveNull001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsStreamActiveUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_STREAM_ACTIVE_SYNC_0200
     * @tc.desc   isStreamActive 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsStreamActiveUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.isStreamActive(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsStreamActiveUndefined001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsAcousticEchoCancelerSupportedNull001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_SYNC_0100
     * @tc.desc   isAcousticEchoCancelerSupported 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsAcousticEchoCancelerSupportedNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.isAcousticEchoCancelerSupported(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsAcousticEchoCancelerSupportedNull001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsAcousticEchoCancelerSupportedUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_SYNC_0200
     * @tc.desc   isAcousticEchoCancelerSupported 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsAcousticEchoCancelerSupportedUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.isAcousticEchoCancelerSupported(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsAcousticEchoCancelerSupportedUndefined001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsRecordingAvailableSourceInvalidEnum001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_RECORDING_AVAILABLE_SYNC_0100
     * @tc.desc   isRecordingAvailable 6800101 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsRecordingAvailableSourceInvalidEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: 999 as audio.SourceType,
        capturerFlags: 0
      };
      try {
        let result = streamManager!.isRecordingAvailable(capturerInfo);
        done();
      } catch (error) {
        console.error(`${TAG} testIsRecordingAvailableSourceInvalidEnum001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsIntelligentNoiseReductionEnabledForCurrentDeviceNull001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_INTELLIGENT_NOISE_REDUCTION_ENABLED_FOR_CURRENT_DEVICE_SYNC_0100
     * @tc.desc   isIntelligentNoiseReductionEnabledForCurrentDevice 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsIntelligentNoiseReductionEnabledForCurrentDeviceNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.isIntelligentNoiseReductionEnabledForCurrentDevice(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsIntelligentNoiseReductionEnabledForCurrentDeviceNull001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name   testIsIntelligentNoiseReductionEnabledForCurrentDeviceUndefined001
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_STREAM_MANAGER_IS_INTELLIGENT_NOISE_REDUCTION_ENABLED_FOR_CURRENT_DEVICE_SYNC_0200
     * @tc.desc   isIntelligentNoiseReductionEnabledForCurrentDevice 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsIntelligentNoiseReductionEnabledForCurrentDeviceUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        streamManager!.isIntelligentNoiseReductionEnabledForCurrentDevice(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsIntelligentNoiseReductionEnabledForCurrentDeviceUndefined001 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

  });
}
