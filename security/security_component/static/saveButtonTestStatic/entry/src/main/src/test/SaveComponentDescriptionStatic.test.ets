'use static';
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, Component, Point } from '@ohos.UiTest'
import { UtilsTest } from './Util.test';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { BusinessError, RecordData } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import display from '@ohos.display';
import {
  SaveButtonOnClickResult,
  ButtonType
} from '@ohos.arkui.component';

export default function saveComponentDescriptionStaticTest() {
  describe('saveComponentDescriptionStaticTest', () => {
    console.info('====>saveComponentDescriptionStaticTest start');
    let driver: Driver = Driver.create();
    let authorized: boolean = false;
    let caseDone: boolean = false;

    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'pages/saveDescription',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>saveComponentDescriptionStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('saveDescription' == pages.name)) {
          console.info('====>saveComponentDescriptionStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>saveComponentDescriptionStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>saveComponentDescriptionStaticTest after each called');
    });

    let clickBtn = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickBtn function Start====`);
      const findRetry: int = 5;
      let userBtn: Component | null = null;
      for (let retry: int = 0; retry < findRetry; retry++) {
        userBtn = await driver.findComponent(ON.text('允许'));
        await UtilsTest.msSleep(3000);
        console.info(`====>${testname} userBtn is:` + JSON.stringify(userBtn));
        if (userBtn !== null) {
          console.info(`====>${testname} userBtnClick START====`);
          await userBtn.click();
          console.info(`====>${testname} reClick====`);
          break;
        }
        console.info(`====>${testname} userBtn is null, retry ${retry + 1}/${findRetry}`);
        await UtilsTest.msSleep(500);
      }
      if (userBtn === null) {
        let defaultDisplay: display.Display = display.getDefaultDisplaySync();
        console.info(`====>${testname} screen width: ` + defaultDisplay.width + `, height: ` + defaultDisplay.height);
        let btnX: int = Math.floor(defaultDisplay.width * 0.4).toInt();
        let btnY: int = Math.floor(defaultDisplay.height * 0.857).toInt();
        let clickPoint: Point = { x: btnX, y: btnY };
        console.info(`====>${testname} clickAt fallback point: (` + btnX + `, ` + btnY + `)`);
        await driver.clickAt(clickPoint);
        await UtilsTest.msSleep(1000);
      }
      if (userBtn === null) {
        for (let i = 0; i < 25 && !authorized; i++) {
          await UtilsTest.msSleep(200);
        }
        if (!authorized) {
          console.error(`====>${testname} clickBtn cannot find button: 允许`);
          expect(false).assertTrue();
        }
      }
      console.info(`====>${testname} clickBtn function End====`);
    }

    let clickSecComponent = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      const findRetry: int = 5;
      let button: Component | null = null;
      for (let retry: int = 0; retry < findRetry; retry++) {
        button = await driver.findComponent(ON.type('SaveButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        if (button !== null) {
          await button.click();
          break;
        }
        console.info(`====>${testname} SaveButton is null, retry ${retry + 1}/${findRetry}`);
        await UtilsTest.msSleep(1000);
      }
      if (button === null) {
        console.error(`====>${testname} SaveButton cannot be found`);
        if (!authorized) {
          expect(false).assertTrue();
        }
        return;
      }
      await UtilsTest.msSleep(2000);
      let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
      console.info(`====>${testname} titleTx is:` + JSON.stringify(titleTx));
      if (titleTx !== null) {
        await clickBtn(testname, driver);
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let clickSwitchButton = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSwitchButton function Start====`);
      const findRetry: int = 5;
      let switchButton: Component | null = null;
      for (let retry: int = 0; retry < findRetry; retry++) {
        switchButton = await driver.findComponent(ON.id('switchButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} switchButton is:` + JSON.stringify(switchButton));
        if (switchButton !== null) {
          await switchButton.click();
          await UtilsTest.msSleep(1000);
          break;
        }
        console.info(`====>${testname} switchButton is null, retry ${retry + 1}/${findRetry}`);
        await UtilsTest.msSleep(1000);
      }
      if (switchButton === null) {
        console.error(`====>${testname} switchButton cannot be found`);
        if (!authorized) {
          expect(false).assertTrue();
        }
        return;
      }
      console.info(`====>${testname} clickSwitchButton function End====`);
    }

    let sucCallback = (testname: string) => {
      console.info(`====>${testname} sucCallback function Start====`);
      let clickEvent:events_emitter.InnerEvent = {
        eventId: 2,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.off(clickEvent.eventId);
      let clickCallback = (clickData:events_emitter.EventData) => {
        try {
          if(clickData.data != undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info(`====>${testname} get clickEvent result is: ` + JSON.stringify(clickEvent));
            console.info(`====>${testname} get clickData.data.clickResult is: ` + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == SaveButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              authorized = true;
              console.info(`====>${testname} END====`);
            } else {
              console.info(`====>${testname} 设置权限失败`);
              authorized = false;
              console.info(`====>${testname} END====`);
            }
          } else {
            console.info(`====>${testname} ERR CASE 失败`);
            authorized = false;
            console.info(`====>${testname} END====`);
          }
        } catch (err) {
          console.error(`====>${testname} once clickEvent err : ` + JSON.stringify(err));
          authorized = false;
        }
      }
      events_emitter.once(clickEvent, clickCallback);
      console.info(`====>${testname} sucCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0100
     * @tc.desc   Test SecurityComponent The button style is a line and the text is described as a download file and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0100';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      let strJson: string = inspector.getInspectorByKey('keyDescription1');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(1);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(1);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0200
     * @tc.desc   Test SecurityComponent The text is described as saving and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0200';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription2');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(2);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0300
     * @tc.desc   Test SecurityComponent The text describes saving the image and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0300';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription3');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(3);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0400
     * @tc.desc   Test SecurityComponent The text describes the saved file and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0400';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription4');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(4);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0500
     * @tc.desc   Test SecurityComponent The text description is download and share and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0500';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription5');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(5);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0600
     * @tc.desc   Test SecurityComponent The text is described as receiving and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0600';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription6');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(6);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0700
     * @tc.desc   Test SecurityComponent The text describes continued receiving and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0700';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription7');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(7);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0800
     * @tc.desc   Test SecurityComponent The text describes save to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0800';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription8');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(8);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_0900
     * @tc.desc   Test SecurityComponent The text describes export to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_0900';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription9');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(9);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_1000
     * @tc.desc   Test SecurityComponent The text describes quick save to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_1000';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription10');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(10);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_1100
     * @tc.desc   Test SecurityComponent The text describes resave to gallery and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_1100';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription11');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(11);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });

    /**
     * @tc.name   Test_Security_SaveDescription_Static_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveDescription_Static_1200
     * @tc.desc   Test SecurityComponent The text describes save all and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveDescription_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveDescription_Static_1200';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      await clickSwitchButton(TCNAME, driver);
      await UtilsTest.msSleep(500);
      let strJson: string = inspector.getInspectorByKey('keyDescription12');
      console.info(`====>>${TCNAME} strJson: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(12);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      await clickSecComponent(TCNAME, driver);
      for (let i = 0; i < 25 && !authorized; i++) {
        await UtilsTest.msSleep(200);
      }
      expect(authorized).assertTrue();
      if (!caseDone) {
        caseDone = true;
        done();
      }
    });
  })
}
