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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import Utils from './Utils';

export default function tabContentModifier() {
  describe('tabContentModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("tabContentModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabContentModifier',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabContentModifier state pages: " + JSON.stringify(pages));
        if (!("tabContentModifier" == pages.name)) {
          console.info("get tabContentModifier state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push tabContentModifier page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   tabContentModifier_0100
     * @tc.number SUB_ARKUI_TABCONTENT_MODIFIER_PARAM_0100
     * @tc.desc   Test TabContent Modifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabContentModifier_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0300 start");
      let strJson = getInspectorByKey('tabContent_modifier_text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('tabContentModifier_0100 text: ' + JSON.stringify(JSON.parse(strJson).$attrs.text))
      console.log('tabContentModifier_0100 tabBar: ' + JSON.stringify(JSON.parse(strJson).$attrs.tabBar))
      expect(JSON.parse(strJson).$attrs.text).assertEqual('文本1');
      done();
    });

    /**
     * @tc.name   tabContentModifier_0200
     * @tc.number SUB_ARKUI_TABCONTENT_MODIFIER_PARAM_0200
     * @tc.desc   Test TabContent Modifier indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabContentModifier_0200', Level.LEVEL0, async (done: Function) => {
      console.info("tabContentModifier_0200 start");
      let strJson = getInspectorByKey('tabContent_modifier_text');
      console.log('tabContentModifier_0200 tabBar: ' + JSON.stringify(JSON.parse(strJson).$attrs.tabBar))
      console.log('tabContentModifier_0200 indicator: ' + JSON.stringify(JSON.parse(strJson).$attrs.tabBar.indicator))
      expect(JSON.parse(strJson).$attrs.tabBar.indicator.width).assertEqual("40.00vp");
      expect(JSON.parse(strJson).$attrs.tabBar.indicator.height).assertEqual("10.00vp");
      done();
    });
  })
}
