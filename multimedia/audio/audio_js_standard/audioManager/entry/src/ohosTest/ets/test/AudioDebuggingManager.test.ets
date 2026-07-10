/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function audioDebuggingManagerTest() {
  describe('AudioDebuggingManagerTest', () => {
    let audioManager: audio.AudioManager;
    let debugManager: audio.AudioDebuggingManager;
    let audioRenderer: audio.AudioRenderer;
    let audioCapturer: audio.AudioCapturer;
    let audioSessionManager: audio.AudioSessionManager;
    const TAG = 'AudioDebuggingManagerTest';

    beforeAll(async () => {
      console.info(`${TAG}: beforeAll: Test suite initialization`);
      try {
        audioManager = audio.getAudioManager();
        console.info(`${TAG}: AudioManager obtained successfully`);
      } catch (err) {
        console.error(`${TAG}: Failed to get AudioManager`);
      }
    });

    beforeEach(() => {
      console.info(`${TAG}: beforeEach: Test case initialization`);
    });

    afterEach(async () => {
      console.info(`${TAG}: afterEach: Test case cleanup`);
      if (audioRenderer) {
        try {
          await audioRenderer.release();
        } catch (err) {
          console.error(`${TAG}: Failed to cleanup AudioRenderer`);
        }
      }
      if (audioCapturer) {
        try {
          await audioCapturer.release();
        } catch (err) {
          console.error(`${TAG}: Failed to cleanup AudioCapturer`);
        }
      }
    });

    afterAll(() => {
      console.info(`${TAG}: afterAll called`);
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0100
     * @tc.desc    printAppInfo with normal file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        await audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await audioSessionManager.activateAudioSession(strategy);
        debugManager.printAppInfo(-1);
        await audioSessionManager.deactivateAudioSession();
        done();
      } catch (error) {
        console.error(`${TAG}: printAppInfo failed: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0200
     * @tc.desc    printAppInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        await audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await audioSessionManager.activateAudioSession(strategy);
        debugManager.printAppInfo(null);
        await audioSessionManager.deactivateAudioSession();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printAppInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0300
     * @tc.desc    printAppInfo with minimum integer file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        await audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await audioSessionManager.activateAudioSession(strategy);
        debugManager.printAppInfo(undefined);
        await audioSessionManager.deactivateAudioSession();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printAppInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0100
     * @tc.desc    printRendererInfo with valid AudioRenderer and file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0
          }
        };
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        await audioRenderer.start();
        
        debugManager.printRendererInfo(audioRenderer, -1);
        console.info(`${TAG}: printRendererInfo with valid renderer executed successfully`);
        done();
      } catch (error) {
        console.error(`${TAG}: printRendererInfo failed: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0200
     * @tc.desc    printRendererInfo with null AudioRenderer throws 401 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printRendererInfo(null, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0300
     * @tc.desc    printRendererInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0
          }
        };
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        await audioRenderer.start();
        
        debugManager.printRendererInfo(audioRenderer, null);
        console.info(`${TAG}: printRendererInfo with negative fd executed successfully`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printRendererInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0400
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0400
     * @tc.desc    printRendererInfo with AudioRenderer in prepared state.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0
          }
        };
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        
        debugManager.printRendererInfo(audioRenderer, undefined);
        console.info(`${TAG}: printRendererInfo in prepared state executed successfully`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printRendererInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0500
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0500
     * @tc.desc    printRendererInfo with undefined AudioRenderer throws 6800101 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printRendererInfo(undefined, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0100
     * @tc.desc    printCapturerInfo with valid AudioCapturer and file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        let audioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
          }
        };
        
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
        await audioCapturer.start();
        
        debugManager.printCapturerInfo(audioCapturer, -1);
        console.info(`${TAG}: printCapturerInfo with valid capturer executed successfully`);
        done();
      } catch (error) {
        console.error(`${TAG}: printCapturerInfo failed: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0200
     * @tc.desc    printCapturerInfo with null AudioCapturer throws 401 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printCapturerInfo(null, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0300
     * @tc.desc    printCapturerInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        let audioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
          }
        };
        
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
        await audioCapturer.start();
        
        debugManager.printCapturerInfo(audioCapturer, null);
        console.info(`${TAG}: printCapturerInfo with negative fd executed successfully`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printCapturerInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0400
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0400
     * @tc.desc    printCapturerInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        let audioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          capturerInfo: {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
          }
        };
        
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
        await audioCapturer.start();
        
        debugManager.printCapturerInfo(audioCapturer, undefined);
        console.info(`${TAG}: printCapturerInfo with negative fd executed successfully`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printCapturerInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0500
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0500
     * @tc.desc    printCapturerInfo with undefined AudioCapturer throws 6800101 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printCapturerInfo(undefined, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0100
     * @tc.desc    printSessionInfo with valid AudioSessionManager and file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        await audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await audioSessionManager.activateAudioSession(strategy);
        debugManager.printSessionInfo(audioSessionManager, -1);
        console.info(`${TAG}: printSessionInfo with valid session manager executed successfully`);
        await audioSessionManager.deactivateAudioSession();
        done();
      } catch (error) {
        console.error(`${TAG}: printSessionInfo failed: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0200
     * @tc.desc    printSessionInfo with null AudioSessionManager throws 401 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printSessionInfo(null, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0300
     * @tc.desc    printSessionInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        await audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await audioSessionManager.activateAudioSession(strategy);
        debugManager.printSessionInfo(audioSessionManager, null);
        console.info(`${TAG}: printSessionInfo with negative fd executed successfully`);
        await audioSessionManager.deactivateAudioSession();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printSessionInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0400
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0400
     * @tc.desc    printSessionInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        await audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await audioSessionManager.activateAudioSession(strategy);
        debugManager.printSessionInfo(audioSessionManager, undefined);
        console.info(`${TAG}: printSessionInfo with negative fd executed successfully`);
        await audioSessionManager.deactivateAudioSession();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printSessionInfo failed: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0500
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0500
     * @tc.desc    printSessionInfo with undefined AudioSessionManager throws 6800101 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printSessionInfo(undefined, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0100
     * @tc.desc    loopbackInfo with valid loopback and file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          debugManager = audioManager.getDebuggingManager();
          let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          debugManager.printLoopbackInfo(audioLoopback, -1);
          console.info(`${TAG}: loopbackInfo with valid loopback executed successfully`);
          done();
        } catch (error) {
          console.error(`${TAG}: loopbackInfo failed: ${error.code}, ${error.message}`);
          expect().assertFail();
          done();
        }
      }
      done();
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0200
     * @tc.desc    loopbackInfo with null loopback throws 6800101 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printLoopbackInfo(null, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0300
     * @tc.desc    loopbackInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          debugManager = audioManager.getDebuggingManager();
          
          let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          
          debugManager.printLoopbackInfo(audioLoopback, null);
          console.info(`${TAG}: loopbackInfo with negative fd executed successfully`);
          expect().assertFail();
          done();
        } catch (error) {
          console.error(`${TAG}: loopbackInfo failed: ${error.code}, ${error.message}`);
          expect(error.code).assertEqual(6800101);
          done();
        }
      }
      done();
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0400
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0400
     * @tc.desc    loopbackInfo with loopback in prepared state.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(audio.AudioLoopbackMode.HARDWARE)) {
        try {
          debugManager = audioManager.getDebuggingManager();
          
          let audioLoopback: audio.AudioLoopback = await audio.createAudioLoopback(audio.AudioLoopbackMode.HARDWARE);
          
          debugManager.printLoopbackInfo(audioLoopback, undefined);
          console.info(`${TAG}: loopbackInfo in prepared state executed successfully`);
          expect().assertFail();
          done();
        } catch (error) {
          console.error(`${TAG}: loopbackInfo failed: ${error.code}, ${error.message}`);
          expect(error.code).assertEqual(6800101);
          done();
        }
      }
      done();
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0500
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0500
     * @tc.desc    loopbackInfo with undefined loopback throws 6800101 error.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_LOOPBACK_INFO_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        debugManager = audioManager.getDebuggingManager();
        debugManager.printLoopbackInfo(undefined, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${TAG}: Expected error caught: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });
  });
}