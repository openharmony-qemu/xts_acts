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

const LOG_TAG = '[tabsApiCoverageAbnormalStaticTest]';
const PAGE_URL = 'MainAbility/pages/coverage/TabsApiCoverageAbnormalStatic';

export default function tabsApiCoverageAbnormalStaticTest(): void {
  describe('tabsApiCoverageAbnormalStaticTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeEach start`);
      const options: router.RouterOptions = {
        url: PAGE_URL,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pages = routerInstance.getState();
        if (pages.name !== 'TabsApiCoverageAbnormalStatic') {
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

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BARSTYLE_0100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BARSTYLE_0100
     * @tc.desc Cover Tabs BARSTYLE undefined smoke on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BARSTYLE_0100', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('tabs_barStyle_undefined');
      expect(strJson.length > 2).assertTrue();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARPOS_0200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARPOS_0200
     * @tc.desc Cover Tabs SIDEBARPOS undefined smoke on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARPOS_0200', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('tabs_sidebarPosition_undefined');
      expect(strJson.length > 2).assertTrue();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARHEADER_0300
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARHEADER_0300
     * @tc.desc Cover Tabs SIDEBARHEADER undefined smoke on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARHEADER_0300', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('tabs_sidebarHeader_undefined');
      expect(strJson.length > 2).assertTrue();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARSEARCH_0400
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARSEARCH_0400
     * @tc.desc Cover Tabs SIDEBARSEARCH undefined smoke on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARSEARCH_0400', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('tabs_sidebarSearchable_undefined');
      expect(strJson.length > 2).assertTrue();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BREAKPOINT_0500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BREAKPOINT_0500
     * @tc.desc Cover Tabs BREAKPOINT undefined smoke on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BREAKPOINT_0500', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('tabs_barDisplayModeBreakpoint_undefined');
      expect(strJson.length > 2).assertTrue();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_ONBARMODE_0600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_ONBARMODE_0600
     * @tc.desc Cover Tabs ONBARMODE undefined smoke on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_ONBARMODE_0600', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('tabs_onBarDisplayModeChange_undefined');
      expect(strJson.length > 2).assertTrue();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELICON_0700
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELICON_0700
     * @tc.desc Cover Tabs sidebarSelectedIconColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELICON_0700', Level.LEVEL0, async (): Promise<void> => {
      await Utils.sleep(800);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELTEXT_0800
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELTEXT_0800
     * @tc.desc Cover Tabs sidebarSelectedTextColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELTEXT_0800', Level.LEVEL0, async (): Promise<void> => {
      await Utils.sleep(800);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELICON_0900
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELICON_0900
     * @tc.desc Cover Tabs sidebarUnselectedIconColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELICON_0900', Level.LEVEL0, async (): Promise<void> => {
      await Utils.sleep(800);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELTEXT_1000
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELTEXT_1000
     * @tc.desc Cover Tabs sidebarUnselectedTextColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELTEXT_1000', Level.LEVEL0, async (): Promise<void> => {
      await Utils.sleep(800);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELBOARD_1100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELBOARD_1100
     * @tc.desc Cover Tabs sidebarSelectedBoardColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELBOARD_1100', Level.LEVEL0, async (): Promise<void> => {
      await Utils.sleep(800);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_TABVIS_1200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_TABVIS_1200
     * @tc.desc Cover Tabs TABVIS undefined smoke on static
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_TABVIS_1200', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('tabVis_undefined');
      expect(strJson.length > 2).assertTrue();
    });
  });
}
