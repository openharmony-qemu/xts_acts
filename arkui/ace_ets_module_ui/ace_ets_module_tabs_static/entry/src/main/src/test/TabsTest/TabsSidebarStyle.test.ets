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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function tabsSidebarStyle(): void {
  describe('tabsSidebarStyle', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.tabs.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsSidebarStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('TabsSidebarStyle' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.info('push TabsSidebarStyle error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0100
     * @tc.desc Cover Tabs barStyle normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0200
     * @tc.desc Cover Tabs barStyle undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_barStyle_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0300
     * @tc.desc Cover Tabs sidebarPosition normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarPosition_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0400
     * @tc.desc Cover Tabs sidebarPosition undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarPosition_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0500
     * @tc.desc Cover Tabs sidebarWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0500', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarWidth_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0600
     * @tc.desc Cover Tabs sidebarWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0600', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarWidth_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0700
     * @tc.desc Cover Tabs minSidebarWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0700', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_minSidebarWidth_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0800
     * @tc.desc Cover Tabs minSidebarWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0800', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_minSidebarWidth_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_0900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_0900
     * @tc.desc Cover Tabs maxSidebarWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_0900', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_maxSidebarWidth_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_1000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_1000
     * @tc.desc Cover Tabs maxSidebarWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_1000', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_maxSidebarWidth_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1100
     * @tc.desc Cover Tabs minContentWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_minContentWidth_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1200
     * @tc.desc Cover Tabs minContentWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_minContentWidth_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1300
     * @tc.desc Cover Tabs sidebarBackgroundColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarBackgroundColor_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1400
     * @tc.desc Cover Tabs sidebarBackgroundColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarBackgroundColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1500
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1500', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarBackgroundBlurStyle_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1600
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1600', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarBackgroundBlurStyle_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1700
     * @tc.desc Cover Tabs sidebarDivider normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1700', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarDivider_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1800
     * @tc.desc Cover Tabs sidebarDivider undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1800', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarDivider_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_1900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_1900
     * @tc.desc Cover Tabs sidebarSelectedIconColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_1900', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_2000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_2000
     * @tc.desc Cover Tabs sidebarSelectedIconColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_2000', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2100
     * @tc.desc Cover Tabs sidebarSelectedTextColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2200
     * @tc.desc Cover Tabs sidebarSelectedTextColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2300
     * @tc.desc Cover Tabs sidebarUnselectedIconColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2400
     * @tc.desc Cover Tabs sidebarUnselectedIconColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2500
     * @tc.desc Cover Tabs sidebarUnselectedTextColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2500', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2600
     * @tc.desc Cover Tabs sidebarUnselectedTextColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2600', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2700
     * @tc.desc Cover Tabs sidebarSelectedBoardColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2700', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_normal');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2800
     * @tc.desc Cover Tabs sidebarSelectedBoardColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2800', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      expect(strJson.length > 2).assertTrue();
    });

  });
}
