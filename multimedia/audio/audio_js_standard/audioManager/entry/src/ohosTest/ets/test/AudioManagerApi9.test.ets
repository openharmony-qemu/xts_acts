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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import call from '@ohos.telephony.call';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { Permissions } from '@ohos.abilityAccessCtrl';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { BY, UiDriver } from '@ohos.UiTest';
import { deviceInfo } from "@kit.BasicServicesKit";

let deviceTypeInfo: string = deviceInfo.deviceType
let TagFrmwk = "audioManagerApi9Test";
console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let audioManager: audio.AudioManager;
let streamManager: audio.AudioStreamManager;
let audioMedia = 3;
let minVol = 0;
let maxVol = 15;
let maxVolPc = 20;
let maxVolDP = 100;
let volGroupId = null;
let volConnectType = null;
let onMicStateChangeFlag1: boolean | null = null;
let onMicStateChangeFlag2: boolean | null = null;
let onMicStateChangeFlag3: boolean | null = null;
let onMicStateChangeFlag4: boolean | null = null;
let onMicStateChangeFlag5: boolean | null = null;
let strParams: ESObject = "123";
let numParams: ESObject = 123;

let voice = call.hasVoiceCapability()

function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    let audioVolumeManager = audioManager.getVolumeManager();
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

