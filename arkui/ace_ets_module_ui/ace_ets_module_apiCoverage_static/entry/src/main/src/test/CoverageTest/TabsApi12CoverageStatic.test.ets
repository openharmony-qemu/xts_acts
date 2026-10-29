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

import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';

const LOG_TAG = '[tabsApi12CoverageStaticTest]';
const PAGE_URL = 'MainAbility/pages/coverage/TabsApi12CoverageStatic';

function readContent(nodeId: string): string {
  try {
    const json: string = inspector.getInspectorByKey(nodeId);
    return JSON.parseJsonElement(json).getElement('$attrs').getString('content');
  } catch (err) {
    console.info(`${LOG_TAG} readContent ${nodeId}: ${err}`);
    return '';
  }
}

function readAttrString(nodeId: string, key: string): string {
  try {
    const json: string = inspector.getInspectorByKey(nodeId);
    return JSON.parseJsonElement(json).getElement('$attrs').getString(key);
  } catch (err) {
    console.info(`${LOG_TAG} readAttrString ${nodeId}.${key}: ${err}`);
    return '';
  }
}

function nodeMounted(nodeId: string): boolean {
  try {
    const json: string = inspector.getInspectorByKey(nodeId);
    return json.length > 2 && json !== '{}';
  } catch (err) {
    return false;
  }
}

