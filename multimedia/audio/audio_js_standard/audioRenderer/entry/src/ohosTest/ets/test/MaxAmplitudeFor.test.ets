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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base'

const defaultVolumeGroupId = audio.DEFAULT_VOLUME_GROUP_ID;
let audioManager = audio.getAudioManager();
let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();
let audioVolumeGroupManager: audio.AudioVolumeGroupManager | undefined = undefined;
let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
let REMOTE_CAST = audio.DeviceType.REMOTE_CAST;
let rate_88200 = audio.AudioSamplingRate.SAMPLE_RATE_88200;
let rate_176400 = audio.AudioSamplingRate.SAMPLE_RATE_176400;
let rate_19200 = audio.AudioSamplingRate.SAMPLE_RATE_192000;


let capturerInfo: audio.AudioCapturerInfo = {
  source: audio.SourceType.SOURCE_TYPE_MIC,
  capturerFlags: 0
}

let rendererInfo: audio.AudioRendererInfo = {
  usage : audio.StreamUsage.STREAM_USAGE_MUSIC,
  rendererFlags : 0
}

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function maxAmplitudeFor() {
  describe('maxAmplitudeFor', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await sleep(1000);
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      console.info(`beforeEach: Prerequisites at the test case level`);
      await sleep(100);
    })

    afterEach(async () => {
      console.info(`afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })

    afterAll(() => {
      console.info(`afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200
     * @tc.desc   AudioRenderer - STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await sleep(3000);
        let audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        await sleep(500);
        let data = await audioRoutingManager.getPreferredInputDeviceForCapturerInfo(capturerInfo);
        await sleep(500);
        console.log('SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200 data is:' + data);
        let value = await audioVolumeGroupManager.getMaxAmplitudeForInputDevice(data[0]);
        await sleep(500);
        console.info(`SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200 mic volatileume amplitude is: ${value}`);
        expect(value >= 0 && value <= 1).assertTrue();
        done();
      } catch (error) {
        console.error("SUB_MULTIMEDIA_AUDIO_RECORD_UV_VALUE_0200 get outputDeviceId error" + error);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200
     * @tc.desc   AudioRenderer - STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
        await sleep(500);
        let data = await audioRoutingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
        await sleep(500);
        console.log('SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200 data is:' + data);
        let value = await audioVolumeGroupManager.getMaxAmplitudeForOutputDevice(data[0]);
        await sleep(500);
        console.info(`SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200 mic volatileume amplitude is: ${value}`);
        expect(value >= 0 && value <= 1).assertTrue();
        done();
      } catch (error) {
        console.error("SUB_MULTIMEDIA_AUDIO_PlAY_UV_VALUE_0200 get outputDeviceId error" + error);
        expect(false).assertTrue();
        done();
      }
    })

  })
}