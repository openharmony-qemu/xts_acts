/**
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';

export default function saveComponentTest_1() {
  describe('saveComponentTest_1', () => {
    let driver: Driver;
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/saveButton_1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("====>saveComponentTest_1 get state success " + JSON.stringify(pages));
        if (!("saveButton_1" == pages.name)) {
          console.info("====>saveComponentTest_1 get state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("====>saveComponentTest_1 push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("====>saveComponentTest_1 push page error: " + err);
      }
      driver = Driver.create();
      await Utils.sleep(1000);
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("====>saveComponentTest_1 after each called");
    });

    /**
     * @tc.name   Test_Security_Button_Save_2300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2300
     * @tc.desc   Test SecurityComponent The button style is a line and the text is described as a download file and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_2300] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave2');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_2300] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.icon:" + obj.$attrs.icon);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.icon).assertEqual(1);
      expect(obj.$attrs.text).assertEqual(1);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_2300] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_2300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_2300] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_2300] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_2300] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_2300] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_2300] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_2300] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2300] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_2300] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_2300] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2300] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_2400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2400
     * @tc.desc   Test SecurityComponent The text is described as saving and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_2400] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave3');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_2400] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(2);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_2400] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_2400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_2400] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_2400] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_2400] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_2400] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_2400] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_2400] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2400] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_2400] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_2400] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2400] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_2500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2500
     * @tc.desc   Test SecurityComponent The text describes saving the image and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_2500] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave4');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_2500] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(3);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_2500] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_2500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_2500] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_2500] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_2500] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_2500] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_2500] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_2500] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2500] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_2500] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_2500] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2500] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_2600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2600
     * @tc.desc   Test SecurityComponent The text describes the saved file and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_2600] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave5');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_2600] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(4);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_2600] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_2600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_2600] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_2600] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_2600] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_2600] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_2600] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_2600] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2600] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_2600] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_2600] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2600] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_2700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2700
     * @tc.desc   Test SecurityComponent The text description is download and share and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_2700] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave6');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_2700] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(5);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_2700] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_2700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_2700] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_2700] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_2700] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_2700] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_2700] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_2700] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2700] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_2700] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_2700] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2700] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_2800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2800
     * @tc.desc   Test SecurityComponent The text is described as receiving and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_2800] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave7');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_2800] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(6);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_2800] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_2800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_2800] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_2800] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_2800] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_2800] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_2800] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_2800] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2800] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_2800] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_2800] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2800] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_2900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2900
     * @tc.desc   Test SecurityComponent The text describes continued receiving and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_2900] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave8');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_2900] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(7);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_2900] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_2900] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_2900] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_2900] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_2900] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_2900] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_2900] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_2900] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2900] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_2900] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_2900] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2900] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_3000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3000
     * @tc.desc   Test SecurityComponent The text describes save to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_3000] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave9');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_3000] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(8);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_3000] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_3000] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_3000] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_3000] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_3000] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_3000] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_3000] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3000] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3000] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_3000] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_3000] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3000] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_3100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3100
     * @tc.desc   Test SecurityComponent The text describes export to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_3100] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave15');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_3100] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(9);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_3100] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_3100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_3100] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_3100] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_3100] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_3100] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_3100] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3100] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3100] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_3100] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_3100] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3100] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_3200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3200
     * @tc.desc   Test SecurityComponent The text describes quick save to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_3200] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave16');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_3200] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(10);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_3200] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_3200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_3200] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_3200] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_3200] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_3200] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_3200] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3200] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3200] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_3200] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_3200] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3200] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });
	
    /**
     * @tc.name   Test_Security_Button_Save_3300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3300
     * @tc.desc   Test SecurityComponent The text describes resave to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_3300] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave17');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_3300] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(11);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_3300] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_3300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_3300] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_3300] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_3300] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_3300] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_3300] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3300] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3300] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_3300] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_3300] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
        let button2 = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(3000);
        await button2.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3300] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });

    /**
     * @tc.name   Test_Security_Button_Save_3400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3400
     * @tc.desc   Test SecurityComponent The text describes save all and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Save_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('====>[Test_Security_Button_Save_3400] START====');
      let authorized = false;
      let finished = false;
      const finish = () => {
        if (!finished) {
          finished = true;
          done();
        }
      };
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave18');
      await Utils.sleep(3000);
      console.info(`====>[Test_Security_Button_Save_3400] strJsonNew is: ${strJsonNew}`);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(12);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData: events_emitter.EventData) => {
          if (clickData.data != undefined){
            console.info("====>[Test_Security_Button_Save_3400] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Save_3400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Save_3400] 设置权限成功");
              authorized = true;
              console.info("====>[Test_Security_Button_Save_3400] END====");
            } else {
              console.info("====>[Test_Security_Button_Save_3400] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Save_3400] END====");
            }
          } else {
            console.info("====>[Test_Security_Button_Save_3400] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3400] END====");
          }
        }
        let clickEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3400] once clickEvent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(3000);
        console.info("====>[Test_Security_Button_Save_3400] button is:" + JSON.stringify(button));
        if (await button.isEnabled()) {
          await button.click();
          await Utils.sleep(1000);
        } else {
          console.info(`====>[Test_Security_Button_Save_3400] SaveButton is disabled`);
          if (!authorized) {
            expect(false).assertTrue();
          }
        }
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3400] clickSecComponent err : " + JSON.stringify(err));
        if (!authorized) {
          expect(false).assertTrue();
        }
      }
      expect(authorized).assertTrue();
      await Utils.sleep(1000);
      finish();
    });
  })
}