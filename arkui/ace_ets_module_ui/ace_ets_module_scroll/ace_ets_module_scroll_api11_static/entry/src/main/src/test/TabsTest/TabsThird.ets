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
import { Resource, BarMode, LayoutStyle, VerticalAlign, LayoutMode, TextOverflow, TextHeightAdaptivePolicy, FontWeight, FontStyle } from '@ohos.arkui.component'
import { describe, beforeEach, afterEach, it, expect, beforeAll } from '../../../../hypium/index'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils'
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

// function tabsDefaultFontSize(sysWidth: Resource) {
//   let resourceFontSize = getContext().resourceManager.getNumber(sysWidth.id)
//   let newFontSize: string = Math.round(px2vp(resourceFontSize)) + '.00vp'
//   return newFontSize;
// }

export default function tabsThird() {
  describe('ActsAceTabsTestThird', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/IndexThird",
      }
      try {
        const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get IndexThird state success " + JSON.stringify(pages));
        if (!("IndexThird" == pages.name)) {
          console.info("get IndexThird state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          // console.info("push IndexThird page success " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push IndexThird page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("tabs beforeEach start");
    })

    afterEach(async (): Promise<void> => {
      console.info("tabs afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": 0,
            "barGridAlignMarginString": '0.00fp',
            "barGridAlignGutterNumber": 0,
            "barGridAlignGutterString": '0.00fp',
            "barGridAlignSmNumber": 0,
            "barGridAlignMdNumber": 0,
            "barGridAlignLgNumber": 0,
            "barHeightString": '0.00vp',
            "barModeMode": BarMode.Fixed,
            "barModeMarginString": '0.00fp',
            "barModeMarginNumber": 0,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER,
            "subTabBarStylePaddingNumber": 0,
            "subTabBarStylePaddingString": '0.00fp',
            "bottomTabBarStylePaddingNumber": 0,
            "bottomTabBarStylePaddingString": '0.00fp',
            "subTabBarStylePaddingTopNumber": 0,
            "subTabBarStylePaddingBottomNumber": 0,
            "subTabBarStylePaddingLeftNumber": 0,
            "subTabBarStylePaddingRightNumber": 0,
            "subTabBarStylePaddingTopString": '0.00vp',
            "subTabBarStylePaddingBottomString": '0.00vp',
            "subTabBarStylePaddingLeftString": '0.00vp',
            "subTabBarStylePaddingRightString": '0.00vp',
            "bottomTabBarStylePaddingTopNumber": 0,
            "bottomTabBarStylePaddingBottomNumber": 0,
            "bottomTabBarStylePaddingLeftNumber": 0,
            "bottomTabBarStylePaddingRightNumber": 0,
            "bottomTabBarStylePaddingTopString": '0.00vp',
            "bottomTabBarStylePaddingBottomString": '0.00vp',
            "bottomTabBarStylePaddingLeftString": '0.00vp',
            "bottomTabBarStylePaddingRightString": '0.00vp',
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Center,
            "bottomTabBarStyleLayoutMode": LayoutMode.VERTICAL,
            "bottomTabBarStyleSymmetricExtensible": false,

          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
    })

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the default values of barGridAlign.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100] start");
      let strJson = inspector.getInspectorByKey('tabsDefaultTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));

      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');

      console.info("[ArkUI_Tabs_BarGridAlign_static_0100] end");
      done();
    });
    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10px.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10px'
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200] end");
      done();
    });
    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10vp.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10vp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300] end");
      done();
    });
    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": 10
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:-2.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": -2
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:2 ** 16.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": Math.pow(2, 16)
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('65536.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10fp.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10fp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00fp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0800
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10lpx.
     */
    it('ArkUI_Tabs_BarGridAlign_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10lpx'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00lpx');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_static_0900
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:$r('app.float.BarGridAlign_Test').
     */
    it('ArkUI_Tabs_BarGridAlign_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900] start");
      let strJson = inspector.getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('15.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1000
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:undefined.
     */
    it('ArkUI_Tabs_BarGridAlign_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1000] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "barGridAlignMarginNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:null.
     */
    it('ArkUI_Tabs_BarGridAlign_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1100] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "barGridAlignMarginNumber": null
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10px.
     */
    it('ArkUI_Tabs_BarGridAlign_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1200] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10px'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10vp.
     */
    it('ArkUI_Tabs_BarGridAlign_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1300] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10vp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10.
     */
    it('ArkUI_Tabs_BarGridAlign_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": 10
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:-2.
     */
    it('ArkUI_Tabs_BarGridAlign_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": -2
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:2 ** 16.
     */
    it('ArkUI_Tabs_BarGridAlign_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": Math.pow(2, 16)
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('65536.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10fp.
     */
    it('ArkUI_Tabs_BarGridAlign_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1700] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10fp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00fp');
      console.info("[ArkUI_Tabs_BarGridAlign_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1800
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10lpx.
     */
    it('ArkUI_Tabs_BarGridAlign_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1800] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10lpx'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00lpx');
      console.info("[ArkUI_Tabs_BarGridAlign_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1900
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:$r('app.float.BarGridAlign_Test').
     */
    it('ArkUI_Tabs_BarGridAlign_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1900] start");
      let strJson = inspector.getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('15.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2000
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:undefined.
     */
    it('ArkUI_Tabs_BarGridAlign_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2000] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "barGridAlignGutterNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:null.
     */
    it('ArkUI_Tabs_BarGridAlign_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2100] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "barGridAlignGutterNumber": null
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2200]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:3, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2300]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 3,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:-2, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2400]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": -2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:100000, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2500]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 100000,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:undefined, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2600]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "barGridAlignSmNumber": undefined,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:null, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2700]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "barGridAlignSmNumber": null,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2800
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:3, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2800]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2800] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 3,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2900
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:-2, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2900]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2900] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": -2,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3000
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:100000, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_3000]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3000] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 100000,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:undefined, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_3100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3100] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            // "barGridAlignMdNumber": undefined,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:null, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_3200]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            // "barGridAlignMdNumber": null,
            "barGridAlignLgNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:5.
     */
    it('[ArkUI_Tabs_BarGridAlign_3300]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 5
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:-2.
     */
    it('[ArkUI_Tabs_BarGridAlign_3400]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": -2
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:100000.
     */
    it('[ArkUI_Tabs_BarGridAlign_3500]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:undefined.
     */
    it('[ArkUI_Tabs_BarGridAlign_3600]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            // "barGridAlignLgNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:null.
     */
    it('[ArkUI_Tabs_BarGridAlign_3700]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            // "barGridAlignLgNumber": null
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarHeight_0100
     * @tc.name      Tests the BarHeight property of the Tabs component.
     * @tc.desc      Gets the values of barHeight, when the value of the barHeight is "auto".
     */
    it('ArkUI_Tabs_BarHeight_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarHeight_0100] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("ArkUI_Tabs_BarHeight: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barHeightString": "auto"
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarHeight_0100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarHeight_0100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarHeight_0100] barHeight: " + JSON.stringify(obj.getElement('$attrs').getString('barHeight')));
      expect(obj.getElement('$attrs').getString('barHeight')).assertEqual("auto");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0100
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the default values of barMode.
     */
    it('[ArkUI_Tabs_BarMode_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0100] start");
      let strJson = inspector.getInspectorByKey('tabsDefaultTest');
      console.info("[ArkUI_Tabs_BarMode_static_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarMode_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_static_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0200
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Fixed.
     */
    it('ArkUI_Tabs_BarMode_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Fixed
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_static_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0300
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable.
     */
    it('ArkUI_Tabs_BarMode_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0400
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10px'.
     */
    it('ArkUI_Tabs_BarMode_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0400] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_static_0400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10px'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00px","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0500
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10vp'.
     */
    it('ArkUI_Tabs_BarMode_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0500] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_static_0500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10vp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0600
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:10.
     */
    it('ArkUI_Tabs_BarMode_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": 10
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0700
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:-1.
     */
    it('ArkUI_Tabs_BarMode_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0800
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:100000.
     */
    it('ArkUI_Tabs_BarMode_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0800] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"100000.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_static_0900
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10fp'.
     */
    it('ArkUI_Tabs_BarMode_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0900] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_static_0900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10fp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00fp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1000
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10lpx'.
     */
    it('ArkUI_Tabs_BarMode_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1000] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_1000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10lpx'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1000]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00lpx","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1100
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:$r('app.float.BarMode_Test').
     */
    it('ArkUI_Tabs_BarMode_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1100] start");
      let strJson = inspector.getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarMode_1100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsResourceTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1100]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"8.00px","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1200
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:undefined.
     */
    it('ArkUI_Tabs_BarMode_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            // "barModeMarginNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1200]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1300
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:null.
     */
    it('ArkUI_Tabs_BarMode_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            // "barModeMarginNumber": null
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1300]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1400
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:LayoutStyle.ALWAYS_CENTER.
     */
    it('ArkUI_Tabs_BarMode_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1400]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1500
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:LayoutStyle.ALWAYS_AVERAGE_SPLIT.
     */
    it('ArkUI_Tabs_BarMode_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_AVERAGE_SPLIT
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1500]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_AVERAGE_SPLIT"}');
      console.info("[ArkUI_Tabs_BarMode_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1600
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:LayoutStyle.SPACE_BETWEEN_OR_CENTER.
     */
    it('ArkUI_Tabs_BarMode_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.SPACE_BETWEEN_OR_CENTER
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1600]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.SPACE_BETWEEN_OR_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1700
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:undefined.
     */
    it('ArkUI_Tabs_BarMode_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            // "barModeNonScrollableLayoutStyle": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1700]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1800
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:null.
     */
    it('ArkUI_Tabs_BarMode_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1800] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            // "barModeNonScrollableLayoutStyle": null
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1800]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1900
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Fixed, margin:'10px', nonScrollableLayoutStyle:null.
     */
    it('ArkUI_Tabs_BarMode_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1900] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Fixed,
            "barModeMarginString": '10px',
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1900]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0100
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the default values of subTabBarStylePadding.
     */
    it('[ArkUI_Tabs_SubTabBarStylePadding_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100] start");
      let strJson = inspector.getInspectorByKey('subTabBarDefaultTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0200
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is 10.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": 10
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0300
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is '10.00px'.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] start");
      let strJson = inspector.getInspectorByKey('subTabBarStringTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingString": '10.00px',
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0400
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is $r('app.float.SubTabBarStylePadding_Test')).
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400] start");
      let strJson = inspector.getInspectorByKey('subTabBarResourceTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0500
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is -1.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0600
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is 100000.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('100000.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0700
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is undefined.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "subTabBarStylePaddingNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0800
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is null.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "subTabBarStylePaddingNumber": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0900
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('6.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1000
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:10.00px, right:10.00px, bottom:10.00px, left:10.00px}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingStringTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopString": '10.00px',
            "subTabBarStylePaddingRightString": '10.00px',
            "subTabBarStylePaddingBottomString": '10.00px',
            "subTabBarStylePaddingLeftString": '10.00px'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1100
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:$r('app.float.subTabBarStylePadding_Test'), right:$r('app.float.subTabBarStylePadding_Test'), bottom:$r('app.float.subTabBarStylePadding_Test'), left:$r('app.float.subTabBarStylePadding_Test')}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingResourceTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1200
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:-1, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": -1,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"' + objJudge.getElement('$attrs').getString('width') + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1300
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:100000, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 100000,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"100000.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1400
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:undefined, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "subTabBarStylePaddingTopNumber": undefined,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"' + objJudge.getElement('$attrs').getString('width') + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1500
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:null, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "subTabBarStylePaddingTopNumber": null,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"' + objJudge.getElement('$attrs').getString('width') + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1600
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:-1, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": -1,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.getElement('$attrs').getString('width') + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1700
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:100000, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 100000,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"100000.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1800
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:undefined, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            // "subTabBarStylePaddingRightNumber": undefined,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.getElement('$attrs').getString('width') + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1900
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:null, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            // "subTabBarStylePaddingRightNumber": null,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.getElement('$attrs').getString('width') + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2000
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:-1, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": -1,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.getElement('$attrs').getString('width') + '","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2100
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:100000, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 100000,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"100000.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2200
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:undefined, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            // "subTabBarStylePaddingBottomNumber": undefined,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.getElement('$attrs').getString('width') + '","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2300
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:null, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            // "subTabBarStylePaddingBottomNumber": null,
            "subTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.getElement('$attrs').getString('width') + '","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2400
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:-1}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2500
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:100000}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"100000.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2600
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:undefined}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            // "subTabBarStylePaddingLeftNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2700
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:null}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            // "subTabBarStylePaddingLeftNumber": null
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0100
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStylePadding.
     */
    it('[ArkUI_Tabs_BottomTabBarStylePadding_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarDefaultTestJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0200
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is 10.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": 10,
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0300
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is '10.00px'.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingString": '10.00px',
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0400
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is $r('app.float.BottomTabBarStylePadding_Test').
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('8.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0500
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": -1,
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0600
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": 100000,
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('100000.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0700
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStylePaddingNumber": undefined,
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0800
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is null.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
            // "bottomTabBarStylePaddingNumber": null,
           // } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0900
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('6.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1000
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:10.00px, right:10.00px, bottom:10.00px, left:10.00px}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopString": '10.00px',
            "bottomTabBarStylePaddingRightString": '10.00px',
            "bottomTabBarStylePaddingBottomString": '10.00px',
            "bottomTabBarStylePaddingLeftString": '10.00px'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1100
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:$r('app.float.bottomTabBarStylePadding_Test'), right:$r('app.float.bottomTabBarStylePadding_Test'), bottom:$r('app.float.bottomTabBarStylePadding_Test'), left:$r('app.float.bottomTabBarStylePadding_Test')}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('8.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1200
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:-1, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": -1,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1300
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:100000, bottom:6, left:6, right:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 100000,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"100000.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1400
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:undefined, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStylePaddingTopNumber": undefined,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1500
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:null, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStylePaddingTopNumber": null,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1600
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:-1, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": -1,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1700
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:100000, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 100000,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"100000.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1800
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:undefined, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            // "bottomTabBarStylePaddingRightNumber": undefined,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1900
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:null, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            // "bottomTabBarStylePaddingRightNumber": null,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2000
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:-1, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": -1,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2100
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:100000, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 100000,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"100000.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2200
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:undefined, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            // "bottomTabBarStylePaddingBottomNumber": undefined,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2300
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:null, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            // "bottomTabBarStylePaddingBottomNumber": null,
            "bottomTabBarStylePaddingLeftNumber": 6
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2400
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:-1}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2500
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:100000}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"100000.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2600
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:undefined}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            // "bottomTabBarStylePaddingLeftNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2700
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:null}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            // "bottomTabBarStylePaddingLeftNumber": null
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleVerticalAlign.
     */
    it('[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is VerticalAlign.Top.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Top
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Top");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is VerticalAlign.Center.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Center
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is VerticalAlign.Bottom.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Bottom
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Bottom");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleVerticalAlign": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleVerticalAlign": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleLayoutMode.
     */
    it('[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is LayoutMode.HORIZONTAL.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.HORIZONTAL
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.HORIZONTAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is LayoutMode.VERTICAL.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.VERTICAL
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is LayoutMode.AUTO.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.AUTO
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.AUTO");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLayoutMode": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLayoutMode": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleSymmetricExtensible.
     */
    it('[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is true.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": true
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("true");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is false.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": false
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleSymmetricExtensible": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleSymmetricExtensible": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleLabelStyle.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));

      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('1');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');

      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('overflow'), when the value of the tabBar.getElement('labelStyle').getString('overflow') is TextOverflow.None.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.None
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.None");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('overflow'), when the value of the tabBar.getElement('labelStyle').getString('overflow') is TextOverflow.Clip.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.Clip
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Clip");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('overflow'), when the value of the tabBar.getElement('labelStyle').getString('overflow') is TextOverflow.Ellipsis.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.Ellipsis
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('overflow'), when the value of the tabBar.getElement('labelStyle').getString('overflow') is TextOverflow.MARQUEE.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.MARQUEE
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Marquee");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('overflow'), when the value of the tabBar.getElement('labelStyle').getString('overflow') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleOverflow": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('overflow'), when the value of the tabBar.getElement('labelStyle').getString('overflow') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleOverflow": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxLines'), when the value of the tabBar.getElement('labelStyle').getString('maxLines') is 2.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": 2
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("2");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxLines'), when the value of the tabBar.getElement('labelStyle').getString('maxLines') is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxLines'), when the value of the tabBar.getElement('labelStyle').getString('maxLines') is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("100000");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxLines'), when the value of the tabBar.getElement('labelStyle').getString('maxLines') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleMaxLines": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxLines'), when the value of the tabBar.getElement('labelStyle').getString('maxLines') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleMaxLines": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('minFontSize'), when the value of the tabBar.getElement('labelStyle').getString('minFontSize') is 3.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": 3
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('minFontSize'), when the value of the tabBar.getElement('labelStyle').getString('minFontSize') is '3.00fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeString": '3.00fp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('minFontSize'), when the value of the tabBar.getElement('labelStyle').getString('minFontSize') is ($r('app.float.BottomTabBarStyleLabelStyle_minFontSize_Test')).
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("4.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('minFontSize'), when the value of the tabBar.getElement('labelStyle').getString('minFontSize') is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('minFontSize'), when the value of the tabBar.getElement('labelStyle').getString('minFontSize') is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("100000.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('minFontSize'), when the value of the tabBar.getElement('labelStyle').getString('minFontSize') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
          //   "bottomTabBarStyleLabelStyleMinFontSizeNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('minFontSize'), when the value of the tabBar.getElement('labelStyle').getString('minFontSize') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleMinFontSizeNumber": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxFontSize'), when the value of the tabBar.getElement('labelStyle').getString('maxFontSize') is 3.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": 3
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxFontSize'), when the value of the tabBar.getElement('labelStyle').getString('maxFontSize') is '3.00fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeString": '3.00fp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('3.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxFontSize'), when the value of the tabBar.getElement('labelStyle').getString('maxFontSize') is ($r('app.float.BottomTabBarStyleLabelStyle_maxFontSize_Test')).
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('5.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxFontSize'), when the value of the tabBar.getElement('labelStyle').getString('maxFontSize') is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxFontSize'), when the value of the tabBar.getElement('labelStyle').getString('maxFontSize') is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('100000.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxFontSize'), when the value of the tabBar.getElement('labelStyle').getString('maxFontSize') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleMaxFontSizeNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('maxFontSize'), when the value of the tabBar.getElement('labelStyle').getString('maxFontSize') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleMaxFontSizeNumber": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('heightAdaptivePolicy'), when the value of the tabBar.getElement('labelStyle').getString('heightAdaptivePolicy') is TextHeightAdaptivePolicy.MAX_LINES_FIRST.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.MAX_LINES_FIRST
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('heightAdaptivePolicy'), when the value of the tabBar.getElement('labelStyle').getString('heightAdaptivePolicy') is TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('heightAdaptivePolicy'), when the value of the tabBar.getElement('labelStyle').getString('heightAdaptivePolicy') is TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('heightAdaptivePolicy'), when the value of the tabBar.getElement('labelStyle').getString('heightAdaptivePolicy') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getString('heightAdaptivePolicy'), when the value of the tabBar.getElement('labelStyle').getString('heightAdaptivePolicy') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('size'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('size') is 15.0.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": 15.0
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('15.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('size'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('size') is '17.0fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeString": '17.0fp'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('17.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('size'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('size') is 15.0.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('18.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('size'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('size') is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('size'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('size') is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('100000.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('size'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('size') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleFontSizeNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('size'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('size') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleFontSizeNumber": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        // expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is FontWeight.Lighter.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Lighter
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is FontWeight.Normal.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Normal
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is FontWeight.Regular.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Regular
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is FontWeight.Medium.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Medium
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is FontWeight.Bold.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Bold
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is FontWeight.Bolder.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Bolder
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bolder');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is 500.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 500
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('500');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is '2.0fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightString": '200'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('200');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is 150.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 150
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": -1
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 100000
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleFontWeightNumber": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('weight'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('weight') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleFontWeightNumber": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('family'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('family') is 'HarmonyOS Sans'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontFamilyString": 'HarmonyOS Sans'
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('family'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('family') is ($r('app.string.BottomTabBarStyleLabelStyle_family_Test')).
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(strJson));

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('family'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('family') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleFontFamilyString": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('family'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('family') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleFontFamilyString": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('style'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('style') is FontStyle.Normal.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": FontStyle.Normal
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('style'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('style') is FontStyle.Italic.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": FontStyle.Italic
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Italic');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('style'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('style') is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "bottomTabBarStyleLabelStyleFontStyle": undefined
           } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.getElement('labelStyle').getElement('font').getString('style'), when the value of the tabBar.getElement('labelStyle').getElement('font').getString('style') is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(strJson));
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          //   "bottomTabBarStyleLabelStyleFontStyle": null
          //  } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] end");
      done();
    });

  })
}