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
import window from '@ohos.window';
import display from '@ohos.display';
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

export default function saveComponentUserCancelStaticTest() {
  describe('saveComponentUserCancelStaticTest', () => {
    console.info('====>saveComponentUserCancelStaticTest start');
    let driver: Driver = Driver.create();
    let authorized: boolean = false;
    let caseDone: boolean = false;

    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.example.securitycomponent.static', 'EntryAbility')
      await UtilsTest.msSleep(2000);
      let options: router.RouterOptions = {
        url: 'pages/saveButtonUserCancel',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>saveComponentUserCancelStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('saveButtonUserCancel' == pages.name)) {
          console.info('====>saveComponentUserCancelStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>saveComponentUserCancelStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>saveComponentUserCancelStaticTest after each called');
    });

    let clickBtn = async (testname: string, driver: Driver, targetBut: string) => {
      console.info(`====>${testname} clickBtn function Start====`);
      const findRetry: int = 5;
      let userBtn: Component | null = null;
      for (let retry: int = 0; retry < findRetry; retry++) {
        userBtn = await driver.findComponent(ON.text(targetBut));
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
        let screenW: int = Math.floor(defaultDisplay.width).toInt();
        let screenH: int = Math.floor(defaultDisplay.height).toInt();
        console.info(`====>${testname} screen width: ` + screenW + `, height: ` + screenH);
        let allowBaseY: int = Math.floor(screenH * 0.857).toInt();

        if (targetBut == '允许') {
          // 兼容手表弹窗左右布局
          let allowX: int = Math.floor(screenW * 0.6).toInt();
          let allowPoint: Point = { x: allowX, y: allowBaseY };
          console.info(`====>${testname} clickAt horizontal fallback point for 允许: (` + allowX + `, ` + allowBaseY + `)`);
          try {
            await driver.clickAt(allowPoint);
          } catch (e) {
            console.error(`====>${testname} clickAt error: ` + JSON.stringify(e));
          }
          for (let i = 0; i < 10 && !authorized; i++) {
            await UtilsTest.msSleep(200);
          }
          if (!authorized) {
            let allowProbeYs: Array<int> = [
              allowBaseY,
              Math.floor(screenH * 0.78).toInt(),
              Math.floor(screenH * 0.92).toInt(),
              Math.floor(screenH * 0.7).toInt()
            ];
            for (let p: int = 0; p < allowProbeYs.length && !authorized; p++) {
              let allowProbePoint: Point = { x: Math.floor(screenW * 0.5).toInt(), y: allowProbeYs[p] };
              console.info(`====>${testname} allow probe click at (` + allowProbePoint.x + `, ` + allowProbePoint.y + `)`);
              await driver.clickAt(allowProbePoint);
              await UtilsTest.msSleep(800);
            }
          }
        } else {
          // 兼容手表弹窗上下布局
          let scrollX: int = Math.floor(screenW * 0.5).toInt();
          let dragFromY: int = Math.floor(screenH * 0.75).toInt();
          let dragToY: int = Math.floor(screenH * 0.35).toInt();
          let dragFrom: Point = { x: scrollX, y: dragFromY };
          let dragTo: Point = { x: scrollX, y: dragToY };
          let dialogClosed: boolean = false;
          for (let round: int = 0; round < 3 && !authorized && !dialogClosed; round++) {
            try {
              if (round == 1) {
                console.info(`====>${testname} fling up, round ` + round);
                await driver.fling(dragFrom, dragTo, 50, 1000);
              } else {
                console.info(`====>${testname} drag up, round ` + round);
                await driver.drag(scrollX, dragFromY, scrollX, dragToY, 600);
              }
            } catch (e) {
              console.error(`====>${testname} scroll error: ` + JSON.stringify(e));
            }
            await UtilsTest.msSleep(600);

            // 滚动后部分设备按钮对 UiTest 可见，优先按文本查找并点击
            userBtn = await driver.findComponent(ON.text(targetBut));
            if (userBtn !== null) {
              console.info(`====>${testname} userBtnClick after scroll START====`);
              await userBtn.click();
              console.info(`====>${testname} reClick after scroll====`);
              break;
            }

            // 自下而上逐档探测：“取消”在“允许”下方，先点屏幕底部
            let probeYs: Array<int> = [
              Math.floor(screenH * 0.95).toInt(),
              Math.floor(screenH * 0.89).toInt(),
              Math.floor(screenH * 0.83).toInt(),
              Math.floor(screenH * 0.77).toInt(),
              Math.floor(screenH * 0.71).toInt(),
              Math.floor(screenH * 0.65).toInt(),
              Math.floor(screenH * 0.59).toInt()
            ];
            for (let p: int = 0; p < probeYs.length && !authorized; p++) {
              let probePoint: Point = { x: scrollX, y: probeYs[p] };
              console.info(`====>${testname} probe click at (` + scrollX + `, ` + probeYs[p] + `)`);
              await driver.clickAt(probePoint);
              await UtilsTest.msSleep(800);
              if (authorized) {
                console.info(`====>${testname} probe click hit 取消====`);
                break;
              }
              // 弹窗消失说明误点到了“允许”，后续探测无意义
              let titleNow: Component | null = await driver.findComponent(ON.text('安全保存图片和视频'));
              if (titleNow === null) {
                console.info(`====>${testname} dialog closed during probe (hit 允许), stop probe`);
                dialogClosed = true;
                break;
              }
            }
          }
        }
      }
      if (userBtn === null) {
        for (let i = 0; i < 25 && !authorized; i++) {
          await UtilsTest.msSleep(200);
        }
        if (!authorized) {
          console.error(`====>${testname} clickBtn cannot find button: ` + targetBut);
          expect(false).assertTrue();
        }
      }
      console.info(`====>${testname} clickBtn function End====`);
    }

    let clickSecComponent = async (testname: string, driver: Driver, butt: string) => {
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
        await clickBtn(testname, driver, butt);
      }
      console.info(`====>${testname} clickSecComponent function End====`);
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

    let cancelCallback = (testname: string) => {
      console.info(`====>${testname} cancelCallback function Start====`);
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
            if (data['clickResult'] == SaveButtonOnClickResult.CANCELED_BY_USER) {
              console.info(`====>${testname} 取消授权成功`);
              authorized = true;
              console.info(`====>${testname} END====`);
            } else {
              console.info(`====>${testname} 取消授权失败`);
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
      console.info(`====>${testname} cancelCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_SaveButton_CancelStatic_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0100
     * @tc.desc   Test SaveComponent userCancelEvent is true and userCancel Save successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveButton_CancelStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0100';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      try {
        let data: Record<string, RecordData> = {
          'userEve': true
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      cancelCallback(TCNAME);
      let targetBut = '取消';
      await clickSecComponent(TCNAME, driver, targetBut);
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
     * @tc.name   Test_Security_SaveButton_CancelStatic_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0200
     * @tc.desc   Test SaveComponent userCancelEvent is true and Authorization is successfully after clicking Allow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CancelStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0200';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      try {
        let data: Record<string, RecordData> = {
          'userEve': true
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      let targetBut = '允许';
      await clickSecComponent(TCNAME, driver, targetBut);
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
     * @tc.name   Test_Security_SaveButton_CancelStatic_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0300
     * @tc.desc   Test SaveComponent userCancelEvent is false and Authorization is successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CancelStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0300';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      try {
        let data: Record<string, RecordData> = {
          'userEve': false
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      let targetBut = '允许';
      await clickSecComponent(TCNAME, driver, targetBut);
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
     * @tc.name   Test_Security_SaveButton_CancelStatic_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0400
     * @tc.desc   Test SaveComponent userCancelEvent is undefined and Authorization is successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CancelStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0400';
      console.info(`====>${TCNAME} START====`);
      authorized = false;
      caseDone = false;
      try {
        let data: Record<string, RecordData> = {
          'userEve': undefined
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME);
      let targetBut = '允许';
      await clickSecComponent(TCNAME, driver, targetBut);
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
