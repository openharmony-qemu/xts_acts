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
import { ImageUtils } from './ImageUtils.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { JSON } from '@kit.ArkTS';

const EFFECT_SUCCESS = 0;
const EFFECT_ERROR_PARAM_INVALID = 401;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const TAG = 'imageEffectSuppXts';

export default function ImageEffectSuppTest() {
  describe('ImageEffectSuppTest', () => {
    beforeAll(async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filePath = context.filesDir + "/test.jpg";
      await ImageUtils.getInstance().savePixelMap(filePath, $r('app.media.original'));
      testNapi.savePixelMapForPath(filePath);
      let outFilePath = context.filesDir + "/outtest.jpg";
      await ImageUtils.getInstance().savePixelMap(outFilePath, $r('app.media.d23116'));
      testNapi.creatOutPixeMapForPath(outFilePath);
      done();
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100
     * @tc.name   : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100
     * @tc.desc   : OHImageEffectCreateSupp
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectCreateSupp(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100
     * @tc.name   : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100
     * @tc.desc   : OHImageEffectAddFilterSupp
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectAddFilterSupp(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100
     * @tc.name   : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100
     * @tc.desc   : OHImageEffectInsertFilterSupp
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectInsertFilterSupp(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100
     * @tc.name   : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100
     * @tc.desc   : OHImageEffectRemoveFilterSupp
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectRemoveFilterSupp(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100
     * @tc.name   : SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100
     * @tc.desc   : OHImageEffectReplaceFilterSupp
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectReplaceFilterSupp(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
  });
}