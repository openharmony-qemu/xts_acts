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

const EFFECT_SUCCESS = 0;
const EFFECT_ERROR_PARAM_INVALID = 401;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const TAG = 'imageEffectSuppXts';

export default function ImageEffectSuppTest() {
  describe('ImageEffectSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100
     * @tc.desc   OH_ImageEffect_Create with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectCreateSupp(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_AddFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectAddFilterSupp(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_InsertFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectInsertFilterSupp(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_RemoveFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectRemoveFilterSupp(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_ReplaceFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectReplaceFilterSupp(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0300
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0400
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0400
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0400', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0200
     * @tc.desc   OH_ImageEffect_Create with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0200', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectCreateSupp(undefined);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_AddFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0200', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectAddFilterSupp(undefined);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_AddFilterByFilter with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilterSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_AddFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilterSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0300
     * @tc.desc   OH_ImageEffect_AddFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilterSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_InsertFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0200', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectInsertFilterSupp(undefined);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0300
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0400
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0400
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0400', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0100
     * @tc.desc   OH_ImageEffect_RemoveFilterByIndex with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndexSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0200
     * @tc.desc   OH_ImageEffect_RemoveFilterByIndex with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndexSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0300
     * @tc.desc   OH_ImageEffect_RemoveFilterByIndex with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndexSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_GetFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetFilterSupp(undefined);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0200
     * @tc.desc   OH_ImageEffect_SetInputPicture with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPictureSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0300
     * @tc.desc   OH_ImageEffect_SetInputPicture with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPictureSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_OUTPUT_PICTURE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_OUTPUT_PICTURE_SUPP_0100
     * @tc.desc   OH_ImageEffect_SetOutputPicture with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_OUTPUT_PICTURE_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPictureSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0100
     * @tc.desc   OH_ImageEffect_Release with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReleaseSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0200
     * @tc.desc   OH_ImageEffect_Release with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReleaseSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_Create with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result:undefined = testNapi.OHImageEffectCreateSupplement();
      console.info(TAG,'Success',result);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_AddFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result:undefined = testNapi.OHImageEffectAddFilterSupplement();
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_InsertFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: undefined = testNapi.OHImageEffectInsertFilterSupplement();
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_ReplaceFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: undefined = testNapi.OHImageEffectReplaceFilterSupplement();
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_GetFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: undefined = testNapi.OHImageEffectGetFilterSupplement();
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputTextureSupp(1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0200
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputTextureSupp(2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
  });
}