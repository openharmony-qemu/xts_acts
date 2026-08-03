/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function HyperlinkModifierTest() {
  describe('HyperlinkModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("HyperlinkModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Hyperlink/HyperlinkModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HyperlinkModifierTest state pages: " + JSON.stringify(pages));
        if (!("HyperlinkModifier" == pages.name)) {
          console.info("get HyperlinkModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push HyperlinkModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HyperlinkModifierTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   HyperlinkModifierTest_0010
     * @tc.number SUB_ARKUI_HYPERLINK_MODIFIER_0010
     * @tc.desc   Test Hyperlink with AttributeModifier, verify component type is Hyperlink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HyperlinkModifierTest_0010', Level.LEVEL3, async (done: Function) => {
      console.info('HyperlinkModifierTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('hyperlink_modifier_color');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[HyperlinkModifierTest_0010] obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Hyperlink');
      console.info('[HyperlinkModifierTest_0010] END');
      done();
    });

    /**
     * @tc.name   HyperlinkModifierTest_0020
     * @tc.number SUB_ARKUI_HYPERLINK_MODIFIER_0020
     * @tc.desc   Test Hyperlink with AttributeModifier, verify initial color set by applyNormalAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HyperlinkModifierTest_0020', Level.LEVEL3, async (done: Function) => {
      console.info('HyperlinkModifierTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('hyperlink_modifier_color');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[HyperlinkModifierTest_0020] color is: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual('#FFFF0000');
      console.info('[HyperlinkModifierTest_0020] END');
      done();
    });

    /**
     * @tc.name   HyperlinkModifierTest_0030
     * @tc.number SUB_ARKUI_HYPERLINK_MODIFIER_0030
     * @tc.desc   Test Hyperlink with AttributeModifier, verify dynamic color change after modifier state toggle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HyperlinkModifierTest_0030', Level.LEVEL3, async (done: Function) => {
      console.info('HyperlinkModifierTest_0030 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('hyperlink_btn_change_modifier'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('hyperlink_modifier_color');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[HyperlinkModifierTest_0030] color after change is: " + JSON.stringify(obj.$attrs.color));
      expect(obj.$attrs.color).assertEqual('#FF000000');
      console.info('[HyperlinkModifierTest_0030] END');
      done();
    });
  })
}
