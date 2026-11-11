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
import audiodsddecoder from 'libaudiodsddecoder.so'

export default function audioDsdDecoderTest() {
  describe('audioDsdDecoderTest', () => {

    /**
     * @tc.name   testDsdCodecTypeDefaultCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0100
     * @tc.desc   test configure the DSD decoder without OH_MD_KEY_AUDIO_DSD_CODEC_TYPE,
     *            the default OH_AVCODEC_DSD_CODEC_LSBF_PLANAR(0) is used
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeDefaultCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeDefaultCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCodecTypeLsbFirstPlanarCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0200
     * @tc.desc   test configure the DSD decoder with OH_AVCODEC_DSD_CODEC_LSBF_PLANAR(0),
     *            the dsf container format for LSB first and flat layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeLsbFirstPlanarCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeLsbFirstPlanarCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCodecTypeMsbFirstPlanarCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0300
     * @tc.desc   test configure the DSD decoder with OH_AVCODEC_DSD_CODEC_MSBF_PLANAR(1),
     *            MSB first and flat layout of the dsf container format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeMsbFirstPlanarCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeMsbFirstPlanarCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCodecTypeMsbFirstCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0400
     * @tc.desc   test configure the DSD decoder with OH_AVCODEC_DSD_CODEC_MSBF(2),
     *            MSB first and interleaved dff container format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeMsbFirstCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeMsbFirstCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCodecTypeOutOfRangeCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0500
     * @tc.desc   test configure the DSD decoder with values outside OH_AVCodec_DSDCodecType,
     *            the decoder rejects them or falls back to the default type and stays usable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeOutOfRangeCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeOutOfRangeCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCodecTypeFormatKeyCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0600
     * @tc.desc   test OH_MD_KEY_AUDIO_DSD_CODEC_TYPE set and get round trip for every
     *            OH_AVCodec_DSDCodecType value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeFormatKeyCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeFormatKeyCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCodecTypeChannelRangeCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0700
     * @tc.desc   test every OH_AVCodec_DSDCodecType value with the channel count range [1, 6],
     *            a channel count out of the range is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeChannelRangeCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeChannelRangeCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCodecTypeSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0800
     * @tc.desc   test every OH_AVCodec_DSDCodecType value with the DSD64, DSD128 and DSD256
     *            sample rate, an invalid sample rate is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCodecTypeSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCodecTypeSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDsdCapabilityAndCreateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIODSDDECODER_INTERFACE_TEST_0900
     * @tc.desc   test the DSD decoder capability, the decoder creation and the missing encoder
     *            capability of OH_AVCODEC_MIMETYPE_AUDIO_DSD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDsdCapabilityAndCreateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiodsddecoder.DsdCapabilityAndCreateCheck()).assertEqual(0);
      done();
    });
  })
}
