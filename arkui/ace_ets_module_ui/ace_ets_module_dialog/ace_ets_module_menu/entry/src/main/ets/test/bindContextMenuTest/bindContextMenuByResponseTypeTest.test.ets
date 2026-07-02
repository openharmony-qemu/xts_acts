/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, ON, Component, Point, PointerMatrix, Rect, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function bindContextMenuByResponseTypeTest() {
  describe('bindContextMenuByResponseTypeTest', () => {
    beforeAll(async () => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
    });

    beforeEach(async (done: Function) => {
      console.info('bindContextMenuByResponseTypeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/bindContextMenuByResponseType',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get state pages:' + JSON.stringify(pages));
        if (pages.name !== 'bindContextMenuByResponseType') {
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push page error:' + JSON.stringify(err));
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await driver.pressBack();
      console.info('bindContextMenuByResponseTypeTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0100
     * @tc.name      bindContextMenuByResponseTypeTest_0100
     * @tc.desc      test content=CustomBuilder responseType=LongPress menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn01 = await driver.findComponent(ON.id('btn01'));
      await btn01.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0200
     * @tc.name      bindContextMenuByResponseTypeTest_0200
     * @tc.desc      test content=CustomBuilder responseType=RightClick component setup
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0200] START');
      await CommonFunc.sleep(1500);

      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let Btn02 = await driver.findComponent(ON.id('btn02'));
      await CommonFunc.sleep(500);
      let point = await Btn02.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseClick({ x: point.x, y: point.y }, MouseButton.MOUSE_BUTTON_RIGHT);
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0300
     * @tc.name      bindContextMenuByResponseTypeTest_0300
     * @tc.desc      test content=Array<MenuElement> responseType=LongPress menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn03 = await driver.findComponent(ON.id('btn03'));
      await btn03.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0400
     * @tc.name      bindContextMenuByResponseTypeTest_0400
     * @tc.desc      test content=Array<MenuElement> responseType=RightClick component setup
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0400] START');
      await CommonFunc.sleep(1500);

      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let Btn04 = await driver.findComponent(ON.id('btn04'));
      await CommonFunc.sleep(500);
      let point = await Btn04.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseClick({ x: point.x, y: point.y }, MouseButton.MOUSE_BUTTON_RIGHT);
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0500
     * @tc.name      bindContextMenuByResponseTypeTest_0500
     * @tc.desc      test options offset and placement menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn05 = await driver.findComponent(ON.id('btn05'));
      await btn05.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_0500] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0600
     * @tc.name      bindContextMenuByResponseTypeTest_0600
     * @tc.desc      test options enableArrow and arrowOffset menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn06 = await driver.findComponent(ON.id('btn06'));
      await btn06.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_0600] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0700
     * @tc.name      bindContextMenuByResponseTypeTest_0700
     * @tc.desc      test options onAppear onDisappear callbacks fire correctly
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn07 = await driver.findComponent(ON.id('btn07'));
      await btn07.longClick();
      await CommonFunc.sleep(1500);

      let strJsonAppear = getInspectorByKey('appearText');
      expect(JSON.parse(strJsonAppear).$attrs.content).assertEqual('onAppear:appeared');

      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      await menuItem.click();
      await CommonFunc.sleep(1500);

      let strJsonDisappear = getInspectorByKey('disappearText');
      expect(JSON.parse(strJsonDisappear).$attrs.content).assertEqual('onDisappear:disappeared');

      console.info('[bindContextMenuByResponseTypeTest_0700] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0800
     * @tc.name      bindContextMenuByResponseTypeTest_0800
     * @tc.desc      test options aboutToAppear aboutToDisappear callbacks fire correctly
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn08 = await driver.findComponent(ON.id('btn08'));
      await btn08.longClick();
      await CommonFunc.sleep(1500);

      let strJsonAboutAppear = getInspectorByKey('aboutAppearText');
      expect(JSON.parse(strJsonAboutAppear).$attrs.content).assertEqual('aboutToAppear:aboutToAppear');

      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      await menuItem.click();
      await CommonFunc.sleep(1500);

      let strJsonAboutDisappear = getInspectorByKey('aboutDisappearText');
      expect(JSON.parse(strJsonAboutDisappear).$attrs.content).assertEqual('aboutToDisappear:aboutToDisappear');

      console.info('[bindContextMenuByResponseTypeTest_0800] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_0900
     * @tc.name      bindContextMenuByResponseTypeTest_0900
     * @tc.desc      test options backgroundColor menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_0900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn09 = await driver.findComponent(ON.id('btn09'));
      await btn09.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_0900] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1000
     * @tc.name      bindContextMenuByResponseTypeTest_1000
     * @tc.desc      test options backgroundBlurStyle menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn10 = await driver.findComponent(ON.id('btn10'));
      await btn10.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1000] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1100
     * @tc.name      bindContextMenuByResponseTypeTest_1100
     * @tc.desc      test options borderRadius menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn11 = await driver.findComponent(ON.id('btn11'));
      await btn11.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1200
     * @tc.name      bindContextMenuByResponseTypeTest_1200
     * @tc.desc      test options preview MenuPreviewMode.IMAGE menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn12 = await driver.findComponent(ON.id('btn12'));
      await btn12.longClick();
      await CommonFunc.sleep(1500);

      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1300
     * @tc.name      bindContextMenuByResponseTypeTest_1300
     * @tc.desc      test options preview CustomBuilder menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn13 = await driver.findComponent(ON.id('btn13'));
      await btn13.longClick();
      await CommonFunc.sleep(1500);

      let menuItem = await driver.findComponent(ON.text('CustomItem1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1400
     * @tc.name      bindContextMenuByResponseTypeTest_1400
     * @tc.desc      test options backgroundBlurStyleOptions menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn14 = await driver.findComponent(ON.id('btn14'));
      await btn14.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1400] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1500
     * @tc.name      bindContextMenuByResponseTypeTest_1500
     * @tc.desc      test options backgroundEffect menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1500', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn15 = await driver.findComponent(ON.id('btn15'));
      await btn15.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1500] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1600
     * @tc.name      bindContextMenuByResponseTypeTest_1600
     * @tc.desc      test options scrollBar menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1600', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn16 = await driver.findComponent(ON.id('btn16'));
      await btn16.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Item1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1600] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1700
     * @tc.name      bindContextMenuByResponseTypeTest_1700
     * @tc.desc      test options maxHeight menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1700', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn17 = await driver.findComponent(ON.id('btn17'));
      await btn17.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Item1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1700] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1800
     * @tc.name      bindContextMenuByResponseTypeTest_1800
     * @tc.desc      test options gridStyle menu appears with grid layout
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1800', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn18 = await driver.findComponent(ON.id('btn18'));
      await btn18.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Grid1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1800] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_1900
     * @tc.name      bindContextMenuByResponseTypeTest_1900
     * @tc.desc      test options targetSpace menu appears with spacing
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_1900', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_1900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn19 = await driver.findComponent(ON.id('btn19'));
      await btn19.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_1900] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_2000
     * @tc.name      bindContextMenuByResponseTypeTest_2000
     * @tc.desc      test options colorMode menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_2000', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_2000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn20 = await driver.findComponent(ON.id('btn20'));
      await btn20.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_2000] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_2100
     * @tc.name      bindContextMenuByResponseTypeTest_2100
     * @tc.desc      test options systemMaterial menu appears
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_2100', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_2100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let btn21 = await driver.findComponent(ON.id('btn21'));
      await btn21.longClick();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.text('Element1'));
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[bindContextMenuByResponseTypeTest_2100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENU_BINDCONTEXTMENUBYRESPONSETYPE_2200
     * @tc.name      bindContextMenuByResponseTypeTest_2200
     * @tc.desc      test return value T allows method chaining
     * @tc.level     Level1
     */
    it('bindContextMenuByResponseTypeTest_2200', Level.LEVEL1, async (done: Function) => {
      console.info('[bindContextMenuByResponseTypeTest_2200] START');
      await CommonFunc.sleep(1500);

      let strJson = getInspectorByKey('btn22');
      // let obj = JSON.parse(strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.backgroundColor).not().assertEqual(undefined);
      expect(obj.$attrs.fontColor).not().assertEqual(undefined);

      console.info('[bindContextMenuByResponseTypeTest_2200] END');
      done();
    });
  });
}
