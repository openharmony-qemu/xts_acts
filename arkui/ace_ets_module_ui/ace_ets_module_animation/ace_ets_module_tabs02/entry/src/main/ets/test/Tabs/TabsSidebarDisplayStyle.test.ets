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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TabsSidebarDisplayStyleTest() {
  describe('TabsSidebarDisplayStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsSidebarDisplayStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsSidebarDisplayStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsSidebarDisplayStyle state pages:" + JSON.stringify(pages));
        if (!("TabsSidebarDisplayStyle" == pages.name)) {
          console.info("get TabsSidebarDisplayStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabsSidebarDisplayStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsSidebarDisplayStyle page error:" + err);
      }
      console.info("TabsSidebarDisplayStyle beforeEach end");
      done();
    });

    /**
     * @tc.name   tabsSidebarDisplayStyle_0100
     * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_PARAM_0100
     * @tc.desc   Test Tabs sidebarDisplayStyle with TabsSidebarDisplayStyle.EMBED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsSidebarDisplayStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsSidebarDisplayStyle_0100] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_sidebarDisplayStyle_embed');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsSidebarDisplayStyle_0100] sidebarDisplayStyle: " + JSON.stringify(obj.$attrs.sidebarDisplayStyle));

      expect(obj.$attrs.sidebarDisplayStyle).assertEqual('SidebarDisplayStyle.EMBED');
      console.info('[tabsSidebarDisplayStyle_0100] END');
      done();
    })

    /**
     * @tc.name   tabsSidebarDisplayStyle_0200
     * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_PARAM_0200
     * @tc.desc   Test Tabs sidebarDisplayStyle with TabsSidebarDisplayStyle.DISPLACE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsSidebarDisplayStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsSidebarDisplayStyle_0200] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_sidebarDisplayStyle_displace');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsSidebarDisplayStyle_0200] sidebarDisplayStyle: " + JSON.stringify(obj.$attrs.sidebarDisplayStyle));

      expect(obj.$attrs.sidebarDisplayStyle).assertEqual('SidebarDisplayStyle.DISPLACE');
      console.info('[tabsSidebarDisplayStyle_0200] END');
      done();
    })

    /**
     * @tc.name   tabsSidebarDisplayStyle_0300
     * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_PARAM_0300
     * @tc.desc   Test Tabs sidebarDisplayStyle default value when not set, should be EMBED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsSidebarDisplayStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsSidebarDisplayStyle_0300] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_sidebarDisplayStyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsSidebarDisplayStyle_0300] sidebarDisplayStyle: " + JSON.stringify(obj.$attrs.sidebarDisplayStyle));

      expect(obj.$attrs.sidebarDisplayStyle).assertEqual('SidebarDisplayStyle.EMBED');
      console.info('[tabsSidebarDisplayStyle_0300] END');
      done();
    })

    /**
     * @tc.name   tabsSidebarDisplayStyle_0400
     * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_PARAM_0400
     * @tc.desc   Test Tabs sidebarDisplayStyle with undefined, should restore to default EMBED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsSidebarDisplayStyle_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsSidebarDisplayStyle_0400] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_sidebarDisplayStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsSidebarDisplayStyle_0400] sidebarDisplayStyle: " + JSON.stringify(obj.$attrs.sidebarDisplayStyle));

      expect(obj.$attrs.sidebarDisplayStyle).assertEqual('SidebarDisplayStyle.EMBED');
      console.info('[tabsSidebarDisplayStyle_0400] END');
      done();
    })

    /**
     * @tc.name   tabsSidebarDisplayStyle_0500
     * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_PARAM_0500
     * @tc.desc   Test Tabs sidebarDisplayStyle with null, should restore to default EMBED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsSidebarDisplayStyle_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsSidebarDisplayStyle_0500] START');
      await CommonFunc.sleep(500);

      let strJsonDefault: string = getInspectorByKey('tabs_sidebarDisplayStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJson: string = getInspectorByKey('tabs_sidebarDisplayStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsSidebarDisplayStyle_0500] sidebarDisplayStyle: " + JSON.stringify(obj.$attrs.sidebarDisplayStyle));

      expect(obj.$attrs.sidebarDisplayStyle).not().assertUndefined();
      expect(obj.$attrs.sidebarDisplayStyle).assertEqual(objDefault.$attrs.sidebarDisplayStyle);
      console.info('[tabsSidebarDisplayStyle_0500] END');
      done();
    })
  })
}
