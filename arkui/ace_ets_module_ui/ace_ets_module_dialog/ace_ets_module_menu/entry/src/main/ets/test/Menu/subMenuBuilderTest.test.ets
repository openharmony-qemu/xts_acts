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
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function subMenuBuilderTest() {
  describe('subMenuBuilderTest', () => {
    

    beforeEach(async (done: Function) => {
      console.info('subMenuBuilderTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/subMenuBuilder',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get state pages:' + JSON.stringify(pages));
        if (pages.name !== 'subMenuBuilder') {
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
      console.info("subMenuBuilder after each called");
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0100
     * @tc.name      subMenuBuilderTest_0100
     * @tc.desc      test subMenuBuilder(CustomBuilder) MenuItem renders with sub-menu
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);
      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.id('menuItemWithSubA'));
       
      expect(menuItem !== null).assertTrue();
      await menuItem.click();
      await CommonFunc.sleep(1000);
      let showBtnA1 = await driver.findComponent(ON.text('SubItemA1'));
      await CommonFunc.sleep(1000);
      expect(showBtnA1 !== null).assertTrue();
      await showBtnA1.click();
      await CommonFunc.sleep(1000);
      console.info('[subMenuBuilderTest_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0200
     * @tc.name      subMenuBuilderTest_0200
     * @tc.desc      test subMenuBuilder(CustomBuilder) clicking MenuItem shows sub-menu
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.id('menuItemWithSubA'));
      await menuItem.click();
      await CommonFunc.sleep(1000);
      let subItem = await driver.findComponent(ON.text('SubItemA1'));
      expect(subItem !== null).assertTrue();
      await CommonFunc.sleep(1000);
      await subItem.click();
      console.info('[subMenuBuilderTest_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0300
     * @tc.name      subMenuBuilderTest_0300
     * @tc.desc      test subMenuBuilder(CustomBuilder) sub-menu items are clickable
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.id('menuItemWithSubA'));
      await menuItem.click();
      await CommonFunc.sleep(1000);

      let subItem = await driver.findComponent(ON.text('SubItemA1'));
      await subItem.click();
      await CommonFunc.sleep(1000);

      console.info('[subMenuBuilderTest_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0400
     * @tc.name      subMenuBuilderTest_0400
     * @tc.desc      test subMenuBuilder(CustomBuilder) different sub-menu builders
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.id('menuItemWithSubB'));
      await menuItem.click();
      await CommonFunc.sleep(1000);

      let subItem = await driver.findComponent(ON.text('SubItemB1'));
      expect(subItem !== null).assertTrue();
      await subItem.click();
      console.info('[subMenuBuilderTest_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0500
     * @tc.name      subMenuBuilderTest_0500
     * @tc.desc      test subMenuBuilder(undefined) MenuItem has no sub-menu
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.id('menuItemSubUndefined'));
      expect(menuItem !== null).assertTrue();

      let strJson = getInspectorByKey('menuItemSubUndefined');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('MenuItem');
      await menuItem.click();
      console.info('[subMenuBuilderTest_0500] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0600
     * @tc.name      subMenuBuilderTest_0600
     * @tc.desc      test subMenuBuilder(undefined) clicking MenuItem does not show sub-menu
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.id('menuItemSubUndefined'));
      await menuItem.click();
      await CommonFunc.sleep(1000);

      console.info('[subMenuBuilderTest_0600] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0700
     * @tc.name      subMenuBuilderTest_0700
     * @tc.desc      test return value MenuItemAttribute allows chaining selected/selectIcon
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('menuItemChaining');
      let obj: ESObject = JSON.parse(strJson);
      console.info('=============='+JSON.stringify(obj))
      expect(obj.$type).assertEqual('MenuItem');
      await showBtn.click();
      console.info('[subMenuBuilderTest_0700] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0800
     * @tc.name      subMenuBuilderTest_0800
     * @tc.desc      test return value chaining MenuItem with subMenuBuilder shows sub-menu
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.id('menuItemChaining'));
      await CommonFunc.sleep(1000);
      await menuItem.click();
      await CommonFunc.sleep(1000);
      let subItem = await driver.findComponent(ON.text('SubItemC1'));
      expect(subItem !== null).assertTrue();
      await subItem.click();

      console.info('[subMenuBuilderTest_0800] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_API_MENUITEM_SUBMENUBUILDER_0900
     * @tc.name      subMenuBuilderTest_0900
     * @tc.desc      test MenuItem without subMenuBuilder has no sub-menu expansion
     * @tc.level     Level1
     */
    it('subMenuBuilderTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[subMenuBuilderTest_0900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1500);

      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn.click();
      await CommonFunc.sleep(1000);

      let menuItem = await driver.findComponent(ON.id('menuItemNoSub'));
      expect(menuItem !== null).assertTrue();

      console.info('[subMenuBuilderTest_0900] END');
      done();
    });
  });
}