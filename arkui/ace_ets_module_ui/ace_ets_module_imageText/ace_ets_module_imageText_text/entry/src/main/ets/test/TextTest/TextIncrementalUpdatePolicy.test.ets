/**
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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextIncrementalUpdatePolicyTest() {
  describe('TextIncrementalUpdatePolicyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextIncrementalUpdatePolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextIncrementalUpdatePolicy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextIncrementalUpdatePolicyTest state pages: " + JSON.stringify(pages));
        if (!("TextIncrementalUpdatePolicy" == pages.name)) {
          console.info("get TextIncrementalUpdatePolicyTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextIncrementalUpdatePolicyTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextIncrementalUpdatePolicyTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_NONE_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_PARAM_0100
     * @tc.desc   Test Text incrementalUpdatePolicy property with IncrementalUpdatePolicy.NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_NONE_0100', Level.LEVEL2, async () => {
      console.info('[textIncrementalUpdatePolicy_NONE_0100] START');

      let strJson: string = getInspectorByKey('text_incrementalUpdatePolicy_NONE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textIncrementalUpdatePolicy_NONE_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textIncrementalUpdatePolicy_NONE_0100] incrementalUpdatePolicy is: " + obj.$attrs.incrementalUpdatePolicy);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.incrementalUpdatePolicy).assertEqual('IncrementalUpdatePolicy.NONE');
      console.info('[textIncrementalUpdatePolicy_NONE_0100] END');
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_PARAM_0200
     * @tc.desc   Test Text incrementalUpdatePolicy property with IncrementalUpdatePolicy.PARAGRAPH_CACHE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100', Level.LEVEL2, async () => {
      console.info('[textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100] START');

      let strJson: string = getInspectorByKey('text_incrementalUpdatePolicy_PARAGRAPH_CACHE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100] incrementalUpdatePolicy is: " + obj.$attrs.incrementalUpdatePolicy);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.incrementalUpdatePolicy).assertEqual('IncrementalUpdatePolicy.PARAGRAPH_CACHE');
      console.info('[textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100] END');
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_null_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_PARAM_0300
     * @tc.desc   Test Text incrementalUpdatePolicy property with null, should restore to default value NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_null_0100', Level.LEVEL2, async () => {
      console.info('[textIncrementalUpdatePolicy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_incrementalUpdatePolicy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_incrementalUpdatePolicy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textIncrementalUpdatePolicy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textIncrementalUpdatePolicy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textIncrementalUpdatePolicy_null_0100] default incrementalUpdatePolicy is: " + objCompare.$attrs.incrementalUpdatePolicy);
      console.info("[textIncrementalUpdatePolicy_null_0100] null incrementalUpdatePolicy is: " + obj.$attrs.incrementalUpdatePolicy);

      expect(obj.$attrs.incrementalUpdatePolicy).not().assertUndefined();
      expect(obj.$attrs.incrementalUpdatePolicy).assertEqual(objCompare.$attrs.incrementalUpdatePolicy);
      console.info('[textIncrementalUpdatePolicy_null_0100] END');
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_PARAM_0400
     * @tc.desc   Test Text incrementalUpdatePolicy property with undefined, should restore to default value NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textIncrementalUpdatePolicy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_incrementalUpdatePolicy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_incrementalUpdatePolicy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textIncrementalUpdatePolicy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textIncrementalUpdatePolicy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textIncrementalUpdatePolicy_undefined_0100] default incrementalUpdatePolicy is: " + objCompare.$attrs.incrementalUpdatePolicy);
      console.info("[textIncrementalUpdatePolicy_undefined_0100] undefined incrementalUpdatePolicy is: " + obj.$attrs.incrementalUpdatePolicy);

      expect(obj.$attrs.incrementalUpdatePolicy).not().assertUndefined();
      expect(obj.$attrs.incrementalUpdatePolicy).assertEqual(objCompare.$attrs.incrementalUpdatePolicy);
      console.info('[textIncrementalUpdatePolicy_undefined_0100] END');
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_MODIFIER_0100
     * @tc.desc   Test Text incrementalUpdatePolicy property set via AttributeModifier with PARAGRAPH_CACHE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100', Level.LEVEL2, async () => {
      console.info('[textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100] START');

      let strJson: string = getInspectorByKey('text_incrementalUpdatePolicy_modifier_PARAGRAPH_CACHE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100] incrementalUpdatePolicy is: " + obj.$attrs.incrementalUpdatePolicy);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.incrementalUpdatePolicy).assertEqual('IncrementalUpdatePolicy.PARAGRAPH_CACHE');
      console.info('[textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100] END');
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_modifier_UNDEFINED_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_MODIFIER_0200
     * @tc.desc   Test Text incrementalUpdatePolicy property set via AttributeModifier with undefined, should restore to NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_modifier_UNDEFINED_0100', Level.LEVEL2, async () => {
      console.info('[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_incrementalUpdatePolicy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_incrementalUpdatePolicy_modifier_UNDEFINED');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] modifier obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] default incrementalUpdatePolicy is: " + objCompare.$attrs.incrementalUpdatePolicy);
      console.info("[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] modifier incrementalUpdatePolicy is: " + obj.$attrs.incrementalUpdatePolicy);

      expect(obj.$attrs.incrementalUpdatePolicy).not().assertUndefined();
      expect(obj.$attrs.incrementalUpdatePolicy).assertEqual(objCompare.$attrs.incrementalUpdatePolicy);
      console.info('[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] END');
    })

  })
}
