/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size} from '@ohos/hypium';
import hevcswDecoderNapi from "libentry.so"
import Utils, { Log } from './Util.test';

const fileArr = [
  "1920_1080_30.h265",
  "hash_val.json"
]

export default function abilityTest() {
  let TAG = '';
  describe('actsHevcswDecoderTest', () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0100';
      try {
        let result: number = hevcswDecoderNapi.VideoDecodeSyncSs265Func0010Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0200
     * @tc.number SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DECODER_SYNC_S265_0200';
      try {
        let result: number = hevcswDecoderNapi.VideoDecodeSyncSs265Func0020Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SWDEC_H265_BLAC_0300
     * @tc.number SUB_MULTIMEDIA_VIDEO_SWDEC_H265_BLAC_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_SWDEC_H265_BLAC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_SWDEC_H265_BLAC_0300';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265BlankFrame0010Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0400
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0400';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0010Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0500
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0500';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0020Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0600
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0600';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0030Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0700
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0700';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0040Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0800
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0800';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0050Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0900
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_0900';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0060Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1000
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1000';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0070Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1100
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1100';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0080Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1200
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SEPPD_FUNCTION_1200';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265Speed0090Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_SURF_EXPIRE_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_SURF_EXPIRE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_SURF_EXPIRE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_SURF_EXPIRE_0100';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265SurfExpired0010Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_MAX_INPUT_SIZE_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_MAX_INPUT_SIZE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_MAX_INPUT_SIZE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_MAX_INPUT_SIZE_0100';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265SetMaxInputSize0010Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_DEC_GET_CROP_SIZE_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_DEC_GET_CROP_SIZE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_VIDEO_DEC_GET_CROP_SIZE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'SUB_MULTIMEDIA_VIDEO_DEC_GET_CROP_SIZE_0100';
      try {
        let result: number = hevcswDecoderNapi.VideoSwdecH265GetCropSize0010Test();
        console.info(TAG + "test ret Result ===>" + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("===> " + TAG + "err:" + err);
        expect().assertFail();
        done();
      }
    });
  })
}