'use static';
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[tabsApiCoverageStaticTest]';
const PAGE_URL = 'MainAbility/pages/coverage/TabsApiCoverageStatic';


export default function tabsApiCoverageStaticTest(): void {
  describe('tabsApiCoverageStaticTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeEach start`);
      const options: router.RouterOptions = {
        url: PAGE_URL,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pages = routerInstance.getState();
        if (pages.name !== 'TabsApiCoverageStatic') {
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.info(`${LOG_TAG} beforeEach navigate soft-fail: ${err}`);
      }
    });

    afterEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} afterEach`);
      await Utils.sleep(300);
    });

    afterAll(async (): Promise<void> => {
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        await Utils.sleep(500);
      } catch (err) {
        console.info(`${LOG_TAG} afterAll clear soft-fail: ${err}`);
      }
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSCTRL_0100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSCTRL_0100
     * @tc.desc Cover TabsController.getBarDisplayMode on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSCTRL_0100', Level.LEVEL1, async () => {
      await Utils.sleep(1200);
      const strJson: string = inspector.getInspectorByKey('tabsCtrlFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_BARSTYLE_0200
     * @tc.desc Cover TabBarStyle enums on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_BARSTYLE_0200', Level.LEVEL1, async () => {
      const strJson: string = inspector.getInspectorByKey('tabBarStyleFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_SIDEBARSEARCH_0300
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_SIDEBARSEARCH_0300
     * @tc.desc Cover TabsSidebarSearchableOptions on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_SIDEBARSEARCH_0300', Level.LEVEL1, async () => {
      const strJson: string = inspector.getInspectorByKey('sidebarSearchFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_DISPLAYMODE_0400
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_DISPLAYMODE_0400
     * @tc.desc Cover TabBarDisplayMode on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_DISPLAYMODE_0400', Level.LEVEL1, async () => {
      const strJson: string = inspector.getInspectorByKey('displayModeFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_BREAKPOINT_0500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_BREAKPOINT_0500
     * @tc.desc Cover TabsBreakpointType sm/md/lg on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_BREAKPOINT_0500', Level.LEVEL1, async () => {
      const strJson: string = inspector.getInspectorByKey('breakpointFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSATTR_0600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSATTR_0600
     * @tc.desc Cover TabsAttribute sidebar APIs on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSATTR_0600', Level.LEVEL1, async () => {
      const strJson: string = inspector.getInspectorByKey('tabsAttrFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABVIS_0700
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABVIS_0700
     * @tc.desc Cover TabVisibility and tabBarVisibility on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABVIS_0700', Level.LEVEL1, async () => {
      const strJson: string = inspector.getInspectorByKey('tabVisibilityFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_EXTENDABLE_0800
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_EXTENDABLE_0800
     * @tc.desc Cover ExtendableComponent getUIContext/getUniqueId
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_EXTENDABLE_0800', Level.LEVEL1, async () => {
      const strJson: string = inspector.getInspectorByKey('extendableFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });
  });
}
