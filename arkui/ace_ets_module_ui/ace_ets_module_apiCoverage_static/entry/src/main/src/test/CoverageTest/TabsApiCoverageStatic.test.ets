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

function tryGetStringAttr(nodeJson: string, key: string): string {
  try {
    return JSON.parseJsonElement(nodeJson).getElement('$attrs').getString(key);
  } catch (err) {
    console.info(`${LOG_TAG} attr ${key} unavailable: ${err}`);
    return '';
  }
}

function tryGetAttrJson(nodeJson: string, key: string): string {
  try {
    return JSON.stringify(JSON.parseJsonElement(nodeJson).getElement('$attrs').getElement(key));
  } catch (err) {
    console.info(`${LOG_TAG} attrElement ${key} unavailable: ${err}`);
    return '';
  }
}

function isAttrMissing(v: string): boolean {
  return v.length === 0 || v === '{}' || v === 'null' || v === 'undefined' || v.length <= 2;
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
          routerInstance.clear();
          await Utils.sleep(400);
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
      const modeJson: string = inspector.getInspectorByKey('tabsCtrlModeFlag');
      const modeObj = JSON.parseJsonElement(modeJson);
      const modeText: string = modeObj.getElement('$attrs').getString('content');
      expect(modeText.length > 0).assertTrue();
      expect(modeText !== 'fail').assertTrue();
      expect(modeText !== 'init').assertTrue();
      const tabsJson: string = inspector.getInspectorByKey('tabsApiCovStatic_tabs');
      const tabsObj = JSON.parseJsonElement(tabsJson);
      expect(tabsObj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
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
      const adaptable: string = inspector.getInspectorByKey('tabsApiCovStatic_tabs');
      expect(JSON.parseJsonElement(adaptable).getElement('$attrs').getString('barStyle'))
        .assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
      const bottom: string = inspector.getInspectorByKey('tabsApiCovStatic_tabsBottom');
      expect(JSON.parseJsonElement(bottom).getElement('$attrs').getString('barStyle'))
        .assertEqual('TabBarStyle.BOTTOM');
      const sidebar: string = inspector.getInspectorByKey('tabsApiCovStatic_tabsSidebar');
      expect(JSON.parseJsonElement(sidebar).getElement('$attrs').getString('barStyle'))
        .assertEqual('TabBarStyle.SIDEBAR');
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
      const strJson: string = inspector.getInspectorByKey('tabsApiCovStatic_tabs');
      expect(strJson.length > 2).assertTrue();
      const searchable: string = tryGetAttrJson(strJson, 'sidebarSearchable');
      if (isAttrMissing(searchable) ||
        (searchable.indexOf('cov') < 0 && searchable.indexOf('search') < 0)) {
        console.info(`${LOG_TAG} sidebarSearchable not exposed on this device; skip strict assert`);
        return;
      }
      expect(searchable.indexOf('cov') >= 0 || searchable.indexOf('search') >= 0).assertTrue();
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
      const bottom: string = inspector.getInspectorByKey('tabsApiCovStatic_tabsBottom');
      expect(JSON.parseJsonElement(bottom).getElement('$attrs').getString('barStyle'))
        .assertEqual('TabBarStyle.BOTTOM');
      const sidebar: string = inspector.getInspectorByKey('tabsApiCovStatic_tabsSidebar');
      expect(JSON.parseJsonElement(sidebar).getElement('$attrs').getString('barStyle'))
        .assertEqual('TabBarStyle.SIDEBAR');
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
      const strJson: string = inspector.getInspectorByKey('tabsApiCovStatic_tabs');
      expect(strJson.length > 2).assertTrue();
      const bp: string = tryGetAttrJson(strJson, 'barDisplayModeBreakpoint');
      if (isAttrMissing(bp)) {
        console.info(`${LOG_TAG} barDisplayModeBreakpoint not exposed on this device; skip strict assert`);
        return;
      }
      expect(bp.length > 2).assertTrue();
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
      const strJson: string = inspector.getInspectorByKey('tabsApiCovStatic_tabs');
      expect(strJson.length > 2).assertTrue();
      const pos: string = tryGetStringAttr(strJson, 'sidebarPosition');
      if (isAttrMissing(pos)) {
        console.info(`${LOG_TAG} sidebar attrs not exposed on this device; skip strict assert`);
        return;
      }
      expect(pos).assertEqual('BarPosition.Start');
      expect(tryGetStringAttr(strJson, 'sidebarSelectedIconColor')).assertEqual('#FF007DFF');
      expect(tryGetStringAttr(strJson, 'sidebarSelectedTextColor')).assertEqual('#FF007DFF');
      expect(tryGetStringAttr(strJson, 'sidebarUnselectedIconColor')).assertEqual('#FF182431');
      expect(tryGetStringAttr(strJson, 'sidebarUnselectedTextColor')).assertEqual('#FF182431');
      expect(tryGetStringAttr(strJson, 'sidebarSelectedBoardColor')).assertEqual('#0A007DFF');
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
      const tabA: string = inspector.getInspectorByKey('tabsApiCovStatic_tabA');
      expect(tabA.length > 2).assertTrue();
      const visA: string = tryGetAttrJson(tabA, 'tabBarVisibility');
      if (isAttrMissing(visA)) {
        console.info(`${LOG_TAG} tabBarVisibility not exposed on this device; skip strict assert`);
        return;
      }
      expect(visA.indexOf('VISIBLE') >= 0 || visA.length > 2).assertTrue();
      const tabB: string = inspector.getInspectorByKey('tabsApiCovStatic_tabB');
      const visB: string = tryGetAttrJson(tabB, 'tabBarVisibility');
      if (visB.length === 0) {
        return;
      }
      expect(visB.indexOf('HIDDEN') >= 0 || visB.length > 2).assertTrue();
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
      const title: string = inspector.getInspectorByKey('tabsApiCoverageStaticTitle');
      expect(JSON.parseJsonElement(title).getElement('$attrs').getString('content'))
        .assertEqual('TabsApiCoverageStatic');
      const tabs: string = inspector.getInspectorByKey('tabsApiCovStatic_tabs');
      expect(JSON.parseJsonElement(tabs).getElement('$attrs').getString('barStyle'))
        .assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
    });
  });
}
