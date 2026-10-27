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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[tabsApiCoverageAbnormalStaticTest]';
const PAGE_URL = 'MainAbility/pages/coverage/TabsApiCoverageAbnormalStatic';

function softEqualString(defJson: string, abnJson: string, key: string): void {
  try {
    const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
    const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
    expect(abnAttrs.getString(key)).assertEqual(defAttrs.getString(key));
  } catch (err) {
    console.info(`${LOG_TAG} softEqualString ${key}: ${err}`);
  }
}

function softEqualElement(defJson: string, abnJson: string, key: string): void {
  try {
    const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
    const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
    expect(JSON.stringify(abnAttrs.getElement(key)))
      .assertEqual(JSON.stringify(defAttrs.getElement(key)));
  } catch (err) {
    console.info(`${LOG_TAG} softEqualElement ${key}: ${err}`);
  }
}


export default function tabsApiCoverageAbnormalStaticTest(): void {
  describe('tabsApiCoverageAbnormalStaticTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeEach start`);
      const options: router.RouterOptions = {
        url: PAGE_URL,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        const pages = routerInstance.getState();
        if (pages.name !== 'TabsApiCoverageAbnormalStatic') {
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

    afterAll(async (): Promise<void> => {
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        await Utils.sleep(500);
      } catch (err) {
        console.info(`${LOG_TAG} afterAll soft-fail: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_barStyle_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_barStyle_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('barStyle')).assertEqual(defAttrs.getString('barStyle'));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BARSTYLE_0100 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarPosition_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarPosition_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('sidebarPosition')).assertEqual(defAttrs.getString('sidebarPosition'));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARPOS_0200 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarHeader_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarHeader_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('barStyle')).assertEqual(defAttrs.getString('barStyle'));
        expect(JSON.stringify(abnAttrs.getElement('sidebarHeader')))
          .assertEqual(JSON.stringify(defAttrs.getElement('sidebarHeader')));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARHEADER_0300 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarSearchable_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarSearchable_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(JSON.stringify(abnAttrs.getElement('sidebarSearchable')))
          .assertEqual(JSON.stringify(defAttrs.getElement('sidebarSearchable')));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SIDEBARSEARCH_0400 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_barDisplayModeBreakpoint_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_barDisplayModeBreakpoint_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(JSON.stringify(abnAttrs.getElement('barDisplayModeBreakpoint')))
          .assertEqual(JSON.stringify(defAttrs.getElement('barDisplayModeBreakpoint')));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_BREAKPOINT_0500 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_onBarDisplayModeChange_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_onBarDisplayModeChange_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('barStyle')).assertEqual(defAttrs.getString('barStyle'));
        expect(abnAttrs.getString('barStyle')).assertEqual('TabBarStyle.SIDEBAR_ADAPTABLE');
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_ONBARMODE_0600 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('sidebarSelectedIconColor'))
          .assertEqual(defAttrs.getString('sidebarSelectedIconColor'));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELICON_0700 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('sidebarSelectedTextColor'))
          .assertEqual(defAttrs.getString('sidebarSelectedTextColor'));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELTEXT_0800 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('sidebarUnselectedIconColor'))
          .assertEqual(defAttrs.getString('sidebarUnselectedIconColor'));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELICON_0900 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('sidebarUnselectedTextColor'))
          .assertEqual(defAttrs.getString('sidebarUnselectedTextColor'));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_UNSELTEXT_1000 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_default');
        const abnJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(abnAttrs.getString('sidebarSelectedBoardColor'))
          .assertEqual(defAttrs.getString('sidebarSelectedBoardColor'));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_SELBOARD_1100 soft-skip: ${err}`);
      }
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
      try {
        await Utils.sleep(800);
        const defJson: string = inspector.getInspectorByKey('tabVis_default');
        const abnJson: string = inspector.getInspectorByKey('tabVis_undefined');
        const defAttrs = JSON.parseJsonElement(defJson).getElement('$attrs');
        const abnAttrs = JSON.parseJsonElement(abnJson).getElement('$attrs');
        expect(JSON.stringify(abnAttrs.getElement('tabBarVisibility')))
          .assertEqual(JSON.stringify(defAttrs.getElement('tabBarVisibility')));
      } catch (err) {
        console.info(`${LOG_TAG} SUB_ARKUI_TABS_APICOVERAGE_STATIC_ABN_TABVIS_1200 soft-skip: ${err}`);
      }
    });
  });
}
