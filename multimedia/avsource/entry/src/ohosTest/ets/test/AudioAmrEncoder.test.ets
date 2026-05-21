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

    it('testAmrNbDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    it('testAmrNbDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    it('testAmrNbEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderBitrateCheck()).assertEqual(0);
      done();
    });

    it('testAmrNbEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    it('testAmrWbDecoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderSampleRateCheck()).assertEqual(0);
      done();
    });

    it('testAmrWbDecoderChannelCountCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderChannelCountCheck()).assertEqual(0);
      done();
    });

    it('testAmrWbEncoderBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderBitrateCheck()).assertEqual(0);
      done();
    });

    it('testAmrWbEncoderSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderSampleRateCheck()).assertEqual(0);
      done();
    });

    it('testAmrNbDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbDecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    it('testAmrNbEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrNbEncoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    it('testAmrWbDecoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbDecoderCreateByNameCheck()).assertEqual(0);
      done();
    });

    it('testAmrWbEncoderCreateByNameCheck', Level.LEVEL2, async (done: Function) => {
      expect(audioamrencoder.AmrWbEncoderCreateByNameCheck()).assertEqual(0);
      done();
    });
  })
}
