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
import audioamrencoder from 'libaudioamrencoder.so'

export default function audioAmrEncoderTest() {
  describe('audioAmrEncoderTest', () => {

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0100
     * @tc.name      : testAmrNbDecoderSampleRateCheck
     * @tc.desc      : Test AMR-NB decoder sample rate configuration
     */
    it('testAmrNbDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0200
     * @tc.name      : testAmrNbDecoderChannelCountCheck
     * @tc.desc      : Test AMR-NB decoder channel count configuration
     */
    it('testAmrNbDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0300
     * @tc.name      : testAmrNbEncoderBitrateCheck
     * @tc.desc      : Test AMR-NB encoder bitrate configuration
     */
    it('testAmrNbEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0400
     * @tc.name      : testAmrNbEncoderSampleRateCheck
     * @tc.desc      : Test AMR-NB encoder sample rate configuration
     */
    it('testAmrNbEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0500
     * @tc.name      : testAmrWbDecoderSampleRateCheck
     * @tc.desc      : Test AMR-WB decoder sample rate configuration
     */
    it('testAmrWbDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0600
     * @tc.name      : testAmrWbDecoderChannelCountCheck
     * @tc.desc      : Test AMR-WB decoder channel count configuration
     */
    it('testAmrWbDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0700
     * @tc.name      : testAmrWbEncoderBitrateCheck
     * @tc.desc      : Test AMR-WB encoder bitrate configuration
     */
    it('testAmrWbEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0800
     * @tc.name      : testAmrWbEncoderSampleRateCheck
     * @tc.desc      : Test AMR-WB encoder sample rate configuration
     */
    it('testAmrWbEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_0900
     * @tc.name      : testAmrNbDecoderCreateByNameCheck
     * @tc.desc      : Test AMR-NB decoder create by name
     */
    it('testAmrNbDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_1000
     * @tc.name      : testAmrNbEncoderCreateByNameCheck
     * @tc.desc      : Test AMR-NB encoder create by name
     */
    it('testAmrNbEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_1100
     * @tc.name      : testAmrWbDecoderCreateByNameCheck
     * @tc.desc      : Test AMR-WB decoder create by name
     */
    it('testAmrWbDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_1200
     * @tc.name      : testAmrWbEncoderCreateByNameCheck
     * @tc.desc      : Test AMR-WB encoder create by name
     */
    it('testAmrWbEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderCreateByNameCheck()).assertEqual(0);
      done();
    });
  })
}
