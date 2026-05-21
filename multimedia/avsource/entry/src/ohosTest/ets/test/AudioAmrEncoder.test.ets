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
     * @tc.name   testAmrNbDecoderSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0100
     * @tc.desc   test AmrNbDecoderSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrNbDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrNbDecoderChannelCountCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0200
     * @tc.desc   test AmrNbDecoderChannelCountCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrNbDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrNbEncoderBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0300
     * @tc.desc   test AmrNbEncoderBitrateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrNbEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrNbEncoderSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0400
     * @tc.desc   test AmrNbEncoderSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrNbEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrWbDecoderSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0500
     * @tc.desc   test AmrWbDecoderSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrWbDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrWbDecoderChannelCountCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0600
     * @tc.desc   test AmrWbDecoderChannelCountCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrWbDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrWbEncoderBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0700
     * @tc.desc   test AmrWbEncoderBitrateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrWbEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrWbEncoderSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0800
     * @tc.desc   test AmrWbEncoderSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrWbEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrNbDecoderCreateByNameCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_0900
     * @tc.desc   test AmrNbDecoderCreateByNameCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrNbDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrNbEncoderCreateByNameCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_1000
     * @tc.desc   test AmrNbEncoderCreateByNameCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrNbEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrWbDecoderCreateByNameCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_1100
     * @tc.desc   test AmrWbDecoderCreateByNameCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrWbDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAmrWbEncoderCreateByNameCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOAMRENCODER_INTERFACE_TEST_1200
     * @tc.desc   test AmrWbEncoderCreateByNameCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAmrWbEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderCreateByNameCheck()).assertEqual(0);
      done();
    });
  })
}
