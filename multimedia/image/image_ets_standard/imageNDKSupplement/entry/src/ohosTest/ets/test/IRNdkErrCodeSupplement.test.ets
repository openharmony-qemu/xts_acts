/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libimageEffect.so'
import { JSON } from '@kit.ArkTS';

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;
const CASE_INDEX_12 = 12;
const CASE_INDEX_13 = 13;
const CASE_INDEX_14 = 14;
const CASE_INDEX_15 = 15;
const CASE_INDEX_16 = 16;
const CASE_INDEX_17 = 17;
const CASE_INDEX_18 = 18;
const CASE_INDEX_19 = 19
const CASE_INDEX_20 = 20

const TAG = 'IRNdkErrCodeSupplementTestSupp';

export default function IRNdkErrCodeSupplementTest() {
  describe('IRNdkErrCodeSupplementTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0001
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0001
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_UNKNOWN
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0001', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980111);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0002
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0002
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_OPAQUE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0002', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980112);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0003
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0003
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_PREMUL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0003', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980113);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0004
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0004
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_UNPREMUL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0004', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_4);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980114);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0005
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0005
     * @tc.desc     OHOS_PIXEL_MAP_READ_ONLY
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0005', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_5);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980116);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0006
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0006
     * @tc.desc     OHOS_PIXEL_MAP_EDITABLE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0006', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_6);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980117);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0007
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0007
     * @tc.desc     OHOS_PIXEL_MAP_FORMAT_NONE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0007', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_7);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980118);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0008
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0008
     * @tc.desc     OHOS_PIXEL_MAP_FORMAT_RGBA_8888
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0008', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_8);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980119);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0009
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0009
     * @tc.desc     OHOS_PIXEL_MAP_FORMAT_RGB_565
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0009', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_9);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980120);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00010
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00010
     * @tc.desc     IMAGE_LOCK_UNLOCK_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00010', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_10);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980121);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00011
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00011
     * @tc.desc     IMAGE_INIT_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00011', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_11);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980122);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00012
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00012
     * @tc.desc     IMAGE_CREATE_PIXELMAP_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00012', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_12);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980123);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00013
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00013
     * @tc.desc     IMAGE_ALLOCATOR_MODE_UNSUPPORTED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00013', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_13);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980124);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00014
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00014
     * @tc.desc     IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00014', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_14);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980126);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00015
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00015
     * @tc.desc     IMAGE_SOURCE_TOO_LARGE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00015', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_15);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980127);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00016
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00016
     * @tc.desc     IMAGE_DECODE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00016', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_16);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980128);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00017
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00017
     * @tc.desc     IMAGE_SOURCE_ALLOC_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00017', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_17);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980129);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00018
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00018
     * @tc.desc     IMAGE_ENCODE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00018', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_18);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980130);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00019
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00019
     * @tc.desc     IMAGE_UNSUPPORTED_DATA_FORMAT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00019', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_19);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980131);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00020
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00020
     * @tc.desc     IMAGE_LOCK_UNLOCK_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00020', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_20);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980110);
    });
  })
}