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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
// import { resourceManager } from '@kit.LocalizationKit';
import inspector from '@ohos.arkui.inspector'
import { Color, FontWeight, $r, Resource } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext.ets'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitUserAgent";

// function spliceColor(sysColor: Resource) {
//   let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
//   let newArgb: string = '#' + resourceColor.toString(16).toUpperCase()
//   return newArgb;
// }
//
// function alphabetDefaultPopupSize(sysWidth: Resource) {
//   let resourcePopupSize = getContext().resourceManager.getNumber(sysWidth.id)
//   const uiContext = new UIContext();
//   let newPopupSize: string = Math.round(uiContext.px2vp(resourcePopupSize)) + '.00vp'
//   return newPopupSize;
// }

export default function ActsAlphabetIndexerUxTest() {
  describe('ActsAlphabetIndexerUxTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetIndexerux",
      }
      try {
        const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get AlphabetIndexer state success " + JSON.stringify(pages));
        if (!("alphabetIndexerux" == pages.name)) {
          console.info("get AlphabetIndexer state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          await CommonFunc.sleep(2000);
          // console.info("push AlphabetIndexer page success " + JSON.stringify(result));
        }
      } catch (err: BusinessError) {
        console.error("push AlphabetIndexer page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("AlphabetIndexer afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "popupSelectedColorStr": '#00FF00',
            "popupUnselectedColorStr": '#DA70D6',
            "popupItemBackgroundStr": '#FFD700',
            "popupItemFontSizeStr": '20',
            "popupItemFontWeightStr": '400',
            "popupSpaceStr": '120',
            "getString('popupSelectedColor')": Color.Orange,
            "getString('popupUnselectedColor')": Color.Green,
            "popupItemBackgroundColor": Color.Pink,
            "popupSelectedColorNum": 0x00CED1,
            "popupUnselectedColorNum": 0xC0FF3E,
            "popupItemBackgroundNum": 0x8470FF,
            "popupItemFontSizeNum": 30,
            "popupItemFontWeightNum": FontWeight.Normal,
            "popupSpaceNum": 50,
            "popupSelectedColorRes": $r('app.color.popupSelectedColor'),
            "popupUnselectedColorRes": $r('app.color.popupUnselectedColor'),
            "popupItemBackgroundRes": $r('app.color.popupItemBackground'),
            "popupItemFontSizeRes": $r('app.string.fontSize'),
            "popupSpaceRes": $r('app.string.popupSpace'),
            "popupItemFontWeightFont": FontWeight.Bolder,
            "nullFlag1": false,
            "nullFlag2": false,
            "nullFlag3": false,
            "nullFlag4": false,
            "nullFlag5": false
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
    })

    it('ArkUI_AlphabetIndexer_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0100 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('popupUnselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      // expect(obj.getElement('$attrs').getString('popupItemFontSize')).assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0600 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest6');
      let obj = JSON.parseJsonElement(strJson);
      let popupItemFontSize: string = obj.getElement('$attrs').getString('popupItemFontSize');
      expect(parseFloat(popupItemFontSize)).assertEqual(30)
      done();
    });

    it('ArkUI_AlphabetIndexer_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0700 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest7');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Normal");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0800 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0900 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupUnselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1000 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1100 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      // expect(obj.getElement('$attrs').getString('popupItemFontSize')).assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1200 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1300 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1400 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1500 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupUnselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1600 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1700', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1700 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      // expect(obj.getElement('$attrs').getString('popupItemFontSize')).assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1800', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1800 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_1900', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1900 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    })

    it('ArkUI_AlphabetIndexer_static_2600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2600 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_2600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_2700', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2700 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_2700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupUnselectedColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_2800', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2800 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_2800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_2900', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2900 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_2900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      // expect(obj.getElement('$attrs').getString('popupItemFontSize')).assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      done();
    });

    it('ArkUI_AlphabetIndexer_static_3000', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_3000 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_3000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      done();
    });

    it('ArkUI_AlphabetIndexer_static_3100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_3100 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_3100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[ArkUI_AlphabetIndexer_static_3100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    });
  })
}