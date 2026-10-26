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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.SIDEBAR');
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.STANDARD');
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarPosition')).assertEqual('BarPosition.Start');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarPosition_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarPosition'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarPosition'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarWidth')).assertEqual('240.00vp');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarWidth_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarWidth'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarWidth'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('minSidebarWidth')).assertEqual('200.00vp');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_minSidebarWidth_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('minSidebarWidth'))
        .assertEqual(objBase.getElement('$attrs').getString('minSidebarWidth'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('maxSidebarWidth')).assertEqual('320.00vp');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_maxSidebarWidth_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('maxSidebarWidth'))
        .assertEqual(objBase.getElement('$attrs').getString('maxSidebarWidth'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('minContentWidth')).assertEqual('360.00vp');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_minContentWidth_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('minContentWidth'))
        .assertEqual(objBase.getElement('$attrs').getString('minContentWidth'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarBackgroundColor')).assertEqual('#FFFFFFFF');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarBackgroundColor_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarBackgroundColor'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarBackgroundColor'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarBackgroundBlurStyle'))
        .assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarBackgroundBlurStyle_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarBackgroundBlurStyle'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarBackgroundBlurStyle'));
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
      let obj = JSON.parseJsonElement(strJson);
      let divider = obj.getElement('$attrs').getElement('sidebarDivider');
      expect(divider.getString('strokeWidth')).assertEqual('1.00vp');
      expect(divider.getString('color')).assertEqual('#33000000');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarDivider_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(JSON.stringify(objUndef.getElement('$attrs').getElement('sidebarDivider')))
        .assertEqual(JSON.stringify(objBase.getElement('$attrs').getElement('sidebarDivider')));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarSelectedIconColor')).assertEqual('#FF007DFF');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarSelectedIconColor'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarSelectedIconColor'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarSelectedTextColor')).assertEqual('#FF007DFF');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarSelectedTextColor'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarSelectedTextColor'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarUnselectedIconColor')).assertEqual('#FF182431');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarUnselectedIconColor'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarUnselectedIconColor'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarUnselectedTextColor')).assertEqual('#FF182431');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarUnselectedTextColor'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarUnselectedTextColor'));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('sidebarSelectedBoardColor')).assertEqual('#0A007DFF');
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
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getString('sidebarSelectedBoardColor'))
        .assertEqual(objBase.getElement('$attrs').getString('sidebarSelectedBoardColor'));
    });

  });
}
