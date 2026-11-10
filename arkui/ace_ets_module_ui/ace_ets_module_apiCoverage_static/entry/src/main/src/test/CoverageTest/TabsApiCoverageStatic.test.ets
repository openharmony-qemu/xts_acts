'use static'
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[tabsApiCoverageStaticTest]';
const PAGE_URL = 'MainAbility/pages/coverage/TabsApiCoverageStatic';

function readContent(nodeId: string): string {
  const json: string = inspector.getInspectorByKey(nodeId);
  return JSON.parseJsonElement(json).getElement('$attrs').getString('content');
}

function readBarStyle(nodeId: string): string {
  const json: string = inspector.getInspectorByKey(nodeId);
  return JSON.parseJsonElement(json).getElement('$attrs').getString('barStyle');
}

function tryReadStringAttr(nodeId: string, key: string): string {
  try {
    const json: string = inspector.getInspectorByKey(nodeId);
    return JSON.parseJsonElement(json).getElement('$attrs').getString(key);
  } catch (err) {
    console.info(`${LOG_TAG} attr ${nodeId}.${key}: ${err}`);
    return '';
  }
}

export default function tabsApiCoverageStaticTest(): void {
  describe('tabsApiCoverageStaticTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeEach start`);
      const options: router.RouterOptions = {
        url: PAGE_URL,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        const pages = routerInstance.getState();
        if (pages.name !== 'TabsApiCoverageStatic') {
          await routerInstance.pushUrl(options);
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

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSCTRL_0100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSCTRL_0100
     * @tc.desc Cover TabsController.getBarDisplayMode on static via mounted Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSCTRL_0100', Level.LEVEL1, async () => {
      await Utils.sleep(1200);
      const modeText: string = readContent('tabsCtrlModeFlag');
      expect(modeText !== 'fail').assertTrue();
      expect(modeText !== 'init').assertTrue();
      expect(readBarStyle('tabsApiCovStatic_tabs')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_BARSTYLE_0200
     * @tc.desc Cover TabBarStyle BOTTOM/SIDEBAR/SIDEBAR_ADAPTABLE on static Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_BARSTYLE_0200', Level.LEVEL1, async () => {
      expect(readBarStyle('tabsApiCovStatic_tabs')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
      expect(readBarStyle('tabsApiCovStatic_tabsBottom')).assertEqual('TabBarStyle.BOTTOM');
      expect(readBarStyle('tabsApiCovStatic_tabsSidebar')).assertEqual('TabBarStyle.SIDEBAR');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_SIDEBARSEARCH_0300
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_SIDEBARSEARCH_0300
     * @tc.desc Cover TabsSidebarSearchableOptions applied on static Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_SIDEBARSEARCH_0300', Level.LEVEL1, async () => {
      expect(readContent('tabsSearchProbeFlag')).assertEqual('cov_search');
      expect(readBarStyle('tabsApiCovStatic_tabs')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_DISPLAYMODE_0400
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_DISPLAYMODE_0400
     * @tc.desc Cover TabBarDisplayMode via barStyle BOTTOM/SIDEBAR Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_DISPLAYMODE_0400', Level.LEVEL1, async () => {
      expect(readBarStyle('tabsApiCovStatic_tabsBottom')).assertEqual('TabBarStyle.BOTTOM');
      expect(readBarStyle('tabsApiCovStatic_tabsSidebar')).assertEqual('TabBarStyle.SIDEBAR');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_BREAKPOINT_0500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_BREAKPOINT_0500
     * @tc.desc Cover TabsBreakpointType sm/md/lg applied on static Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_BREAKPOINT_0500', Level.LEVEL1, async () => {
      expect(readContent('tabsBpProbeFlag')).assertEqual('sm_md_lg');
      expect(readBarStyle('tabsApiCovStatic_tabs')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSATTR_0600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSATTR_0600
     * @tc.desc Cover TabsAttribute sidebar colors/position on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABSATTR_0600', Level.LEVEL1, async () => {
      expect(readContent('tabsColorProbeFlag')).assertEqual('ok');
      expect(readBarStyle('tabsApiCovStatic_tabs')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
      const pos: string = tryReadStringAttr('tabsApiCovStatic_tabs', 'sidebarPosition');
      if (pos.length > 0 && pos !== 'null' && pos !== 'undefined') {
        expect(pos).assertEqual('BarPosition.Start');
      }
      const icon: string = tryReadStringAttr('tabsApiCovStatic_tabs', 'sidebarSelectedIconColor');
      if (icon.startsWith('#')) {
        expect(icon).assertEqual('#FF007DFF');
      }
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABVIS_0700
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABVIS_0700
     * @tc.desc Cover TabVisibility and tabBarVisibility on static TabContent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_TABVIS_0700', Level.LEVEL1, async () => {
      expect(readContent('tabsTabVisProbeFlag')).assertEqual('VISIBLE_HIDDEN');
      expect(readBarStyle('tabsApiCovStatic_tabs')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
      const tabA: string = inspector.getInspectorByKey('tabsApiCovStatic_tabA');
      expect(tabA.length > 0).assertTrue();
      const tabB: string = inspector.getInspectorByKey('tabsApiCovStatic_tabB');
      expect(tabB.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_EXTENDABLE_0800
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_EXTENDABLE_0800
     * @tc.desc Cover page title node after real Tabs mount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_EXTENDABLE_0800', Level.LEVEL1, async () => {
      expect(readContent('tabsApiCoverageStaticTitle')).assertEqual('TabsApiCoverageStatic');
      expect(readBarStyle('tabsApiCovStatic_tabs')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
    });
  });
}
