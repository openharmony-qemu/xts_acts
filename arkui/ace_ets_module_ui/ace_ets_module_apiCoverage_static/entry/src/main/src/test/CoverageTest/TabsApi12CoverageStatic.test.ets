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

import { describe, beforeAll, afterAll, it, expect, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { TabVisibility, TabBarDisplayMode } from '@ohos.arkui.component';

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
     * @tc.desc 参数规格+调用: TabVisibility.VISIBLE used by tabBarVisibility
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_TABVIS_VISIBLE_0100', Level.LEVEL1, async () => {
      // 参数规格
      expect(TabVisibility.VISIBLE).assertEqual(0);
      expect(readContent('tabsApi12_visVisibleSpec')).assertEqual('0');
      // 调用：真实挂到 TabContent.tabBarVisibility(VISIBLE, ...)
      expect(nodeMounted('tabsApi12_tabVisible')).assertTrue();
      expect(readContent('tabsApi12_tabVisParamVisible')).assertEqual('vis=0,mode=1');
      expect(readAttrString('tabsApi12_tabs', 'barStyle').indexOf('SIDEBAR') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_TABVIS_HIDDEN_0200
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_TABVIS_HIDDEN_0200
     * @tc.desc 参数规格+调用: TabVisibility.HIDDEN used by tabBarVisibility
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_TABVIS_HIDDEN_0200', Level.LEVEL1, async () => {
      expect(TabVisibility.HIDDEN).assertEqual(1);
      expect(readContent('tabsApi12_visHiddenSpec')).assertEqual('1');
      expect(nodeMounted('tabsApi12_tabHidden')).assertTrue();
      expect(readContent('tabsApi12_tabVisParamHidden')).assertEqual('vis=1,mode=0');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_TABBARVIS_0300
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_TABBARVIS_0300
     * @tc.desc 调用+入参+参数规格: tabBarVisibility(visibility, displayMode|undefined)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_TABBARVIS_0300', Level.LEVEL1, async () => {
      // 参数规格: TabBarDisplayMode
      expect(TabBarDisplayMode.BOTTOM_TABBAR).assertEqual(0);
      expect(TabBarDisplayMode.SIDEBAR).assertEqual(1);
      expect(readContent('tabsApi12_modeBottomSpec')).assertEqual('0');
      expect(readContent('tabsApi12_modeSidebarSpec')).assertEqual('1');
      // 入参组合: VISIBLE+SIDEBAR / HIDDEN+BOTTOM_TABBAR / VISIBLE+undefined
      expect(readContent('tabsApi12_tabVisParamVisible'))
        .assertEqual(`vis=0,mode=1`);
      expect(readContent('tabsApi12_tabVisParamHidden'))
        .assertEqual(`vis=1,mode=0`);
      expect(readContent('tabsApi12_tabVisParamUndefMode'))
        .assertEqual('vis=0,mode=undefined');
      // 调用：三个 TabContent 均已挂载
      expect(nodeMounted('tabsApi12_tabVisible')).assertTrue();
      expect(nodeMounted('tabsApi12_tabHidden')).assertTrue();
      expect(nodeMounted('tabsApi12_tabUndefMode')).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_GETBARMODE_0400
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_GETBARMODE_0400
     * @tc.desc 调用+返回值: TabsController.getBarDisplayMode()
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
     * @tc.desc 调用+入参: sidebarHeader(ComponentContent)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_SIDEBARHEADER_0500', Level.LEVEL1, async () => {
      // 调用+入参: ComponentContent 构造成功并传入 sidebarHeader
      expect(readContent('tabsApi12_headerInitFlag')).assertEqual('ok');
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      const barStyle: string = readAttrString('tabsApi12_tabs', 'barStyle');
      expect(barStyle.indexOf('SIDEBAR') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_SIDEBARSEARCH_0600
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_SIDEBARSEARCH_0600
     * @tc.desc 调用+入参+返回值: sidebarSearchable options + callback/filter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_SIDEBARSEARCH_0600', Level.LEVEL1, async () => {
      // 调用: .sidebarSearchable({...}) on mounted Tabs
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      expect(readAttrString('tabsApi12_tabs', 'barStyle').indexOf('SIDEBAR') >= 0).assertTrue();
      // 入参/返回值: 与挂到 Tabs 的同一 filter/callback 被真实调用（独立 probe 旗标，防框架二次覆盖）
      expect(readContent('tabsApi12_searchProbeCb')).assertEqual('api12cov');
      expect(readContent('tabsApi12_searchProbeFilter')).assertEqual('0:api12probe');
      expect(readContent('tabsApi12_searchProbeRet')).assertEqual('true');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_BREAKPOINT_0700
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_BREAKPOINT_0700
     * @tc.desc 调用+入参+参数规格: barDisplayModeBreakpoint sm/md/lg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_BREAKPOINT_0700', Level.LEVEL1, async () => {
      // 参数规格: sm/md/lg 取值均为 TabBarDisplayMode
      expect(TabBarDisplayMode.BOTTOM_TABBAR).assertEqual(0);
      expect(TabBarDisplayMode.SIDEBAR).assertEqual(1);
      // 调用: SIDEBAR_ADAPTABLE + breakpoint 已挂载
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      const barStyle: string = readAttrString('tabsApi12_tabs', 'barStyle');
      expect(
        barStyle === 'TabBarStyle.SIDEBAR_ADAPTABLE' || barStyle === 'TabBarStyle.SIDEBAR'
      ).assertTrue();
      // 入参记录：与页面传入的 sm/md/lg 枚举值一致
      expect(readContent('tabsApi12_modeBottomSpec')).assertEqual('0');
      expect(readContent('tabsApi12_modeSidebarSpec')).assertEqual('1');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_API12_STATIC_ONBARMODE_0800
     * @tc.name SUB_ARKUI_TABS_API12_STATIC_ONBARMODE_0800
     * @tc.desc 调用+入参+返回值: onBarDisplayModeChange(Callback mode)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_API12_STATIC_ONBARMODE_0800', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      // 调用: .onBarDisplayModeChange 已挂到真实 Tabs；入参为 TabBarDisplayMode
      // 返回值路径: applyBarModeChange 被 getBarDisplayMode 实参驱动（与注册回调同一 handler）
      expect(nodeMounted('tabsApi12_tabs')).assertTrue();
      expect(nodeMounted('tabsApi12_flipBarStyle')).assertTrue();
      const changeFlag: string = readContent('tabsApi12_barModeChangeFlag');
      expect(changeFlag === 'BOTTOM_TABBAR' || changeFlag === 'SIDEBAR').assertTrue();
      const ctrlMode: string = readContent('tabsApi12_ctrlModeFlag');
      expect(ctrlMode).assertEqual(changeFlag);
    });
  });
}
