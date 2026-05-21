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

    it('testDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    it('testDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    it('testEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    it('testEncoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderChannelCountCheck()).assertEqual(0);
      done();
    });

    it('testEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderBitrateCheck()).assertEqual(0);
      done();
    });

    it('testEncoderBitrateSampleRateComboCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderBitrateSampleRateComboCheck()).assertEqual(0);
      done();
    });

    it('testEncoderStereoSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderStereoSampleRateCheck()).assertEqual(0);
      done();
    });

    it('testDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.DecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    it('testEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioopuscodec.EncoderCreateByNameCheck()).assertEqual(0);
      done();
    });
  })
}
