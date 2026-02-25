/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import display from '@ohos.display';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';
import window from '@ohos.window';
import { ObjectUtils } from './ObjectUtils'

export default function pasteComponentSetUndefinedTest() {
  describe('pasteComponentSetUndefinedTest', ( ) => {
    beforeAll(async (done:Function) => {
      try {
        let driver = Driver.create();
        await Utils.sleep(500);
        let dialog_usb = await driver.findComponent(ON.type('Dialog'));
        if (dialog_usb !== null) {
          let button = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.info('====>beforeAll USB_Dialog button is : ' + JSON.stringify(button));
          await button.click();
          await Utils.sleep(500);
        } else {
          console.info('====>beforeAll USB_Dialog not exist.');
        }
      } catch (err) {
        console.info('====>beforeAll USB_Dialog err : ' + JSON.stringify(err));
      }
      let options:router.RouterOptions = {
        url: 'testability/pages/pasteButtonSetUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('====>pasteComponentSetUndefinedTest get state success ' + JSON.stringify(pages));
        if (!('pasteButtonSetUndefined' == pages.name)) {
          console.info('====>pasteComponentSetUndefinedTest get state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('====>pasteComponentSetUndefinedTest push page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('====>pasteComponentSetUndefinedTest push page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('====>pasteComponentSetUndefinedTest after each called');
    });

    let clickSecComponent = async (testname: string, driver: Driver, index: number) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponents(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button[index]));
        await button[index].click();
      } catch (err) {
        console.error(`====>${testname} clickSecComponent err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let clickSwitchButton = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSwitchButton function Start====`);
      try {
        let switchButton = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(500);
        console.info(`====>${testname} switchButton is:` + JSON.stringify(switchButton));
        await switchButton.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.error(`====>${testname} clickSwitchButton err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSwitchButton function End====`);
    }

    let sucCallback = (testname: string, done: Function) => {
      console.info(`====>${testname} sucCallback function Start====`);
      let clickEvent:events_emitter.InnerEvent = {
        eventId: 2,
        priority: events_emitter.EventPriority.LOW
      }
      let clickCallback = (clickData:events_emitter.EventData) => {
        try {
          if(clickData.data !=undefined){
            console.info(`====>${testname} get clickEvent result is: ` + JSON.stringify(clickEvent));
            console.info(`====>${testname} get clickData.data.clickResult is: ` + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            } else {
              console.info(`====>${testname} 设置权限失败`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`====>${testname} ERR CASE 失败`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.error(`====>${testname} once clickEvent err : ` + JSON.stringify(err));
          console.info(`====>${testname} END====`);
          done();
        }
      }
      events_emitter.once(clickEvent, clickCallback);
      console.info(`====>${testname} sucCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0100
     * @tc.desc   Test SecurityComponent iconSize set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      let strJson: string = getInspectorByKey('setUndefined0');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0200
     * @tc.desc   Test SecurityComponent position set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined1');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.position.x).assertEqual('');
      expect(obj.$attrs.position.y).assertEqual('');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0300
     * @tc.desc   Test SecurityComponent markAnchor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined2');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.markAnchor.x).assertEqual('0.00vp');
      expect(obj.$attrs.markAnchor.y).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0400
     * @tc.desc   Test SecurityComponent offset set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined3');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.offset.x).assertEqual('0.00vp');
      expect(obj.$attrs.offset.y).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0500
     * @tc.desc   Test SecurityComponent fontSize set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined4');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0600
     * @tc.desc   Test SecurityComponent fontStyle set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0600';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined5');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontStyle).assertEqual(0);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0700
     * @tc.desc   Test SecurityComponent fontWeight set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0700';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined6');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0800
     * @tc.desc   Test SecurityComponent fontFamily set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0800';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined7');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0900
     * @tc.desc   Test SecurityComponent fontColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0900';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setUndefined8-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let except_fontColor: string = obj1.$attrs.fontColor;
      let strJson2: string = getInspectorByKey('setUndefined8-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.fontColor).assertEqual(except_fontColor);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1000
     * @tc.desc   Test SecurityComponent iconColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1000';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setUndefined9-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let except_iconColor: string = obj1.$attrs.iconColor;
      let strJson2: string = getInspectorByKey('setUndefined9-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.iconColor).assertEqual(except_iconColor);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1100
     * @tc.desc   Test SecurityComponent backgroundColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setUndefined10-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let except_backgroundColor: string = obj1.$attrs.backgroundColor;
      let strJson2: string = getInspectorByKey('setUndefined10-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.backgroundColor).assertEqual(except_backgroundColor);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1200
     * @tc.desc   Test SecurityComponent borderStyle set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined11');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderStyle).assertEqual(3);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1300
     * @tc.desc   Test SecurityComponent borderWidth set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined12');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderWidth).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1400
     * @tc.desc   Test SecurityComponent borderColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined13');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1500
     * @tc.desc   Test SecurityComponent borderRadius set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setUndefined14');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderRadius).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });
  })
}
