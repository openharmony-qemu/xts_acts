/*
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import AudioKitTest from 'libentry.so'

const ABILITY_ERR_OK = 0;

export default function AudioTest() {
  describe('AudioTest', () => {

    /**
     * @tc.number  : SUB_MULTIMEDIA_AUDIO_CAPTURER_START_0100
     * @tc.name    : testMultimediaAudioCapturerStart0100
     * @tc.desc    : Test AbiliRuntimeErrorMultiInstanceNotSupport error code.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testMultimediaAudioCapturerStart0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_START_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCaptureStartInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number  : SUB_MULTIMEDIA_AUDIO_CAPTURER_PAUSE_0100
     * @tc.name    : testMultimediaAudioCapturerPause0100
     * @tc.desc    : Test AbiliRuntimeErrorMultiInstanceNotSupport error code.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testMultimediaAudioCapturerPause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_CAPTURER_PAUSE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioCapturePauseInvalidParam();
          expect(1).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })
  })
}
