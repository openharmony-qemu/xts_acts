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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import { UtilsTest } from './Util.test';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { BusinessError, RecordData } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import window from '@ohos.window';
import display from '@ohos.display';
import common from '@ohos.app.ability.common';
import {
  SaveButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  Color
} from '@ohos.arkui.component';

let gContext: common.UIAbilityContext;

export default function saveComponentStaticTest() {
  describe('saveComponentStaticTest', () => {
    console.info('====>saveComponentStaticTest start');
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'pages/saveButton',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>saveComponentStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('saveButton' == pages.name)) {
          console.info('====>saveComponentStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>saveComponentStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>saveComponentStaticTest after each called');
    });

    let clickBtn = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickBtn function Start====`);
      try {
        let userBtn = await driver.findComponent(ON.text('允许'));
        console.info(`====>${testname} userBtn is:` + JSON.stringify(userBtn));
        if(userBtn !== null) {
          console.info(`====>${testname} userBtnClick START====`);
          await (userBtn?.click() as Promise<void>);
          console.info(`====>${testname} reClick====`);
        } else {
          let startX: int = 0;
          let startY: int = 0;
          let endX: int = 0;
          let endY: int = 0;
          display.getAllDisplays((err: BusinessError | null, data: Array<display.Display> | undefined) => {
            if (err?.code) {
              console.info(`====>${testname} failed to obtain all the display objects. Code: ${err?.code}, message: ${err?.message}`);
              expect(false).assertTrue();
            }
            if (data && data.length > 0) {
              console.info(`====>${testname} the window data[0].width: ` + data[0].width);
              console.info(`====>${testname} the window data[0].height: ` + data[0].height);
              startX = endX = Math.floor(data[0].width * (1/2)) as Int;
              startY = Math.floor(data[0].height * (4/5)) as Int;
              endY = Math.floor(data[0].height * (1/5)) as Int;
            } else {
              console.info(`====>${testname} failed to obtain all the display objects data is Null`);
              expect(false).assertTrue();
            }
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(startX, startY, endX, endY);
            await UtilsTest.msSleep(100);
          }
          let userBtn = await driver.findComponent(ON.text('允许'));
          console.info(`====>${testname} userBtn is:` + JSON.stringify(userBtn));
          console.info(`====>${testname} userBtnClick START====`);
          await (userBtn?.click() as Promise<void>);
          console.info(`====>${testname} reClick====`);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${testname} clickBtn err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickBtn function End====`);
    }

    let clickSecComponent = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(2000);
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info(`====>${testname} titleTx is:` + JSON.stringify(titleTx));
        if (titleTx !== null) {
          await clickBtn(testname, driver);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${testname} clickSecComponent err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let sucCallback = (testname: string, done: () => void) => {
      console.info(`====>${testname} sucCallback function Start====`);
      let clickEvent:events_emitter.InnerEvent = {
        eventId: 2,
        priority: events_emitter.EventPriority.LOW
      }
      let clickCallback = (clickData:events_emitter.EventData) => {
        try {
          if(clickData.data != undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info(`====>${testname} get clickEvent result is: ` + JSON.stringify(clickEvent));
            console.info(`====>${testname} get clickData.data.clickResult is: ` + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == SaveButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(data['clickResult'] == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            } else {
              console.info(`====>${testname} 设置权限失败`);
              expect(false).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            }
          } else {
            console.info(`====>${testname} ERR CASE 失败`);
            expect(false).assertTrue();
            console.info(`====>${testname} END====`);
            done();
          }
        } catch (err) {
          err = err as BusinessError;
          console.error(`====>${testname} once clickEvent err : ` + JSON.stringify(err));
          done();
        }
      }
      events_emitter.once(clickEvent, clickCallback);
      console.info(`====>${testname} sucCallback function End====`);
    }

    let failCallback = (testname: string, done: () => void) => {
      console.info(`====>${testname} failCallback function Start====`);
      let clickEvent:events_emitter.InnerEvent = {
        eventId: 2,
        priority: events_emitter.EventPriority.LOW
      }
      let clickCallback = (clickData:events_emitter.EventData) => {
        try {
          if(clickData.data != undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info(`====>${testname} get clickEvent result is: ` + JSON.stringify(clickEvent));
            console.info(`====>${testname} get clickData.data.clickResult is: ` + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == SaveButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info(`====>${testname} 设置权限失败 pass`);
              expect(data['clickResult'] == SaveButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            } else {
              console.info(`====>${testname} ERR CASE 失败`);
              expect(false).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            }
          } else {
            console.info(`====>${testname} ERR CASE 失败`);
            expect(false).assertTrue();
            console.info(`====>${testname} END====`);
            done();
          }
        } catch (err) {
          err = err as BusinessError;
          console.error(`====>${testname} once clickEvent err : ` + JSON.stringify(err));
          done();
        }
      }
      events_emitter.once(clickEvent, clickCallback);
      console.info(`====>${testname} failCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_SaveButton_Static_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0100
     * @tc.desc   Test SecurityComponent Default parameters and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveButton_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0100';
      console.info(`====>${TCNAME} START====`);
      let strJson: string = inspector.getInspectorByKey('keySave');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('buttonType')).assertEqual(0);
      expect(obj.getElement('$attrs').getString('iconSize')).assertEqual('16.00vp');
      expect(obj.getElement('$attrs').getInteger('layoutDirection')).assertEqual(0);
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00vp');
      expect(obj.getElement('$attrs').getInteger('fontStyle')).assertEqual(0);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('iconColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF007DFF');
      expect(obj.getElement('$attrs').getInteger('borderStyle')).assertEqual(1);
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('left')).assertEqual('12.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('right')).assertEqual('12.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('top')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('bottom')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getString('textIconSpace')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getString('align')).assertEqual('Alignment.Center');
      expect(obj.getElement('$attrs').getString('id').toString()).assertEqual('keySave');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0200
     * @tc.desc   Test SecurityComponent layoutDirection attribute is VERTICAL and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0200';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.VERTICAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('layoutDirection')).assertEqual(1);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0300
     * @tc.desc   Test SecurityComponent position.x is 10.00vp and position.y is 10.00vp
     * markAnchor.x is 20.00vp and markAnchor.y is 20.00vp and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
     it('Test_Security_SaveButton_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0300';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '10',
          'positionY': '10',
          'anchorX': '20',
          'anchorY': '20',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('20.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0400
     * @tc.desc   Test SecurityComponent offset and markAnchor attribute is normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0400';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.VERTICAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '20',
          'anchorY': '20',
          'offsetX': '10',
          'offsetY': '10',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('10.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0500
     * @tc.desc   Test SecurityComponent FontStyle attribute is Italic and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0500';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Italic,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('fontStyle')).assertEqual(1);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0600
     * @tc.desc   Test SecurityComponent FontWeight attribute is Lighter and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0600';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Lighter,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0700
     * @tc.desc   Test SecurityComponent FontWeight attribute is Normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0700';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Normal,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0800
     * @tc.desc   Test SecurityComponent FontWeight attribute is Regular and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0800';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Regular,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Regular');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_0900
     * @tc.desc   Test SecurityComponent FontWeight attribute is Bold and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_0900';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Bold,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_Static_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_Static_1000
     * @tc.desc   Test SecurityComponent FontWeight attribute is Bolder and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_Static_1000';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Bolder,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySave');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });
  })
}
