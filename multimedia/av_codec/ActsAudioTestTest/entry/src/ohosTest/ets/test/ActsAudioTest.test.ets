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
import { afterAll, beforeAll, describe, expect, it, Level } from "@ohos/hypium"
import libentry from "libentry.so"

const TAG = 'AudioEncoderTest'

export default function AudioTest() {
  describe('AcstAudioTest', () => {
    beforeAll(() => {
      console.info(`${TAG}: beforeAll: Init AAC encoder test env`)
    })
    afterAll(() => {
      console.info(`${TAG}: afterAll: Clean AAC encoder test env`)
    })

    /**
     * @tc.name   Encoder_Configure_LCAAC
     * @tc.number Encoder_Configure_LCAAC
     * @tc.desc   Encoder_Configure_LCAAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Encoder_Configure_LCAAC', Level.LEVEL1, () => {
      const  result = libentry.encoderConfigureLCAAC();
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   Encoder_Configure_HEAAC
     * @tc.number Encoder_Configure_HEAAC
     * @tc.desc   Encoder_Configure_HEAAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Encoder_Configure_HEAAC', Level.LEVEL1, () => {
      const result = libentry.encoderConfigureHEAAC(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   Encoder_Configure_HEAAC_v2
     * @tc.number EncoderConfigureHEAACv2
     * @tc.desc   EncoderConfigureHEAACv2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Encoder_Configure_HEAAC_v2", Level.LEVEL1, () => {
      const result = libentry.encoderConfigureHEAAC(1);
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   Encoder_Configure_By_Cap
     * @tc.number Encoder_Configure_By_Cap
     * @tc.desc   Encoder_Configure_By_Cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Encoder_Configure_By_Cap", Level.LEVEL1, () => {
      const result = libentry.encoderConfigureByCap();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   Sample_Rate
     * @tc.number Sample_Rate
     * @tc.desc   Sample_Rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sample_Rate', Level.LEVEL1, () => {
      const  result = libentry.sample_rate();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   Channel_Count_v1
     * @tc.number Channel_Count_v1
     * @tc.desc   Channel_Count_v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Channel_Count_v1", Level.LEVEL1, () => {
      const result = libentry.channel_count(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   Channel_Count_v2
     * @tc.number Channel_Count_v2
     * @tc.desc   Channel_Count_v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Channel_Count_v2", Level.LEVEL1, () => {
      const result = libentry.channel_count(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   Channel_Layout_v1
     * @tc.number channel_layout_v1
     * @tc.desc   Channel_Layout_v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Channel_Layout_v1", Level.LEVEL1, () => {
      const result = libentry.channel_layout(0);
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   Channel_Layout_v2
     * @tc.number channel_layout_v2
     * @tc.desc   Channel_Layout_v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Channel_Layout_v2", Level.LEVEL1, () => {
      const result = libentry.channel_layout(1);
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   Aac_Profile
     * @tc.number Aac_Profile
     * @tc.desc   Aac_Profile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Aac_Profile", Level.LEVEL1, () => {
      const result = libentry.aac_profile();
      expect(result).assertEqual(0);
    })
  })


}