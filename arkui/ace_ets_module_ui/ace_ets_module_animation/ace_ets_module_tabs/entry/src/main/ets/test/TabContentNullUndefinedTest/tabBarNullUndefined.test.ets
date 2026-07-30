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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function tabBarNullUndefined() {
  describe('tabBarNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("tabBarNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContentNullUndefined/tabBarNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabBarNullUndefined state pages:" + JSON.stringify(pages));
        if (!("tabBarNullUndefined" == pages.name)) {
          console.info("get tabBarNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabBarNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabBarNullUndefined page error:" + err);
      }
      console.info("tabBarNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   tabContentTabBar_0100
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_PARAM_0100
     * @tc.desc   Test TabContent tabBar property with string value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabContentTabBar_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[tabContentTabBar_0100] START');
      let strJson: string = getInspectorByKey('tabContent_tabBar_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabContentTabBar_0100] tabBar: " + JSON.stringify(obj.$attrs.tabBar));
      expect(obj.$attrs.tabBar).not().assertUndefined();
      console.info('[tabContentTabBar_0100] END');
      done();
    });

    /**
     * @tc.name   tabContentTabBar_0200
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_PARAM_0200
     * @tc.desc   Test TabContent tabBar property with empty string should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabContentTabBar_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[tabContentTabBar_0200] START');
      let strJsonCompare: string = getInspectorByKey('tabContent_tabBar_string');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('tabContent_tabBar_empty_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabContentTabBar_0200] tabBar: " + JSON.stringify(obj.$attrs.tabBar));
      expect(obj.$attrs.tabBar).not().assertUndefined();
      console.info('[tabContentTabBar_0200] END');
      done();
    });

    /**
     * @tc.name   tabContentTabBar_0300
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_PARAM_0300
     * @tc.desc   Test TabContent tabBar property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabContentTabBar_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[tabContentTabBar_0300] START');
      let strJsonCompare: string = getInspectorByKey('tabContent_tabBar_string');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('tabContent_tabBar_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabContentTabBar_0300] tabBar: " + JSON.stringify(obj.$attrs.tabBar));
      expect(obj.$attrs.tabBar).not().assertUndefined();
      console.info('[tabContentTabBar_0300] END');
      done();
    });

    /**
     * @tc.name   tabContentTabBar_0400
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_PARAM_0400
     * @tc.desc   Test TabContent tabBar property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabContentTabBar_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[tabContentTabBar_0400] START');
      let strJsonCompare: string = getInspectorByKey('tabContent_tabBar_string');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('tabContent_tabBar_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabContentTabBar_0400] tabBar: " + JSON.stringify(obj.$attrs.tabBar));
      expect(obj.$attrs.tabBar).not().assertUndefined();
      console.info('[tabContentTabBar_0400] END');
      done();
    });
  });
}