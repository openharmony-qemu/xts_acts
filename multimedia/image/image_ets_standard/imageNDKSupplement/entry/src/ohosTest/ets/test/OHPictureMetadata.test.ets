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

import
  { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libimageEffect.so';
import { JSON } from '@kit.ArkTS';
const IMAGE_SUCCESS = 0;
const IMAGE_BAD_PARAMETER  = -1;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const TAG = 'PictureMetadataXts';

export default function OHPictureMetadata() {
  describe('OHPictureMetadata', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_PICTURE_METADATA_GET_PROPERTY_SUPP_0100
     * @tc.name    SUB_PICTURE_METADATA_GET_PROPERTY_SUPP_0100
     * @tc.desc    OH_PictureMetadata_GetProperty-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PICTURE_METADATA_GET_PROPERTY_SUPP_0100', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.PictureMetadataGetProperty(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_PICTURE_METADATA_SET_PROPERTY_SUPP_0100
     * @tc.name    SUB_PICTURE_METADATA_SET_PROPERTY_SUPP_0100
     * @tc.desc    OH_PictureMetadata_SetProperty-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PICTURE_METADATA_SET_PROPERTY_SUPP_0100', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.PictureMetadataSetProperty(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_Picture_Metadata_CLONE_SUPP_0100
     * @tc.name    SUB_Picture_Metadata_CLONE_SUPP_0100
     * @tc.desc    OH_PictureMetadata_SetProperty-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Picture_Metadata_CLONE_SUPP_0100', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.ClonedMetadataGetProperty(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
  });
}