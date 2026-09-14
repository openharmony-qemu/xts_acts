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

const TAG = '[AudioRendererSpecErrorTest]';

export default function AudioRendererSpecErrorTest() {
  describe('audioRendererSpecErrorTest', () => {
    let audioManager: audio.AudioManager | null = null;
    let audioRenderer: audio.AudioRenderer | null = null;

    beforeAll(async () => {
      audioManager = audio.getAudioManager();
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      } catch (error) {
        console.error(`${TAG} beforeAll createAudioRenderer error: ${JSON.stringify(error)}`);
      }
    });

    beforeEach(() => {});

    afterEach(() => {});

    afterAll(async () => {
      await audioRenderer!.release();
      audioManager = null;
    });

    /**
     * @tc.name    testSetAudioEffectModeCallbackEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_AUDIO_EFFECT_MODE_ERROR_0100
     * @tc.desc    setAudioEffectMode(callback) mode is null
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetAudioEffectModeCallbackEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setAudioEffectMode(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetAudioEffectModeCallbackEnumNull0100 error: ${err.code}, ${err.message}`);
        } else {
          expect().assertFail();
          done();
        }
      });
      } catch (error) {
        console.error(`${TAG} testSetAudioEffectModeCallbackEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testSetAudioEffectModeCallbackEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_AUDIO_EFFECT_MODE_ERROR_0200
     * @tc.desc    setAudioEffectMode(callback) mode is undefined
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetAudioEffectModeCallbackEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setAudioEffectMode(undefined, (err: BusinessError) => {
          if (err) {
            console.error(`${TAG} testSetAudioEffectModeCallbackEnumUndefined0200 error: ${err.code}, ${err.message}`);
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${TAG} testSetAudioEffectModeCallbackEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testSetAudioEffectModeCallbackEnumEffectNone0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_AUDIO_EFFECT_MODE_PARAM_0100
     * @tc.desc    setAudioEffectMode(callback) mode is EFFECT_NONE
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetAudioEffectModeCallbackEnumEffectNone0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError) => {
        if (err) {
          console.info(`${TAG} testSetAudioEffectModeCallbackEnumEffectNone0300 callback err: ${err.code}`);
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.name    testSetAudioEffectModePromiseEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_AUDIO_EFFECT_MODE_PROMISE_ERROR_0100
     * @tc.desc    setAudioEffectMode(promise) mode is null
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetAudioEffectModePromiseEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRenderer!.setAudioEffectMode(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetAudioEffectModePromiseEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testSetAudioEffectModePromiseEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_AUDIO_EFFECT_MODE_PROMISE_ERROR_0200
     * @tc.desc    setAudioEffectMode(promise) mode is undefined
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetAudioEffectModePromiseEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRenderer!.setAudioEffectMode(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetAudioEffectModePromiseEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testSetRenderRateCallbackEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_RENDER_RATE_ERROR_0100
     * @tc.desc    setRenderRate(callback) rate is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetRenderRateCallbackEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioRenderer!.setRenderRate(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetRenderRateCallbackEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name    testSetRenderRateCallbackEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_RENDER_RATE_ERROR_0200
     * @tc.desc    setRenderRate(callback) rate is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetRenderRateCallbackEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioRenderer!.setRenderRate(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetRenderRateCallbackEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          audioRenderer!.setRenderRate(999 as audio.AudioRendererRate, (err: BusinessError) => {
          if (err) {
            console.error(`${TAG} testSetRenderRateCallbackEnumUndefined0200 error: ${err.code}, ${err.message}`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testSetInterruptModeCallbackEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_INTERRUPT_MODE_ERROR_0100
     * @tc.desc    setInterruptMode(callback) mode is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetInterruptModeCallbackEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioRenderer!.setInterruptMode(null, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetInterruptModeCallbackEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testSetInterruptModeCallbackEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_INTERRUPT_MODE_ERROR_0200
     * @tc.desc    setInterruptMode(callback) mode is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetInterruptModeCallbackEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioRenderer!.setInterruptMode(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`${TAG} testSetInterruptModeCallbackEnumUndefined0200 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testSetInterruptModePromiseEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_INTERRUPT_MODE_PROMISE_ERROR_0100
     * @tc.desc    setInterruptMode(promise) mode is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetInterruptModePromiseEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRenderer!.setInterruptMode(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetInterruptModePromiseEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testSetInterruptModePromiseEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_INTERRUPT_MODE_PROMISE_ERROR_0200
     * @tc.desc    setInterruptMode(promise) mode is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetInterruptModePromiseEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRenderer!.setInterruptMode(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetInterruptModePromiseEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testSetInterruptModeSyncEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_INTERRUPT_MODE_SYNC_ERROR_0100
     * @tc.desc    setInterruptModeSync mode is null, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetInterruptModeSyncEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setInterruptModeSync(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetInterruptModeSyncEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('number');
        done();
      }
    });

    /**
     * @tc.name    testSetInterruptModeSyncEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_INTERRUPT_MODE_SYNC_ERROR_0200
     * @tc.desc    setInterruptModeSync mode is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetInterruptModeSyncEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setInterruptModeSync(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetInterruptModeSyncEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('number');
        done();
      }
    });

    /**
     * @tc.name    testSetChannelBlendModeEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_CHANNEL_BLEND_MODE_SYNC_ERROR_0100
     * @tc.desc    setChannelBlendMode mode is null, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetChannelBlendModeEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setChannelBlendMode(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetChannelBlendModeEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('number');
        done();
      }
    });

    /**
     * @tc.name    testSetChannelBlendModeEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_CHANNEL_BLEND_MODE_SYNC_ERROR_0200
     * @tc.desc    setChannelBlendMode mode is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetChannelBlendModeEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setChannelBlendMode(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetChannelBlendModeEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('number');
        done();
      }
    });

    /**
     * @tc.name    testSetSilentModeAndMixWithOthersNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_SILENT_MODE_AND_MIX_WITH_OTHERS_SYNC_ERROR_0100
     * @tc.desc    setSilentModeAndMixWithOthers on is null, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetSilentModeAndMixWithOthersNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setSilentModeAndMixWithOthers(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetSilentModeAndMixWithOthersNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('bool');
        done();
      }
    });

    /**
     * @tc.name    testSetSilentModeAndMixWithOthersUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_SILENT_MODE_AND_MIX_WITH_OTHERS_SYNC_ERROR_0200
     * @tc.desc    setSilentModeAndMixWithOthers on is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetSilentModeAndMixWithOthersUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.setSilentModeAndMixWithOthers(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetSilentModeAndMixWithOthersUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('bool');
        done();
      }
    });

    /**
     * @tc.name    testSetDefaultOutputDeviceEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_DEFAULT_OUTPUT_DEVICE_PROMISE_ERROR_0100
     * @tc.desc    setDefaultOutputDevice deviceType is null, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetDefaultOutputDeviceEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioRenderer!.setDefaultOutputDevice(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetDefaultOutputDeviceEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('number');
        done();
      }
    });

    /**
     * @tc.name    testGetLatencyEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_GET_LATENCY_SYNC_ERROR_0100
     * @tc.desc    getLatency type is null, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetLatencyEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.getLatency(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetLatencyEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('number');
        done();
      }
    });

    /**
     * @tc.name    testGetLatencyEnumUndefined0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_GET_LATENCY_SYNC_ERROR_0200
     * @tc.desc    getLatency type is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetLatencyEnumUndefined0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioRenderer!.getLatency(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetLatencyEnumUndefined0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('number');
        done();
      }
    });

    /**
     * @tc.name    testSetIndependentAudioSessionStrategyIllegalEnum0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_RENDERER_SET_INDEPENDENT_AUDIO_SESSION_STRATEGY_SYNC_ERROR_0100
     * @tc.desc    setIndependentAudioSessionStrategy strategy.concurrencyMode is 999
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetIndependentAudioSessionStrategyIllegalEnum0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: 999
      };
      try {
        audioRenderer!.setIndependentAudioSessionStrategy(strategy, 0);
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
