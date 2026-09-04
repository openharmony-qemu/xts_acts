/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';

export default function NavigationAttrSupplement() {
  describe('NavigationAttrSupplement', () => {
    beforeEach(async (done: () => void) => {
      console.info("NavigationAttrSupplement beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationAttrSupplement',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationAttrSupplement state pages:" + JSON.stringify(pages));
        if (!("NavigationAttrSupplement" == pages.name)) {
          console.info("get NavigationAttrSupplement pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationAttrSupplement page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationAttrSupplement page error:" + err);
      }
      console.info("NavigationAttrSupplement beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("NavigationAttrSupplement after each called");
    });

    /**
     * @tc.name   navBarPositionParamStart
     * @tc.number SUB_ArkUI_Navigation_NavBarPosition_0100
     * @tc.desc   Test navBarPosition with NavBarPosition.Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('navBarPositionParamStart', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_NavBarPosition_0100] START');
      try {
        globalThis.value.message.notify({ name: 'navBarPositionIndex', value: 0 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.Start');
        console.info('[SUB_ArkUI_Navigation_NavBarPosition_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_NavBarPosition_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   navBarPositionParamEnd
     * @tc.number SUB_ArkUI_Navigation_NavBarPosition_0200
     * @tc.desc   Test navBarPosition with NavBarPosition.End
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('navBarPositionParamEnd', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_NavBarPosition_0200] START');
      try {
        globalThis.value.message.notify({ name: 'navBarPositionIndex', value: 1 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.navBarPosition).assertEqual('NavBarPosition.End');
        console.info('[SUB_ArkUI_Navigation_NavBarPosition_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_NavBarPosition_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   modeParamStack
     * @tc.number SUB_ArkUI_Navigation_Mode_0100
     * @tc.desc   Test mode with NavigationMode.Stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('modeParamStack', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Mode_0100] START');
      try {
        globalThis.value.message.notify({ name: 'navModeIndex', value: 0 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.mode).assertEqual('NavigationMode.STACK');
        console.info('[SUB_ArkUI_Navigation_Mode_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Mode_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   modeParamSplit
     * @tc.number SUB_ArkUI_Navigation_Mode_0200
     * @tc.desc   Test mode with NavigationMode.Split
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('modeParamSplit', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Mode_0200] START');
      try {
        globalThis.value.message.notify({ name: 'navModeIndex', value: 1 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.mode).assertEqual('NavigationMode.SPLIT');
        console.info('[SUB_ArkUI_Navigation_Mode_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Mode_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   modeParamAuto
     * @tc.number SUB_ArkUI_Navigation_Mode_0300
     * @tc.desc   Test mode with NavigationMode.Auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('modeParamAuto', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Mode_0300] START');
      try {
        globalThis.value.message.notify({ name: 'navModeIndex', value: 2 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.mode).assertEqual('NavigationMode.AUTO');
        console.info('[SUB_ArkUI_Navigation_Mode_0300] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Mode_0300] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideNavBarParamTrue
     * @tc.number SUB_ArkUI_Navigation_HideNavBar_0100
     * @tc.desc   Test hideNavBar with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideNavBarParamTrue', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideNavBar_0100] START');
      try {
        globalThis.value.message.notify({ name: 'hideNavBar', value: true });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideNavBar === 'true' || obj.$attrs.hideNavBar === true).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideNavBar_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideNavBar_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideNavBarParamFalse
     * @tc.number SUB_ArkUI_Navigation_HideNavBar_0200
     * @tc.desc   Test hideNavBar with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideNavBarParamFalse', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideNavBar_0200] START');
      try {
        globalThis.value.message.notify({ name: 'hideNavBar', value: false });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideNavBar === 'false' || obj.$attrs.hideNavBar === false).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideNavBar_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideNavBar_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   titleCustomBuilderWithOptions
     * @tc.number SUB_ArkUI_Navigation_Title_0100
     * @tc.desc   Test title with CustomBuilder and NavigationTitleOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('titleCustomBuilderWithOptions', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Title_0100] START');
      try {
        globalThis.value.message.notify({ name: 'titleTypeIndex', value: 1 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs !== undefined).assertTrue();
        console.info('[SUB_ArkUI_Navigation_Title_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Title_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideTitleBarParamTrue
     * @tc.number SUB_ArkUI_Navigation_HideTitleBar_0100
     * @tc.desc   Test hideTitleBar with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideTitleBarParamTrue', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideTitleBar_0100] START');
      try {
        globalThis.value.message.notify({ name: 'hideTitleBar', value: true });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideTitleBar === 'true' || obj.$attrs.hideTitleBar === true).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideTitleBar_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideTitleBar_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideTitleBarParamFalse
     * @tc.number SUB_ArkUI_Navigation_HideTitleBar_0200
     * @tc.desc   Test hideTitleBar with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideTitleBarParamFalse', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideTitleBar_0200] START');
      try {
        globalThis.value.message.notify({ name: 'hideTitleBar', value: false });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideTitleBar === 'false' || obj.$attrs.hideTitleBar === false).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideTitleBar_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideTitleBar_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideBackButtonParamTrue
     * @tc.number SUB_ArkUI_Navigation_HideBackButton_0100
     * @tc.desc   Test hideBackButton with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideBackButtonParamTrue', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideBackButton_0100] START');
      try {
        globalThis.value.message.notify({ name: 'hideBackButton', value: true });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideBackButton === 'true' || obj.$attrs.hideBackButton === true).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideBackButton_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideBackButton_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideBackButtonParamFalse
     * @tc.number SUB_ArkUI_Navigation_HideBackButton_0200
     * @tc.desc   Test hideBackButton with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideBackButtonParamFalse', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideBackButton_0200] START');
      try {
        globalThis.value.message.notify({ name: 'hideBackButton', value: false });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideBackButton === 'false' || obj.$attrs.hideBackButton === false).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideBackButton_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideBackButton_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   titleModeParamMini
     * @tc.number SUB_ArkUI_Navigation_TitleMode_0100
     * @tc.desc   Test titleMode with NavigationTitleMode.Mini
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('titleModeParamMini', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_TitleMode_0100] START');
      try {
        globalThis.value.message.notify({ name: 'titleModeIndex', value: 0 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.titleMode).assertEqual('NavigationTitleMode.Mini');
        console.info('[SUB_ArkUI_Navigation_TitleMode_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_TitleMode_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   titleModeParamFull
     * @tc.number SUB_ArkUI_Navigation_TitleMode_0200
     * @tc.desc   Test titleMode with NavigationTitleMode.Full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('titleModeParamFull', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_TitleMode_0200] START');
      try {
        globalThis.value.message.notify({ name: 'titleModeIndex', value: 1 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.titleMode).assertEqual('NavigationTitleMode.Full');
        console.info('[SUB_ArkUI_Navigation_TitleMode_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_TitleMode_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   menusCustomBuilderWithOptions
     * @tc.number SUB_ArkUI_Navigation_Menus_0100
     * @tc.desc   Test menus with CustomBuilder and NavigationMenuOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menusCustomBuilderWithOptions', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Menus_0100] START');
      try {
        globalThis.value.message.notify({ name: 'menusTypeIndex', value: 1 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs !== undefined).assertTrue();
        console.info('[SUB_ArkUI_Navigation_Menus_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Menus_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   toolbarConfigurationCustomBuilderWithOptions
     * @tc.number SUB_ArkUI_Navigation_ToolbarConfiguration_0100
     * @tc.desc   Test toolbarConfiguration with CustomBuilder and NavigationToolbarOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('toolbarConfigurationCustomBuilderWithOptions', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_ToolbarConfiguration_0100] START');
      try {
        globalThis.value.message.notify({ name: 'toolbarTypeIndex', value: 1 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs !== undefined).assertTrue();
        console.info('[SUB_ArkUI_Navigation_ToolbarConfiguration_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_ToolbarConfiguration_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideToolBarParamTrue
     * @tc.number SUB_ArkUI_Navigation_HideToolBar_0100
     * @tc.desc   Test hideToolBar with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideToolBarParamTrue', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideToolBar_0100] START');
      try {
        globalThis.value.message.notify({ name: 'hideToolBar', value: true });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideToolBar === 'true' || obj.$attrs.hideToolBar === true).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideToolBar_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideToolBar_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideToolBarParamFalse
     * @tc.number SUB_ArkUI_Navigation_HideToolBar_0200
     * @tc.desc   Test hideToolBar with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideToolBarParamFalse', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideToolBar_0200] START');
      try {
        globalThis.value.message.notify({ name: 'hideToolBar', value: false });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideToolBar === 'false' || obj.$attrs.hideToolBar === false).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideToolBar_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideToolBar_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideToolBarAnimatedTrue
     * @tc.number SUB_ArkUI_Navigation_HideToolBar_Animated_0100
     * @tc.desc   Test hideToolBar(hide, animated) with both true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideToolBarAnimatedTrue', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideToolBar_Animated_0100] START');
      try {
        globalThis.value.message.notify({ name: 'hideToolBarAnimated', value: true });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideToolBar === 'true' || obj.$attrs.hideToolBar === true).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideToolBar_Animated_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideToolBar_Animated_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hideToolBarAnimatedFalse
     * @tc.number SUB_ArkUI_Navigation_HideToolBar_Animated_0200
     * @tc.desc   Test hideToolBar(hide, animated) with hide false and animated true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hideToolBarAnimatedFalse', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_HideToolBar_Animated_0200] START');
      try {
        globalThis.value.message.notify({ name: 'hideToolBarAnimated', value: false });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.hideToolBar === 'false' || obj.$attrs.hideToolBar === false).assertTrue();
        console.info('[SUB_ArkUI_Navigation_HideToolBar_Animated_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_HideToolBar_Animated_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   navigationInterfaceDefault
     * @tc.number SUB_ArkUI_Navigation_Interface_0100
     * @tc.desc   Test Navigation() constructor returns attribute object for chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('navigationInterfaceDefault', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Interface_0100] START');
      try {
        globalThis.value.message.notify({ name: 'constructorType', value: 0 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs !== undefined).assertTrue();
        console.info('[SUB_ArkUI_Navigation_Interface_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Interface_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   navigationInterfaceWithPathStack
     * @tc.number SUB_ArkUI_Navigation_Interface_0200
     * @tc.desc   Test Navigation(pathInfos: NavPathStack) constructor returns attribute for chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('navigationInterfaceWithPathStack', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Interface_0200] START');
      try {
        globalThis.value.message.notify({ name: 'constructorType', value: 1 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs !== undefined).assertTrue();
        console.info('[SUB_ArkUI_Navigation_Interface_0200] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Interface_0200] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   navigationInterfaceWithHomePathInfo
     * @tc.number SUB_ArkUI_Navigation_Interface_0300
     * @tc.desc   Test Navigation(pathInfos: NavPathStack, homeDestination: HomePathInfo) constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('navigationInterfaceWithHomePathInfo', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Interface_0300] START');
      try {
        globalThis.value.message.notify({ name: 'constructorType', value: 2 });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs !== undefined).assertTrue();
        console.info('[SUB_ArkUI_Navigation_Interface_0300] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Interface_0300] error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   attributeChaining
     * @tc.number SUB_ArkUI_Navigation_Chaining_0100
     * @tc.desc   Test NavigationAttribute chaining - multiple attributes applied in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('attributeChaining', Level.LEVEL2, async (done: () => void) => {
      console.info('[SUB_ArkUI_Navigation_Chaining_0100] START');
      try {
        globalThis.value.message.notify({ name: 'constructorType', value: 1 });
        await CommonFunc.sleep(1000);
        globalThis.value.message.notify({ name: 'navModeIndex', value: 0 });
        await CommonFunc.sleep(500);
        globalThis.value.message.notify({ name: 'chainingTest', value: true });
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('NavigationAttrSupplement_nav');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.mode).assertEqual('NavigationMode.STACK');
        expect(obj.$attrs.hideNavBar === 'true' || obj.$attrs.hideNavBar === true).assertTrue();
        expect(obj.$attrs.hideTitleBar === 'true' || obj.$attrs.hideTitleBar === true).assertTrue();
        expect(obj.$attrs.hideBackButton === 'true' || obj.$attrs.hideBackButton === true).assertTrue();
        expect(obj.$attrs.hideToolBar === 'true' || obj.$attrs.hideToolBar === true).assertTrue();
        console.info('[SUB_ArkUI_Navigation_Chaining_0100] END');
      } catch (err) {
        console.error('[SUB_ArkUI_Navigation_Chaining_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });
  });
}
