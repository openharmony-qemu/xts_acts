/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import common from '@ohos.app.ability.common';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import abilityContext from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement'

let Tag: string = "AFCapLog";
let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let testAbilityContext: common.UIAbilityContext;
let audioCap: audio.AudioCapturer;
let g_context: common.UIAbilityContext;

export default function audioCapturerChange() {
  describe('audioCapturerChange', () => {
    let audioStreamManager: audio.AudioStreamManager;
    let audioStreamManagerCB: audio.AudioStreamManager;
    let tag = "AFCapLog";

    const audioManager = audio.getAudioManager();
    console.info(`${tag}: Create AudioManger Object JS Framework`);

    beforeAll(async (): Promise<void> => {
      try {
        console.info(' beforeAll start');
        g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            console.info(' requestPermissionsFromUser end');
            console.info("request success permissions" + JSON.stringify(data));
            console.info("getPermissionRequestResult err" + JSON.stringify(err));
          });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error(' beforeAll failed, err: ' + err);
      }
      audioStreamManager = audioManager.getStreamManager();
      audioStreamManagerCB = audioManager.getStreamManager();
      console.info('TestLog: Start Testing AudioFrameworkTest Interfaces');
    })

    beforeEach(async () => {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
    })

    afterEach(async () => {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
    })

    afterAll(() => {
      await Utils.msSleep(1000);
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0200
     * @tc.desc   AudioCapturerChange - ON_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag = false;

      let audioCap: audio.AudioCapturer;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
          console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
        })
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      }

      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray: Array<Readonly<audio.AudioCapturerChangeInfo>>) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-002] ResultFlag for element ${i} is: ${resultFlag}`);
            audioStreamManagerCB.offAudioCapturerChange();
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-002] ######### CapturerChange Off is called #########`);

            try {
              await audioCap.release().then(() => {
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
              });
              done();
            } catch (err) {
              err = err as BusinessError;
              console.info(`${Tag}: ${Tag}: Capturer release:ERROR :${err.message}`);
            }
          }
        }
      });

      try {
        await audioCap.start().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer started :Success `);
        });
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0700
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let nowVolume = maxVol + 1
        console.log(`nowVolume type: ${typeof (nowVolume)},${nowVolume}`);
        try {
          let data = await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, nowVolume, audio.DeviceType.SPEAKER);
          console.info(`getSystemVolumeInDb :SUCCESS ${data}, testcase FAIL!`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          if (error) {
            console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(Number(error.code)).assertEqual(TestConst.INVALID_INPUT_PARAMETER_6800101);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        error = error as BusinessError;
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0600
     * @tc.desc   AudioCapturerChange - ON_SOURCE_TYPE_VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;

      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 7 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-006] ResultFlag for element ${i} is: ${resultFlag}`);
          }
        }
      });
      await Utils.msSleep(100);

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });
      await Utils.msSleep(100);

      audioStreamManagerCB.offAudioCapturerChange();
      await Utils.msSleep(100);
      console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-006] ######### CapturerChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0700
     * @tc.desc   AudioCapturerChange - STREAMID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].streamId != undefined && devDescriptor != null) {
            audioStreamManager.offAudioCapturerChange();
            expect(true).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0400
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let DeviceTypeKeys: string[] = [
          "INVALID",
          "EARPIECE",
          "SPEAKER",
          "WIRED_HEADSET",
          "WIRED_HEADPHONES",
          "BLUETOOTH_SCO",
          "BLUETOOTH_A2DP",
          "MIC",
          "USB_HEADSET",
          "DISPLAY_PORT",
          "REMOTE_CAST",
          "USB_DEVICE",
          "REMOTE_DAUDIO",
          "DEFAULT",
        ]
        let enumArray: audio.DeviceType[] = [
          audio.DeviceType.INVALID,
          audio.DeviceType.EARPIECE,
          audio.DeviceType.SPEAKER,
          audio.DeviceType.WIRED_HEADSET,
          audio.DeviceType.WIRED_HEADPHONES,
          audio.DeviceType.BLUETOOTH_SCO,
          audio.DeviceType.BLUETOOTH_A2DP,
          audio.DeviceType.MIC,
          audio.DeviceType.USB_HEADSET,
          audio.DeviceType.DISPLAY_PORT,
          audio.DeviceType.REMOTE_CAST,
          audio.DeviceType.USB_DEVICE,
          audio.DeviceType.REMOTE_DAUDIO,
          audio.DeviceType.DEFAULT,
        ];
        for (let i = 0; i < enumArray.length; i++) {
          try {
            let data = await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 1, enumArray[i]);
            let index = DeviceTypeKeys[i];
            console.info(`${index} getSystemVolumeInDb :SUCCESS ${data}`);
          } catch (error) {
            error = error as BusinessError;
            let index = DeviceTypeKeys[i];
            if (index == 'DEFAULT' || index == 'MAX' || index == 'INVALID' || index == 'NONE' || index == 'WAKEUP' ||
              index == 'DISPLAY_PORT' || index == 'REMOTE_CAST' || index == 'HDMI' || index == 'REMOTE_DAUDIO') {
              console.log(`${index} getSystemVolumeInDb :${error.code} ${error.message}`);
            } else {
              console.log(`${TagFrmwk}:${index} getSystemVolumeInDb : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          }
        }
        done();
      } catch (error) {
        error = error as BusinessError;
        console.info(`GETSYSTEMVOLUMEINDB: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0900
     * @tc.desc   AudioCapturerChange - DeviceDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
            let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
              audioStreamManager.offAudioCapturerChange();
              expect(true).assertTrue();
              done();
            }
          }
        }
      });
      try {
        await audioCap.start();
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0300
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        let volLevel = 0;
        for (volLevel = minVol; volLevel <= maxVol; volLevel++) {
          try {
            let data = await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, volLevel, audio.DeviceType.SPEAKER);
            console.info(` ${volLevel} getSystemVolumeInDb :SUCCESS ${data}`);
          } catch (error) {
            error = error as BusinessError;
            console.log(`${TagFrmwk}: ${volLevel} getSystemVolumeInDb : error ${error}`);
            expect(false).assertTrue();
            done();
          }
        }
        done();
      } catch (error) {
        error = error as BusinessError;
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0200
     * @tc.desc   AudioCapturerChange - OFF_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.start();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.offAudioCapturerChange();
          expect(true).assertTrue();
          done();
        }
      });
      await Utils.msSleep(100);
      try {
        await audioCap.release();
        console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :` + JSON.stringify(err));
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0300
     * @tc.desc   AudioCapturerChange - OFF_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.start();
        await audioCap.stop();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.offAudioCapturerChange();
          expect(true).assertTrue();
          done();
        }
      });
      await Utils.msSleep(100);

      try {
        await audioCap.release();
        console.info(`${Tag}: ${Tag}: Capturer released : SUCCESS`);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: Capturer release:ERROR :${err.message}`);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0200
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < TestConst.AudioVolumeType.length; index++) {
          try {
            let data = await audioVolumeGroupManager.getSystemVolumeInDb(TestConst.AudioVolumeType[index], 3, audio.DeviceType.SPEAKER);
            console.info(`${TestConst.AudioVolumeType[index]} getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          } catch (error) {
            error = error as BusinessError;
            console.log(`${TagFrmwk}: ${TestConst.AudioVolumeType[index]} getSystemVolumeInDb : error ${error}`);
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        error = error as BusinessError;
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0500
     * @tc.desc   AudioCapturerChange - DeviceDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
            let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
              audioStreamManager.offAudioCapturerChange();
              expect(true).assertTrue();
              done();
            }
          }
        }
      });
      try {
        await audioCap.start();
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })
	
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0100
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER);
          console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          console.log(`${TagFrmwk}: getSystemVolumeInDb : error ${error}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0100
     * @tc.desc   AudioCapturerChange - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManagerCB.offAudioCapturerChange();
              console.info(`${Tag}: audioCapturerChange off Success `);
              try {
                await audioCap.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              } catch (err) {
                err = err as BusinessError;
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.log('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })
	
	
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_STATIC_0100
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER)
        console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0300
     * @tc.desc   AudioCapturerChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCap.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioCap.stop();
        console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_3_PROMISE] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManager.offAudioCapturerChange();
              try {
                await audioCap.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              } catch (err) {
                err = err as BusinessError;
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.log('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0200
     * @tc.desc   DeviceChangeType - DISCONNECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DeviceChangeType.DISCONNECT == 1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0300
     * @tc.desc   AudioCapturerChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCap.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioCap.stop();
        console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
      } catch (err) {
        err = err as BusinessError;
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.getCurrentAudioCapturerInfoArray((err: BusinessError<void> | null, AudioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray | undefined) => {
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_3_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag}: ${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManager.offAudioCapturerChange();
                try {
                  await audioCap.release();
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  done();
                } catch (err) {
                  err = err as BusinessError;
                  console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                }
              }
            }
          }
        }
      });
    })
  })
}
