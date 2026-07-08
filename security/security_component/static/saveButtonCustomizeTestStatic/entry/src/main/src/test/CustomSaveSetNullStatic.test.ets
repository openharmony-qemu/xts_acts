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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import display from '@ohos.display';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import { UtilsTest } from './Util.test';
import window from '@ohos.window';
import { BusinessError, RecordData } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import {
  SaveButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  Color,
  Resource,
  ResourceColor,
  SymbolRenderingStrategy,
  $r
} from '@ohos.arkui.component';

export default function customSaveSetNullStaticTest() {
  describe('customSaveSetNullStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      let options:router.RouterOptions = {
        url: 'pages/customSaveSetNull',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>customSaveSetNullStaticTest get state success ' + JSON.stringify(pages));
        if (!('customSaveSetNull' == pages.name)) {
          console.info('====>customSaveSetNullStaticTest get state success ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>customSaveSetNullStaticTest push page error: ' + err);
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>saveCompCustomizeTest after each called');
    });

    let clickAllowBtn = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickAllowBtn function Start====`);
      try {
        let allowBtn = await driver.findComponent(ON.text('允许'));
        console.info(`====>${testname} allowBtn is:` + JSON.stringify(allowBtn));
        if(allowBtn !== null) {
          console.info(`====>${testname} allowBtnClick START====`);
          await (allowBtn?.click() as Promise<void>);
          console.info(`====>${testname} reClick====`);
        } else {
          let startX = 0;
          let startY = 0;
          let endX = 0;
          let endY = 0;
          display.getAllDisplays((err: BusinessError | null, data: Array<display.Display> | undefined) => {
            if (err?.code) {
              console.info(`====>${testname} failed to obtain all the display objects. Code: ${err?.code}, message: ${err?.message}`);
              expect(false).assertTrue();
            }
            if (data && data.length > 0) {
              console.info(`====>${testname} the window data[0].width: ` + data[0].width);
              console.info(`====>${testname} the window data[0].height: ` + data[0].height);
              startX = endX = Math.floor(data[0].width * (1/2)).toInt();
              startY = Math.floor(data[0].height * (4/5)).toInt();
              endY = Math.floor(data[0].height * (1/5)).toInt();
            } else {
              console.info(`====>${testname} failed to obtain all the display objects data is Null`);
              expect(false).assertTrue();
            }
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(startX, startY, endX, endY);
            await UtilsTest.msSleep(100);
          }
          let allowBtn = await driver.findComponent(ON.text('允许'));
          console.info(`====>${testname} allowBtn is:` + JSON.stringify(allowBtn));
          console.info(`====>${testname} allowBtnClick START====`);
          await (allowBtn?.click() as Promise<void>);
          console.info(`====>${testname} reClick====`);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${testname} clickAllowBtn err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickAllowBtn function End====`);
    }

    let clickSecComponent = async (testname: string, expectText: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        let buttonText: string = await (button?.getText() as Promise<string>);
        console.info(`====>${testname} buttonText is:` + JSON.stringify(buttonText));
        expect(expectText == buttonText).assertTrue();
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info(`====>${testname} titleTx is:` + JSON.stringify(titleTx));
        if (titleTx !== null) {
          await clickAllowBtn(testname, driver);
        }
        let button2 = await driver.findComponent(ON.id('switchButton'))
        console.info(`====>${testname} switchButton is:` + JSON.stringify(button2));
        await (button2?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
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
          if(clickData.data !=undefined){
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
          console.info(`====>${testname} END====`);
          done();
        }
      }
      events_emitter.once(clickEvent, clickCallback);
      console.info(`====>${testname} sucCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_Customize_SaveButton_SetNull_Static_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Customize_SaveButton_SetNull_Static_0100
     * @tc.desc   Test SaveComponent attr symbolIconColor set undefined validated and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Customize_SaveButton_SetNull_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_Customize_SaveButton_SetNull_Static_0100';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '自定义保存';
      let strJson: string = inspector.getInspectorByKey('customSave0');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('buttonType')).assertEqual(0);
//      expect(obj.getElement('$attrs').getString('symbolIconColor')).assertEqual('#E5000000');
      expect(obj.getElement('$attrs').getString('SymbolRenderingStrategy')).assertEqual('SymbolRenderingStrategy.SINGLE');
      expect(obj.getElement('$attrs').getString('SymbolFontWeight')).assertEqual('FontWeight.Normal');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });

    /**
     * @tc.name   Test_Security_Customize_SaveButton_SetNull_Static_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Customize_SaveButton_SetNull_Static_0200
     * @tc.desc   Test SaveComponent attr symbolIconColor set null validated and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Customize_SaveButton_SetNull_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_Customize_SaveButton_SetNull_Static_0200';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '自定义保存';
      let strJson: string = inspector.getInspectorByKey('customSave1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('buttonType')).assertEqual(0);
//      expect(obj.getElement('$attrs').getString('symbolIconColor')).assertEqual('#E5000000');
      expect(obj.getElement('$attrs').getString('SymbolRenderingStrategy')).assertEqual('SymbolRenderingStrategy.SINGLE');
      expect(obj.getElement('$attrs').getString('SymbolFontWeight')).assertEqual('FontWeight.Normal');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });
  })
}