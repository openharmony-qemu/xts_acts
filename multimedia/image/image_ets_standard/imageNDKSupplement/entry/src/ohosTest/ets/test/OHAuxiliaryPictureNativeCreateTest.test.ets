/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import testNapi from 'libimageEffect.so';
import { JSON } from '@kit.ArkTS';

const IMAGE_SUCCESS = 0;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const TAG = 'OHAuxiliaryPictureNativeCreateTest';

export default function OHAuxiliaryPictureNativeCreateTest() {
  describe('OHAuxiliaryPictureNativeCreateTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_AUXILIARY_PICTURE_NATIVE_CREATE_OXY_MAP_0100
     * @tc.name    SUB_IMAGE_AUXILIARY_PICTURE_NATIVE_CREATE_OXY_MAP_0100
     * @tc.desc    OH_AuxiliaryPictureNative_Create传入AUXILIARY_PICTURE_TYPE_OXY_MAP(11)时返回IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_NATIVE_CREATE_OXY_MAP_0100', Level.LEVEL1, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.AuxiliaryPictureNativeCreateTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_AUXILIARY_PICTURE_NATIVE_CREATE_MEL_MAP_0100
     * @tc.name    SUB_IMAGE_AUXILIARY_PICTURE_NATIVE_CREATE_MEL_MAP_0100
     * @tc.desc    OH_AuxiliaryPictureNative_Create传入AUXILIARY_PICTURE_TYPE_MEL_MAP(12)时返回IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_NATIVE_CREATE_MEL_MAP_0100', Level.LEVEL1, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.AuxiliaryPictureNativeCreateTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
  });
}