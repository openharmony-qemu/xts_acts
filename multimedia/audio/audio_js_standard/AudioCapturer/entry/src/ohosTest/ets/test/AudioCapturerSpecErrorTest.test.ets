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

const TAG = '[AudioCapturerSpecErrorTest]';

export default function AudioCapturerSpecErrorTest() {
  describe('audioCapturerSpecErrorTest', () => {
    let audioCapturer: audio.AudioCapturer | null = null;

    beforeAll(async () => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };
      try {
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
      } catch (error) {
        console.error(`${TAG} beforeAll error: ${JSON.stringify(error)}`);
      }
    });

    beforeEach(() => {});

    afterEach(() => {});

    afterAll(async () => {
      await audioCapturer!.release();
    });

    /**
     * @tc.name    testReadBlockingTrue0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_CAPTURER_READ_PROMISE_PARAM_0100
     * @tc.desc    read isBlockingRead is true
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testReadBlockingTrue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result = await audioCapturer!.read(1024, true);
        expect(result).not().assertNull();
        done();
      } catch (error) {
        console.info(`${TAG} testReadBlockingTrue0100: code=${error.code}`);
        done();
      }
    });

    /**
     * @tc.name    testReadBlockingNull0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_CAPTURER_READ_PROMISE_ERROR_0100
     * @tc.desc    read isBlockingRead is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testReadBlockingNull0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioCapturer!.read(1024, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testReadBlockingNull0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testReadBlockingUndefined0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_CAPTURER_READ_PROMISE_ERROR_0200
     * @tc.desc    read isBlockingRead is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testReadBlockingUndefined0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioCapturer!.read(1024, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testReadBlockingUndefined0300 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testSetMuteHintNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_CAPTURER_SET_MUTE_HINT_PROMISE_ERROR_0100
     * @tc.desc    setMuteHint mute is null, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetMuteHintNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioCapturer!.setMuteHint(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetMuteHintNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name    testSetMuteHintUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_CAPTURER_SET_MUTE_HINT_PROMISE_ERROR_0200
     * @tc.desc    setMuteHint mute is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetMuteHintUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioCapturer!.setMuteHint(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetMuteHintUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name    testSetIndependentAudioSessionStrategyIllegalEnum0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_CAPTURER_SET_INDEPENDENT_AUDIO_SESSION_STRATEGY_SYNC_ERROR_0100
     * @tc.desc    setIndependentAudioSessionStrategy strategy.concurrencyMode is 999
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetIndependentAudioSessionStrategyIllegalEnum0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: 999 as audio.AudioConcurrencyMode
      };
      try {
        audioCapturer!.setIndependentAudioSessionStrategy(strategy, 0);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetIndependentAudioSessionStrategyIllegalEnum0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('param1 verification failed');
        done();
      }
    });

  });
}
