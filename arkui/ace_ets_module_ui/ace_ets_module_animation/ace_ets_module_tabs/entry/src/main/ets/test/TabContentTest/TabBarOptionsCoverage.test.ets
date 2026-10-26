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

export default function tabBarOptionsCoverageTest() {
  describe('tabBarOptionsCoverageTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContent/TabBarOptionsCoverage',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[ARKUI_DYN] TabBarOptions push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0100
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0100
     * @tc.desc Cover TabBarOptions text normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabBarOptions_text_normal');
      expect(JSON.parse(node).$attrs.tabBar.text).assertEqual('Home');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0200
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0200
     * @tc.desc Cover TabBarOptions text undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_text_undefined');
      let nodeBase = getInspectorByKey('tabBarOptions_default');
      expect(JSON.stringify(JSON.parse(nodeUndef).$attrs.tabBar))
        .assertEqual(JSON.stringify(JSON.parse(nodeBase).$attrs.tabBar));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0300
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0300
     * @tc.desc Cover TabBarOptions text null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_TEXT_0300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_text_undefined');
      let nodeNull = getInspectorByKey('tabBarOptions_text_null');
      expect(JSON.stringify(JSON.parse(nodeNull).$attrs.tabBar))
        .assertEqual(JSON.stringify(JSON.parse(nodeUndef).$attrs.tabBar));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0400
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0400
     * @tc.desc Cover TabBarOptions badge value normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
            let node = getInspectorByKey('tabBarOptions_badgeValue_normal');
      let tabBarJson = JSON.stringify(JSON.parse(node).$attrs.tabBar);
      expect(tabBarJson.indexOf('Home') >= 0).assertTrue();
      expect(tabBarJson.indexOf('8') >= 0).assertTrue();
      expect(tabBarJson.indexOf('99') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0500
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0500
     * @tc.desc Cover TabBarOptions badge value undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_badgeValue_undefined');
      let nodeBase = getInspectorByKey('tabBarOptions_text_normal');
      expect(JSON.stringify(JSON.parse(nodeUndef).$attrs.tabBar.badge))
        .assertEqual(JSON.stringify(JSON.parse(nodeBase).$attrs.tabBar.badge));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0600
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0600
     * @tc.desc Cover TabBarOptions badge value null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_0600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_badgeValue_undefined');
      let nodeNull = getInspectorByKey('tabBarOptions_badgeValue_null');
      expect(JSON.stringify(JSON.parse(nodeNull).$attrs.tabBar.badge))
        .assertEqual(JSON.stringify(JSON.parse(nodeUndef).$attrs.tabBar.badge));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0700
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0700
     * @tc.desc Cover TabBarOptions badge maxCount normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
            let node = getInspectorByKey('tabBarOptions_badgeMax_normal');
      let tabBarJson = JSON.stringify(JSON.parse(node).$attrs.tabBar);
      expect(tabBarJson.indexOf('Home') >= 0).assertTrue();
      expect(tabBarJson.indexOf('8') >= 0).assertTrue();
      expect(tabBarJson.indexOf('99') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0800
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0800
     * @tc.desc Cover TabBarOptions badge maxCount undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_badgeMax_undefined');
      let nodeBase = getInspectorByKey('tabBarOptions_badgeValue_normal');
      expect(JSON.parse(nodeUndef).$attrs.tabBar.badge.maxCount)
        .assertEqual(JSON.parse(nodeBase).$attrs.tabBar.badge.maxCount);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0900
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0900
     * @tc.desc Cover TabBarOptions badge maxCount null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_0900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_badgeMax_undefined');
      let nodeNull = getInspectorByKey('tabBarOptions_badgeMax_null');
      expect(JSON.parse(nodeNull).$attrs.tabBar.badge.maxCount)
        .assertEqual(JSON.parse(nodeUndef).$attrs.tabBar.badge.maxCount);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_UNDEF_1000
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_UNDEF_1000
     * @tc.desc Cover TabBarOptions tabBar undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_UNDEF_1000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_tabBar_undefined');
      let nodeBase = getInspectorByKey('tabBarOptions_default');
      expect(JSON.stringify(JSON.parse(nodeUndef).$attrs.tabBar))
        .assertEqual(JSON.stringify(JSON.parse(nodeBase).$attrs.tabBar));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_NULL_1100
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_NULL_1100
     * @tc.desc Cover TabBarOptions tabBar null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_NULL_1100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_tabBar_undefined');
      let nodeNull = getInspectorByKey('tabBarOptions_tabBar_null');
      expect(JSON.stringify(JSON.parse(nodeNull).$attrs.tabBar))
        .assertEqual(JSON.stringify(JSON.parse(nodeUndef).$attrs.tabBar));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_1200
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_1200
     * @tc.desc Cover TabBarOptions badge value ResourceStr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEVALUE_1200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
            let node = getInspectorByKey('tabBarOptions_badgeValue_resourceStr');
      let tabBarJson = JSON.stringify(JSON.parse(node).$attrs.tabBar);
      expect(tabBarJson.indexOf('Home') >= 0).assertTrue();
      expect(tabBarJson.indexOf('99') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_1300
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_1300
     * @tc.desc Cover TabBarOptions badge maxCount zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGEMAX_1300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
            let node = getInspectorByKey('tabBarOptions_badgeMax_zero');
      let tabBarJson = JSON.stringify(JSON.parse(node).$attrs.tabBar);
      expect(tabBarJson.indexOf('Home') >= 0).assertTrue();
      expect(tabBarJson.indexOf('8') >= 0).assertTrue();
      expect(tabBarJson.indexOf('"maxCount":0') >= 0 || tabBarJson.indexOf('maxCount":0') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BADGE_GT_MAX_1400
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BADGE_GT_MAX_1400
     * @tc.desc Cover TabBarOptions badge value greater than maxCount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BADGE_GT_MAX_1400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
            let node = getInspectorByKey('tabBarOptions_badgeValue_gt_maxCount');
      let tabBarJson = JSON.stringify(JSON.parse(node).$attrs.tabBar);
      expect(tabBarJson.indexOf('Home') >= 0).assertTrue();
      expect(tabBarJson.indexOf('200') >= 0).assertTrue();
      expect(tabBarJson.indexOf('99') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BOTTOM_BADGE_1500
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BOTTOM_BADGE_1500
     * @tc.desc Cover BottomTabBarStyle badge normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BOTTOM_BADGE_1500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
            let node = getInspectorByKey('tabBarOptions_bottomTabBar_badge');
      let tabBarJson = JSON.stringify(JSON.parse(node).$attrs.tabBar);
      expect(tabBarJson.indexOf('8') >= 0).assertTrue();
      expect(tabBarJson.indexOf('99') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_BOTTOM_BADGE_UNDEF_1600
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_BOTTOM_BADGE_UNDEF_1600
     * @tc.desc Cover BottomTabBarStyle badge undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_BOTTOM_BADGE_UNDEF_1600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabBarOptions_bottomTabBar_badge_undefined');
      let nodeBase = getInspectorByKey('tabBarOptions_bottomTabBar_badge');
      expect(JSON.stringify(JSON.parse(nodeUndef).$attrs.tabBar.badge))
        .assertEqual(JSON.stringify(JSON.parse(nodeBase).$attrs.tabBar.badge));
      done();
    });

  });
}
