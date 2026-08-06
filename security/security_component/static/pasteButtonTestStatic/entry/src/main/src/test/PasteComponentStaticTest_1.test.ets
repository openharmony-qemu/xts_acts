'use static';
/**
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect,
    TestType,
    Size,
    Level
} from "../../../hypium/index";
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
  PasteButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  Color,
  HorizontalAlign,
  VerticalAlign,
  Axis,
  ChainStyle,
  AlignRuleOption,
  SecurityComponentRoleType
} from '@ohos.arkui.component';

let gContext: common.UIAbilityContext;

export default function pasteComponentStaticTest_1() {
  describe('pasteComponentStaticTest_1', ( ) =>{
    console.info("====>pasteComponentStaticTest_1 start");
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.example.securitycomponent.static', 'EntryAbility')
      await UtilsTest.msSleep(2000);
      let options:router.RouterOptions = {
        url: 'pages/pasteButton_1',
      };
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>pasteComponentStaticTest_1 get state success 1 ' + JSON.stringify(pages));
        if (!('pasteButton' == pages.name)) {
          console.info('====>pasteComponentStaticTest_1 get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error('====>pasteComponentStaticTest_1 push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info("====>pasteComponentStaticTest_1 after each called");
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_Static_0100
     * @tc.name   Test_Security_Button_PasteScenarios_Static_0100
     * @tc.desc   Test SecurityComponent layoutDirection attribute is undefined and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_PasteScenarios_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          "icon": 0,
          "textType": 0,
          "bgType": ButtonType.Normal,
          "iconSize": 16,
          "direct": undefined,
          "positionX": 0,
          "positionY": 0,
          "anchorX": 0,
          "anchorY": 0,
          "offsetX": 0,
          "offsetY": 0,
          "fontSize": 16,
          "fontStyle": FontStyle.Normal,
          "fontWeight": FontWeight.Medium,
          "fontFamily": 'HarmonyOS Sans',
          "fontColor": 0xffffffff,
          "iconColor": 0xffffffff,
          "bgColor": 0xff007dff,
          "borderSty": BorderStyle.Dashed,
          "borderWid": 0,
          "borderCol": 0xffffffff,
          "borderRad": 0,
          "left": 12,
          "right": 12,
          "top": 4,
          "bottom": 4,
          "middle": 4,
          "width": 10,
          "height": 15,
          "minWidth": 20,
          "maxWidth": 25,
          "minHeight": 30,
          "maxHeight": 35
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error('====>[Test_Security_Button_PasteScenarios_Static_0100] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJsonNew: string = inspector.getInspectorByKey('keyPaste2');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_Static_0100] get obj is: " + JSON.stringify(obj));
      // layoutDirection的undefined取值
      expect(obj.getElement('$attrs').getInteger('layoutDirection')).assertEqual(SecurityComponentLayoutDirection.HORIZONTAL);
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info("====>[Test_Security_Button_PasteScenarios_Static_0100] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_PasteScenarios_Static_0100] get data['clickResult'] is: " + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.error('====>[Test_Security_Button_PasteScenarios_Static_0100] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_PasteScenarios_Static_0100] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        console.error('====>[Test_Security_Button_PasteScenarios_Static_0100] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_Static_0200
     * @tc.name   Test_Security_Button_PasteScenarios_Static_0200
     * @tc.desc   Test SecurityComponent layoutDirection attribute is null and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_PasteScenarios_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          "icon": 0,
          "textType": 0,
          "bgType": ButtonType.Normal,
          "iconSize": 16,
          "direct": null,
          "positionX": 0,
          "positionY": 0,
          "anchorX": 0,
          "anchorY": 0,
          "offsetX": 0,
          "offsetY": 0,
          "fontSize": 16,
          "fontStyle": FontStyle.Normal,
          "fontWeight": FontWeight.Medium,
          "fontFamily": 'HarmonyOS Sans',
          "fontColor": 0xffffffff,
          "iconColor": 0xffffffff,
          "bgColor": 0xff007dff,
          "borderSty": BorderStyle.Dashed,
          "borderWid": 0,
          "borderCol": 0xffffffff,
          "borderRad": 0,
          "left": 12,
          "right": 12,
          "top": 4,
          "bottom": 4,
          "middle": 4,
          "width": 10,
          "height": 15,
          "minWidth": 20,
          "maxWidth": 25,
          "minHeight": 30,
          "maxHeight": 35
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error('====>[Test_Security_Button_PasteScenarios_Static_0200] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJsonNew: string = inspector.getInspectorByKey('keyPaste2');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_Static_0200] get obj is: " + JSON.stringify(obj));
      // layoutDirection的null取值
      expect(obj.getElement('$attrs').getInteger('layoutDirection')).assertEqual(SecurityComponentLayoutDirection.HORIZONTAL);
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info("====>[Test_Security_Button_PasteScenarios_Static_0200] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_PasteScenarios_Static_0200] get data['clickResult'] is: " + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.error('====>[Test_Security_Button_PasteScenarios_Static_0200] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_PasteScenarios_Static_0200] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        console.error('====>[Test_Security_Button_PasteScenarios_Static_0200] clickSecComponent err : ' + JSON.stringify(err));
      }
    });
  })
}