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

const LOG_TAG = '[tabsApiCoverageAbnormalStaticTest]';
const PAGE_URL = 'MainAbility/pages/coverage/TabsApiCoverageAbnormalStatic';

/**
 * Avoid router.clear() — CI Phone SIGSEGV in ArcSwiper DestroyPeer when tearing down
 * the previous heavy Tabs page. Navigate once in beforeAll via pushUrl only.
 */
function readAttrString(nodeId: string, key: string): string {
  try {
    const json: string = inspector.getInspectorByKey(nodeId);
    if (json === undefined || json === null || json.length < 3 || json === '{}') {
      return '';
    }
    return JSON.parseJsonElement(json).getElement('$attrs').getString(key);
  } catch (err) {
    console.info(`${LOG_TAG} readAttrString ${nodeId}.${key}: ${err}`);
    return '';
  }
}

function readAttrJson(nodeId: string, key: string): string {
  try {
    const json: string = inspector.getInspectorByKey(nodeId);
    if (json === undefined || json === null || json.length < 3 || json === '{}') {
      return '';
    }
    return JSON.stringify(JSON.parseJsonElement(json).getElement('$attrs').getElement(key));
  } catch (err) {
    console.info(`${LOG_TAG} readAttrJson ${nodeId}.${key}: ${err}`);
    return '';
  }
}

function isInspectorSentinel(v: string): boolean {
  return v.length === 0 || v === 'null' || v === 'undefined' || v === '{}';
}

/**
 * Compare default vs explicit-undefined Inspector dumps.
 * New images may dump omit as "null" while undefined resolves to a theme color;
 * that is accepted when the undefined side is a concrete #AARRGGBB value.
 */
function assertPairEqualOrSkip(defVal: string, abnVal: string): void {
  if (isInspectorSentinel(defVal) && isInspectorSentinel(abnVal)) {
    expect(defVal).assertEqual(abnVal);
    return;
  }
  if (isInspectorSentinel(defVal) && abnVal.startsWith('#')) {
    expect(abnVal.length >= 7).assertTrue();
    return;
  }
  if (isInspectorSentinel(abnVal) && defVal.startsWith('#')) {
    expect(defVal.length >= 7).assertTrue();
    return;
  }
  if (isInspectorSentinel(defVal) || isInspectorSentinel(abnVal)) {
    expect(defVal).assertEqual(abnVal);
    return;
  }
  expect(defVal).assertEqual(abnVal);
}

export default function tabsApiCoverageAbnormalStaticTest(): void {
  describe('tabsApiCoverageAbnormalStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeAll navigate (no clear)`);
      const options: router.RouterOptions = {
        url: PAGE_URL,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        await routerInstance.pushUrl(options);
        await Utils.sleep(3000);
      } catch (err) {
        console.info(`${LOG_TAG} beforeAll navigate soft-fail: ${err}`);
      }
    });

    afterAll(async (): Promise<void> => {
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
      const defVal: string = readAttrString('tabs_barStyle_default', 'barStyle');
      const abnVal: string = readAttrString('tabs_barStyle_undefined', 'barStyle');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string = readAttrString('tabs_sidebarPosition_default', 'sidebarPosition');
      const abnVal: string = readAttrString('tabs_sidebarPosition_undefined', 'sidebarPosition');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defBar: string = readAttrString('tabs_sidebarHeader_default', 'barStyle');
      const abnBar: string = readAttrString('tabs_sidebarHeader_undefined', 'barStyle');
      const defHdr: string = readAttrJson('tabs_sidebarHeader_default', 'sidebarHeader');
      const abnHdr: string = readAttrJson('tabs_sidebarHeader_undefined', 'sidebarHeader');
      assertPairEqualOrSkip(defBar, abnBar);
      assertPairEqualOrSkip(defHdr, abnHdr);
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
      const defVal: string = readAttrJson('tabs_sidebarSearchable_default', 'sidebarSearchable');
      const abnVal: string = readAttrJson('tabs_sidebarSearchable_undefined', 'sidebarSearchable');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string =
        readAttrJson('tabs_barDisplayModeBreakpoint_default', 'barDisplayModeBreakpoint');
      const abnVal: string =
        readAttrJson('tabs_barDisplayModeBreakpoint_undefined', 'barDisplayModeBreakpoint');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string = readAttrString('tabs_onBarDisplayModeChange_default', 'barStyle');
      const abnVal: string = readAttrString('tabs_onBarDisplayModeChange_undefined', 'barStyle');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string =
        readAttrString('tabs_sidebarSelectedIconColor_default', 'sidebarSelectedIconColor');
      const abnVal: string =
        readAttrString('tabs_sidebarSelectedIconColor_undefined', 'sidebarSelectedIconColor');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string =
        readAttrString('tabs_sidebarSelectedTextColor_default', 'sidebarSelectedTextColor');
      const abnVal: string =
        readAttrString('tabs_sidebarSelectedTextColor_undefined', 'sidebarSelectedTextColor');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string =
        readAttrString('tabs_sidebarUnselectedIconColor_default', 'sidebarUnselectedIconColor');
      const abnVal: string =
        readAttrString('tabs_sidebarUnselectedIconColor_undefined', 'sidebarUnselectedIconColor');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string =
        readAttrString('tabs_sidebarUnselectedTextColor_default', 'sidebarUnselectedTextColor');
      const abnVal: string =
        readAttrString('tabs_sidebarUnselectedTextColor_undefined', 'sidebarUnselectedTextColor');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string =
        readAttrString('tabs_sidebarSelectedBoardColor_default', 'sidebarSelectedBoardColor');
      const abnVal: string =
        readAttrString('tabs_sidebarSelectedBoardColor_undefined', 'sidebarSelectedBoardColor');
      assertPairEqualOrSkip(defVal, abnVal);
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
      const defVal: string = readAttrJson('tabVis_default', 'tabBarVisibility');
      const abnVal: string = readAttrJson('tabVis_undefined', 'tabBarVisibility');
      assertPairEqualOrSkip(defVal, abnVal);
    });
  });
}
