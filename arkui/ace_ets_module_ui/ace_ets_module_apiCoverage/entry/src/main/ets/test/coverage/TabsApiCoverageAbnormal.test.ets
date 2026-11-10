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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';

export default function tabsApiCoverageAbnormalTest() {
  describe('TabsApiCoverageAbnormalTest', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] TabsApiCoverageAbnormalTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/coverage/TabsApiCoverageAbnormal',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[ARKUI_DYN] TabsApiCoverageAbnormalTest push error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_BARSTYLE_0100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_BARSTYLE_0100
     * @tc.desc Cover Tabs barStyle with undefined equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_BARSTYLE_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_barStyle_default');
      let abnNode = getInspectorByKey('tabs_barStyle_undefined');
      expect(JSON.parse(abnNode).$attrs.barStyle).assertEqual(JSON.parse(defNode).$attrs.barStyle);
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_BARSTYLE_0200
     * @tc.desc Cover Tabs barStyle with null equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_BARSTYLE_0200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_barStyle_default');
      let abnNode = getInspectorByKey('tabs_barStyle_null');
      expect(JSON.parse(abnNode).$attrs.barStyle).assertEqual(JSON.parse(defNode).$attrs.barStyle);
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARPOS_0300
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARPOS_0300
     * @tc.desc Cover Tabs sidebarPosition with undefined equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARPOS_0300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_sidebarPosition_default');
      let abnNode = getInspectorByKey('tabs_sidebarPosition_undefined');
      expect(JSON.parse(abnNode).$attrs.sidebarPosition)
        .assertEqual(JSON.parse(defNode).$attrs.sidebarPosition);
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARPOS_0400
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARPOS_0400
     * @tc.desc Cover Tabs sidebarPosition with null equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARPOS_0400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_sidebarPosition_default');
      let abnNode = getInspectorByKey('tabs_sidebarPosition_null');
      expect(JSON.parse(abnNode).$attrs.sidebarPosition)
        .assertEqual(JSON.parse(defNode).$attrs.sidebarPosition);
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARHEADER_0500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARHEADER_0500
     * @tc.desc Cover Tabs sidebarHeader with undefined equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARHEADER_0500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_sidebarHeader_default');
      let abnNode = getInspectorByKey('tabs_sidebarHeader_undefined');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.sidebarHeader))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.sidebarHeader));
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARHEADER_0600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARHEADER_0600
     * @tc.desc Cover Tabs sidebarHeader with null equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARHEADER_0600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_sidebarHeader_default');
      let abnNode = getInspectorByKey('tabs_sidebarHeader_null');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.sidebarHeader))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.sidebarHeader));
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARSEARCH_0700
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARSEARCH_0700
     * @tc.desc Cover Tabs sidebarSearchable with undefined equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARSEARCH_0700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_sidebarSearchable_default');
      let abnNode = getInspectorByKey('tabs_sidebarSearchable_undefined');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.sidebarSearchable))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.sidebarSearchable));
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARSEARCH_0800
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARSEARCH_0800
     * @tc.desc Cover Tabs sidebarSearchable with null equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SIDEBARSEARCH_0800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_sidebarSearchable_default');
      let abnNode = getInspectorByKey('tabs_sidebarSearchable_null');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.sidebarSearchable))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.sidebarSearchable));
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_BREAKPOINT_0900
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_BREAKPOINT_0900
     * @tc.desc Cover Tabs barDisplayModeBreakpoint with undefined equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_BREAKPOINT_0900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_barDisplayModeBreakpoint_default');
      let abnNode = getInspectorByKey('tabs_barDisplayModeBreakpoint_undefined');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.barDisplayModeBreakpoint))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.barDisplayModeBreakpoint));
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_BREAKPOINT_1000
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_BREAKPOINT_1000
     * @tc.desc Cover Tabs barDisplayModeBreakpoint with null equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_BREAKPOINT_1000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_barDisplayModeBreakpoint_default');
      let abnNode = getInspectorByKey('tabs_barDisplayModeBreakpoint_null');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.barDisplayModeBreakpoint))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.barDisplayModeBreakpoint));
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_ONBARMODE_1100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_ONBARMODE_1100
     * @tc.desc Cover Tabs onBarDisplayModeChange with undefined equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_ONBARMODE_1100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_onBarDisplayModeChange_default');
      let abnNode = getInspectorByKey('tabs_onBarDisplayModeChange_undefined');
      expect(JSON.parse(abnNode).$attrs.barStyle).assertEqual(JSON.parse(defNode).$attrs.barStyle);
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_ONBARMODE_1200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_ONBARMODE_1200
     * @tc.desc Cover Tabs onBarDisplayModeChange with null equals default smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_ONBARMODE_1200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabs_onBarDisplayModeChange_default');
      let abnNode = getInspectorByKey('tabs_onBarDisplayModeChange_null');
      expect(JSON.parse(abnNode).$attrs.barStyle).assertEqual(JSON.parse(defNode).$attrs.barStyle);
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SELICON_1300
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SELICON_1300
     * @tc.desc Cover Tabs sidebarSelectedIconColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SELICON_1300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarSelectedIconColor_default');
      let node = getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      let abnVal = `${JSON.parse(node).$attrs.sidebarSelectedIconColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarSelectedIconColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SELICON_1400
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SELICON_1400
     * @tc.desc Cover Tabs sidebarSelectedIconColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SELICON_1400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarSelectedIconColor_default');
      let node = getInspectorByKey('tabs_sidebarSelectedIconColor_null');
      let abnVal = `${JSON.parse(node).$attrs.sidebarSelectedIconColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarSelectedIconColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SELTEXT_1500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SELTEXT_1500
     * @tc.desc Cover Tabs sidebarSelectedTextColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SELTEXT_1500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarSelectedTextColor_default');
      let node = getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      let abnVal = `${JSON.parse(node).$attrs.sidebarSelectedTextColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarSelectedTextColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SELTEXT_1600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SELTEXT_1600
     * @tc.desc Cover Tabs sidebarSelectedTextColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SELTEXT_1600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarSelectedTextColor_default');
      let node = getInspectorByKey('tabs_sidebarSelectedTextColor_null');
      let abnVal = `${JSON.parse(node).$attrs.sidebarSelectedTextColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarSelectedTextColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELICON_1700
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELICON_1700
     * @tc.desc Cover Tabs sidebarUnselectedIconColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELICON_1700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarUnselectedIconColor_default');
      let node = getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      let abnVal = `${JSON.parse(node).$attrs.sidebarUnselectedIconColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarUnselectedIconColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELICON_1800
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELICON_1800
     * @tc.desc Cover Tabs sidebarUnselectedIconColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELICON_1800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarUnselectedIconColor_default');
      let node = getInspectorByKey('tabs_sidebarUnselectedIconColor_null');
      let abnVal = `${JSON.parse(node).$attrs.sidebarUnselectedIconColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarUnselectedIconColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELTEXT_1900
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELTEXT_1900
     * @tc.desc Cover Tabs sidebarUnselectedTextColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELTEXT_1900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarUnselectedTextColor_default');
      let node = getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      let abnVal = `${JSON.parse(node).$attrs.sidebarUnselectedTextColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarUnselectedTextColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELTEXT_2000
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELTEXT_2000
     * @tc.desc Cover Tabs sidebarUnselectedTextColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_UNSELTEXT_2000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarUnselectedTextColor_default');
      let node = getInspectorByKey('tabs_sidebarUnselectedTextColor_null');
      let abnVal = `${JSON.parse(node).$attrs.sidebarUnselectedTextColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarUnselectedTextColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SELBOARD_2100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SELBOARD_2100
     * @tc.desc Cover Tabs sidebarSelectedBoardColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SELBOARD_2100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarSelectedBoardColor_default');
      let node = getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      let abnVal = `${JSON.parse(node).$attrs.sidebarSelectedBoardColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarSelectedBoardColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_SELBOARD_2200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_SELBOARD_2200
     * @tc.desc Cover Tabs sidebarSelectedBoardColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_SELBOARD_2200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let defNode = getInspectorByKey('tabs_sidebarSelectedBoardColor_default');
      let node = getInspectorByKey('tabs_sidebarSelectedBoardColor_null');
      let abnVal = `${JSON.parse(node).$attrs.sidebarSelectedBoardColor}`;
      let defVal = `${JSON.parse(defNode).$attrs.sidebarSelectedBoardColor}`;
      expect(abnVal === 'null' || abnVal === 'undefined' || abnVal !== defVal).assertTrue();
      expect(node.length > 2).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_TABVIS_1500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_TABVIS_1500
     * @tc.desc Cover tabBarVisibility displayMode undefined smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_TABVIS_1500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabVis_default');
      let abnNode = getInspectorByKey('tabVis_undefined');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.tabBarVisibility))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.tabBarVisibility));
      done();
    });
    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_ABN_TABVIS_1600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_ABN_TABVIS_1600
     * @tc.desc Cover tabBarVisibility displayMode null smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_ABN_TABVIS_1600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let defNode = getInspectorByKey('tabVis_default');
      let abnNode = getInspectorByKey('tabVis_null');
      expect(JSON.stringify(JSON.parse(abnNode).$attrs.tabBarVisibility))
        .assertEqual(JSON.stringify(JSON.parse(defNode).$attrs.tabBarVisibility));
      done();
    });
  });
}
