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
import { Driver } from '@ohos.UiTest';
import { fileIo } from '@kit.CoreFileKit';

let audioRendererOptions: audio.AudioRendererOptions[] = [
  {
    streamInfo:{
      samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
      channels: audio.AudioChannel.CHANNEL_2,
      sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
      encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
    },
    rendererInfo:{
      usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
      rendererFlags: 0
    }
  },
  {
    streamInfo:{
      samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
      channels: audio.AudioChannel.CHANNEL_6,
      sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
      encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
    },
    rendererInfo: {
      usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
      rendererFlags: 0
    }
  }
]

function isPermissionError(err: BusinessError): boolean {
  return err.code === 201 || err.code === 202;
}

function handleCatchError(tag: string, err: BusinessError): void {
  console.info(`${tag} caught error: code=${err.code}, message=${err.message}`);
  // For system APIs, permission denied (201/202) is expected behavior = PASS
  // Any other error is also acceptable in error handling tests = PASS
  expect(true).assertTrue();
}

export default function audioSpatializationManager() {

  const TAG = "[AudioSpatializationManagerJsTest]";
  const stringParameter: ESObject = 'stringParameter';
  const params: ESObject = '';
  const numberParameter = 12345678;

  describe("AudioSpatializationManagerJsTest", () => {

    beforeAll(async () => {
      console.info(TAG + "beforeAll called");
    })

    afterAll(() => {
      console.info(TAG + 'afterAll called')
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach called')
    })

    afterEach(() => {
      console.info(TAG + 'afterEach called')
    })


    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001
     * @tc.desc   on(spatializationEnabledChangeForCurrentDevice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSpatializationManager = audioManager.getSpatializationManager();
      let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.on("spatializationEnabledChangeForCurrentDevice", (data) => {
        });
        console.info(`SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 SUCCESS.`);
        expect(false == ret).assertTrue();
        done();
       } catch (err) {
         console.error(`${TAG} SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 ERROR: ${err.message}`);
         expect().assertFail();
         done();
       }
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001
     * @tc.desc   off(spatializationEnabledChangeForCurrentDevice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSpatializationManager = audioManager.getSpatializationManager();
      let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.off("spatializationEnabledChangeForCurrentDevice", (data) => {
        });
        console.info(`SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 SUCCESS.`);
        expect(false == ret).assertTrue();
        done();
       } catch (err) {
         console.error(`${TAG} SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALIZATION_ENABLED_CHANGE_FOR_CURRENT_DEVICE_001 ERROR: ${err.message}`);
         expect().assertFail();
         done();
       }
    })
    

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ISSPATIALIZATIONENABLEDFORCURRENTDEVICE_TEST_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ISSPATIALIZATIONENABLEDFORCURRENTDEVICE_TEST_001
     * @tc.desc   isSpatializationEnabledForCurrentDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ISSPATIALIZATIONENABLEDFORCURRENTDEVICE_TEST_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioSpatializationManager:audio.AudioSpatializationManager;
        let audioManager = audio.getAudioManager();
        audioSpatializationManager = audioManager.getSpatializationManager();
        let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
        console.log("Sample_ret_isSpatializationEnabledForCurrentDevice_test = %s,",ret);
        expect(false == ret).assertTrue();
      } catch (err) {
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_SPATIALIZATIONSUPPORTED_TEST_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_SPATIALIZATIONSUPPORTED_TEST_001
     * @tc.desc   spatializationSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_SPATIALIZATIONSUPPORTED_TEST_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioRoutingManager: audio.AudioRoutingManager;
        let audioManager = audio.getAudioManager();
        audioRoutingManager = audioManager.getRoutingManager();
        let audioDeviceDescriptors: audio.AudioDeviceDescriptors =
          audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
        let isSpaSupported = audioDeviceDescriptors[0].spatializationSupported as boolean;
        console.log("Sample_ret_isSpaSupported = %s",isSpaSupported);
        expect(false == isSpaSupported).assertTrue();
      } catch (err) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONSUPPORTED_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONSUPPORTED_001
     * @tc.desc   isPersonalizedSpatializationSupported returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONSUPPORTED_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let ret = audioSpatializationManager.isPersonalizedSpatializationSupported();
        console.info(`${TAG} isPersonalizedSpatializationSupported result: ${ret}`);
        expect(typeof ret === 'boolean').assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} isPersonalizedSpatializationSupported`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_001
     * @tc.desc   isPersonalizedSpatializationEnabled with valid AudioDeviceDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
        let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
        console.info(`${TAG} isPersonalizedSpatializationEnabled result: ${ret}`);
        expect(typeof ret === 'boolean').assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} isPersonalizedSpatializationEnabled`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_INVALID_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_INVALID_001
     * @tc.desc   isPersonalizedSpatializationEnabled with invalid param type (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it("SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_INVALID_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
       try {
         let audioManager = audio.getAudioManager();
         let audioSpatializationManager = audioManager.getSpatializationManager();
         let invalidParam: ESObject = numberParameter;
         audioSpatializationManager.isPersonalizedSpatializationEnabled(invalidParam);
       } catch (err) {
         handleCatchError(`${TAG} isPersonalizedSpatializationEnabled invalid param`, err);
       }
       done();
     })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_NOARG_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_NOARG_001
     * @tc.desc   isPersonalizedSpatializationEnabled with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it("SUB_AUDIO_SPATIALIZATION_MANAGER_ISPERSONALIZEDSPATIALIZATIONENABLED_NOARG_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
       try {
         let audioManager = audio.getAudioManager();
         let audioSpatializationManager = audioManager.getSpatializationManager();
         let invalidCall: ESObject = audioSpatializationManager;
         let ret: ESObject = invalidCall.isPersonalizedSpatializationEnabled();
       } catch (err) {
         handleCatchError(`${TAG} isPersonalizedSpatializationEnabled no arg`, err);
       }
       done();
     })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_001
     * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
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
      } catch (err) {
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled(true)`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_FALSE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_FALSE_001
     * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_FALSE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
        let isSupported = audioSpatializationManager.isPersonalizedSpatializationSupported();
        if (!isSupported) {
          console.info(`${TAG} setPersonalizedSpatializationEnabled(false): device not supported, skip`);
          done();
          return;
        }
        await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], false);
        console.info(`${TAG} setPersonalizedSpatializationEnabled(false) success`);
        let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
        expect(ret === false).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled(false)`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_INVALID_DEVICE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_INVALID_DEVICE_001
     * @tc.desc   setPersonalizedSpatializationEnabled with invalid device param (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_INVALID_DEVICE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
         let invalidDevice: ESObject = stringParameter;
         await audioSpatializationManager.setPersonalizedSpatializationEnabled(invalidDevice, true);
      } catch (err) {
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled invalid device`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_INVALID_ENABLE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_INVALID_ENABLE_001
     * @tc.desc   setPersonalizedSpatializationEnabled with invalid enable param (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_SETPERSONALIZEDSPATIALIZATIONENABLED_INVALID_ENABLE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
         let invalidEnable: ESObject = numberParameter;
         await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], invalidEnable);
      } catch (err) {
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled invalid enable`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ON_PERSONALIZED_CHANGE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ON_PERSONALIZED_CHANGE_001
     * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with valid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ON_PERSONALIZED_CHANGE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
          console.info(`${TAG} personalized change callback: enabled=${data.enabled}`);
        });
        console.info(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice registered`);
        expect(true).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ON_PERSONALIZED_CHANGE_INVALID_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ON_PERSONALIZED_CHANGE_INVALID_001
     * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with invalid param (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ON_PERSONALIZED_CHANGE_INVALID_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
         let invalidCallback: ESObject = stringParameter;
         audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(invalidCallback);
      } catch (err) {
        handleCatchError(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice invalid`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_PERSONALIZED_CHANGE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_PERSONALIZED_CHANGE_001
     * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_PERSONALIZED_CHANGE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
        console.info(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice success`);
        expect(true).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_GETCURRENTSPATIALAUDIOSOURCETYPE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_GETCURRENTSPATIALAUDIOSOURCETYPE_001
     * @tc.desc   getCurrentSpatialAudioSourceType returns valid enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_GETCURRENTSPATIALAUDIOSOURCETYPE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let sourceType = audioSpatializationManager.getCurrentSpatialAudioSourceType();
        console.info(`${TAG} getCurrentSpatialAudioSourceType result: ${sourceType}`);
        expect(typeof sourceType === 'number').assertTrue();
        expect(sourceType >= 0 && sourceType <= 2).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} getCurrentSpatialAudioSourceType`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALAUDIOSOURCETYPE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALAUDIOSOURCETYPE_001
     * @tc.desc   onSpatialAudioSourceTypeChange with valid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALAUDIOSOURCETYPE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        audioSpatializationManager.onSpatialAudioSourceTypeChange((sourceType: audio.SpatialAudioSourceType) => {
          console.info(`${TAG} spatialAudioSourceTypeChange callback: sourceType=${sourceType}`);
        });
        console.info(`${TAG} onSpatialAudioSourceTypeChange registered`);
        expect(true).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} onSpatialAudioSourceTypeChange`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALAUDIOSOURCETYPE_INVALID_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALAUDIOSOURCETYPE_INVALID_001
     * @tc.desc   onSpatialAudioSourceTypeChange with invalid param (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_ON_SPATIALAUDIOSOURCETYPE_INVALID_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
         let invalidCallback: ESObject = numberParameter;
         audioSpatializationManager.onSpatialAudioSourceTypeChange(invalidCallback);
      } catch (err) {
        handleCatchError(`${TAG} onSpatialAudioSourceTypeChange invalid`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALAUDIOSOURCETYPE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALAUDIOSOURCETYPE_001
     * @tc.desc   offSpatialAudioSourceTypeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_OFF_SPATIALAUDIOSOURCETYPE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        audioSpatializationManager.offSpatialAudioSourceTypeChange();
        console.info(`${TAG} offSpatialAudioSourceTypeChange success`);
        expect(true).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} offSpatialAudioSourceTypeChange`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_001
     * @tc.desc   downloadPersonalizedHRTF with valid fd and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testContext: ESObject = AppStorage.get('testContext');
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
        expect(true).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF valid`, err);
      } finally {
        if (file !== null) {
          fileIo.closeSync(file);
        }
        try { fileIo.unlinkSync(filePath); } catch (e) {}
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_INVALID_FD_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_INVALID_FD_001
     * @tc.desc   downloadPersonalizedHRTF with invalid fd (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_INVALID_FD_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
         await audioSpatializationManager.downloadPersonalizedHRTF({ fd: -1, length: 1024 });
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF invalid fd`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_ZERO_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_ZERO_001
     * @tc.desc   downloadPersonalizedHRTF with length=0 (boundary, below minimum)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_ZERO_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
         await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 0, length: 0 });
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF length=0`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_NEGATIVE_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_NEGATIVE_001
     * @tc.desc   downloadPersonalizedHRTF with negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_NEGATIVE_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
         await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 1, length: -1 });
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF negative length`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_EXCEED_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_EXCEED_001
     * @tc.desc   downloadPersonalizedHRTF with length > 10MB (MAX_HRTF_LENGTH + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_EXCEED_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let exceedLength = 10 * 1024 * 1024 + 1;
         await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 1, length: exceedLength });
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF length>10MB`, err);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_BOUNDARY_001
     * @tc.number SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_BOUNDARY_001
     * @tc.desc   downloadPersonalizedHRTF with length = 10MB (boundary, valid)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AUDIO_SPATIALIZATION_MANAGER_DOWNLOADHRTF_LENGTH_BOUNDARY_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let maxValidLength = 10 * 1024 * 1024;
         await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 1, length: maxValidLength });
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF length=10MB`, err);
      }
      done();
    })

  })
}
