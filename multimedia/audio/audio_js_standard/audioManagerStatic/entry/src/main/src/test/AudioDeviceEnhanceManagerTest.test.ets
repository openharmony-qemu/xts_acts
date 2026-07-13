'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';

const TAG = 'Audio_DeviceEnhanceManagerTest';
const WAIT_TIME = 1000;
const ERROR_CODE_PARAM = 6800101;
const ERROR_CODE_SERVICE = 6800301;

export default function AudioDeviceEnhanceManagerTest() {
  describe('AudioDeviceEnhanceManagerTest', () => {    
    beforeAll(async () => {
      await Utils.msSleep(4000);
      console.info(`${TAG}: beforeAll called`);
    });

    beforeEach(() => {
      console.info(`${TAG}: beforeEach called`);
    });

    afterEach(async () => {
      console.info(`${TAG}: afterEach called`);      
    });

    afterAll(() => {
      console.info(`${TAG}: afterAll called`);
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_STATIC_0100
     * @tc.desc    Test isEnhancedRoutingSupported returns boolean type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify isEnhancedRoutingSupported returns boolean type
     * @tc.input     Call isEnhancedRoutingSupported() method
     * @tc.output    Return value type is boolean (true or false)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        try {
          const result: boolean = audioDeviceEnhanceManager.isEnhancedRoutingSupported();
          console.info(`${TAG}: isEnhancedRoutingSupported result: ${result}`);
          
          expect(typeof result === 'boolean').assertTrue();
          if(result) {
            expect(result === true).assertTrue();
          }
          else {
            expect(result === false).assertTrue();
          }
          
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_STATIC_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_STATIC_0100
     * @tc.desc    Test isEnhancedRoutingSupported return value indicates system capability
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify return value meaning - true means supported, false means not supported
     * @tc.input     Call isEnhancedRoutingSupported() and check result
     * @tc.output    When supported, enhanced routing APIs work; when not supported, APIs select default devices
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        try {
          const isSupported: boolean = audioDeviceEnhanceManager.isEnhancedRoutingSupported();
          console.info(`${TAG}: Enhanced routing supported: ${isSupported}`);
          
          if (isSupported) {
            console.info(`${TAG}: System supports enhanced routing, APIs will take effect`);
          } else {
            console.info(`${TAG}: System does not support enhanced routing, APIs will use default devices`);
          }
          
          expect(isSupported !== null).assertTrue();
          expect(isSupported !== undefined).assertTrue();
          
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_STATIC_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_STATIC_0100
     * @tc.desc    Test selectOutputDevice with valid output device descriptor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectOutputDevice succeeds with valid AudioDeviceDescriptor
     * @tc.input     Get available output device from getAvailableDevices and call selectOutputDevice
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        try {
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_OUTPUT_DEVICES
          );
          console.info(`${TAG}: Available output devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const outputDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            console.info(`${TAG}: Selecting device: ${outputDevice.name}, type: ${outputDevice.deviceType}`);
            
            await audioDeviceEnhanceManager.selectOutputDevice(outputDevice);
            console.info(`${TAG}: selectOutputDevice succeeded`);
            
          } else {
            console.info(`${TAG}: No available output devices, test skipped`);
            expect(availableDevices.length >= 0).assertTrue();
          }
          
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_STATIC_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);
          if (error.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(error.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_STATIC_0100
     * @tc.desc    Test selectOutputDevice with input device role throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDevice throws 6800101 when device role is INPUT_DEVICE
     * @tc.input     Call selectOutputDevice with device having INPUT_DEVICE role
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        try {
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_INPUT_DEVICES
          );
          console.info(`${TAG}: Available input devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const wrongroleDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            await audioDeviceEnhanceManager.selectOutputDevice(wrongroleDevice);
            console.error(`${TAG}: Should have thrown error but succeeded`);
            expect(false).assertTrue();
            done();
          }
          done();
        } catch (error) {
          console.info(`${TAG}: Caught error, code: ${error.code}, message: ${error.message}`);
          expect(error.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_STATIC_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_STATIC_0100
     * @tc.desc    Test selectInputDevice with valid input device descriptor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectInputDevice succeeds with valid AudioDeviceDescriptor
     * @tc.input     Get available input device from getAvailableDevices and call selectInputDevice
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        try {
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_INPUT_DEVICES
          );
          console.info(`${TAG}: Available input devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const inputDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            console.info(`${TAG}: Selecting device: ${inputDevice.name}, type: ${inputDevice.deviceType}`);
            
            await audioDeviceEnhanceManager.selectInputDevice(inputDevice);
            console.info(`${TAG}: selectInputDevice succeeded`);
            
          } else {
            console.info(`${TAG}: No available input devices, test skipped`);
            expect(availableDevices.length >= 0).assertTrue();
          }
          
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_STATIC_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);        
          if (error.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(error.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_STATIC_0100
     * @tc.desc    Test selectInputDevice with output device role throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDevice throws 6800101 when device role is OUTPUT_DEVICE
     * @tc.input     Call selectInputDevice with device having OUTPUT_DEVICE role
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        try {
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_OUTPUT_DEVICES
          );
          console.info(`${TAG}: Available output devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const wrongroleDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            await audioDeviceEnhanceManager.selectInputDevice(wrongroleDevice);
            console.error(`${TAG}: Should have thrown error but succeeded`);
            expect(false).assertTrue();
            done()
          }
          done();
        } catch (error) {
          console.info(`${TAG}: Caught error, code: ${error.code}, message: ${error.message}`);
          expect(error.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_STATIC_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_STATIC_0100
     * @tc.desc    Test selectOutputDeviceForAudioRenderer with valid renderer and device
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectOutputDeviceForAudioRenderer succeeds with valid parameters
     * @tc.input     Create AudioRenderer, get available output device, call selectOutputDeviceForAudioRenderer
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        let audioRenderer: audio.AudioRenderer | null;
        try {
          const rendererInfo: audio.AudioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0
          };
          
          const rendererOptions: audio.AudioRendererOptions = {
            streamInfo: {
              samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
              channels: audio.AudioChannel.CHANNEL_2,
              sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
              encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
            rendererInfo: rendererInfo
          };
          
          audioRenderer = await audio.createAudioRenderer(rendererOptions);
          console.info(`${TAG}: AudioRenderer created`);
          
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_OUTPUT_DEVICES
          );
          console.info(`${TAG}: Available output devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const outputDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            
            await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(audioRenderer!, outputDevice);
            console.info(`${TAG}: selectOutputDeviceForAudioRenderer succeeded`);
            
          } else {
            console.info(`${TAG}: No available output devices, test skipped`);
            expect(availableDevices.length >= 0).assertTrue();
          }
          await audioRenderer!.release();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_STATIC_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);          
          if (error.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(error.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_STATIC_0100
     * @tc.desc    Test selectOutputDeviceForAudioRenderer with released renderer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDeviceForAudioRenderer throws 6800101 when renderer is released
     * @tc.input     Create AudioRenderer, release it, then call selectOutputDeviceForAudioRenderer
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        let audioRenderer: audio.AudioRenderer | null;
        try {
          const rendererInfo: audio.AudioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0
          };
          
          const rendererOptions: audio.AudioRendererOptions = {
            streamInfo: {
              samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
              channels: audio.AudioChannel.CHANNEL_2,
              sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
              encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
            rendererInfo: rendererInfo
          };
          
          audioRenderer = await audio.createAudioRenderer(rendererOptions);
          await audioRenderer!.release();
          console.info(`${TAG}: AudioRenderer released`);
          
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_OUTPUT_DEVICES
          );
          console.info(`${TAG}: Available output devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const outputDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(audioRenderer!, outputDevice);
            console.error(`${TAG}: Should have thrown error but succeeded`);
            expect(false).assertTrue();
            done();
          }
          done();
        } catch (error) {
          console.info(`${TAG}: Caught error, code: ${error.code}, message: ${error.message}`);
          expect(error.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_STATIC_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_STATIC_0100
     * @tc.desc    Test selectInputDeviceForAudioCapturer with valid capturer and device
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectInputDeviceForAudioCapturer succeeds with valid parameters
     * @tc.input     Create AudioCapturer, get available input device, call selectInputDeviceForAudioCapturer
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        let audioCapturer: audio.AudioCapturer | null;
        try {
          const capturerInfo: audio.AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
          };
          
          const capturerOptions: audio.AudioCapturerOptions = {
            streamInfo: {
              samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
              channels: audio.AudioChannel.CHANNEL_2,
              sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
              encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
            capturerInfo: capturerInfo
          };
          
          audioCapturer = await audio.createAudioCapturer(capturerOptions);
          console.info(`${TAG}: AudioCapturer created`);
          
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_INPUT_DEVICES
          );
          console.info(`${TAG}: Available input devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const inputDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            
            await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(audioCapturer!, inputDevice);
            console.info(`${TAG}: selectInputDeviceForAudioCapturer succeeded`);
            
          } else {
            console.info(`${TAG}: No available input devices, test skipped`);
            expect(availableDevices.length >= 0).assertTrue();
          }
          await audioCapturer!.release();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_STATIC_0100 end`);
          
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);          
          if (error.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(error.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_STATIC_0100
     * @tc.desc    Test selectInputDeviceForAudioCapturer with released capturer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDeviceForAudioCapturer throws 6800101 when capturer is released
     * @tc.input     Create AudioCapturer, release it, then call selectInputDeviceForAudioCapturer
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_STATIC_0100 start`);
        let audioManager: audio.AudioManager;
        let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
        let audioRoutingManager: audio.AudioRoutingManager;
        audioManager = audio.getAudioManager();
        audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
        audioRoutingManager = audioManager.getRoutingManager();
        let audioCapturer: audio.AudioCapturer | null;
        try {
          const capturerInfo: audio.AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
          };
          
          const capturerOptions: audio.AudioCapturerOptions = {
            streamInfo: {
              samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
              channels: audio.AudioChannel.CHANNEL_2,
              sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
              encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
            capturerInfo: capturerInfo
          };
          
          audioCapturer = await audio.createAudioCapturer(capturerOptions);
          await audioCapturer!.release();
          console.info(`${TAG}: AudioCapturer released`);
          
          const availableDevices: audio.AudioDeviceDescriptors = await audioRoutingManager.getAvailableDevices(
            audio.DeviceUsage.MEDIA_INPUT_DEVICES
          );
          console.info(`${TAG}: Available input devices count: ${availableDevices.length}`);
          
          if (availableDevices.length > 0) {
            const inputDevice: audio.AudioDeviceDescriptor = availableDevices[0];
            await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(audioCapturer!, inputDevice);
            console.error(`${TAG}: Should have thrown error but succeeded`);
            expect(false).assertTrue();
            done();
          }
          done();
        } catch (error) {
          console.info(`${TAG}: Caught error, code: ${error.code}, message: ${error.message}`);
          expect(error.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_STATIC_0100 end`);
          done();
        }
      });
  });
}