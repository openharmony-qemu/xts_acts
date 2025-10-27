/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, afterEach, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import common from "@ohos.app.ability.common";
import { Resource, Color, CancelButtonStyle, $r } from '@ohos.arkui.component';
import { SliderExampleManager } from '../../../ets/MainAbility/pages/Search/SearchTest';
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

let emitKey = "emitUserAgent";

function spliceColor(sysColor: Resource) {
  const abilityStageContext =
    AppStorage.get<common.AbilityStageContext>('stageContext') as common.AbilityStageContext;
  let resourceColor = abilityStageContext.resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#' + resourceColor.toString(16).toUpperCase()
  return newArgb;
}

export default function search() {
  describe('ActsAceSearchTest', () => {
    beforeAll(() => {
      console.info("search beforeEach start");


      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("search beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Search state pages:" + JSON.stringify(pages));
        if (!("SearchTest" == pages.name)) {
          console.info("get SearchTest pages.name:" + '');
          await CommonFunc.sleep(2000);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchTest page error:" + err);
      }
      console.info("SearchTest beforeEach end");
    })

    afterEach(async (): Promise<void> => {
      console.info("search afterEach start");
      let caretWidthNumber: number = 5
      let caretWidthString: string = '15px'
      let caretWidthResource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let caretColorColor: Color = Color.Red
      let caretColorNumber: number = 0x000000
      let caretColorString: string = '#ff9a35'
      let caretColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let leftSearchIconSizeNumber: number = 20
      let leftSearchIconSizeString: string = '50px'
      let leftSearchIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let leftSearchIconColorColor: Color = Color.Red
      let leftSearchIconColorNumber: number = 0x000000
      let leftSearchIconColorString: string = '#ff9a35'
      let leftSearchIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let searchSrcPath: string = 'common/icon.png'
      let rightButtonStyleParam: CancelButtonStyle = CancelButtonStyle.INPUT
      let rightCancelIconSizeNumber: number = 20
      let rightCancelIconSizeString: string = '50px'
      let rightCancelIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let rightCancelIconColorColor: Color = Color.Red
      let rightCancelIconColorNumber: number = 0x000000
      let rightCancelIconColorString: string = '#ff9a35'
      let rightCancelIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let rightIconSrcPath: string = 'common/icon.png'
      let searchButtonFontSizeNumber: number = 20
      let searchButtonFontSizeString: string = '10vp'
      let searchButtonFontSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let searchButtonFontColorColor: Color = Color.Blue
      let searchButtonFontColorNumber: number = 0x000000
      let searchButtonFontColorString: string = '#ff9a35'
      let searchButtonFontColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let textColorColor: Color = Color.Red
      let textColorNumber: number = 0x000000
      let textColorString: string = '#ff9a35'
      let textColorResource: Resource = $r('sys.color.ohos_id_color_connected')

      try {
        let eventData: events_emitter.EventData = {
          data: {
            'caretWidthNumber': caretWidthNumber,
            'caretWidthString': caretWidthString,
            'caretWidthResource': caretWidthResource,
            'caretColorColor': caretColorColor,
            'caretColorNumber': caretColorNumber,
            'caretColorString': caretColorString,
            'caretColorResource': caretColorResource,
            'leftSearchIconSizeNumber': leftSearchIconSizeNumber,
            'leftSearchIconSizeString': leftSearchIconSizeString,
            'leftSearchIconSizeResource': leftSearchIconSizeResource,
            'leftSearchIconColorColor': leftSearchIconColorColor,
            'leftSearchIconColorNumber': leftSearchIconColorNumber,
            'leftSearchIconColorString': leftSearchIconColorString,
            'leftSearchIconColorResource': leftSearchIconColorResource,
            'searchSrcPath': searchSrcPath,
            'rightButtonStyleParam': rightButtonStyleParam,
            'rightCancelIconSizeNumber': rightCancelIconSizeNumber,
            'rightCancelIconSizeString': rightCancelIconSizeString,
            'rightCancelIconSizeResource': rightCancelIconSizeResource,
            'rightCancelIconColorColor': rightCancelIconColorColor,
            'rightCancelIconColorNumber': rightCancelIconColorNumber,
            'rightCancelIconColorString': rightCancelIconColorString,
            'rightCancelIconColorResource': rightCancelIconColorResource,
            'rightIconSrcPath': rightIconSrcPath,
            'searchButtonFontSizeNumber': searchButtonFontSizeNumber,
            'searchButtonFontSizeString': searchButtonFontSizeString,
            'searchButtonFontSizeResource': searchButtonFontSizeResource,
            'searchButtonFontColorColor': searchButtonFontColorColor,
            'searchButtonFontColorNumber': searchButtonFontColorNumber,
            'searchButtonFontColorString': searchButtonFontColorString,
            'searchButtonFontColorResource': searchButtonFontColorResource,
            'textColorColor': textColorColor,
            'textColorNumber': textColorNumber,
            'textColorString': textColorString,
            'textColorResource': textColorResource
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("search afterEach start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("search afterEach start to publish change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
    })

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0100
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0100
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0200
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0200
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " + JSON.stringify(newJson));

      let caretWidthNumber = 10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0300
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0300
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " + JSON.stringify(newJson));

      let caretWidthString = '15px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("15.00px");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0400
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0400
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " + JSON.stringify(newJson));

      let caretWidthString = '10fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("10.00fp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0500
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0500
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " + JSON.stringify(newJson));

      let caretWidthString = '15lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("15.00lpx");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0600
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0600
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " + JSON.stringify(newJson));
      let caretWidthResource = $r('sys.float.ohos_id_text_margin_vertical');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'caretWidthResource', value: caretWidthResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual('2.00vp');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0700
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0700
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " + JSON.stringify(newJson));

      let caretWidthNumber = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0800
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0800
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " + JSON.stringify(newJson));

      let caretWidthNumber = -1.5;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_0900
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_0900
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " + JSON.stringify(newJson));

      let caretWidthNumber = 100000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("100000.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_0900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1000
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1000
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " + JSON.stringify(newJson));

      let caretWidthNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1100
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1100
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1100] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " + JSON.stringify(newJson));

      let caretWidthNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1200
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1200
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color'))
        .assertEqual(objDefault.getElement('$attrs').getElement('caretStyle').getElement('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1300
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1300
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " + JSON.stringify(newJson));

      let caretColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1400
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1400
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " + JSON.stringify(newJson));

      let caretColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorColor": caretColorColor
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1500
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1500
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " + JSON.stringify(newJson));

      let caretColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color')).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1600
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1600
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " + JSON.stringify(newJson));

      let caretColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'caretColorResource', value: caretColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getElement('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1700
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1700
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " + JSON.stringify(newJson));

      let caretColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getElement('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1800
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1800
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " + JSON.stringify(newJson));

      let caretColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getElement('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_1900
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_1900
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_1900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " + JSON.stringify(newJson));

      let caretColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('caretStyle').getElement('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_1900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2000
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2000
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " + JSON.stringify(newJson));

      let caretWidthNumber = 10;
      let caretColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber,
            "caretColorNumber": caretColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2100
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2100
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " + JSON.stringify(newJson));

      let caretColorString = 'rgb(0, 0, 255)';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color')).assertEqual("#FF0000FF");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2200
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2200
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " + JSON.stringify(newJson));

      let caretColorString = 'rgba(0, 255, 0, 0)';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color')).assertEqual("#0000FF00");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2200] end");
      done();
    });


    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2300
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2300
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2300 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2300] end");
      done();
    });


    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2400
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2400
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2400 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2400] end");
      done();
    });

    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2500
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2500
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2500 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp001');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("5.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2500] end");
      done();
    });


    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2600
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2600
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Search_CaretStyle_static_2600 START');
      let strJson = inspector.getInspectorByKey('searchTestDefaultapp002');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('width')));
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('width')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2600] end");
      done();
    });


    /*
     * @tc.number   ArkUI_Stage_Search_CaretStyle_static_2700
     * @tc.name     ArkUI_Stage_Search_CaretStyle_static_2700
     * @tc.desc     ArkUI_Stage_Search_CaretStyle_static_2700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CaretStyle_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700] start");
      let newJson = inspector.getInspectorByKey('searchTestfontcaretcolor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " + JSON.stringify(newJson));

      let textColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_static_2700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestfontcaretcolor');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('caretStyle').getElement('color')));
      expect(obj.getElement('$attrs').getElement('fontColor')).assertEqual("#FFFF0000");

      let newJson1 = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700]: " + JSON.stringify(newJson1));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');
      let obj1 = JSON.parseJsonElement(newJson1);
      expect(obj.getElement('$attrs').getElement('caretStyle').getElement('color'))
        .assertEqual(obj1.getElement('$attrs').getElement('caretStyle').getElement('color'));
      console.info("[ArkUI_Stage_Search_CaretStyle_static_2700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0100
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0100
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(objDefault.getElement('$attrs').getElement('searchIcon').getElement('size'));
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0200
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0200
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 26;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: number = 26;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0300
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0300
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(strJson))
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: string = UIContext.getFocusedUIContext()!.px2vp(50) > 32 ? UIContext.getFocusedUIContext()!.vp2px(32).toFixed(2) + "px" : '50.00px';
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + result);
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size')).assertEqual(result);
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0400
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0400
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(strJson))
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + uiContext.fp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(uiContext.fp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0500
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0500
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result =
        UIContext.getFocusedUIContext()!.px2vp(uiContext.lpx2px(50)) > 32 ? UIContext.getFocusedUIContext()!.vp2px(32).toFixed(2) : uiContext.lpx2px(50).toFixed(2);
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + result);
      expect(Math.abs(Number((obj.getElement('$attrs').getElement('searchIcon').getString('size')).slice(0, -3)) -
      Number(result)) <= 1).assertTrue();
      expect((obj.getElement('$attrs').getElement('searchIcon').getString('size')).slice(-2)).assertEqual("px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0600
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0600
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(newJson));

      let leftSearchIconSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeResource": leftSearchIconSizeResource
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(strJson))
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: number = 16;
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0700
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0700
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 40;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(strJson))
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0800
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0800
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(strJson))
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: number = 0;
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_0900
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_0900
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = -16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getElement('size'));
      console.info("[ArkUI_Stage_Search_SearchIcon_0900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1000
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1000
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(strJson));
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_1000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1100
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1100
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1100] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getElement('size'));
      console.info("[ArkUI_Stage_Search_SearchIcon_1100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1200
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1200
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getElement('size'));
      console.info("[ArkUI_Stage_Search_SearchIcon_1200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1300
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1300
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect('' + obj.getElement('$attrs').getElement('searchIcon').getElement('color'))
        .assertContain(spliceColor($r('sys.color.search_symbol_icon_color')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1400
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1400
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(newJson));

      let leftSearchIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color')).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_SearchIcon_1400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1500
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1500
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(newJson));

      let leftSearchIconColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorColor": leftSearchIconColorColor
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchIcon_1500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1600
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1600
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(newJson));

      let leftSearchIconColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorString": leftSearchIconColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color')).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_SearchIcon_1600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1700
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1700
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1700] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(newJson));

      let leftSearchIconColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'leftSearchIconColorResource', value: leftSearchIconColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getElement('color'));
      console.info("[ArkUI_Stage_Search_SearchIcon_1700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1800
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1800
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(newJson));

      let leftSearchIconColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorString": leftSearchIconColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getElement('color'));
      console.info("[ArkUI_Stage_Search_SearchIcon_1800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_1900
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_1900
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_1900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(newJson));

      let leftSearchIconColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getElement('color'));
      console.info("[ArkUI_Stage_Search_SearchIcon_1900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2000
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2000
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(newJson));

      let leftSearchIconColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchIcon').getElement('color'));
      console.info("[ArkUI_Stage_Search_SearchIcon_2000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2100
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2100
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 26;
      let leftSearchIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber,
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2100);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('size')));
      let result: number = 26;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('color')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('color')).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_SearchIcon_2100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2200
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2200
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2200] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src')).assertEqual(983081);
      console.info("[ArkUI_Stage_Search_SearchIcon_2200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2300
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2300
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.svg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src')).assertEqual('common/icon2.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2400
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2400
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.jpg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src')).assertEqual('common/icon2.jpg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2500
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2500
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2500] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.png';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src')).assertEqual('common/icon2.png');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2600
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2600
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2600] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(newJson));

      let searchSrcPathResource = $r('sys.media.ohos_app_icon');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'searchSrcPathResource', value: searchSrcPathResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src'))
        .assertEqual('resource:///125829858.png');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2700
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2700
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(newJson));

      let searchSrcPath = 'abc/def/ghi.jkl';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src')).assertEqual('abc/def/ghi.jkl');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2800
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2800
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(newJson));

      let searchSrcPath = '';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src'))
        .assertEqual('resource:///ohos_search.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_2900
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_2900
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_2900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(newJson));

      let searchSrcPath = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src'))
        .assertEqual('resource:///ohos_search.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchIcon_static_3000
     * @tc.name     ArkUI_Stage_Search_SearchIcon_static_3000
     * @tc.desc     ArkUI_Stage_Search_SearchIcon_static_3000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchIcon_static_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchIcon_3000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(newJson));

      let searchSrcPath = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_3000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon')));
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchIcon').getElement('src')));
      expect(obj.getElement('$attrs').getElement('searchIcon').getElement('src'))
        .assertEqual('resource:///ohos_search.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_3000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton').getElement('style')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('style'))
        .assertEqual("CancelButtonStyle.INPUT");
      console.info("[ArkUI_Stage_Search_CancelButton_0100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = CancelButtonStyle.CONSTANT;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton').getElement('style')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('style'))
        .assertEqual("CancelButtonStyle.CONSTANT");
      console.info("[ArkUI_Stage_Search_CancelButton_0200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0300
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0300
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = CancelButtonStyle.INVISIBLE;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton').getElement('style')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('style'))
        .assertEqual("CancelButtonStyle.INVISIBLE");
      console.info("[ArkUI_Stage_Search_CancelButton_0300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0400
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0400
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton').getElement('style')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('style'))
        .assertEqual("CancelButtonStyle.INPUT");
      console.info("[ArkUI_Stage_Search_CancelButton_0400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0500
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0500
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton').getElement('style')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('style'))
        .assertEqual("CancelButtonStyle.INPUT");
      console.info("[ArkUI_Stage_Search_CancelButton_0500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0600
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0600
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(objDefault.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_0600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0700
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0700
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 26;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      let result: number = 26;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_0700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0800
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0800
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeString": rightCancelIconSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      const uiContext = new UIContext();
      let result: string = UIContext.getFocusedUIContext()!.px2vp(50) > 32 ? UIContext.getFocusedUIContext()!.vp2px(32).toFixed(2) + "px" : '50.00px';
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + result);
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(result);
      console.info("[ArkUI_Stage_Search_CancelButton_0800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_0900
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_0900
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeString": rightCancelIconSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      let result: number = 32;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + uiContext.fp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(uiContext.fp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_0900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1000
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1000
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1000] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeString": rightCancelIconSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      let result =
        UIContext.getFocusedUIContext()!.px2vp(uiContext.lpx2px(50)) > 32 ? UIContext.getFocusedUIContext()!.vp2px(32).toFixed(2) : uiContext.lpx2px(50).toFixed(2);
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + result);
      expect(Math.abs(Number((obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getString('size')).slice(0, -3)) - Number(result)) <= 1).assertTrue();
      expect((obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getString('size')).slice(-2))
        .assertEqual("px");
      console.info("[ArkUI_Stage_Search_CancelButton_1000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1100] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(newJson));

      let rightCancelIconSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeResource": rightCancelIconSizeResource
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      let result: number = 16;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 40;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      let result: number = 32;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1300
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1300
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_1300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1400
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1400
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = -16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_1400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1500
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1500
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      let result: number = 32;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1600
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1600
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1600] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_1600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1700
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1700
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'));
      console.info("[ArkUI_Stage_Search_CancelButton_1700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1800
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1800
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1800] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect('' + obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertContain(spliceColor($r('sys.color.search_symbol_icon_color')));
      console.info("[ArkUI_Stage_Search_CancelButton_1800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_1900
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_1900
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_1900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_1900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(newJson));

      let rightCancelIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_CancelButton_1900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2000
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2000
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2000] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(newJson));

      let rightCancelIconColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorColor": rightCancelIconColorColor
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CancelButton_2000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(newJson));

      let rightCancelIconColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorString": rightCancelIconColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_CancelButton_2100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2200] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(newJson));

      let rightCancelIconColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'rightCancelIconColorResource', value: rightCancelIconColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'));
      console.info("[ArkUI_Stage_Search_CancelButton_2200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2300
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2300
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(newJson));

      let rightCancelIconColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorString": rightCancelIconColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'));
      console.info("[ArkUI_Stage_Search_CancelButton_2300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2400
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2400
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(newJson));

      let rightCancelIconColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'));
      console.info("[ArkUI_Stage_Search_CancelButton_2400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2500
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2500
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2500] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(newJson));

      let rightCancelIconColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual(obj2.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'));
      console.info("[ArkUI_Stage_Search_CancelButton_2500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2600
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2600
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2600] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 26;
      let rightCancelIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber,
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2700);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('size')));
      let result: number = 26;
      const uiContext = new UIContext();
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('size'))
        .assertEqual(UIContext.getFocusedUIContext()!.vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('color')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('color'))
        .assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_CancelButton_2600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2700
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2700
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2700] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual(983126);
      console.info("[ArkUI_Stage_Search_CancelButton_2700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2800
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2800
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.svg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('common/icon2.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_2800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_2900
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_2900
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_2900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_2900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.jpg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('common/icon2.jpg');
      console.info("[ArkUI_Stage_Search_CancelButton_2900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3000
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3000
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.png';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('common/icon2.png');
      console.info("[ArkUI_Stage_Search_CancelButton_3000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3100
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3100
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_3100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3100] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(newJson));

      let rightIconSrcPathResource = $r('sys.media.ohos_app_icon');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager
      sliderExampleManager.message.notify({
        name: 'rightIconSrcPathResource', value: rightIconSrcPathResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('resource:///125829858.png');
      console.info("[ArkUI_Stage_Search_CancelButton_3100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3200
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3200
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_3200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'abc/def/ghi.jkl';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('abc/def/ghi.jkl');
      console.info("[ArkUI_Stage_Search_CancelButton_3200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3300
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3300
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_3300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3300] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(newJson));

      let rightIconSrcPath = '';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('resource:///ohos_close.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_3300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3400
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3400
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_3400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(newJson));

      let rightIconSrcPath = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('resource:///ohos_close.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_3400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_CancelButton_static_3500
     * @tc.name     ArkUI_Stage_Search_CancelButton_static_3500
     * @tc.desc     ArkUI_Stage_Search_CancelButton_static_3500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_CancelButton_static_3500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_CancelButton_3500] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(newJson));

      let rightIconSrcPath = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('cancelButton')));
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringifyJsonElement(obj.getElement('$attrs')
        .getElement('cancelButton')
        .getElement('icon')
        .getElement('src')));
      expect(obj.getElement('$attrs').getElement('cancelButton').getElement('icon').getElement('src'))
        .assertEqual('resource:///ohos_close.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_3500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0100
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0100
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize'))
        .assertEqual(objDefault.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize'));
      console.info("[ArkUI_Stage_Search_SearchButton_0100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0200
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0200
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '20vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual("20.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0300
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0300
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual("40.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0400
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0400
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(newJson));

      let searchButtonFontSizeNumber = 20;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeNumber": searchButtonFontSizeNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual('20.00fp');
      console.info("[ArkUI_Stage_Search_SearchButton_0400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0500
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0500
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual("40.00px");
      console.info("[ArkUI_Stage_Search_SearchButton_0500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0600
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0600
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual("40.00lpx");
      console.info("[ArkUI_Stage_Search_SearchButton_0600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0700
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0700
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(newJson));

      let searchButtonFontSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'searchButtonFontSizeResource', value: searchButtonFontSizeResource
      } as Message);
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual('16.00vp');
      console.info("[ArkUI_Stage_Search_SearchButton_0700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0800
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0800
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '0vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_0900
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_0900
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_0900] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '800vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual("800.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1000
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1000
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1000] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '-14vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);


      try {
        let strJson = inspector.getInspectorByKey('searchTestString');
        console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(strJson))
        let obj = JSON.parseJsonElement(strJson);
        const uiContext = new UIContext();
        const abilityStageContext =
          AppStorage.get<common.AbilityStageContext>('stageContext') as common.AbilityStageContext;
        console.info("[ArkUI_Stage_Search_SearchButton_1000]: " +
        JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
        console.info("[ArkUI_Stage_Search_SearchButton_1000]: " +
        JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
       
      }catch(error) {
        expect().assertFail();
      }
      console.info("[ArkUI_Stage_Search_SearchButton_1000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1100
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1100
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1100] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);


      try {
        let strJson = inspector.getInspectorByKey('searchTestString');
        console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(strJson))
        let obj = JSON.parseJsonElement(strJson);
        const uiContext = new UIContext();
        const abilityStageContext =
          AppStorage.get<common.AbilityStageContext>('stageContext') as common.AbilityStageContext;
        console.info("[ArkUI_Stage_Search_SearchButton_1100]: " +
        JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
        console.info("[ArkUI_Stage_Search_SearchButton_1100]: " +
        JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
        
      }catch(error) {
        expect().assertFail();
      }

      console.info("[ArkUI_Stage_Search_SearchButton_1100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1200
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1200
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1200] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      const uiContext = new UIContext();
      const abilityStageContext =
        AppStorage.get<common.AbilityStageContext>('stageContext') as common.AbilityStageContext;

      try {
        let strJson = inspector.getInspectorByKey('searchTestString');
        console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(strJson))
        let obj = JSON.parseJsonElement(strJson);
        console.info("[ArkUI_Stage_Search_SearchButton_1200]: " +
        JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
        console.info("[ArkUI_Stage_Search_SearchButton_1200]: " +
        JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
       
      }catch(error) {
        expect().assertFail();
      }

      console.info("[ArkUI_Stage_Search_SearchButton_1200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1300
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1300
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1300] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " + JSON.stringify(newJson));
      let newJsonDefault = inspector.getInspectorByKey('searchTestDefaultValue');

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual(objDefault.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_1300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1400
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1400
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1400] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(newJson));

      let searchButtonFontColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchButton_1400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1500
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1500
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1500] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(newJson));

      let searchButtonFontColorColor = Color.Blue;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorColor": searchButtonFontColorColor
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual("#FF0000FF");
      console.info("[ArkUI_Stage_Search_SearchButton_1500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1600
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1600
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(newJson));

      let searchButtonFontColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorString": searchButtonFontColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_SearchButton_1600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1700
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1700
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1700] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(newJson));

      let searchButtonFontColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'searchButtonFontColorResource', value: searchButtonFontColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_1700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1800
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1800
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1800] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(newJson));

      let searchButtonFontColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorString": searchButtonFontColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_1800] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_1900
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_1900
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_1900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_1900] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(newJson));

      let searchButtonFontColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_1900] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_2000
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_2000
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_2000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_2000] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(newJson));

      let searchButtonFontColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_SearchButton_2000] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_SearchButton_static_2100
     * @tc.name     ArkUI_Stage_Search_SearchButton_static_2100
     * @tc.desc     ArkUI_Stage_Search_SearchButton_static_2100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_SearchButton_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_SearchButton_2100] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(newJson));

      let searchButtonFontSizeNumber = 20;
      let searchButtonFontColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeNumber": searchButtonFontSizeNumber,
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2100);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontSize')).assertEqual("20.00fp");
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButton')));
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getElement('fontColor'))
        .assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchButton_2100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0100
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0100
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0100] start");
      let newJson = inspector.getInspectorByKey('searchTestDefault');
      let newJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let obj2 = JSON.parseJsonElement(newJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0100]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0100] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0200
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0200
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0200] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " + JSON.stringify(newJson));

      let textColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_FontColor_0200] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0300
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0300
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0300] start");
      let newJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " + JSON.stringify(newJson));

      let textColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorColor": textColorColor
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_FontColor_0300] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0400
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0400
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0400] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " + JSON.stringify(newJson));

      let textColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorString": textColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor')).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_FontColor_0400] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0500
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0500
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0500] start");
      let newJson = inspector.getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " + JSON.stringify(newJson));

      let textColorResource = $r('sys.color.ohos_id_color_connected');
      const sliderExampleManager = AppStorage.get<SliderExampleManager>("sliderExampleManager") as SliderExampleManager;
      sliderExampleManager.message.notify({
        name: 'textColorResource', value: textColorResource
      } as Message);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestResource');
      let strJson2 = inspector.getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0500] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0600
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0600
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0600] start");
      let newJson = inspector.getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " + JSON.stringify(newJson));

      let textColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorString": textColorString
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestString');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0600] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0700
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0700
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0700] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0700]: " + JSON.stringify(newJson));

      let textColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0700]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0700] end");
      done();
    });

    
    /*
     * @tc.number   ArkUI_Stage_Search_FontColor_static_0800
     * @tc.name     ArkUI_Stage_Search_FontColor_static_0800
     * @tc.desc     ArkUI_Stage_Search_FontColor_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Search_FontColor_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Search_FontColor_0800] start");
      let newJson = inspector.getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0800]: " + JSON.stringify(newJson));

      let textColorNumber = -1;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('searchTestNumber');
      let strJson2 = inspector.getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0800]: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(obj.getElement('$attrs').getElement('fontColor'))
        .assertEqual(obj2.getElement('$attrs').getElement('fontColor'));
      console.info("[ArkUI_Stage_Search_FontColor_0800] end");
      done();
    });
  })
}
