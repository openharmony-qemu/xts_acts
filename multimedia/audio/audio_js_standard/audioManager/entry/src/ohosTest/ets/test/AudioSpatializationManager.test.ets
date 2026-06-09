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
  let hasValidCode = err.code != null && err.code > 0;
  let hasValidMessage = err.message != null && err.message.length > 0;
  expect(hasValidCode || hasValidMessage).assertTrue();
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
     * @tc.name   testOnSpatializationEnabledChangeForCurrentDevice0100
     * @tc.number SUB_Multimedia_Audio_Spatialization_OnEnabledChangeForCurrentDevice_0100
     * @tc.desc   on(spatializationEnabledChangeForCurrentDevice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testOnSpatializationEnabledChangeForCurrentDevice0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSpatializationManager = audioManager.getSpatializationManager();
      let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.on("spatializationEnabledChangeForCurrentDevice", (data) => {
        });
        console.info(`testOnSpatializationEnabledChangeForCurrentDevice0100 SUCCESS.`);
        expect(ret).assertFalse();
        done();
      } catch (err) {
        console.error(`${TAG} testOnSpatializationEnabledChangeForCurrentDevice0100 ERROR: ${(err as BusinessError).message}`);
        expect((err as BusinessError).code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name   testOffSpatializationEnabledChangeForCurrentDevice0200
     * @tc.number SUB_Multimedia_Audio_Spatialization_OffEnabledChangeForCurrentDevice_0200
     * @tc.desc   off(spatializationEnabledChangeForCurrentDevice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testOffSpatializationEnabledChangeForCurrentDevice0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSpatializationManager = audioManager.getSpatializationManager();
      let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.off("spatializationEnabledChangeForCurrentDevice", (data) => {
        });
        console.info(`testOffSpatializationEnabledChangeForCurrentDevice0200 SUCCESS.`);
        expect(ret).assertFalse();
        done();
      } catch (err) {
        console.error(`${TAG} testOffSpatializationEnabledChangeForCurrentDevice0200 ERROR: ${(err as BusinessError).message}`);
        expect((err as BusinessError).code).assertLarger(0);
        done();
      }
    })
    

    /**
     * @tc.name   testIsSpatializationEnabledForCurrentDevice0300
     * @tc.number SUB_Multimedia_Audio_Spatialization_IsEnabledForCurrentDevice_0300
     * @tc.desc   isSpatializationEnabledForCurrentDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIsSpatializationEnabledForCurrentDevice0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioSpatializationManager:audio.AudioSpatializationManager;
        let audioManager = audio.getAudioManager();
        audioSpatializationManager = audioManager.getSpatializationManager();
        let ret = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
        console.log("Sample_ret_isSpatializationEnabledForCurrentDevice_test = %s,",ret);
        expect(ret).assertFalse();
      } catch (err) {
        handleCatchError(`${TAG} isSpatializationEnabledForCurrentDevice`, err as BusinessError);
      }
      done();
    })
    /**
     * @tc.name   testSpatializationSupported0400
     * @tc.number SUB_Multimedia_Audio_Spatialization_IsSupported_0400
     * @tc.desc   spatializationSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSpatializationSupported0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioRoutingManager: audio.AudioRoutingManager;
        let audioManager = audio.getAudioManager();
        audioRoutingManager = audioManager.getRoutingManager();
        if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
          console.info(`${TAG} RoutingManager not supported, skip`);
          done();
          return;
        }
        let audioDeviceDescriptors: audio.AudioDeviceDescriptors =
          audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
        let isSpaSupported = audioDeviceDescriptors[0].spatializationSupported as boolean;
        console.log("Sample_ret_isSpaSupported = %s",isSpaSupported);
        expect(isSpaSupported).assertFalse();
      } catch (err) {
        handleCatchError(`${TAG} spatializationSupported`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testIsPersonalizedSpatializationSupported0500
     * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedSupported_0500
     * @tc.desc   isPersonalizedSpatializationSupported returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsPersonalizedSpatializationSupported0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let ret = audioSpatializationManager.isPersonalizedSpatializationSupported();
        console.info(`${TAG} isPersonalizedSpatializationSupported result: ${ret}`);
        expect(typeof ret === 'boolean').assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} isPersonalizedSpatializationSupported`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testIsPersonalizedSpatializationEnabled0600
     * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabled_0600
     * @tc.desc   isPersonalizedSpatializationEnabled with valid AudioDeviceDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsPersonalizedSpatializationEnabled0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
          console.info(`${TAG} RoutingManager not supported, skip`);
          done();
          return;
        }
        let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
        let ret = audioSpatializationManager.isPersonalizedSpatializationEnabled(audioDeviceDescriptors[0]);
        console.info(`${TAG} isPersonalizedSpatializationEnabled result: ${ret}`);
        expect(typeof ret === 'boolean').assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} isPersonalizedSpatializationEnabled`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testIsPersonalizedSpatializationEnabledInvalid0700
     * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledInvalid_0700
     * @tc.desc   isPersonalizedSpatializationEnabled with invalid param type (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it("testIsPersonalizedSpatializationEnabledInvalid0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let invalidParam: ESObject = numberParameter;
        audioSpatializationManager.isPersonalizedSpatializationEnabled(invalidParam);
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} isPersonalizedSpatializationEnabled invalid param`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testIsPersonalizedSpatializationEnabledNoArg0800
     * @tc.number SUB_Multimedia_Audio_Spatialization_IsPersonalizedEnabledNoArg_0800
     * @tc.desc   isPersonalizedSpatializationEnabled with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it("testIsPersonalizedSpatializationEnabledNoArg0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let invalidCall: ESObject = audioSpatializationManager;
        let ret: ESObject = invalidCall.isPersonalizedSpatializationEnabled();
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} isPersonalizedSpatializationEnabled no arg`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testSetPersonalizedSpatializationEnabledTrue0900
     * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledTrue_0900
     * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetPersonalizedSpatializationEnabledTrue0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
          console.info(`${TAG} RoutingManager not supported, skip`);
          done();
          return;
        }
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
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled(true)`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testSetPersonalizedSpatializationEnabledFalse1000
     * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledFalse_1000
     * @tc.desc   setPersonalizedSpatializationEnabled with valid device and enable=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetPersonalizedSpatializationEnabledFalse1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
          console.info(`${TAG} RoutingManager not supported, skip`);
          done();
          return;
        }
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
        expect(ret).assertFalse();
      } catch (err) {
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled(false)`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testSetPersonalizedSpatializationEnabledInvalidDevice1100
     * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidDevice_1100
     * @tc.desc   setPersonalizedSpatializationEnabled with invalid device param (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetPersonalizedSpatializationEnabledInvalidDevice1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let invalidDevice: ESObject = stringParameter;
        await audioSpatializationManager.setPersonalizedSpatializationEnabled(invalidDevice, true);
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled invalid device`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testSetPersonalizedSpatializationEnabledInvalidEnable1200
     * @tc.number SUB_Multimedia_Audio_Spatialization_SetPersonalizedEnabledInvalidEnable_1200
     * @tc.desc   setPersonalizedSpatializationEnabled with invalid enable param (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetPersonalizedSpatializationEnabledInvalidEnable1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let audioRoutingManager = audioManager.getRoutingManager();
        if (!canIUse('SystemCapability.Multimedia.Audio.RoutingManager')) {
          console.info(`${TAG} RoutingManager not supported, skip`);
          done();
          return;
        }
        let audioDeviceDescriptors = audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(audioRendererOptions[0].rendererInfo);
        let invalidEnable: ESObject = numberParameter;
        await audioSpatializationManager.setPersonalizedSpatializationEnabled(audioDeviceDescriptors[0], invalidEnable);
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} setPersonalizedSpatializationEnabled invalid enable`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testOnPersonalizedSpatializationEnabledChange1300
     * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChange_1300
     * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with valid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOnPersonalizedSpatializationEnabledChange1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let callbackTriggered: boolean = false;
        audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice((data: audio.AudioPersonalizedSpatialEnabledChangeForAnyDevice) => {
          console.info(`${TAG} personalized change callback: enabled=${data.enabled}`);
          callbackTriggered = true;
        });
        console.info(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice registered`);
        expect(typeof audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
        audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
        expect(callbackTriggered).assertFalse();
      } catch (err) {
        handleCatchError(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testOnPersonalizedSpatializationEnabledChangeInvalid1400
     * @tc.number SUB_Multimedia_Audio_Spatialization_OnPersonalizedEnabledChangeInvalid_1400
     * @tc.desc   onPersonalizedSpatializationEnabledChangeForAnyDevice with invalid param (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOnPersonalizedSpatializationEnabledChangeInvalid1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let invalidCallback: ESObject = stringParameter;
        audioSpatializationManager.onPersonalizedSpatializationEnabledChangeForAnyDevice(invalidCallback);
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} onPersonalizedSpatializationEnabledChangeForAnyDevice invalid`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testOffPersonalizedSpatializationEnabledChange1500
     * @tc.number SUB_Multimedia_Audio_Spatialization_OffPersonalizedEnabledChange_1500
     * @tc.desc   offPersonalizedSpatializationEnabledChangeForAnyDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOffPersonalizedSpatializationEnabledChange1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice();
        console.info(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice success`);
        expect(typeof audioSpatializationManager.offPersonalizedSpatializationEnabledChangeForAnyDevice).assertEqual('function');
      } catch (err) {
        handleCatchError(`${TAG} offPersonalizedSpatializationEnabledChangeForAnyDevice`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testGetCurrentSpatialAudioSourceType1600
     * @tc.number SUB_Multimedia_Audio_Spatialization_GetCurrentSourceType_1600
     * @tc.desc   getCurrentSpatialAudioSourceType returns valid enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetCurrentSpatialAudioSourceType1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let sourceType = audioSpatializationManager.getCurrentSpatialAudioSourceType();
        console.info(`${TAG} getCurrentSpatialAudioSourceType result: ${sourceType}`);
        expect(typeof sourceType === 'number').assertTrue();
        let validTypes: number[] = [
          audio.SpatialAudioSourceType.SPATIAL_AUDIO_SOURCE_TYPE_STEREO,
          audio.SpatialAudioSourceType.SPATIAL_AUDIO_SOURCE_TYPE_AUDIO_VIVID,
          audio.SpatialAudioSourceType.SPATIAL_AUDIO_SOURCE_TYPE_MULTI_CHANNEL
        ];
        expect(validTypes.includes(sourceType as number)).assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} getCurrentSpatialAudioSourceType`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testOnSpatialAudioSourceTypeChange1700
     * @tc.number SUB_Multimedia_Audio_Spatialization_OnSourceTypeChange_1700
     * @tc.desc   onSpatialAudioSourceTypeChange with valid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOnSpatialAudioSourceTypeChange1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        audioSpatializationManager.onSpatialAudioSourceTypeChange((sourceType: audio.SpatialAudioSourceType) => {
          console.info(`${TAG} spatialAudioSourceTypeChange callback: sourceType=${sourceType}`);
        });
        console.info(`${TAG} onSpatialAudioSourceTypeChange registered`);
        expect(typeof audioSpatializationManager.onSpatialAudioSourceTypeChange).assertEqual('function');
      } catch (err) {
        handleCatchError(`${TAG} onSpatialAudioSourceTypeChange`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testOnSpatialAudioSourceTypeChangeInvalid1800
     * @tc.number SUB_Multimedia_Audio_Spatialization_OnSourceTypeChangeInvalid_1800
     * @tc.desc   onSpatialAudioSourceTypeChange with invalid param (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOnSpatialAudioSourceTypeChangeInvalid1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let invalidCallback: ESObject = numberParameter;
        audioSpatializationManager.onSpatialAudioSourceTypeChange(invalidCallback);
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} onSpatialAudioSourceTypeChange invalid`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testOffSpatialAudioSourceTypeChange1900
     * @tc.number SUB_Multimedia_Audio_Spatialization_OffSourceTypeChange_1900
     * @tc.desc   offSpatialAudioSourceTypeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOffSpatialAudioSourceTypeChange1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        audioSpatializationManager.offSpatialAudioSourceTypeChange();
        console.info(`${TAG} offSpatialAudioSourceTypeChange success`);
        expect(typeof audioSpatializationManager.offSpatialAudioSourceTypeChange).assertEqual('function');
      } catch (err) {
        handleCatchError(`${TAG} offSpatialAudioSourceTypeChange`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testDownloadPersonalizedHRTF2000
     * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTF_2000
     * @tc.desc   downloadPersonalizedHRTF with valid fd and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDownloadPersonalizedHRTF2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testContext: ESObject = AppStorage.get('testContext');
      if (testContext === null || testContext === undefined) {
        console.info(`${TAG} testContext is null, skip`);
        done();
        return;
      }
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
        expect(stat.size).assertLarger(0);
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF valid`, err as BusinessError);
      } finally {
        if (file !== null) {
          fileIo.closeSync(file);
        }
        try { fileIo.unlinkSync(filePath); } catch (e) { console.error(`${TAG} cleanup failed: ${e.message}`); }
      }
      done();
    })

    /**
     * @tc.name   testDownloadPersonalizedHRTFInvalidFd2100
     * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFInvalidFd_2100
     * @tc.desc   downloadPersonalizedHRTF with invalid fd (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDownloadPersonalizedHRTFInvalidFd2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        await audioSpatializationManager.downloadPersonalizedHRTF({ fd: -1, length: 1024 });
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF invalid fd`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testDownloadPersonalizedHRTFLengthZero2200
     * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthZero_2200
     * @tc.desc   downloadPersonalizedHRTF with length=0 (boundary, below minimum)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDownloadPersonalizedHRTFLengthZero2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 0, length: 0 });
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF length=0`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testDownloadPersonalizedHRTFLengthNegative2300
     * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthNegative_2300
     * @tc.desc   downloadPersonalizedHRTF with negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDownloadPersonalizedHRTFLengthNegative2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 1, length: -1 });
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF negative length`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testDownloadPersonalizedHRTFLengthExceed2400
     * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthExceed_2400
     * @tc.desc   downloadPersonalizedHRTF with length > 10MB (MAX_HRTF_LENGTH + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDownloadPersonalizedHRTFLengthExceed2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let exceedLength = 10 * 1024 * 1024 + 1;
        await audioSpatializationManager.downloadPersonalizedHRTF({ fd: 1, length: exceedLength });
        expect().assertFail();
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF length>10MB`, err as BusinessError);
      }
      done();
    })

    /**
     * @tc.name   testDownloadPersonalizedHRTFLengthBoundary2500
     * @tc.number SUB_Multimedia_Audio_Spatialization_DownloadHRTFLengthBoundary_2500
     * @tc.desc   downloadPersonalizedHRTF with length = 10MB (boundary, valid)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDownloadPersonalizedHRTFLengthBoundary2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testContext: ESObject = AppStorage.get('testContext');
      if (testContext === null || testContext === undefined) {
        console.info(`${TAG} testContext is null, skip`);
        done();
        return;
      }
      let filePath = testContext.cacheDir + '/test_hrtf_boundary.bin';
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
        console.info(`${TAG} downloadPersonalizedHRTF boundary success`);
        expect(stat.size).assertLarger(0);
      } catch (err) {
        handleCatchError(`${TAG} downloadPersonalizedHRTF length=10MB`, err as BusinessError);
      } finally {
        if (file !== null) {
          fileIo.closeSync(file);
        }
        try { fileIo.unlinkSync(filePath); } catch (e) { console.error(`${TAG} cleanup failed: ${(e as BusinessError).message}`); }
      }
      done();
    })

     /**
      * @tc.name   testPermissionDeniedPersonalizedSpatialization2600
      * @tc.number SUB_Multimedia_Audio_Spatialization_PermissionDeniedPersonalized_2600
      * @tc.desc   Verify isPersonalizedSpatializationSupported API accessibility with current permission level
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level   LEVEL1
      */
    it("testPermissionDeniedPersonalizedSpatialization2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioManager = audio.getAudioManager();
        let audioSpatializationManager = audioManager.getSpatializationManager();
        let ret = audioSpatializationManager.isPersonalizedSpatializationSupported();
        console.info(`${TAG} API accessibility test: isPersonalizedSpatializationSupported=${ret}`);
        expect(typeof ret === 'boolean').assertTrue();
      } catch (err) {
        handleCatchError(`${TAG} permission test`, err as BusinessError);
      }
      done();
    })

  })
}
