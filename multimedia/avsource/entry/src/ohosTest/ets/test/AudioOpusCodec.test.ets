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
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0100
     * @tc.name      : testDecoderSampleRateCheck
     * @tc.desc      : Test Opus decoder sample rate configuration
     */
    it('testDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0200
     * @tc.name      : testDecoderChannelCountCheck
     * @tc.desc      : Test Opus decoder channel count configuration
     */
    it('testDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0300
     * @tc.name      : testEncoderSampleRateCheck
     * @tc.desc      : Test Opus encoder sample rate configuration
     */
    it('testEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0400
     * @tc.name      : testEncoderChannelCountCheck
     * @tc.desc      : Test Opus encoder channel count configuration
     */
    it('testEncoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0500
     * @tc.name      : testEncoderBitrateCheck
     * @tc.desc      : Test Opus encoder bitrate configuration
     */
    it('testEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0600
     * @tc.name      : testEncoderBitrateSampleRateComboCheck
     * @tc.desc      : Test Opus encoder bitrate and sample rate combination
     */
    it('testEncoderBitrateSampleRateComboCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderBitrateSampleRateComboCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0700
     * @tc.name      : testEncoderStereoSampleRateCheck
     * @tc.desc      : Test Opus encoder stereo sample rate configuration
     */
    it('testEncoderStereoSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderStereoSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0800
     * @tc.name      : testDecoderCreateByNameCheck
     * @tc.desc      : Test Opus decoder create by name
     */
    it('testDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOOPUSCODEC_0900
     * @tc.name      : testEncoderCreateByNameCheck
     * @tc.desc      : Test Opus encoder create by name
     */
    it('testEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderCreateByNameCheck()).assertEqual(0);
      done();
    });
  })
}
