/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';

let TagFrmwk: string = "getAudioSceneApi12";
let AudioSceneRinging: audio.AudioScene = audio.AudioScene.AUDIO_SCENE_RINGING;
let AudioScenePhoneCall: audio.AudioScene = audio.AudioScene.AUDIO_SCENE_PHONE_CALL;
let audioManager: audio.AudioManager;

async function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

export default function getAudioSceneApi12() {
  describe('getAudioSceneApi12', () => {

    beforeAll(async () => {
      console.info(`${TagFrmwk}: beforeAll: Prerequisites at the test suite level`);
      await Utils.msSleep(100);
      await getAudioManager();
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(100);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(100);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })


    /**
     * @tc.number      SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100
     * @tc.name        SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100
     * @tc.desc        mute - AudioScene - AsyncCallback - AudioScene
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done: () => void): void => {
      try {
        audioManager.getAudioScene( (err: BusinessError<void> | null, getValue: audio.AudioScene | undefined) => {
          if (err) {
            console.error(`Failed to obtain the audio scene mode. ${err}`);
            return;
          }
          if (getValue === AudioSceneRinging) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
          } else if (getValue === AudioScenePhoneCall) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
          }
          done();
        });
      } catch (e) {
        e = e as BusinessError;
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200
     * @tc.name        SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200
     * @tc.desc        mute - AudioScene - Promise - AudioScene
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let value = await audioManager.getAudioScene();
        if (value === AudioSceneRinging) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        } else if (value === AudioScenePhoneCall) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        }
        done();
      } catch (e) {
        e = e as BusinessError;
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300
     * @tc.name        SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300
     * @tc.desc        mute - AudioScene - getAudioSceneSync
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done: () => void): void => {
      try {
        let value = audioManager.getAudioSceneSync();
        if (value === AudioSceneRinging) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        } else if (value === AudioScenePhoneCall) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        }
        done();
      } catch (e) {
        e = e as BusinessError;
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}