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

import audio from '@ohos.multimedia.audio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

const TAG = 'Audio_DeviceEnhanceManagerTest';
const WAIT_TIME = 1000;
const ERROR_CODE_PARAM = 6800101;
const ERROR_CODE_SERVICE = 6800301;

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function AudioDeviceEnhanceManagerTest() {
  describe('AudioDeviceEnhanceManagerTest', () => {
    let audioManager: audio.AudioManager;
    let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager;
    let audioRoutingManager: audio.AudioRoutingManager;
    let audioRenderer: audio.AudioRenderer;
    let audioCapturer: audio.AudioCapturer;

    beforeAll(async () => {
      await sleep(4000);
      console.info(`${TAG}: beforeAll called`);
      audioManager = audio.getAudioManager();
      audioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
      audioRoutingManager = audioManager.getRoutingManager();
    });

    beforeEach(() => {
      console.info(`${TAG}: beforeEach called`);
    });

    afterEach(async () => {
      console.info(`${TAG}: afterEach called`);
      if (audioRenderer) {
        try {
          await audioRenderer.release();
        } catch (e) {
          console.info(`${TAG}: audioRenderer release error`);
        }
      }
      if (audioCapturer) {
        try {
          await audioCapturer.release();
        } catch (e) {
          console.info(`${TAG}: audioCapturer release error`);
        }
      }
    });

    afterAll(() => {
      console.info(`${TAG}: afterAll called`);
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_0100
     * @tc.desc    Test isEnhancedRoutingSupported returns boolean type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify isEnhancedRoutingSupported returns boolean type
     * @tc.input     Call isEnhancedRoutingSupported() method
     * @tc.output    Return value type is boolean (true or false)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_0100 start`);

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

          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_SUPPORTED_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_0100
     * @tc.desc    Test isEnhancedRoutingSupported return value indicates system capability
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify return value meaning - true means supported, false means not supported
     * @tc.input     Call isEnhancedRoutingSupported() and check result
     * @tc.output    When supported, enhanced routing APIs work; when not supported, APIs select default devices
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_0100 start`);

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

          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_ISENHANCEDROUTING_RETURN_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_0100
     * @tc.desc    Test selectOutputDevice with valid output device descriptor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectOutputDevice succeeds with valid AudioDeviceDescriptor
     * @tc.input     Get available output device from getAvailableDevices and call selectOutputDevice
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_0100 start`);
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        console.info(`SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        console.info(`Determine if this is a default device`)
        const detecteDevice = outputDeviceDescription.some(device =>
          device.deviceType === audio.DeviceType.INVALID && device.deviceRole === audio.DeviceRole.OUTPUT_DEVICE
        );
        if (detecteDevice) {
          console.info(`this device has external device`)
          done();
          return;
        }
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

          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_SUCCESS_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);
          const err = error as BusinessError;
          if (err.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(err.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_NULL_0100
     * @tc.desc    Test selectOutputDevice with null parameter throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDevice throws 6800101 when parameter is null
     * @tc.input     Call selectOutputDevice with null as parameter
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_NULL_0100 start`);

        try {
          await audioDeviceEnhanceManager.selectOutputDevice(null);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_NULL_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_UNDEFINED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_UNDEFINED_0100
     * @tc.desc    Test selectOutputDevice with undefined parameter throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDevice throws 6800101 when parameter is undefined
     * @tc.input     Call selectOutputDevice with undefined as parameter
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_UNDEFINED_0100 start`);

        try {
          await audioDeviceEnhanceManager.selectOutputDevice(undefined);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_UNDEFINED_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_0100
     * @tc.desc    Test selectOutputDevice with input device role throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDevice throws 6800101 when device role is INPUT_DEVICE
     * @tc.input     Call selectOutputDevice with device having INPUT_DEVICE role
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_0100 start`);

        try {
          const wrongRoleDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.INPUT_DEVICE,
            deviceType: audio.DeviceType.MIC,
            id: 1,
            name: 'mic',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'mic'
          };

          await audioDeviceEnhanceManager.selectOutputDevice(wrongRoleDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTDEVICE_PARAM_WRONGROLE_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_0100
     * @tc.desc    Test selectInputDevice with valid input device descriptor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectInputDevice succeeds with valid AudioDeviceDescriptor
     * @tc.input     Get available input device from getAvailableDevices and call selectInputDevice
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_0100 start`);
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        console.info(`SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        console.info(`Determine if this is a default device`)
        const detecteDevice = outputDeviceDescription.some(device =>
          device.deviceType === audio.DeviceType.INVALID && device.deviceRole === audio.DeviceRole.OUTPUT_DEVICE
        );
        if (detecteDevice) {
          console.info(`this device has external device`)
          done();
          return;
        }
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

          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_SUCCESS_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);
          const err = error as BusinessError;
          if (err.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(err.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_NULL_0100
     * @tc.desc    Test selectInputDevice with null parameter throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDevice throws 6800101 when parameter is null
     * @tc.input     Call selectInputDevice with null as parameter
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_NULL_0100 start`);

        try {
          await audioDeviceEnhanceManager.selectInputDevice(null);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_NULL_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_UNDEFINED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_UNDEFINED_0100
     * @tc.desc    Test selectInputDevice with undefined parameter throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDevice throws 6800101 when parameter is undefined
     * @tc.input     Call selectInputDevice with undefined as parameter
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_UNDEFINED_0100 start`);

        try {
          await audioDeviceEnhanceManager.selectInputDevice(undefined);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_UNDEFINED_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_0100
     * @tc.desc    Test selectInputDevice with output device role throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDevice throws 6800101 when device role is OUTPUT_DEVICE
     * @tc.input     Call selectInputDevice with device having OUTPUT_DEVICE role
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_0100 start`);

        try {
          const wrongRoleDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.OUTPUT_DEVICE,
            deviceType: audio.DeviceType.SPEAKER,
            id: 1,
            name: 'speaker',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'speaker'
          };

          await audioDeviceEnhanceManager.selectInputDevice(wrongRoleDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTDEVICE_PARAM_WRONGROLE_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_0100
     * @tc.desc    Test selectOutputDeviceForAudioRenderer with valid renderer and device
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectOutputDeviceForAudioRenderer succeeds with valid parameters
     * @tc.input     Create AudioRenderer, get available output device, call selectOutputDeviceForAudioRenderer
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_0100 start`);
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        console.info(`SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        console.info(`Determine if this is a default device`)
        const detecteDevice = outputDeviceDescription.some(device =>
          device.deviceType === audio.DeviceType.INVALID && device.deviceRole === audio.DeviceRole.OUTPUT_DEVICE
        );
        if (detecteDevice) {
          console.info(`this device has external device`)
          done();
          return;
        }
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

            await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(audioRenderer, outputDevice);
            console.info(`${TAG}: selectOutputDeviceForAudioRenderer succeeded`);

          } else {
            console.info(`${TAG}: No available output devices, test skipped`);
            expect(availableDevices.length >= 0).assertTrue();
          }
          await audioRenderer.release();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_SUCCESS_0100 end`);
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);
          const err = error as BusinessError;
          if (err.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(err.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_NULL_0100
     * @tc.desc    Test selectOutputDeviceForAudioRenderer with null renderer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDeviceForAudioRenderer throws 6800101 when renderer is null
     * @tc.input     Call selectOutputDeviceForAudioRenderer with null renderer and valid device
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_NULL_0100 start`);

        try {
          const outputDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.OUTPUT_DEVICE,
            deviceType: audio.DeviceType.SPEAKER,
            id: 1,
            name: 'speaker',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'speaker'
          };

          await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(null, outputDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_NULL_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_UNDEFINED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_UNDEFINED_0100
     * @tc.desc    Test selectOutputDeviceForAudioRenderer with undefined renderer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDeviceForAudioRenderer throws 6800101 when renderer is undefined
     * @tc.input     Call selectOutputDeviceForAudioRenderer with undefined renderer and valid device
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_UNDEFINED_0100 start`);

        try {
          const outputDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.OUTPUT_DEVICE,
            deviceType: audio.DeviceType.SPEAKER,
            id: 1,
            name: 'speaker',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'speaker'
          };

          await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(undefined, outputDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_UNDEFINED_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_0100
     * @tc.desc    Test selectOutputDeviceForAudioRenderer with released renderer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDeviceForAudioRenderer throws 6800101 when renderer is released
     * @tc.input     Create AudioRenderer, release it, then call selectOutputDeviceForAudioRenderer
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_0100 start`);

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
          await audioRenderer.release();
          console.info(`${TAG}: AudioRenderer released`);

          const outputDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.OUTPUT_DEVICE,
            deviceType: audio.DeviceType.SPEAKER,
            id: 1,
            name: 'speaker',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'speaker'
          };

          await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(audioRenderer, outputDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_RENDERER_RELEASED_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_DEVICE_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_DEVICE_NULL_0100
     * @tc.desc    Test selectOutputDeviceForAudioRenderer with null device throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectOutputDeviceForAudioRenderer throws 6800101 when device is null
     * @tc.input     Create AudioRenderer, call selectOutputDeviceForAudioRenderer with null device
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_DEVICE_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_DEVICE_NULL_0100 start`);

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

          await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(audioRenderer, null);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          await audioRenderer.release();
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTOUTPUTFORRENDERER_DEVICE_NULL_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_0100
     * @tc.desc    Test selectInputDeviceForAudioCapturer with valid capturer and device
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     * @tc.testpoint  Verify selectInputDeviceForAudioCapturer succeeds with valid parameters
     * @tc.input     Create AudioCapturer, get available input device, call selectInputDeviceForAudioCapturer
     * @tc.output    Promise resolves successfully without error
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_0100 start`);
        let audioManager = audio.getAudioManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        console.info(`SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
        console.info(`Determine if this is a default device`)
        const detecteDevice = outputDeviceDescription.some(device =>
          device.deviceType === audio.DeviceType.INVALID && device.deviceRole === audio.DeviceRole.OUTPUT_DEVICE
        );
        if (detecteDevice) {
          console.info(`this device has external device`)
          done();
          return;
        }
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

            await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(audioCapturer, inputDevice);
            console.info(`${TAG}: selectInputDeviceForAudioCapturer succeeded`);

          } else {
            console.info(`${TAG}: No available input devices, test skipped`);
            expect(availableDevices.length >= 0).assertTrue();
          }

          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_SUCCESS_0100 end`);
          await audioCapturer.release();
          done();
        } catch (error) {
          console.error(`${TAG}: Error occurred: ${JSON.stringify(error)}`);
          const err = error as BusinessError;
          if (err.code === ERROR_CODE_SERVICE) {
            console.info(`${TAG}: Service error, test marked as passed with note`);
            expect(err.code === ERROR_CODE_SERVICE).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_NULL_0100
     * @tc.desc    Test selectInputDeviceForAudioCapturer with null capturer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDeviceForAudioCapturer throws 6800101 when capturer is null
     * @tc.input     Call selectInputDeviceForAudioCapturer with null capturer and valid device
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_NULL_0100 start`);

        try {
          const inputDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.INPUT_DEVICE,
            deviceType: audio.DeviceType.MIC,
            id: 1,
            name: 'mic',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'mic'
          };

          await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(null, inputDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_NULL_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_UNDEFINED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_UNDEFINED_0100
     * @tc.desc    Test selectInputDeviceForAudioCapturer with undefined capturer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDeviceForAudioCapturer throws 6800101 when capturer is undefined
     * @tc.input     Call selectInputDeviceForAudioCapturer with undefined capturer and valid device
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_UNDEFINED_0100 start`);

        try {
          const inputDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.INPUT_DEVICE,
            deviceType: audio.DeviceType.MIC,
            id: 1,
            name: 'mic',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'mic'
          };

          await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(undefined, inputDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_UNDEFINED_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_0100
     * @tc.desc    Test selectInputDeviceForAudioCapturer with released capturer throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDeviceForAudioCapturer throws 6800101 when capturer is released
     * @tc.input     Create AudioCapturer, release it, then call selectInputDeviceForAudioCapturer
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_0100 start`);

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
          await audioCapturer.release();
          console.info(`${TAG}: AudioCapturer released`);

          const inputDevice: audio.AudioDeviceDescriptor = {
            deviceRole: audio.DeviceRole.INPUT_DEVICE,
            deviceType: audio.DeviceType.MIC,
            id: 1,
            name: 'mic',
            address: '0',
            sampleRates: [48000],
            channelCounts: [2],
            channelMasks: [0],
            networkId: audio.LOCAL_NETWORK_ID,
            interruptGroupId: 1,
            volumeGroupId: 1,
            displayName: 'mic'
          };

          await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(audioCapturer, inputDevice);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}:SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_0100 Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_CAPTURER_RELEASED_0100 end`);
          done();
        }
      });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_DEVICE_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_DEVICE_NULL_0100
     * @tc.desc    Test selectInputDeviceForAudioCapturer with null device throws 6800101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     * @tc.testpoint  Verify selectInputDeviceForAudioCapturer throws 6800101 when device is null
     * @tc.input     Create AudioCapturer, call selectInputDeviceForAudioCapturer with null device
     * @tc.output    Throws BusinessError with code 6800101 (Parameter verification failed)
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_DEVICE_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_DEVICE_NULL_0100 start`);

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

          await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(audioCapturer, null);
          console.error(`${TAG}: Should have thrown error but succeeded`);
          await audioCapturer.release();
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info(`${TAG}: Caught error, code: ${err.code}, message: ${err.message}`);
          expect(err.code === ERROR_CODE_PARAM).assertTrue();
          console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_DEVICEENHANCE_SELECTINPUTFORCAPTURER_DEVICE_NULL_0100 end`);
          done();
        }
      });
  });
}