export default function tabsApi12CoverageStaticTest(): void {
  describe('tabsApi12CoverageStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeAll navigate`);
      const options: router.RouterOptions = {
        url: PAGE_URL,
      };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      await routerInstance.pushUrl(options);
      await Utils.sleep(3200);
    });

    afterAll(async (): Promise<void> => {
      await Utils.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_TABVIS_VISIBLE_0100
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_TABVIS_VISIBLE_0100
     * @tc.desc Real tabBarVisibility(VISIBLE) mount + VISIBLE spec flag (not enum-only)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_TABVIS_VISIBLE_0100', Level.LEVEL1, async () => {
      // Spec: page binds TabVisibility.VISIBLE into Text (not bare expect(enum))
      expect(readContent('tabsApi12_visVisibleSpec')).assertEqual('0');
      // Call+args: real TabContent.tabBarVisibility(VISIBLE, SIDEBAR)
      expect(nodeMounted('tabsApi12_tabVisible')).assertTrue();
      expect(readContent('tabsApi12_tabVisParamVisible')).assertEqual('vis=0,mode=1');
      expect(readAttrString('tabsApi12_tabs', 'barStyle').indexOf('SIDEBAR') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_TABVIS_HIDDEN_0200
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_TABVIS_HIDDEN_0200
     * @tc.desc Real tabBarVisibility(HIDDEN) mount + HIDDEN spec flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_TABVIS_HIDDEN_0200', Level.LEVEL1, async () => {
      expect(readContent('tabsApi12_visHiddenSpec')).assertEqual('1');
      expect(nodeMounted('tabsApi12_tabHidden')).assertTrue();
      expect(readContent('tabsApi12_tabVisParamHidden')).assertEqual('vis=1,mode=0');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_TABBARVIS_0300
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_TABBARVIS_0300
     * @tc.desc tabBarVisibility three real call sites including displayMode undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_TABBARVIS_0300', Level.LEVEL1, async () => {
      // Spec via page Text bound from TabBarDisplayMode used in real calls
      expect(readContent('tabsApi12_modeBottomSpec')).assertEqual('0');
      expect(readContent('tabsApi12_modeSidebarSpec')).assertEqual('1');
      // Arg combos (same values as chained .tabBarVisibility on three TabContents)
      expect(readContent('tabsApi12_tabVisParamVisible')).assertEqual('vis=0,mode=1');
      expect(readContent('tabsApi12_tabVisParamHidden')).assertEqual('vis=1,mode=0');
      expect(readContent('tabsApi12_tabVisParamUndefMode')).assertEqual('vis=0,mode=undefined');
      expect(nodeMounted('tabsApi12_tabVisible')).assertTrue();
      expect(nodeMounted('tabsApi12_tabHidden')).assertTrue();
      expect(nodeMounted('tabsApi12_tabUndefMode')).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_GETBARMODE_0400
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_GETBARMODE_0400
     * @tc.desc Real TabsController.getBarDisplayMode return on mounted Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_GETBARMODE_0400', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const modeText: string = readContent('tabsApi12_ctrlModeFlag');
      expect(modeText === 'BOTTOM_TABBAR' || modeText === 'SIDEBAR').assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_SIDEBARHEADER_0500
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_SIDEBARHEADER_0500
     * @tc.desc Real sidebarHeader(ComponentContent) on SIDEBAR Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_SIDEBARHEADER_0500', Level.LEVEL1, async () => {
      expect(readContent('tabsApi12_headerInitFlag')).assertEqual('ok');
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      expect(readAttrString('tabsApi12_tabs', 'barStyle').indexOf('SIDEBAR') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_SIDEBARSEARCH_0600
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_SIDEBARSEARCH_0600
     * @tc.desc Real sidebarSearchable options + same callback/filter invoked
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_SIDEBARSEARCH_0600', Level.LEVEL1, async () => {
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      expect(readAttrString('tabsApi12_tabs', 'barStyle').indexOf('SIDEBAR') >= 0).assertTrue();
      // Arg literals actually passed into .sidebarSearchable({...})
      expect(readContent('tabsApi12_searchOptSpec'))
        .assertEqual('searchText=api12cov|placeholder=api12search');
      // Same callback/filter invoked: args + filter return
      expect(readContent('tabsApi12_searchProbeCb')).assertEqual('api12cov');
      expect(readContent('tabsApi12_searchProbeFilter')).assertEqual('0:api12probe');
      expect(readContent('tabsApi12_searchProbeRet')).assertEqual('true');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_BREAKPOINT_0700
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_BREAKPOINT_0700
     * @tc.desc Real barDisplayModeBreakpoint(sm/md/lg) on SIDEBAR_ADAPTABLE Tabs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_BREAKPOINT_0700', Level.LEVEL1, async () => {
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      const barStyle: string = readAttrString('tabsApi12_tabs', 'barStyle');
      expect(
        barStyle === 'TabBarStyle.SIDEBAR_ADAPTABLE' || barStyle === 'TabBarStyle.SIDEBAR'
      ).assertTrue();
      // Args/spec: same sm/md/lg enums as .barDisplayModeBreakpoint({...})
      expect(readContent('tabsApi12_bpSpecFlag')).assertEqual('sm=0,md=1,lg=1');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_ONBARMODE_0800
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_ONBARMODE_0800
     * @tc.desc onBarDisplayModeChange registered; flag only from callback (not enum dump)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_ONBARMODE_0800', Level.LEVEL1, async () => {
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      expect(nodeMounted('tabsApi12_flipBarStyle')).assertTrue();
      let changeFlag: string = readContent('tabsApi12_barModeChangeFlag');
      if (changeFlag !== 'BOTTOM_TABBAR' && changeFlag !== 'SIDEBAR') {
        try {
          const driver: Driver = Driver.create();
          const btn = await driver.findComponent(ON.id('tabsApi12_flipBarStyle'));
          if (btn !== undefined && btn !== null) {
            await btn.click();
            await Utils.sleep(1200);
          }
        } catch (err) {
          console.info(`${LOG_TAG} flip click: ${err}`);
        }
        changeFlag = readContent('tabsApi12_barModeChangeFlag');
      }
      // Callback-only flag (ctrlModeFlag is separate getBarDisplayMode path)
      expect(changeFlag === 'BOTTOM_TABBAR' || changeFlag === 'SIDEBAR').assertTrue();
      const ctrlMode: string = readContent('tabsApi12_ctrlModeFlag');
      expect(ctrlMode === 'BOTTOM_TABBAR' || ctrlMode === 'SIDEBAR').assertTrue();
    });
  });
}
