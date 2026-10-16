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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

export default function tabsSidebarStyleTest() {
  describe('tabsSidebarStyleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsSidebarStyle',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[ARKUI_DYN] TabsSidebarStyle push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0100
     * @tc.desc Cover Tabs barStyle normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0200
     * @tc.desc Cover Tabs barStyle undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_barStyle_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0300
     * @tc.desc Cover Tabs barStyle null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_barStyle_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0400
     * @tc.desc Cover Tabs sidebarPosition normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarPosition_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0500
     * @tc.desc Cover Tabs sidebarPosition undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarPosition_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0600
     * @tc.desc Cover Tabs sidebarPosition null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarPosition_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0700
     * @tc.desc Cover Tabs sidebarWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarWidth_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0800
     * @tc.desc Cover Tabs sidebarWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarWidth_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0900
     * @tc.desc Cover Tabs sidebarWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarWidth_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1000
     * @tc.desc Cover Tabs minSidebarWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minSidebarWidth_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1100
     * @tc.desc Cover Tabs minSidebarWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minSidebarWidth_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1200
     * @tc.desc Cover Tabs minSidebarWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minSidebarWidth_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1300
     * @tc.desc Cover Tabs maxSidebarWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_maxSidebarWidth_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1400
     * @tc.desc Cover Tabs maxSidebarWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_maxSidebarWidth_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1500
     * @tc.desc Cover Tabs maxSidebarWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_maxSidebarWidth_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1600
     * @tc.desc Cover Tabs minContentWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minContentWidth_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1700
     * @tc.desc Cover Tabs minContentWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minContentWidth_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1800
     * @tc.desc Cover Tabs minContentWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minContentWidth_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_1900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_1900
     * @tc.desc Cover Tabs sidebarBackgroundColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_1900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundColor_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2000
     * @tc.desc Cover Tabs sidebarBackgroundColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundColor_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2100
     * @tc.desc Cover Tabs sidebarBackgroundColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundColor_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2200
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundBlurStyle_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2300
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundBlurStyle_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2400
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundBlurStyle_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2500
     * @tc.desc Cover Tabs sidebarDivider normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarDivider_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2600
     * @tc.desc Cover Tabs sidebarDivider undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarDivider_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2700
     * @tc.desc Cover Tabs sidebarDivider null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarDivider_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2800
     * @tc.desc Cover Tabs sidebarSelectedIconColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedIconColor_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2900
     * @tc.desc Cover Tabs sidebarSelectedIconColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_3000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_3000
     * @tc.desc Cover Tabs sidebarSelectedIconColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_3000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedIconColor_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3100
     * @tc.desc Cover Tabs sidebarSelectedTextColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedTextColor_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3200
     * @tc.desc Cover Tabs sidebarSelectedTextColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3300
     * @tc.desc Cover Tabs sidebarSelectedTextColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedTextColor_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3400
     * @tc.desc Cover Tabs sidebarUnselectedIconColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedIconColor_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3500
     * @tc.desc Cover Tabs sidebarUnselectedIconColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3600
     * @tc.desc Cover Tabs sidebarUnselectedIconColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedIconColor_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3700
     * @tc.desc Cover Tabs sidebarUnselectedTextColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedTextColor_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3800
     * @tc.desc Cover Tabs sidebarUnselectedTextColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3900
     * @tc.desc Cover Tabs sidebarUnselectedTextColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedTextColor_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4000
     * @tc.desc Cover Tabs sidebarSelectedBoardColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedBoardColor_normal');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4100
     * @tc.desc Cover Tabs sidebarSelectedBoardColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4200
     * @tc.desc Cover Tabs sidebarSelectedBoardColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedBoardColor_null');
      expect(JSON.parse(node).$attrs !== undefined).assertTrue();
      done();
    });

  });
}
