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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium"
import audioNapi from "libentry.so"
import Utils, { Log } from "./Util.test"

const fileArr = [
  "aac_2c_44100hz_199k.pcm"
]

export default function AudioTest() {
  describe('AcstAudioTest', () => {
    beforeAll(async () => {
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i]
        Utils.copyRawfileToFilesDirSync(fileName, context)
      }
      Log.info(`[rawfile_copy_to_sandbox] sandbox path: ${context.filesDir}/`)
      await Utils.sleep(500)
    })
    beforeEach(async () => {
      let context = getContext()
      Log.info(`AudioText beforeEach`);
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i];
        if (Utils.fileCheckSync(fileName, context)) {
          Log.info(`AudioText ${fileName} file exists`);
        } else {
          Log.info(`AudioText ${fileName} file does not exists!`);
        }
      }
      await Utils.sleep(500)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   EncoderConfigureLCAAC
     * @tc.number EncoderConfigureLCAAC
     * @tc.desc   EncoderConfigureLCAAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureLCAAC', 0, async (done: Function) => {
      const result: number = await audioNapi.EncoderConfigureLCAAC();
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   EncoderConfigureHEAAC
     * @tc.number EncoderConfigureHEAAC
     * @tc.desc   EncoderConfigureHEAAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureHEAAC', 0, async (done: Function) => {
      const result = await audioNapi.EncoderConfigureHEAAC()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   EncoderConfigureHEAACv2
     * @tc.number EncoderConfigureHEAACv2
     * @tc.desc   EncoderConfigureHEAACv2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureHEAACv2', 0, async (done: Function) => {
      const result = await audioNapi.EncoderConfigureHEAACv2()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   EncoderConfigureByCap
     * @tc.number EncoderConfigureByCap
     * @tc.desc   EncoderConfigureByCap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureByCap', 0, async (done: Function) => {
      const result = await audioNapi.EncoderConfigureByCap()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   sample_rate
     * @tc.number sample_rate
     * @tc.desc   sample_rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sample_rate', 0, async (done: Function) => {
      const result = await audioNapi.sample_rate()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   channel_count_v1
     * @tc.number channel_count_v1
     * @tc.desc   channel_count_v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('channel_count_v1', 0, async (done: Function) => {
      const result = await audioNapi.channel_count_v1()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   channel_count_v2
     * @tc.number channel_count_v2
     * @tc.desc   channel_count_v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('channel_count_v2', 0, async (done: Function) => {
      const result = await audioNapi.channel_count_v2()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   channel_layout_v1
     * @tc.number channel_layout_v1
     * @tc.desc   channel_layout_v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('channel_layout_v1', 0, async (done: Function) => {
      const result = await audioNapi.channel_layout_v1()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   channel_layout_v2
     * @tc.number channel_layout_v2
     * @tc.desc   channel_layout_v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('channel_layout_v2', 0, async (done: Function) => {
      const result = await audioNapi.channel_layout_v2()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   aac_profile
     * @tc.number aac_profile
     * @tc.desc   aac_profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aac_profile', 0, async (done: Function) => {
      const result = await audioNapi.aac_profile()
      expect(result).assertEqual(0)
      done();
    })

  })
}