function getStreamManager() {
  streamManager = audioManager.getStreamManager();
  if (streamManager != null) {
    console.info(`${TagFrmwk}: getStreamManager : PASS`);
  } else {
    console.info(`${TagFrmwk}: getStreamManager : FAIL`);
  }
}

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function audioManagerApi9() {
  describe('audioManagerApi9', () => {
    beforeAll(async () => {
      await getAudioManager();
      getStreamManager();
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      await sleep(100);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ERRORS_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ERRORS_0100
     * @tc.desc   AUDIO_ERRORS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ERRORS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.AudioErrors.ERROR_INVALID_PARAM).assertEqual(6800101);
      expect(audio.AudioErrors.ERROR_NO_MEMORY).assertEqual(6800102);
      expect(audio.AudioErrors.ERROR_ILLEGAL_STATE).assertEqual(6800103);
      expect(audio.AudioErrors.ERROR_UNSUPPORTED).assertEqual(6800104);
      expect(audio.AudioErrors.ERROR_TIMEOUT).assertEqual(6800105);
      expect(audio.AudioErrors.ERROR_STREAM_LIMIT).assertEqual(6800201);
      expect(audio.AudioErrors.ERROR_SYSTEM).assertEqual(6800301);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_0100
     * @tc.number SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_0100
     * @tc.desc   DEFAULT_VOLUME_GROUP_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_DEFAULT_VOLUME_GROUP_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.DEFAULT_VOLUME_GROUP_ID).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_0100
     * @tc.number SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_0100
     * @tc.desc   DEFAULT_INTERRUPT_GROUP_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_DEFAULT_INTERRUPT_GROUP_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.DEFAULT_INTERRUPT_GROUP_ID).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_0100
     * @tc.number SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_0100
     * @tc.desc   COMUNICATIONDEVICETYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_COMUNICATIONDEVICETYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.CommunicationDeviceType.SPEAKER).assertEqual(2);
      await sleep(50);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0100
     * @tc.desc   getVolumeGroupManagerSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(audio.DEFAULT_VOLUME_GROUP_ID)
        if ((typeof groupManager) == 'object') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
          expect(true).assertTrue();
          done();
        } else {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  FAIL');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message}`);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0200
     * @tc.desc   getVolumeGroupManagerSync - Null_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(volGroupId);
        console.info(`audioManagerApi9Test: Promise: getGroupManager  :  FAIL`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0300
     * @tc.desc   getVolumeGroupManagerSync - String_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(strParams);
        console.info(`audioManagerApi9Test: Promise: getGroupManager  :  FAIL`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0400
     * @tc.desc   getVolumeGroupManagerSync - String_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getVolumeGroupManagerSync(numParams);
        console.info(`audioManagerApi9Test: Promise: getGroupManager  :  FAIL`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_0100
     * @tc.desc   getAPPVolumePercentage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_PERCENTAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let groupManager = audioVolumeManager.getAppVolumePercentage();
        if ((typeof groupManager) == 'object') {
          console.info('audioManagerApi9Test: Promise: getAppVolumePercentage  :  PASS');
          expect(true).assertTrue();
          done();
        } else {
          console.info('audioManagerApi9Test: Promise: getAppVolumePercentage  :  FAIL');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to getAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0100
     * @tc.desc   setAppVolumePercentage - String_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        await audioVolumeManager.setAppVolumePercentage(strParams);
        console.info(`audioManagerApi9Test: Promise: setppVolumePercentage  :  Success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to setAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0200
     * @tc.desc   setAppVolumePercentage - Null_Parameter - 6800301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        await audioVolumeManager.setAppVolumePercentage(-1);
        console.info(`audioManagerApi9Test: Promise: setAppVolumePercentage  :  Success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`audioManagerApi9Test: failed to setAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }

    })

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0300
 * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0300
 * @tc.desc   setAppVolumePercentage - Over_Parameter - 6800101
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
//    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SET_VOLUME_PERCENTAGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
//      let audioVolumeManager = audioManager.getVolumeManager();
//     try {
//        await audioVolumeManager.setAppVolumePercentage(101);
//        console.info(`audioManagerApi9Test: Promise: setAppVolumePercentage  :  Success`);
//        expect(false).assertTrue();
//        done();
//      } catch (error) {
//        console.error(`audioManagerApi9Test: failed to setAppVolumePercentage: Callback:  ${error.message},code:${error.code}`);
//        expect(Number(error.code)).assertEqual(6800101);
//        done();
//      }
//
//    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0100
     * @tc.desc   getVolumeGroupManager - callback - number_Parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(numParams);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume(audio.AudioVolumeType.MEDIA);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0200
     * @tc.desc   getVolumeGroupManager - callback - number_Parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(numParams);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume();
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0300
     * @tc.desc   getVolumeGroupManager - callback - undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(undefined);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume();
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0400
     * @tc.desc   getVolumeGroupManager - callback - Null_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGERERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager: ESObject = await audioVolumeManager.getVolumeGroupManager(volGroupId);
        if ((typeof groupManager) != 'undefined') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  TYPE ERROR');
          expect(false).assertTrue();
          done();
        }
        let value: ESObject = await groupManager.getVolume();
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
        expect(true).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0100
     * @tc.desc   getVolumeGroupManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID, (err, groupManager) => {
        if (err) {
          console.error(`audioManagerApi9Test: failed to getGroupManager: Callback:  ${err.message}`);
          expect(false).assertTrue();
        } else {
          if ((typeof groupManager) == 'object') {
            console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
            expect(true).assertTrue();
          } else {
            console.info('audioManagerApi9Test: Promise: getGroupManager  :  FAIL');
            expect(false).assertTrue();
          }
        }
        done();
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0200
     * @tc.desc   getVolumeGroupManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        if ((typeof groupManager) == 'object') {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  PASS');
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: Promise: getGroupManager  :  FAIL');
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager: parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0100
     * @tc.desc   group manager getvolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getVolume(audio.AudioVolumeType.MEDIA, (err: BusinessError, value: number) => {
          if (err) {
            console.error(`audioManagerApi9Test: callback : Meida: failed to get volume ${err.message}`);
            expect(false).assertTrue();
          } else if (value >= minVol && value <= maxVolPc) {
            console.info('audioManagerApi9Test: callback : Meida getVolume: PASS :' + value);
            expect(true).assertTrue();
          } else {
            console.info('audioManagerApi9Test: callback : Meida getVolume: FAIL :' + value);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0200
     * @tc.desc   group manager getvolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let value = await groupManager.getVolume(audio.AudioVolumeType.MEDIA);
        if (value >= minVol && value <= maxVolPc) {
          console.info('audioManagerApi9Test: callback : Meida getVolume: PASS :' + value);
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: callback : Meida getVolume: FAIL :' + value);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0100
     * @tc.desc   getMaxVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getMaxVolume(audio.AudioVolumeType.RINGTONE, (err, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getMaxVolume: Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            if (data == maxVol) {
              console.info('audioManagerApi9Test: callback : Ringtone getMaxVolume: PASS :' + data);
              expect(true).assertTrue();
            } else if (data == maxVolPc) {
              console.info('audioManagerApi9Test: callback : Ringtone getMaxVolume: PASS :' + data);
              expect(true).assertTrue();
            } else if (data == maxVolDP) {
              console.info('audioManagerApi9Test: callback : Ringtone getMaxVolume: PASS :' + data);
              expect(true).assertTrue();
            } else {
              console.info('audioManagerApi9Test: callback : Ringtone getMaxVolume: FAIL :' + data);
              expect(false).assertTrue();
            }
          }
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0200
     * @tc.desc   getMaxVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let maxVolume = await groupManager.getMaxVolume(audio.AudioVolumeType.RINGTONE);
        if (maxVolume == maxVol) {
          console.info('audioManagerApi9Test: promise : Ringtone getMaxVolume: PASS :' + maxVolume);
          expect(true).assertTrue();
        } else if (maxVolume == maxVolPc) {
          console.info('audioManagerApi9Test: promise : Ringtone getMaxVolume: PASS :' + maxVolume);
          expect(true).assertTrue();
        } else if (maxVolume == maxVolDP) {
          console.info('audioManagerApi9Test: promise : Ringtone getMaxVolume: PASS :' + maxVolume);
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: promise : Ringtone getMaxVolume: FAIL :' + maxVolume);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0100
     * @tc.desc   getMinVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getMinVolume(audio.AudioVolumeType.RINGTONE, (err, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getMinVolume : Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            if (data == minVol) {
              console.info('audioManagerApi9Test: callback : Ringtone getMinVolume: PASS :' + data);
              expect(true).assertTrue();
            } else {
              console.info('audioManagerApi9Test: callback : Ringtone getMinVolume: FAIL :' + data);
              expect(false).assertTrue();
            }
          }
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0200
     * @tc.desc   getMaxVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let minVolume = await groupManager.getMinVolume(audio.AudioVolumeType.RINGTONE);
        if (minVolume == minVol) {
          console.info('audioManagerApi9Test: promise : Ringtone getMinVolume: PASS :' + minVolume);
          expect(true).assertTrue();
        } else {
          console.info('audioManagerApi9Test: promise : Ringtone getMinVolume: FAIL :' + minVolume);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('audioManagerApi9Test: getVolumeGroupManager : err:' + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0100
     * @tc.desc   ismute - RINGTONE - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.isMute(audio.AudioVolumeType.RINGTONE, (err: BusinessError, data) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to isMute : Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.log(`audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: PASS:` + data);
            expect(true).assertTrue();
          }
          done();
        })
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager mute : parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0200
     * @tc.desc   ismute - RINGTONE - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        await groupManager.isMute(audio.AudioVolumeType.RINGTONE).then((data) => {
          console.log(`audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: PASS:` + data);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info(`audioManagerApi9Test: Promise:
                    Is Stream GroupManager Mute RINGTONE: FALSE: ERROR:` + err.message);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager ismute : parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_0100
     * @tc.desc   getRingerMode - RINGTONE - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGERMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let groupManager: audio.AudioVolumeGroupManager;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.getRingerMode((err: BusinessError, data: number) => {
          if (err) {
            console.error(`audioManagerApi9Test: failed to getRingerMode : Callback:  ${err.message}`);
            expect(false).assertTrue();
          } else {
            if (data == audio.AudioRingMode.RINGER_MODE_SILENT ||
              data == audio.AudioRingMode.RINGER_MODE_VIBRATE ||
              data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
              console.log(`audioManagerApi9Test: Promise:
                    getRingerMode : PASS:` + data);
              expect(true).assertTrue();
            } else {
              console.log(`audioManagerApi9Test: Promise:
                    getRingerMode : FAIL: ` + data);
              expect(false).assertTrue();
            }
          }
          done();
        })
      } catch (err) {
        console.info('audioManagerApi9Test: getGroupManager mute : parameter err:' + err.message);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_0200
     * @tc.desc   setRingerMode - Set Ring more to Normal Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETRINGERMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        let value = await groupManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_SILENT ||
          value == audio.AudioRingMode.RINGER_MODE_VIBRATE ||
          value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0100
     * @tc.desc   OnRingMode - RINGER_MODE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.on('ringerModeChange', (AudioRingMode) => {
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0200
     * @tc.desc   off_ringerModeChange - Invaild_Number_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let para: ESObject = '123';
      let flag: boolean = false;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.off(para,()=>{});
      } catch (err) {
        console.log('err :' + err.message)
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0300
     * @tc.desc   off_ringerModeChange - String_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let para: ESObject = 123;
      let flag: boolean = false;
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        groupManager.off(para);
      } catch (err) {
        console.log('err :' + err.message)
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0400
     * @tc.desc   OnRingModeChange - RINGER_MODE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL);
        groupManager.on('ringerModeChange', (ringerMode: audio.AudioRingMode) => {
          console.info(`Updated ringermode: ${ringerMode}`)
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0500
     * @tc.desc   OnRingModeChange - RINGER_MODE_SILENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT);
        groupManager.on('ringerModeChange', (ringerMode: audio.AudioRingMode) => {
          console.info(`Updated ringermode: ${ringerMode}`)
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0600
     * @tc.desc   OnRingModeChange - RINGER_MODE_VIBRATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONRINGMODECHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE);
        groupManager.on('ringerModeChange', (ringerMode: audio.AudioRingMode) => {
          console.info(`Updated ringermode: ${ringerMode}`)
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0100
     * @tc.desc   Enable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      groupManager.setMicrophoneMute(true, (err, data) => {
        if (err) {
          console.error(`audioManagerApi9Test: failed to setMicrophoneMute : Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          groupManager.isMicrophoneMute((err, data) => {
            if (err) {
              console.error(`audioManagerApi9Test: failed to isMicrophoneMute : Callback:  ${err.message}`);
              expect(false).assertTrue();
            } else {
              if (data == true) {
                console.log(`${TagFrmwk}: Callback: isMicrophoneMute: TRUE: PASS:${data}`);
                expect(true).assertTrue();
              } else {
                console.log(`${TagFrmwk}: Callback: isMicrophoneMute: TRUE: FAIL: ${data}`);
                expect(false).assertTrue();
              }
            }
            done();
          })
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0200
     * @tc.desc   Enable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        await groupManager.setMicrophoneMute(true);
        let data = await groupManager.isMicrophoneMute();
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.log('err :' + err.message);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0300
     * @tc.desc   Enable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      groupManager.setMicrophoneMute(false, (err, data) => {
        if (err) {
          console.error(`audioManagerApi9Test: failed to setMicrophoneMute : Callback:  ${err.message}`);
          expect(true).assertTrue();
          done();
        } else {
          groupManager.isMicrophoneMute((err, data) => {
            if (err) {
              console.error(`audioManagerApi9Test: failed to isMicrophoneMute : Callback:  ${err.message}`);
              expect(false).assertTrue();
            } else {
              if (data == false) {
                console.log(`${TagFrmwk}: Callback: isMicrophoneMute: TRUE: PASS:${data}`);
                expect(true).assertTrue();
              } else {
                console.log(`${TagFrmwk}: Callback: isMicrophoneMute: TRUE: FAIL: ${data}`);
                expect(false).assertTrue();
              }
            }
            done();
          })
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0400
     * @tc.desc   Enable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_SETMICROPHONEMUTE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioVolumeManager = audioManager.getVolumeManager();
        let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        await groupManager.setMicrophoneMute(false);
        let data = await groupManager.isMicrophoneMute();
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.log('err :' + err.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONMICSTATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONMICSTATECHANGE_0100
     * @tc.desc   OnMicStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONMICSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ONMICSTATECHANGE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      let audioVolumeManager = audioManager.getVolumeManager();
      let groupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      try {
        await groupManager.setMicrophoneMute(false);
        console.info('setMicrophoneMute success')
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
      onMicStateChangeFlag1 = true
      groupManager.on('micStateChange', (MicStateChangeEvent) => {
        if (onMicStateChangeFlag1 == true) {
          console.log(`${TagFrmwk}: Mic State Change Event is called`);
          if (MicStateChangeEvent.mute == true) {
            console.info(`${TagFrmwk}: MEDIA CallBack : PASS : ${MicStateChangeEvent.mute}`);
            onMicStateChangeFlag1 = false
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Audio MicStateChangeEvent is : ${MicStateChangeEvent}`);
            expect(false).assertTrue();
          }
          done();
        }
      });
      try {
        await groupManager.setMicrophoneMute(true);
        console.info('setMicrophoneMute success')
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0100
     * @tc.desc   isActive - Media - Promise - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.log(`${TagFrmwk}: Promise : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = streamManager.isActive(audioMedia);
      PROMISE.then((data) => {
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.log('err :' + JSON.stringify(err));
        expect().assertFail();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0200
     * @tc.desc   isActive - Media - Callback - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_0200', 1, (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      streamManager.isActive(audioMedia, (err, data) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : Media : isActive: failed  ${err.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0100
     * @tc.desc   isActive - Media - Sync - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0100', 1, (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      try {
        let data = streamManager.isActiveSync(audioMedia)
        if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.error(`${TagFrmwk}: Callback : Media : isActive: failed  ${error.message}`);
        expect().assertFail();
      }
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0200
     * @tc.desc   isActiveSync - Null_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0200', 1, (done: Function) => {
      try {
        let data = streamManager.isActiveSync(volConnectType);
        console.log(`${TagFrmwk}: isActiveSync data::${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TagFrmwk}: isActiveSync: failed  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0300
     * @tc.desc   isActiveSync - Invaild_Number_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0300', 1, (done: Function) => {
      try {
        let data = streamManager.isActiveSync(123);
        console.log(`${TagFrmwk}: isActiveSync data::${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TagFrmwk}: isActiveSync: failed  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0400
     * @tc.desc   isActiveSync - String_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_STREAM_MANAGER_ISACTIVE_SYNC_0400', 1, (done: Function) => {
      try {
        let data = streamManager.isActiveSync(strParams);
        console.log(`${TagFrmwk}: isActiveSync data::${data}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TagFrmwk}: isActiveSync: failed  ${error.message},code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0100
     * @tc.desc   isCommunicationDeviceActiveSync speaker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0100
                outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      try {
        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = false;
        }
        await AudioRoutingManager.setCommunicationDevice(2, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                    Promise returned to indicate that the device is set to the active status.`);
        });
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(audio.CommunicationDeviceType.SPEAKER)
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
        if (flag == true && value == true) {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
          expect(true).assertTrue();
        } else if (flag == false && value == true) {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
          expect(true).assertTrue();
        } else {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
          expect(false).assertTrue();
        }

      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0200
     * @tc.desc   isCommunicationDeviceActiveSync - Null_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(null)
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0200
                        isCommunicationDeviceActive : Null_Parameters : PASS :${value}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(`isCommunicationDeviceActive : Null_Parameters Fail,error:${err},ErrorCode:${err.code},${typeof (err.code)}`);
        expect(Number(err.code)).assertEqual(401);
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0300
     * @tc.desc   isCommunicationDeviceActiveSync - Number_Invalid_Parameters - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(123)
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0300
                        isCommunicationDeviceActive : Number_Invalid_Parameters : PASS :${value}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(`isCommunicationDeviceActive : Number_Invalid_Parameters Fail,error:${err},ErrorCode:${err.code},${typeof (err.code)}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0400
     * @tc.desc   isCommunicationDeviceActiveSync - String_Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.isCommunicationDeviceActiveSync(strParams);
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISCOMMUNICATIONDEVICE_SYNC_0400
                        isCommunicationDeviceActive : String_Parameters : PASS :${value}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(`isCommunicationDeviceActive : String_Parameters Fail,error:${err},ErrorCode:${err.code},${typeof (err.code)}`);
        expect(Number(err.code)).assertEqual(401);
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
     * @tc.desc   setCommunicationDevice speaker - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      try {
        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = false;
        }
        await AudioRoutingManager.setCommunicationDevice(2, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                    Promise returned to indicate that the device is set to the active status.`);
        });
        await AudioRoutingManager.isCommunicationDeviceActive(audio.CommunicationDeviceType.SPEAKER).then((value) => {
          if (flag == true && value == true) {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else if (flag == false && value == true) {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0100
                        isCommunicationDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
            expect(false).assertTrue();
          }
        }).catch((err: BusinessError) => {
          console.log('err :' + JSON.stringify(err.message));
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200
     * @tc.desc   setCommunicationDevice speaker - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200
            outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
        flag = true;
      }
      if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
        outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
        flag = false;
      }
      AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Device Test: Callback : setCommunicationDevice : SPEAKER: Deactivate: Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Device Test: Callback : setCommunicationDevice : SPEAKER: Active`);
          AudioRoutingManager.isCommunicationDeviceActive(2, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == true && flag == true) {
              console.info(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
              expect(true).assertTrue();
            } else if (value == true && flag == false) {
              console.info(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
              expect(true).assertTrue();
            } else {
              console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0200 ${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : FAIL :${value} flag is ${flag}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0300
     * @tc.desc   isCommunicationDeviceActive SPEAKER - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo:audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo :audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions :audio.AudioRendererOptions= {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRender:audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      console.info(`${TagFrmwk},createAudioRenderer SUCCESS`);
      await audioRender.start().then(() =>{
        console.info(`startAudioRenderer SUCCESS`);
      }).catch(()=>{
        console.info(`startAudioRenderer ERROR`);
      });
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0300
            outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device =>
      device.deviceType === audio.DeviceType.DISPLAY_PORT
      );
      if (detecteDevice) {
        console.info(`${TagFrmwk}: this device has external device`)
        expect(true).assertTrue();
        done();
        return;
      }
      try {
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        } else {
          console.info(`this device has one outputdevice,not suit this case`);
          expect(true).assertTrue();
          done();
          return
        }
        await AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0300
                    Promise returned to indicate that the device is set to the active status.`);
        });
        await AudioRoutingManager.isCommunicationDeviceActive(audio.CommunicationDeviceType.SPEAKER).then((value) => {
          if (flag == true && value == false) {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0300
                        isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
            done();
          } else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0300
                        isCommunicationDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
            expect(false).assertTrue();
          }
        }).catch((err: BusinessError) => {
          console.log('err :' + JSON.stringify(err.message));
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }

      await audioRender.stop().then(() => {
        console.info(`Renderer stopped : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`Renderer stop:ERROR : ${err.message}`);
      });

      await audioRender.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0400
     * @tc.desc   isCommunicationDeviceActive SPEAKER - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo:audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo :audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions :audio.AudioRendererOptions= {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRender:audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      console.info(`${TagFrmwk},createAudioRenderer SUCCESS`);
      await audioRender.start().then(() =>{
        console.info(`startAudioRenderer SUCCESS`);
      }).catch(()=>{
        console.info(`startAudioRenderer ERROR`);
      });
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0400
            outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device =>
      device.deviceType === audio.DeviceType.DISPLAY_PORT
      );
      if (detecteDevice) {
        console.info(`${TagFrmwk}: this device has external device`)
        expect(true).assertTrue();
        done();
        return;
      }
      try {
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        } else {
          console.info(`this device has one outputdevice,not suit this case`);
          expect(true).assertTrue();
          done();
          return
        }
        await AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0400
                    Promise returned to indicate that the device is set to the active status.`);
        });
        AudioRoutingManager.isCommunicationDeviceActive(2, (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == false && flag == true) {
            console.info(`${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0400 ${TagFrmwk}: Device Test: Callback : isCommunicationDeviceActive : SPEAKER: Deactivate : FAIL :${value} flag is ${flag}`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }

      await audioRender.stop().then(() => {
        console.info(`Renderer stopped : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`Renderer stop:ERROR : ${err.message}`);
      });

      await audioRender.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0500
     * @tc.desc   isCommunicationDeviceActiveSync - SPEAKER - prmiose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo:audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo :audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions :audio.AudioRendererOptions= {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRender:audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      console.info(`${TagFrmwk},createAudioRenderer SUCCESS`);
      await audioRender.start().then(() =>{
        console.info(`startAudioRenderer SUCCESS`);
      }).catch(()=>{
        console.info(`startAudioRenderer ERROR`);
      });
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0500
            outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device =>
      device.deviceType === audio.DeviceType.DISPLAY_PORT
      );
      if (detecteDevice) {
        console.info(`${TagFrmwk}: this device has external device`)
        expect(true).assertTrue();
        done();
        return;
      }
      try {
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        } else {
          console.info(`this device has one outputdevice,not suit this case`);
          expect(true).assertTrue();
          done();
          return
        }
        await AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0500
                    Promise returned to indicate that the device is set to the active status.`);
        });
        try {
          let value: boolean = AudioRoutingManager.isCommunicationDeviceActiveSync(audio.CommunicationDeviceType.SPEAKER);
          if (value == false) {
            console.info(`Indicate that the active status of the device is obtained Successfully :${value}.`);
            expect(true).assertTrue();
            done();
          } else {
            console.info(`Indicate that the active status of the device is obtained FAILED :${value}.`);
            expect(false).assertTrue();
            done();
          }
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to obtain the active status of the device ${error}.`);
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }

      await audioRender.stop().then(() => {
        console.info(`Renderer stopped : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`Renderer stop:ERROR : ${err.message}`);
      });

      await audioRender.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0600
     * @tc.desc   isCommunicationDeviceActiveSync speaker - prmiose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo:audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo :audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions :audio.AudioRendererOptions= {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRender:audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      console.info(`${TagFrmwk},createAudioRenderer SUCCESS`);
      await audioRender.start().then(() =>{
        console.info(`startAudioRenderer SUCCESS`);
      }).catch(()=>{
        console.info(`startAudioRenderer ERROR`);
      });
      let flag: boolean | null = null;
      let AudioRoutingManager = audioManager.getRoutingManager();
      let outputDeviceDescription = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0600
            outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device =>
      device.deviceType === audio.DeviceType.DISPLAY_PORT
      );
      if (detecteDevice) {
        console.info(`${TagFrmwk}: this device has external device`)
        expect(true).assertTrue();
        done();
        return;
      }
      try {
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        } else {
          console.info(`this device has one outputdevice,not suit this case`);
          expect(true).assertTrue();
          done();
          return
        }
        await AudioRoutingManager.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, true).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SETCOMMUNICATIONDEVICE_0600
                    Promise returned to indicate that the device is set to the active status.`);
        });
        try {
          let value: boolean = AudioRoutingManager.isCommunicationDeviceActiveSync(audio.CommunicationDeviceType.SPEAKER);
          if (value == true) {
            console.info(`Indicate that the active status of the device is obtained Successfully :${value}.`);
            expect(true).assertTrue();
            done();
          } else {
            console.info(`Indicate that the active status of the device is obtained FAILED :${value}.`);
            expect(false).assertTrue();
            done();
          }
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to obtain the active status of the device ${error}.`);
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }

      await audioRender.stop().then(() => {
        console.info(`Renderer stopped : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`Renderer stop:ERROR : ${err.message}`);
      });

      await audioRender.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err:BusinessError) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0100
     * @tc.desc   micStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      let count = 0;
      console.info('getVolumeGroupManager Callback START.');
      onMicStateChangeFlag2 = true;
      VolumeGroupManager.on('micStateChange', async (micStateChange) => {
        if (onMicStateChangeFlag2 == true) {
          console.info('micStateChange is ' + micStateChange.mute);
          onMicStateChangeFlag2 = false;
          count++;
        }
      })
      try {
        let data = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS:' + data);
        await audioManager.setMicrophoneMute(data);
        console.info('Promise setMicrophoneMute PASS.');
        let data1 = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS.' + data1);
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0200
     * @tc.desc   micStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0200 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      let audioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      console.info('getVolumeGroupManager Callback START.');
      let count = 0;
      onMicStateChangeFlag3 = true;
      VolumeGroupManager.on('micStateChange', async (micStateChange) => {
        if (onMicStateChangeFlag3 == true) {
          console.info("Updated micState:" + JSON.stringify(micStateChange));
          onMicStateChangeFlag3 = false
          count++;
        }
      })
      try {
        let data = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS:' + data);
        let micStatus = !data;
        await audioManager.setMicrophoneMute(micStatus);
        console.info('Promise setMicrophoneMute PASS:' + micStatus);
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(1);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0300
     * @tc.desc   micStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0300 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      let audioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      console.info('getVolumeGroupManager Callback START.');
      let count = 0;
      onMicStateChangeFlag4 = true;
      VolumeGroupManager.on('micStateChange', async (micStateChange) => {
        if (onMicStateChangeFlag4 == true) {
          console.info("Updated micState:" + JSON.stringify(micStateChange));
          count++;
        }
      })
      try {
        let data = await audioManager.isMicrophoneMute();
        console.info('Promise isMicrophoneMute PASS:' + data);
        let micStatus = !data;
        await audioManager.setMicrophoneMute(micStatus);
        console.info('Promise setMicrophoneMute PASS:' + micStatus);
        await audioManager.setMicrophoneMute(!micStatus);
        console.info('Promise setMicrophoneMute PASS:' + (!micStatus));
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(2);
      onMicStateChangeFlag4 = false
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400
     * @tc.desc   micStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      let audioVolumeManager = audioManager.getVolumeManager();
      let VolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      let count = 0;
      try {
        console.info("enter SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0400");
        onMicStateChangeFlag5 = true
        VolumeGroupManager.on('micStateChange', async (micStateChange1) => {
          if (onMicStateChangeFlag5 = true) {
            console.info("Updated micState--001:" + JSON.stringify(micStateChange1));
            VolumeGroupManager.on('micStateChange', async (micStateChange) => {
              console.info("Updated micState--002:" + JSON.stringify(micStateChange));
              onMicStateChangeFlag5 = false
              count++
            })
            let data = await audioManager.isMicrophoneMute();
            console.info('Second Promise isMicrophoneMute PASS:' + data);
            await audioManager.setMicrophoneMute(!data);
            console.info('Second:Promise setMicrophoneMute PASS:' + (!data));
          }
        })
        let data = await audioManager.isMicrophoneMute();
        console.info('First Promise isMicrophoneMute PASS:' + data);
        await audioManager.setMicrophoneMute(!data);
        console.info('First:Promise setMicrophoneMute PASS:' + (!data));
      } catch (err) {
        console.log('ERROR:' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      await sleep(2000);
      expect(count).assertEqual(1);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0500
     * @tc.desc   micStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
      let audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      let flag: boolean = false;
      try {
        // 取消该事件的所有监听。
        audioVolumeGroupManager.off('micStateChange');

        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let micStateChangeCallback = (micStateChange: audio.MicStateChangeEvent) => {
          console.info(`Current microphone status is: ${micStateChange.mute} `);
        };

        audioVolumeGroupManager.on('micStateChange', micStateChangeCallback);

        audioVolumeGroupManager.off('micStateChange', micStateChangeCallback);
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0500 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0600
     * @tc.desc   micStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
      let audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
      let flag: boolean = false;
      try {
        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let micStateChangeCallback = (micStateChange: audio.MicStateChangeEvent) => {
          console.info(`Current microphone status is: ${micStateChange.mute} `);
        };

        audioVolumeGroupManager.on('micStateChange', micStateChangeCallback);

        audioVolumeGroupManager.off('micStateChange');
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICSTATECHANGE_0600 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2900
     * @tc.desc   mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, 1);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == 1) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MinData = await audioManager.getMinVolume(audio.AudioVolumeType.ALARM);
              console.info('MinData is ' + MinData)
              expect(MinData).assertEqual(1);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2901
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2901
     * @tc.desc   mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, maxVolumeSetting);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolDP) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolDP);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2902
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2902
     * @tc.desc   mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, maxVolumeSetting+1);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolDP) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolDP);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2903
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2903
     * @tc.desc   mute - ALARM - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, -1);
        await audioManager.mute(audio.AudioVolumeType.ALARM, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ALARM);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else if (value == maxVolDP) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ALARM);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolDP);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3000
     * @tc.desc   mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, 1);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == 1) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MinData = await audioManager.getMinVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MinData is ' + MinData)
              expect(MinData).assertEqual(1);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3001
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3001
     * @tc.desc   mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, maxVolumeSetting);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolDP) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolDP);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3002
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3002
     * @tc.desc   mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let maxVolumeSetting = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, maxVolumeSetting+1);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolDP) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolDP);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3003
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3003
     * @tc.desc   mute - ACCESSIBILITY - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, -1);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true);
        let data = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: PASS:${data}`);
          let value = await audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info("value is " + value)
          if (value == maxVol) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVol);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolPc) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolPc);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else if (value == maxVolDP) {
            let data1 = await audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
            console.info("data1 is " + data1);
            if (data1 == false) {
              let MaxData = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
              console.info('MaxData is ' + MaxData)
              expect(MaxData).assertEqual(maxVolDP);
            } else {
              expect(false).assertTrue();
              console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: isMute: Fail:${data}`);
            }
          } else {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: getVolume: Fail:${value}`);
            expect(false).assertTrue();
          }
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: SetVolume: Fail:${data}`);
          expect(false).assertTrue();
        }
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err.message));
        console.info('err code :' + JSON.stringify(err.code));
        expect(err.code).assertEqual(6800104);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0100
     * @tc.desc   OnVolumeChange - setVolume - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      let maxVolume = await audioManager.getMaxVolume(audio.AudioVolumeType.MEDIA)
      let minVolume = await audioManager.getMinVolume(audio.AudioVolumeType.MEDIA)
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, maxVolume)
      await sleep(50);
      audioVolumeManager.on('volumeChange', (VolumeEvent) => {
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0100 VolumeEvent.volumeType: ${VolumeEvent.volumeType}, VolumeEvent.volume:${VolumeEvent.volume},VolumeEvent.volumeMode:${VolumeEvent.volumeMode}, VolumeEvent.updateUi:${VolumeEvent.updateUi}`);
        expect(VolumeEvent.volumeType).assertEqual(audio.AudioVolumeType.MEDIA);
        expect(VolumeEvent.volume).assertEqual(minVolume);
        expect(VolumeEvent.updateUi).assertEqual(false);
        done();
      });
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, minVolume)
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0200
     * @tc.desc   OnVolumeChange - getVolumeManager - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let para1 : ESObject = 1;
        audioVolumeManager.on(para1, (volumeEvent: audio.VolumeEvent) => {
          console.info(`VolumeType of stream: ${volumeEvent.volumeType} `);
          console.info(`Volume level: ${volumeEvent.volume} `);
          console.info(`Whether to updateUI: ${volumeEvent.updateUi} `);
        });
        expect(false).assertTrue();
      }catch(error){
        console.log(`${TagFrmwk}: micStateChange : error ${error}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      };
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0300
     * @tc.desc   OnVolumeChange - getVolumeManager - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ON_VOLUMECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioVolumeManager = audioManager.getVolumeManager();
      try {
        let para1 : ESObject = '1';
        audioVolumeManager.on(para1, (volumeEvent: audio.VolumeEvent) => {
          console.info(`VolumeType of stream: ${volumeEvent.volumeType} `);
          console.info(`Volume level: ${volumeEvent.volume} `);
          console.info(`Whether to updateUI: ${volumeEvent.updateUi} `);
        });
        expect(false).assertTrue();
      }catch(error){
        console.log(`${TagFrmwk}: micStateChange : error ${error}`);
        expect(Number(error.code) == 6800101).assertTrue();
        done();
      };
    })
    /**
     * @tc.name   SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0100
     * @tc.number SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0100
     * @tc.desc   OnVolumeChange - getVolumeManager - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let interAudioInterrupt: audio.AudioInterrupt = {
        streamUsage:2,
        contentType:0,
        pauseWhenDucked:true
      };
      // 取消该事件的所有监听。
      audioManager.off('interrupt', interAudioInterrupt);

      // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
      let interruptCallback = (interruptAction: audio.InterruptAction) => {
        if (interruptAction.actionType === 0) {
          console.info('An event to gain the audio focus starts.');
          console.info(`Focus gain event: ${interruptAction} `);
        }
        if (interruptAction.actionType === 1) {
          console.info('An audio interruption event starts.');
          console.info(`Audio interruption event: ${interruptAction} `);
        }
      };
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audioManager.getSpatializationManager();
        audioManager.on('interrupt', interAudioInterrupt, interruptCallback);
        audioManager.off('interrupt', interAudioInterrupt, interruptCallback);
        done();
      } catch (error) {
        console.info(`ON_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })
    /**
     * @tc.name   SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0200
     * @tc.number SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0200
     * @tc.desc   OnVolumeChange - getVolumeManager - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audioManager.getSpatializationManager();
        done();
      } catch (error) {
        console.info(`ON_MICSTATECHANGE error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0300
     * @tc.number SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0300
     * @tc.desc   OnVolumeChange - getVolumeManager - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let interAudioInterrupt: audio.AudioInterrupt = {
        streamUsage:2,
        contentType:0,
        pauseWhenDucked:true
      };
      // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
      let interruptCallback = (interruptAction: audio.InterruptAction) => {
        if (interruptAction.actionType === 0) {
          console.info('An event to gain the audio focus starts.');
          console.info(`Focus gain event: ${interruptAction} `);
        }
        if (interruptAction.actionType === 1) {
          console.info('An audio interruption event starts.');
          console.info(`Audio interruption event: ${interruptAction} `);
        }
      };
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audioManager.getSpatializationManager();
        audioManager.on('interrupt', interAudioInterrupt, interruptCallback);
        audioManager.off('interrupt', interAudioInterrupt);
        done();
      } catch (error) {
        console.info(`SUB_AUDIO_AUDIORENDER_OFF_DEVICECHANGE_0300 error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0100
     * @tc.desc   OnAudioSceneChange - audioManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        audioManager.on('audioSceneChange', (audioScene) => {
          console.info(`AudioSceneChange event: ${audioScene} `);
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0200
     * @tc.desc   OnAudioSceneChange - audioManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ONAUDIOSCENECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        audioManager.on('audioSceneChange', (audioScene) => {
          console.info(`AudioSceneChange event: ${audioScene} `);
          if (audioScene == audio.AudioScene.AUDIO_SCENE_DEFAULT || audioScene == audio.AudioScene.AUDIO_SCENE_RINGING || audioScene == audio.AudioScene.AUDIO_SCENE_PHONE_CALL || audioScene == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
           done();
           return;
          }
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_0100
     * @tc.desc   OffAudioSceneChange - audioManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_OFFAUDIOSCENECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let cb = (audioScene: audio.AudioScene) => {
          console.info(`AudioSceneChange event: ${audioScene} `);
      }
      try {
        audioManager.on('audioSceneChange', cb);
        audioManager.off('audioSceneChange', cb);
        audioManager.on('audioSceneChange', cb);
        audioManager.off('audioSceneChange');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   TestIsRecordingAvailable0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_0100
     * @tc.desc   Test that no recording stream is currently started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestIsRecordingAvailable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      try {
        const isAvailable = streamManager.isRecordingAvailable(capturerInfo);
        expect(isAvailable).assertTrue();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TestIsRecordingAvailable0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_0200
     * @tc.desc   Test that a recording stream is currently started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestIsRecordingAvailable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let streamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      let capturerOptions: audio.AudioCapturerOptions = {
        streamInfo: streamInfo,
        capturerInfo: capturerInfo
      };
      let checkCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };
      try {
        let audioCap = await audio.createAudioCapturer(capturerOptions);
        console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
        await audioCap.start();
        const isAvailable = streamManager.isRecordingAvailable(checkCapturerInfo);
        expect(isAvailable).assertTrue();
        await audioCap.stop();
        await audioCap.release();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TestIsRecordingAvailable0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISRECORDINGAVAILABLE_0300
     * @tc.desc   Test input parameter sourceType invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestIsRecordingAvailable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      };
      try {
        streamManager.isRecordingAvailable(capturerInfo);
        expect(false).assertTrue();
      } catch (error) {
        console.log(`error code: ${error.code} ,message:${error.message}`);
        expect(Number(error.code) == 6800101).assertTrue();
      }
      done();
    })
    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_UNKNOWN: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ALARM: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ALARM: FAIL : :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_RINGTONE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ACCESSIBILITY: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_MOVIE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_GAME: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_AUDIOBOOK: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NAVIGATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_UNKNOWN: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_MUSIC test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MUSIC: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MUSIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ALARM: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_RINGTONE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ACCESSIBILITY: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MOVIE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_GAME: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_AUDIOBOOK: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NAVIGATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_UNKNOWN: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_MUSIC test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MUSIC: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MUSIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ALARM: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_RINGTONE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ACCESSIBILITY: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MOVIE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_GAME: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_AUDIOBOOK: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NAVIGATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_UNKNOWN: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ALARM: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_MESSAGE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_RINGTONE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION: PASS, is: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION: FAIL: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ACCESSIBILITY: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_MOVIE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_GAME: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_AUDIOBOOK: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NAVIGATION: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_INVALID_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_INVALID_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and INVALID device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_INVALID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 10, audio.DeviceType.INVALID);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and INVALID: PASS, volume: ${volume}`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and INVALID: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_EARPIECE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_EARPIECE_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and EARPIECE device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_EARPIECE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MEDIA, 10, audio.DeviceType.EARPIECE);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and EARPIECE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and EARPIECE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_WIRED_HEADSET_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_WIRED_HEADSET_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and WIRED_HEADSET device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_WIRED_HEADSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 10, audio.DeviceType.WIRED_HEADSET);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and WIRED_HEADSET: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`{TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and WIRED_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_WIRED_HEADPHONES_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_WIRED_HEADPHONES_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_ASSISTANT and WIRED_HEADPHONES device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_WIRED_HEADPHONES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 10, audio.DeviceType.WIRED_HEADPHONES);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_ASSISTANT and WIRED_HEADPHONES: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_ASSISTANT and WIRED_HEADPHONES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ALARM_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ALARM_BLUETOOTH_SCO_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_ALARM and BLUETOOTH_SCO device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ALARM_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_ALARM, 10, audio.DeviceType.BLUETOOTH_SCO);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ALARM and BLUETOOTH_SCO: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ALARM and BLUETOOTH_SCO: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_BLUETOOTH_A2DP_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_BLUETOOTH_A2DP_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_MESSAGE and BLUETOOTH_A2DP device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_BLUETOOTH_A2DP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 10, audio.DeviceType.BLUETOOTH_A2DP);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_MESSAGE and BLUETOOTH_A2DP: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.log(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_MESSAGE and BLUETOOTH_A2DP: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_MIC_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_MIC_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION_RINGTONE and MIC device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_MIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE, 10, audio.DeviceType.MIC);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION_RINGTONE and MIC: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION_RINGTONE and MIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_RINGTONE_USB_HEADSET_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_RINGTONE_USB_HEADSET_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_RINGTONE and USB_HEADSET device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_RINGTONE_USB_HEADSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE, 10, audio.DeviceType.USB_HEADSET);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_RINGTONE and USB_HEADSET: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_RINGTONE and USB_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_DISPLAY_PORT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_DISPLAY_PORT_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION and DISPLAY_PORT device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_DISPLAY_PORT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 10, audio.DeviceType.DISPLAY_PORT);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION and DISPLAY_PORT: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION and DISPLAY_PORT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_REMOTE_CAST_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_REMOTE_CAST_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_ACCESSIBILITY and REMOTE_CAST device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_REMOTE_CAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 10, audio.DeviceType.REMOTE_CAST);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ACCESSIBILITY and REMOTE_CAST: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ACCESSIBILITY and REMOTE_CAST: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MOVIE_USB_DEVICE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MOVIE_USB_DEVICE_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_MOVIE and USB_DEVICE device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MOVIE_USB_DEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MOVIE, 10, audio.DeviceType.USB_DEVICE);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MOVIE and USB_DEVICE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MOVIE and USB_DEVICE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_GAME_HDMI_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_GAME_HDMI_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_GAME and HDMI device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_GAME_HDMI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_GAME, 10, audio.DeviceType.HDMI);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_GAME and HDMI: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_GAME and HDMI: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_AUDIOBOOK_LINE_DIGITAL_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_AUDIOBOOK_LINE_DIGITAL_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_AUDIOBOOK and LINE_DIGITAL device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_AUDIOBOOK_LINE_DIGITAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 10, audio.DeviceType.LINE_DIGITAL);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_AUDIOBOOK and LINE_DIGITAL: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_AUDIOBOOK and LINE_DIGITAL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NAVIGATION_REMOTE_DAUDIO_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NAVIGATION_REMOTE_DAUDIO_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_NAVIGATION and REMOTE_DAUDIO device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NAVIGATION_REMOTE_DAUDIO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 10, audio.DeviceType.REMOTE_DAUDIO);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NAVIGATION and REMOTE_DAUDIO: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NAVIGATION and REMOTE_DAUDIO: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_HEARING_AID_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_HEARING_AID_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VIDEO_COMMUNICATION and HEARING_AID device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_HEARING_AID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 10, audio.DeviceType.HEARING_AID);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VIDEO_COMMUNICATION and HEARING_AID: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VIDEO_COMMUNICATION and HEARING_AID: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_NEARLINK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_NEARLINK_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and NEARLINK device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_NEARLINK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 10, audio.DeviceType.NEARLINK);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and NEARLINK: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and NEARLINK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_SYSTEM_PRIVATE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_SYSTEM_PRIVATE_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and SYSTEM_PRIVATE device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_SYSTEM_PRIVATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MEDIA, 10, audio.DeviceType.SYSTEM_PRIVATE);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and SYSTEM_PRIVATE: PASS, {volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and SYSTEM_PRIVATE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_DEFAULT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_DEFAULT_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and DEFAULT device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_DEFAULT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 10, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and DEFAULT: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and DEFAULT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_UNKNOWN, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_UNKNOWN: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_COMMUNICATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_ASSISTANT: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ALARM_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_ALARM, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ALARM: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_MESSAGE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_RINGTONE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_RINGTONE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_NOTIFICATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ACCESSIBILITY: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_MOVIE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_MOVIE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_MOVIE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_GAME_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_GAME, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_GAME: PASS`);
        });
        done();
      } catch (err) {
        console.info(`{TagFrmwk}: on streamVolumeChange with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_AUDIOBOOK: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_NAVIGATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NAVIGATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VIDEO_COMMUNICATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })
  })

}