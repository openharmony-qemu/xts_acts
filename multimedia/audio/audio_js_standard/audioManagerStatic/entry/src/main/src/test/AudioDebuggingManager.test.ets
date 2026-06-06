'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import audio from '@ohos.multimedia.audio';
import Utils from './Util.test';
import { BusinessError } from '@kit.BasicServicesKit';

export default function audioDebuggingManagerTest() {
  describe('AudioDebuggingManagerTest', () => {
    
    const TAG = 'AudioDebuggingManagerTest';

    beforeAll(() => {
      console.info(`${TAG}: beforeAll: Test suite initialization`);      
    });

    beforeEach(() => {
      console.info(`${TAG}: beforeEach: Test case initialization`);
    });

    afterEach(() => {
      console.info(`${TAG}: afterEach: Test case cleanup`);
    });

    afterAll(() => {
      console.info(`${TAG}: afterAll called`);
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_STATIC_0100
     * @tc.desc    printAppInfo with normal file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_APP_INFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let audioManager: audio.AudioManager;
        audioManager = audio.getAudioManager();
        let debugManager: audio.AudioDebuggingManager;
        let audioSessionManager: audio.AudioSessionManager;
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_STATIC_0100
     * @tc.desc    printRendererInfo with valid AudioRenderer and file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let audioManager: audio.AudioManager;
        audioManager = audio.getAudioManager();
        let debugManager: audio.AudioDebuggingManager;
        debugManager = audioManager.getDebuggingManager();
        let audioRenderer: audio.AudioRenderer | null;
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
        await audioRenderer!.start();
        
        debugManager.printRendererInfo(audioRenderer!, -1);
        console.info(`${TAG}: printRendererInfo with valid renderer executed successfully`);
        await Utils.msSleep(1000);
        await audioRenderer!.release();
        done();
      } catch (error) {
        console.error(`${TAG}: printRendererInfo failed: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_STATIC_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_STATIC_0200
     * @tc.desc    printRendererInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_RENDERER_INFO_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let audioManager: audio.AudioManager;
      audioManager = audio.getAudioManager();
      let debugManager: audio.AudioDebuggingManager;
      debugManager = audioManager.getDebuggingManager();
      let audioRenderer: audio.AudioRenderer | null;
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      };
      
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        debugManager.printRendererInfo(audioRenderer!, -1);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_STATIC_0100
     * @tc.desc    printCapturerInfo with valid AudioCapturer and file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let audioManager: audio.AudioManager;
        audioManager = audio.getAudioManager();
        let debugManager: audio.AudioDebuggingManager;
        debugManager = audioManager.getDebuggingManager();
        let audioCapturer: audio.AudioCapturer | null;
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
        await audioCapturer!.start();
        
        debugManager.printCapturerInfo(audioCapturer!, -1);
        console.info(`${TAG}: printCapturerInfo with valid capturer executed successfully`);
        await Utils.msSleep(1000);
        await audioCapturer!.release();
        done();
      } catch (error) {
        console.error(`${TAG}: printCapturerInfo failed: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_STATIC_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_STATIC_0200
     * @tc.desc    printCapturerInfo with negative file descriptor outputs to hilog.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_CAPTURER_INFO_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let audioManager: audio.AudioManager;
      audioManager = audio.getAudioManager();
      let debugManager: audio.AudioDebuggingManager;
      debugManager = audioManager.getDebuggingManager();
      let audioCapturer: audio.AudioCapturer | null;
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID
        },
        capturerInfo: {
          source: audio.SourceType.SOURCE_TYPE_MIC,
          capturerFlags: 0
        }
      };
        
      try {
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
        debugManager.printCapturerInfo(audioCapturer!, -1);
        console.info(`${TAG}: printCapturerInfo with negative fd executed successfully`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG}: printCapturerInfo failed: ${error.code}, ${error.message}`);
        if (error.code !== 6800101) {
          expect(error.code).assertEqual(6800301);
        }
        else {
          expect(error.code).assertEqual(6800101);
        }
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_STATIC_0100
     * @tc.desc    printSessionInfo with valid AudioSessionManager and file descriptor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PRINT_SESSION_INFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let audioManager: audio.AudioManager;
        audioManager = audio.getAudioManager();
        let debugManager: audio.AudioDebuggingManager;
        let audioSessionManager: audio.AudioSessionManager;
        debugManager = audioManager.getDebuggingManager();
        audioSessionManager = audioManager.getSessionManager();
        audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
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
  });
}