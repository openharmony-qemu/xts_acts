'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextIncrementalUpdatePolicyTest() {
  describe('TextIncrementalUpdatePolicyTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextIncrementalUpdatePolicyTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextIncrementalUpdatePolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextIncrementalUpdatePolicy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextIncrementalUpdatePolicyTest state pages:" + JSON.stringify(pages));
        if (!("TextIncrementalUpdatePolicy" == pages.name)) {
          console.info("get TextIncrementalUpdatePolicyTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextIncrementalUpdatePolicyTest success ");
        }
      } catch (err) {
        console.error("push TextIncrementalUpdatePolicyTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_NONE_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_PARAM_0100
     * @tc.desc   Test Text incrementalUpdatePolicy property with IncrementalUpdatePolicy.NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_NONE_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textIncrementalUpdatePolicy_NONE_0100] START');

      let strJson = inspector.getInspectorByKey('text_incrementalUpdatePolicy_NONE');
      console.info("[textIncrementalUpdatePolicy_NONE_0100] incrementalUpdatePolicy is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'))
        .assertEqual('IncrementalUpdatePolicy.NONE');
      console.info('[textIncrementalUpdatePolicy_NONE_0100] END');
      done();
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_PARAM_0200
     * @tc.desc   Test Text incrementalUpdatePolicy property with IncrementalUpdatePolicy.PARAGRAPH_CACHE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100] START');

      let strJson = inspector.getInspectorByKey('text_incrementalUpdatePolicy_PARAGRAPH_CACHE');

      console.info("[textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100] incrementalUpdatePolicy is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'))
        .assertEqual('IncrementalUpdatePolicy.PARAGRAPH_CACHE');
      console.info('[textIncrementalUpdatePolicy_PARAGRAPH_CACHE_0100] END');
      done();
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_PARAM_0400
     * @tc.desc   Test Text incrementalUpdatePolicy property with undefined, should restore to default value NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textIncrementalUpdatePolicy_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('text_incrementalUpdatePolicy_default');
      let strJson = inspector.getInspectorByKey('text_incrementalUpdatePolicy_undefined');

      console.info("[textIncrementalUpdatePolicy_undefined_0100] default incrementalUpdatePolicy is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('incrementalUpdatePolicy'));
      console.info("[textIncrementalUpdatePolicy_undefined_0100] undefined incrementalUpdatePolicy is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('incrementalUpdatePolicy'));
      console.info('[textIncrementalUpdatePolicy_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_MODIFIER_0100
     * @tc.desc   Test Text incrementalUpdatePolicy property set via AttributeModifier with PARAGRAPH_CACHE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100] START');

      let strJson = inspector.getInspectorByKey('text_incrementalUpdatePolicy_modifier_PARAGRAPH_CACHE');

      console.info("[textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100] incrementalUpdatePolicy is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'))
        .assertEqual('IncrementalUpdatePolicy.PARAGRAPH_CACHE');
      console.info('[textIncrementalUpdatePolicy_modifier_PARAGRAPH_CACHE_0100] END');
      done();
    })

    /**
     * @tc.name   textIncrementalUpdatePolicy_modifier_UNDEFINED_0100
     * @tc.number SUB_ARKUI_TEXT_INCREMENTALUPDATEPOLICY_MODIFIER_0200
     * @tc.desc   Test Text incrementalUpdatePolicy property set via AttributeModifier with undefined, should restore to NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textIncrementalUpdatePolicy_modifier_UNDEFINED_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('text_incrementalUpdatePolicy_default');
      let strJson = inspector.getInspectorByKey('text_incrementalUpdatePolicy_modifier_UNDEFINED');

      console.info("[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] default incrementalUpdatePolicy is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('incrementalUpdatePolicy'));
      console.info("[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] modifier incrementalUpdatePolicy is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('incrementalUpdatePolicy'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('incrementalUpdatePolicy'));
      console.info('[textIncrementalUpdatePolicy_modifier_UNDEFINED_0100] END');
      done();
    })

  })
}
