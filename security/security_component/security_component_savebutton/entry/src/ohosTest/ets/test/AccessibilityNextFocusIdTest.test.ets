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
import display from '@ohos.display';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';
import window from '@ohos.window';
import { ObjectUtils } from './ObjectUtils'

export default function accessibilityNextFocusIdTest() {
  describe('accessibilityNextFocusIdTest', ( ) => {
    beforeAll(async (done:Function) => {
      let options:router.RouterOptions = {
        url: 'testability/pages/accessibilityNextFocusId',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('====>accessibilityNextFocusIdTest get state success ' + JSON.stringify(pages));
        if (!('accessibilityNextFocusId' == pages.name)) {
          console.info('====>accessibilityNextFocusIdTest get state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('====>accessibilityNextFocusIdTest push page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('====>accessibilityNextFocusIdTest push page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('====>accessibilityNextFocusIdTest after each called');
    });

    let clickSecComponent = async (testname: string, expectText: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        let buttonText = await button.getText();
        console.info(`====>${testname} buttonText is:` + JSON.stringify(buttonText));
        expect(expectText == buttonText).assertTrue();
        await button.click();
        await Utils.sleep(1000);
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info(`====>${testname} titleTx is:` + JSON.stringify(titleTx));
        if (titleTx !== null) {
          await clickAllowBtn(testname, driver);
        }
      } catch (err) {
        console.error(`====>${testname} clickSecComponent err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let clickAllowBtn = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickAllowBtn function Start====`);
      try {
        let allowBtn = await driver.findComponent(ON.text('允许'));
        console.info(`====>${testname} allowBtn is:` + JSON.stringify(allowBtn));
        if(allowBtn !== null) {
          console.info(`====>${testname} allowBtnClick START====`);
          await allowBtn.click();
          console.info(`====>${testname} reClick====`);
        } else {
          let startX = 0;
          let startY = 0;
          let endX = 0;
          let endY = 0;
          display.getAllDisplays((err, data) => {
            console.info(`====>${testname} the window data[0].width: ` + data[0].width);
            console.info(`====>${testname} the window data[0].height: ` + data[0].height);
            startX = endX = Math.floor(data[0].width * (1/2));
            startY = Math.floor(data[0].height * (4/5));
            endY = Math.floor(data[0].height * (1/5));
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(startX, startY, endX, endY);
            await Utils.sleep(100);
          }
          let allowBtn = await driver.findComponent(ON.text('允许'));
          console.info(`====>${testname} allowBtn is:` + JSON.stringify(allowBtn));
          console.info(`====>${testname} allowBtnClick START====`);
          await allowBtn.click();
          console.info(`====>${testname} reClick====`);
        }
      } catch (err) {
        console.error(`====>${testname} clickAllowBtn err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickAllowBtn function End====`);
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
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
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
     * @tc.name   Test_Security_Button_Accessibility_Next_Focus_Id_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Accessibility_Next_Focus_Id_0100
     * @tc.desc   Test SaveComponent accessibilityNextFocusId set valid existing component id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Accessibility_Next_Focus_Id_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_Accessibility_Next_Focus_Id_0100';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '下载';
      
      try {
        let strJson = getInspectorByKey('keyAccessibilityNextFocusId');
        let obj : ESObject = JSON.parse(strJson);
        console.info(`====>${TCNAME} getInspectorByKey result: ` + JSON.stringify(obj));
        
        let eventData:events_emitter.EventData = {
          data: {
            "accessibilityNextFocusId": "nextFocusTarget"
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} emit accessibilityNextFocusId valid id event====`);
        events_emitter.emit(innerEvent, eventData);
        await Utils.sleep(2000);
        
        strJson = getInspectorByKey('keyAccessibilityNextFocusId');
        obj = JSON.parse(strJson);
        console.info(`====>${TCNAME} after emit, getInspectorByKey result: ` + JSON.stringify(obj));
        console.info(`====>${TCNAME} after emit, accessibilityNextFocusId result: ` + JSON.stringify(obj.$attrs.accessibilityNextFocusId));
        
        sucCallback(TCNAME, done);
        let driver = Driver.create();
        await clickSecComponent(TCNAME, expectText, driver);
      } catch (err) {
        console.error(`====>${TCNAME} err: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   Test_Security_Button_Accessibility_Next_Focus_Id_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Accessibility_Next_Focus_Id_0200
     * @tc.desc   Test SaveComponent accessibilityNextFocusId set invalid non-existing component id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Accessibility_Next_Focus_Id_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_Accessibility_Next_Focus_Id_0200';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '下载';
      
      try {
        let strJson = getInspectorByKey('keyAccessibilityNextFocusId');
        let obj : ESObject = JSON.parse(strJson);
        console.info(`====>${TCNAME} getInspectorByKey result: ` + JSON.stringify(obj));
        
        let eventData:events_emitter.EventData = {
          data: {
            "accessibilityNextFocusId": "nonExistentId"
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} emit accessibilityNextFocusId invalid id event====`);
        events_emitter.emit(innerEvent, eventData);
        await Utils.sleep(2000);
        
        strJson = getInspectorByKey('keyAccessibilityNextFocusId');
        obj = JSON.parse(strJson);
        console.info(`====>${TCNAME} after emit, getInspectorByKey result: ` + JSON.stringify(obj));
        console.info(`====>${TCNAME} after emit, accessibilityNextFocusId result: ` + JSON.stringify(obj.$attrs.accessibilityNextFocusId));
        
        sucCallback(TCNAME, done);
        let driver = Driver.create();
        await clickSecComponent(TCNAME, expectText, driver);
      } catch (err) {
        console.error(`====>${TCNAME} err: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   Test_Security_Button_Accessibility_Next_Focus_Id_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Accessibility_Next_Focus_Id_0300
     * @tc.desc   Test SaveComponent accessibilityNextFocusId set empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_Security_Button_Accessibility_Next_Focus_Id_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_Accessibility_Next_Focus_Id_0300';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '下载';
      
      try {
        let strJson = getInspectorByKey('keyAccessibilityNextFocusId');
        let obj : ESObject = JSON.parse(strJson);
        console.info(`====>${TCNAME} getInspectorByKey result: ` + JSON.stringify(obj));
        
        let eventData:events_emitter.EventData = {
          data: {
            "accessibilityNextFocusId": ""
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} emit accessibilityNextFocusId empty string event====`);
        events_emitter.emit(innerEvent, eventData);
        await Utils.sleep(2000);
        
        strJson = getInspectorByKey('keyAccessibilityNextFocusId');
        obj = JSON.parse(strJson);
        console.info(`====>${TCNAME} after emit, getInspectorByKey result: ` + JSON.stringify(obj));
        console.info(`====>${TCNAME} after emit, accessibilityNextFocusId result: ` + JSON.stringify(obj.$attrs.accessibilityNextFocusId));
        
        sucCallback(TCNAME, done);
        let driver = Driver.create();
        await clickSecComponent(TCNAME, expectText, driver);
      } catch (err) {
        console.error(`====>${TCNAME} err: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   Test_Security_Button_Accessibility_Next_Focus_Id_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Accessibility_Next_Focus_Id_0400
     * @tc.desc   Test SaveComponent accessibilityNextFocusId default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_Security_Button_Accessibility_Next_Focus_Id_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_Accessibility_Next_Focus_Id_0400';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '下载';
      
      try {
        let strJson = getInspectorByKey('keyAccessibilityNextFocusId');
        let obj : ESObject = JSON.parse(strJson);
        console.info(`====>${TCNAME} getInspectorByKey result: ` + JSON.stringify(obj));
        
        expect(obj.$attrs.accessibilityNextFocusId == undefined || obj.$attrs.accessibilityNextFocusId == "").assertTrue();
        console.info(`====>${TCNAME} accessibilityNextFocusId default value check success====`);
        done();
      } catch (err) {
        console.error(`====>${TCNAME} err: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });
  })
}