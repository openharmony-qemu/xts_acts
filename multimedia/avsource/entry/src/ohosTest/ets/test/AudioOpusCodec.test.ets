/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from "@ohos/hypium"
import audioopuscodec from 'libaudioopuscodec.so'

export default function audioOpusCodecTest() {
  describe('audioOpusCodecTest', () => {

    /**
     * @tc.name   testDecoderSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0100
     * @tc.desc   test DecoderSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDecoderChannelCountCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0200
     * @tc.desc   test DecoderChannelCountCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testEncoderSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0300
     * @tc.desc   test EncoderSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testEncoderChannelCountCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0400
     * @tc.desc   test EncoderChannelCountCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testEncoderBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0500
     * @tc.desc   test EncoderBitrateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testEncoderBitrateSampleRateComboCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0600
     * @tc.desc   test EncoderBitrateSampleRateComboCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncoderBitrateSampleRateComboCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderBitrateSampleRateComboCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testEncoderStereoSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0700
     * @tc.desc   test EncoderStereoSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncoderStereoSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderStereoSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDecoderCreateByNameCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0800
     * @tc.desc   test DecoderCreateByNameCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testEncoderCreateByNameCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_INTERFACE_TEST_0900
     * @tc.desc   test EncoderCreateByNameCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderCreateByNameCheck()).assertEqual(0);
      done();
    });
  })
}
