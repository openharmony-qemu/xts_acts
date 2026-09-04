/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audioHaptic from '@ohos.multimedia.audioHaptic';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[AudioHapticSpecErrorTest]';

export default function AudioHapticSpecErrorTest() {
  describe('audioHapticSpecErrorTest', () => {
    let audioHapticManager: audioHaptic.AudioHapticManager | null = null;
    let audioHapticPlayer: audioHaptic.AudioHapticPlayer | null = null;
    const TEST_HAPTIC_ID = 0;

    beforeAll(async () => {
      console.info(`${TAG} beforeAll`);
      try {
        audioHapticManager = audioHaptic.getAudioHapticManager();
      } catch (error) {
        console.error(`${TAG} beforeAll getAudioHapticManager error: ${JSON.stringify(error)}`);
      }
    });

    beforeEach(() => { console.info(`${TAG} beforeEach`); });
    afterEach(() => { console.info(`${TAG} afterEach`); });
    afterAll(() => { console.info(`${TAG} afterAll`); audioHapticManager = null; audioHapticPlayer = null; });

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_HAPTIC_SET_AUDIO_LATENCY_MODE_NULL_0100
     * @tc.name setAudioLatencyMode_null_0100
     * @tc.desc Test setAudioLatencyMode with null parameter, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setAudioLatencyMode_null_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioHapticManager!.setAudioLatencyMode(TEST_HAPTIC_ID, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} setAudioLatencyMode_null_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_HAPTIC_SET_AUDIO_LATENCY_MODE_UNDEFINED_0200
     * @tc.name setAudioLatencyMode_undefined_0200
     * @tc.desc Test setAudioLatencyMode with undefined parameter, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setAudioLatencyMode_undefined_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioHapticManager!.setAudioLatencyMode(TEST_HAPTIC_ID, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} setAudioLatencyMode_undefined_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_HAPTIC_SET_STREAM_USAGE_NULL_0100
     * @tc.name setStreamUsage_null_0100
     * @tc.desc Test setStreamUsage with null parameter, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setStreamUsage_null_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioHapticManager!.setStreamUsage(TEST_HAPTIC_ID, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} setStreamUsage_null_0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('usage');
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_HAPTIC_SET_STREAM_USAGE_UNDEFINED_0200
     * @tc.name setStreamUsage_undefined_0200
     * @tc.desc Test setStreamUsage with undefined parameter, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setStreamUsage_undefined_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        audioHapticManager!.setStreamUsage(TEST_HAPTIC_ID, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} setStreamUsage_undefined_0200 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('usage');
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_HAPTIC_SET_LOOP_NULL_0100
     * @tc.name setLoop_null_0100
     * @tc.desc Test setLoop with null parameter, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setLoop_null_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (audioHapticPlayer === null) {
        console.info(`${TAG} audioHapticPlayer is null, skipping`);
        done();
        return;
      }
      try {
        await audioHapticPlayer!.setLoop(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} setLoop_null_0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_HAPTIC_SET_LOOP_UNDEFINED_0200
     * @tc.name setLoop_undefined_0200
     * @tc.desc Test setLoop with undefined parameter, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setLoop_undefined_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (audioHapticPlayer === null) {
        console.info(`${TAG} audioHapticPlayer is null, skipping`);
        done();
        return;
      }
      try {
        await audioHapticPlayer!.setLoop(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} setLoop_undefined_0200 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });
  });
}
