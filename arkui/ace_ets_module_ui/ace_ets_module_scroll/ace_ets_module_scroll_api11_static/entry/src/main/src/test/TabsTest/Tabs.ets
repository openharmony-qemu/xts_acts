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
import { Color, SelectedMode, $r } from '@ohos.arkui.component'
import { describe, beforeEach, afterEach, it, expect, beforeAll } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils'
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

export default function tabs() {
  describe('ActsAceTabsTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Index3",
      }
      try {
        const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index3" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          // console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push Index page error " + JSON.stringify(err));
      }

      await Utils.sleep(2000);
      console.info("tabs beforeEach start");
    })

    afterEach(async (): Promise<void> => {
      console.info("tabs afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',

            "nullFlag": false,

            "strokeWidthNum": 10,
            "dividerColorNum": 0xFFFF0000,
            "startMarginNum": 5,
            "endMarginNum": 5,

            "dividerColor": Color.Red,

            "strokeWidthRes": $r("app.string.Divider_Stroke_Width"),
            "dividerColorRes": $r("app.color.Divider_Color"),
            "startMarginRes": $r("app.string.Divider_Start_Margin"),
            "endMarginRes": $r("app.string.Divider_End_Margin"),

            "overflowFlag": false,
            "selfIndicatorColor": Color.Red,
            "selfIndicatorHeight": 10,
            "selfIndicatorWidth": 30,
            "selfIndicatorBorderRadius": 5,
            "selfMarginTop": 10,
            "selfSubTabBorderRadius": 20,
            "selfSelectedMode": SelectedMode.INDICATOR,

            "selfIndicatorColorStr": "#FFFF0000",
            "selfIndicatorHeightStr": "10vp",
            "selfIndicatorWidthStr": "30vp",
            "selfIndicatorBorderRadiusStr": "5vp",
            "selfSubTabBorderRadiusStr": "20vp",
            "selfMarginTopStr": "10vp",
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("change component data error: " + err.message);
      }
      await Utils.sleep(2000);
    })

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0100
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      the default divier parameter is {}
     */
    it('ArkUI_Tabs_Divider_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0100 start");
      let strJson = inspector.getInspectorByKey('tabsTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0100] divider:" + obj.getElement('$attrs').getElement('divider'));
      if(!obj.getElement('$attrs').getElement('divider').getString('strokeWidth')) {
        expect(true).assertTrue();
      } else {
        expect(true).assertFalse();
      }
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0200
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type number
     */
    it('ArkUI_Tabs_Divider_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0200 start");
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);

      console.info("[ArkUI_Tabs_Divider_static_0200] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual("#FFFF0000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0300
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type string
     */
    it('ArkUI_Tabs_Divider_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0300 start");
      let strJson = inspector.getInspectorByKey('tabsTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0300] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual('#FFFF0000');
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0400
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type Resource
     */
    it('ArkUI_Tabs_Divider_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0400 start");
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0400] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual('#FF121212');
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0500
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type Color
     */
    it('ArkUI_Tabs_Divider_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0500 start");
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0500] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual("#FFFF0000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0600
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to null
     */
    it('ArkUI_Tabs_Divider_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0600 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag": true,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = inspector.getInspectorByKey('defaultTabs');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_Divider_static_0600] defaultDivider:" + JSON.stringify(defaultObj.getElement('$attrs').getElement('divider')));
      let defaultDividerObject = defaultObj.getElement('$attrs').getElement('divider');
      let defaultDividerColor: string = defaultDividerObject.getString('color');

      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0600] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("0.00px");
      expect(dividerObject.getString('color')).assertEqual(defaultDividerColor);
      expect(dividerObject.getString('startMargin')).assertEqual('0.00px');
      expect(dividerObject.getString('endMargin')).assertEqual('0.00px');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0700
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol color value
     */
    it('ArkUI_Tabs_Divider_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0700 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'xxxxxxxx',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = inspector.getInspectorByKey('defaultTabs');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_Divider_static_0700] defaultDivider:" + JSON.stringify(defaultObj.getElement('$attrs').getElement('divider')));
      let defaultDividerObject = defaultObj.getElement('$attrs').getElement('divider');
      let defaultDividerColor: string = defaultDividerObject.getString('color');

      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0700] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual(defaultDividerColor);
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0800
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol strokeWidthStr value
     */
    it('ArkUI_Tabs_Divider_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0800 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": 'xxxxxxxx',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0800] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_0900
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol startMarginStr value
     */
    it('ArkUI_Tabs_Divider_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0900 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": 'xxxxxxxx',
            "endMarginStr": '5px',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0900] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('startMargin')).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_1000
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol endMarginStr value
     */
    it('ArkUI_Tabs_Divider_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_1000 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": 'xxxxxxxx',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_1000] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('endMargin')).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_1100
     * @tc.name      Tests the divider and indicator.getString('selectedMode') property of the tabs component
     * @tc.desc      set divider and indicator.getString('selectedMode') test
     */
    it('ArkUI_Tabs_Divider_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_1100 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
            "selfSelectedMode": SelectedMode.BOARD,
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest');
      let strJson2 = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ArkUI_Tabs_Divider_static_1100] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      console.info("[ArkUI_Tabs_Divider_static_1100] selectedMode:" + obj2.getElement('$attrs').getElement('tabBar').getString('selectedMode'));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual("#FFFF0000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");
      expect(obj2.getElement('$attrs').getElement('tabBar').getString('selectedMode')).assertEqual("SelectedMode.BOARD");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_static_1200
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol endMarginStr value
     */
    it('ArkUI_Tabs_Divider_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_1200 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10vp',
            "startMarginStr": '10vp',
            "endMarginStr": '10vp',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_1200] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual('10.00vp');
      expect(dividerObject.getString('startMargin')).assertEqual('10.00vp');
      expect(dividerObject.getString('endMargin')).assertEqual('10.00vp');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "startMarginStr": '10px',
            "endMarginStr": '10px',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('tabsTest');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_1200] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual('10.00px');
      expect(dividerObject.getString('startMargin')).assertEqual('10.00px');
      expect(dividerObject.getString('endMargin')).assertEqual('10.00px');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10fp',
            "startMarginStr": '10fp',
            "endMarginStr": '10fp',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('tabsTest');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_1200] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual('10.00fp');
      expect(dividerObject.getString('startMargin')).assertEqual('10.00fp');
      expect(dividerObject.getString('endMargin')).assertEqual('10.00fp');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10lpx',
            "startMarginStr": '10lpx',
            "endMarginStr": '10lpx',
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_Divider_static_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('tabsTest');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_1200] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual('10.00lpx');
      expect(dividerObject.getString('startMargin')).assertEqual('10.00lpx');
      expect(dividerObject.getString('endMargin')).assertEqual('10.00lpx');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_LabelStyle_static_0100
     * @tc.name      Tests the labelStyle default
     * @tc.desc      the default labelStyle parameter is true
     */
    it('ArkUI_Tabs_LabelStyle_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_LabelStyle_static_0100 start");

      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0100] labelStyle:" +  JSON.stringify(defaultObj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      let defaultLabelStyleObject = defaultObj.getElement('$attrs').getElement('tabBar').getElement('labelStyle');
      let defaultFontSize = defaultLabelStyleObject.getElement('font').getString('size');

      let strJson = inspector.getInspectorByKey('indicatorTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0100] labelStyle:" +  JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));

      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('1');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(defaultFontSize);
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_LabelStyle_static_0200
     * @tc.name      Tests the labelStyle when single line truncation with ellipsis
     * @tc.desc      set labelStyle to Single line truncation with ellipsis
     */
    it('ArkUI_Tabs_LabelStyle_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_LabelStyle_static_0200 start");
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0200] labelStyle:" +  JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));

      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('1');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('5.00fp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_LabelStyle_static_0300
     * @tc.name      Tests the labelStyle when Reduce and then truncate
     * @tc.desc      set labelStyle to Reduce and then truncate
     */
    it('ArkUI_Tabs_LabelStyle_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_LabelStyle_static_0300 start");
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0300] labelStyle:" + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('1');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('5.00fp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_LabelStyle_static_0400
     * @tc.name      Tests the labelStyle when shrink, wrap, and truncate
     * @tc.desc      set labelStyle to shrink, wrap, and truncate
     */
    it('ArkUI_Tabs_LabelStyle_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_LabelStyle_static_0400 start");

      let strJson = inspector.getInspectorByKey('indicatorTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0400] labelStyle:" + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.None');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('5.00fp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_LabelStyle_static_0500
     * @tc.name      Tests the labelStyle when line feed
     * @tc.desc      set labelStyle to line feed
     */
    it('ArkUI_Tabs_LabelStyle_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_LabelStyle_static_0500 start");

      let strJson = inspector.getInspectorByKey('indicatorTest4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0500] labelStyle:" + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.None');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('10');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('5.00fp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_LabelStyle_static_0600
     * @tc.name      Tests the labelStyle when null
     * @tc.desc      set labelStyle to when null
     */
    it('ArkUI_Tabs_LabelStyle_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_LabelStyle_static_0600 start");

      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0600] default labelStyle:" +  JSON.stringify(defaultObj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      let defaultLabelStyleObject = defaultObj.getElement('$attrs').getElement('tabBar').getElement('labelStyle');
      let defaultFontSize = defaultLabelStyleObject.getElement('font').getString('size');

      let strJson = inspector.getInspectorByKey('indicatorTest6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_static_0600] labelStyle:" + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('1');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(defaultFontSize);
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_FadingEdge_static_0100
     * @tc.name      Tests the fadingEdge property of the tabs component
     * @tc.desc      the default fadingEdge parameter is true
     */
    it('ArkUI_Tabs_FadingEdge_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_FadingEdge_static_0100 start");
      let strJson = inspector.getInspectorByKey('tabsTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_static_0100] fadingEdge:" + obj.getElement('$attrs').getString('fadingEdge'));
      expect(obj.getElement('$attrs').getString('fadingEdge')).assertEqual('true');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_FadingEdge_static_0200
     * @tc.name      Tests the fadingEdge property of the tabs component
     * @tc.desc      set fadingEdge to true
     */
    it('ArkUI_Tabs_FadingEdge_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_FadingEdge_static_0200 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "overflowFlag": true
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_FadingEdge_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_FadingEdge_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_static_0200] fadingEdge:" + obj.getElement('$attrs').getString('fadingEdge'));
      expect(obj.getElement('$attrs').getString('fadingEdge')).assertEqual('true');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_FadingEdge_static_0300
     * @tc.name      Tests the fadingEdge property of the tabs component
     * @tc.desc      set fadingEdge to false
     */
    it('ArkUI_Tabs_FadingEdge_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_FadingEdge_static_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "overflowFlag": false
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_FadingEdge_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_FadingEdge_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_static_0300] fadingEdge:" + obj.getElement('$attrs').getString('fadingEdge'));
      expect(obj.getElement('$attrs').getString('fadingEdge')).assertEqual('false');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorColor_0100
     * @tc.name      Tests the indicator.getString('color') property of the tabs component
     * @tc.desc      the default indicator.getString('color') parameter is "#FF007DFF"
     */
    it('ArkUI_Tabs_IndicatorColor_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorColor_0100 start");

      await Utils.sleep(2000);
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0100] default indicator:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let defaultIndicatorColor: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');

      let strJson = inspector.getInspectorByKey('indicatorTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0100] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorColor: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');
      expect(indicatorColor).assertEqual(defaultIndicatorColor);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorColor_0200
     * @tc.name      Tests the indicator.getString('color') property of the tabs component
     * @tc.desc      set indicator.getString('color') to number type
     */
    it('ArkUI_Tabs_IndicatorColor_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorColor_0200 start");
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0200] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorColor: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorColor_0300
     * @tc.name      Tests the indicator.getString('color') property of the tabs component
     * @tc.desc      set indicator.getString('color') to string type
     */
    it('ArkUI_Tabs_IndicatorColor_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorColor_0300 start");
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0300] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorColor: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorColor_0400
     * @tc.name      Tests the indicator.getString('color') property of the tabs component
     * @tc.desc      set indicator.getString('color') to Resource type
     */
    it('ArkUI_Tabs_IndicatorColor_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorColor_0400 start");
      let strJson = inspector.getInspectorByKey('indicatorTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0400] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorColor: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorColor_0500
     * @tc.name      Tests the indicator.getString('color') property of the tabs component
     * @tc.desc      set indicator.getString('color') to Color type
     */
    it('ArkUI_Tabs_IndicatorColor_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorColor_0500 start");
      let strJson = inspector.getInspectorByKey('indicatorTest4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0500] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorColor: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorColor_0600
     * @tc.name      Tests the indicator.getString('color') property of the tabs component
     * @tc.desc      set indicator.getString('color') to abnormol value "xxxxxxxx" then get the default value "#FF007DFF"
     */
    it('ArkUI_Tabs_IndicatorColor_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorColor_0600 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorColor": "xxxxxxxx"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorColor_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0600] default indicator:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let defaultIndicatorColor: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');

      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorColor: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');
      expect(indicatorColor).assertEqual(defaultIndicatorColor);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorColor_0700
     * @tc.name      Tests the indicator property of the tabs component
     * @tc.desc      set indicator property
     */
    it('ArkUI_Tabs_IndicatorColor_0700', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorColor_0700 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorColor": Color.Red,
            "selfIndicatorHeight": 5,
            "selfIndicatorWidth": 20,
            "selfIndicatorBorderRadius": 5,
            "selfMarginTop": 10
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorColor_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0700] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorColor: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('color');
      let indicatorHeight: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      let indicatorWidth: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      let indicatorBorderRadius: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius');
      let IndicatorMarginTop: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorColor).assertEqual("#FFFF0000");
      expect(indicatorHeight).assertEqual("5.00vp");
      expect(indicatorWidth).assertEqual("20.00vp");
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      expect(IndicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorHeight_0100
     * @tc.name      Tests the indicator.height property of the tabs component
     * @tc.desc      the default indicator.height parameter is "2.00vp".
     */
    it('ArkUI_Tabs_IndicatorHeight_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0100 start ")
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0100] default indicator:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let defaultIndicatorHeight: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');

      let strJson = inspector.getInspectorByKey('indicatorTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0100] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorHeight: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual(defaultIndicatorHeight);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorHeight_0200
     * @tc.name      Tests the indicator.height property of the tabs component
     * @tc.desc      set indicator.height to number type
     */
    it('ArkUI_Tabs_IndicatorHeight_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0200 start ")
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0200] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorHeight: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorHeight_0300
     * @tc.name      Tests the indicator.height property of the tabs component
     * @tc.desc      set indicator.height to string type
     */
    it('ArkUI_Tabs_IndicatorHeight_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start ")
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0300] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorHeight: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorHeight_0400
     * @tc.name      Tests the indicator.height property of the tabs component
     * @tc.desc      set indicator.height to resource type
     */
    it('ArkUI_Tabs_IndicatorHeight_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0400 start ")
      let strJson = inspector.getInspectorByKey('indicatorTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0400] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorHeight: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorHeight_0500
     * @tc.name      Tests the indicator.height property of the tabs component
     * @tc.desc      set indicator.height to abnormol value -1 then get the default value "2.00vp"
     */
    it('ArkUI_Tabs_IndicatorHeight_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeight": -1
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0500] default indicator:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let defaultIndicatorHeight: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');

      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0500] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorHeight: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual(defaultIndicatorHeight);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorHeight_0600
     * @tc.name      Tests the indicator.height property of the tabs component
     * @tc.desc      set indicator.height with different length's unit
     */
    it('ArkUI_Tabs_IndicatorHeight_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeightStr": "10px"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorHeight: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeightStr": "10fp"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorHeight = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeightStr": "10lpx"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorHeight = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('height');
      expect(indicatorHeight).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorWidth_0100
     * @tc.name      Tests the indicator.width property of the tabs component
     * @tc.desc      the default indicator.width parameter is "0.00vp".
     */
    it('ArkUI_Tabs_IndicatorWidth_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorWidth_0100 start");
      let strJson = inspector.getInspectorByKey('indicatorTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0100] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorWidth: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorWidth_0200
     * @tc.name      Tests the indicator.width property of the tabs component
     * @tc.desc      set indicator.width to number type
     */
    it('ArkUI_Tabs_IndicatorWidth_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorWidth_0200 start");
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0200] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorWidth: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("30.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorWidth_0300
     * @tc.name      Tests the indicator.width property of the tabs component
     * @tc.desc      set indicator.width to string type
     */
    it('ArkUI_Tabs_IndicatorWidth_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorWidth_0300 start");
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0300] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorWidth: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("30.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorWidth_0400
     * @tc.name      Tests the indicator.width property of the tabs component
     * @tc.desc      set indicator.width to Resource type
     */
    it('ArkUI_Tabs_IndicatorWidth_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorWidth_0400 start");
      let strJson = inspector.getInspectorByKey('indicatorTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0400] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorWidth: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("30.00vp");
      done();
    });


    /**
     * @tc.number    ArkUI_Tabs_IndicatorWidth_0500
     * @tc.name      Tests the indicator.width property of the tabs component
     * @tc.desc      set indicator.getString('color') to abnormol value -1 then get the default value "0.00vp"
     */
    it('ArkUI_Tabs_IndicatorWidth_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorWidth_0500 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidth": -1
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0300] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorWidth: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorWidth_0600
     * @tc.name      Tests the indicator.width property of the tabs component
     * @tc.desc      set indicator.width with different length's unit
     */
    it('ArkUI_Tabs_IndicatorWidth_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidthStr": "10px"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorWidth: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidthStr": "10fp"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorWidth = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidthStr": "10lpx"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorWidth = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('width');
      expect(indicatorWidth).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorBorderRadius_0100
     * @tc.name      Tests the indicator.getElement('borderRadius') property of the tabs component
     * @tc.desc      the default indicator.getElement('borderRadius') parameter is "0.00vp".
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0100 start");
      let strJson = inspector.getInspectorByKey('indicatorTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0100] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorBorderRadius: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius')
      expect(indicatorBorderRadius).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorBorderRadius_0200
     * @tc.name      Tests the indicator.getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('borderRadius') to number type
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0200 start");
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0200] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorBorderRadius: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius')
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorBorderRadius_0300
     * @tc.name      Tests the indicator.getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('borderRadius') to string type
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0300 start");
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0300] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorBorderRadius: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius')
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorBorderRadius_0400
     * @tc.name      Tests the indicator.getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('borderRadius') to Resource type
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0400 start");
      let strJson = inspector.getInspectorByKey('indicatorTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0400] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorBorderRadius: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius')
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorBorderRadius_0500
     * @tc.name      Tests the indicator.getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('borderRadius') to abnormol value -1 then get the default value "0.00vp"
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0500 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadius": -1
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0500] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorBorderRadius: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius');
      expect(indicatorBorderRadius).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorBorderRadius_0600
     * @tc.name      Tests the indicator.getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('borderRadius') with different length's unit
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadiusStr": "10px"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorBorderRadius: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius');
      expect(indicatorBorderRadius).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadiusStr": "10fp"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorBorderRadius = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius');
      expect(indicatorBorderRadius).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadiusStr": "10lpx"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorBorderRadius = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('borderRadius');
      expect(indicatorBorderRadius).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBorderRadius_0100
     * @tc.name      Tests the indicator.getElement('board').getElement('borderRadius') property of the tabs component
     * @tc.desc      the default indicator.height parameter is "8.00vp".
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0100 start");
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0100] default subTabBorderRadius:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      let defaultSubTabBorderRadius: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius');

      let strJson = inspector.getInspectorByKey('indicatorTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0100] subTabBorderRadius:" + obj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual(defaultSubTabBorderRadius);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBorderRadius_0200
     * @tc.name      Tests the indicator.getElement('board').getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('board').getElement('borderRadius') to number type
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0200 start");
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0200] subTabBorderRadius:" + obj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual("20.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBorderRadius_0300
     * @tc.name      Tests the indicator.getElement('board').getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('board').getElement('borderRadius') to string type
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0300 start");
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0300] subTabBorderRadius:" + obj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual("20.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBorderRadius_0400
     * @tc.name      Tests the indicator.getElement('board').getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('board').getElement('borderRadius') to Resource type
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0400 start");
      let strJson = inspector.getInspectorByKey('indicatorTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0400] subTabBorderRadius:" + obj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual("20.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBorderRadius_0500
     * @tc.name      Tests the indicator.getElement('board').getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.getElement('board').getElement('borderRadius') to abnormol value -1 then get the default value "8.00vp"
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0500 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadius": -1
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0500] default subTabBorderRadius:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      let defaultSubTabBorderRadius: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius');

      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0500] subTabBorderRadius:" + obj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual(defaultSubTabBorderRadius);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBorderRadius_0600
     * @tc.name      Tests the indicator.border.getElement('borderRadius') property of the tabs component
     * @tc.desc      set indicator.border.getElement('borderRadius') with different length's unit
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadiusStr": "10px"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadiusStr": "10fp"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadiusStr": "10lpx"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getString('borderRadius')).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBorderRadius_0700
     * @tc.name      Tests the indicator SelectedMode.BOARD property of the tabs component
     * @tc.desc      set indicator property with SelectedMode.BOARD
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0700', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0700 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadius": 20,
            "selfSelectedMode": SelectedMode.BOARD
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0700] subTabBorderRadius:" + obj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius'));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('board').getElement('borderRadius')).assertEqual("20.00vp");
      expect(obj.getElement('$attrs').getElement('tabBar').getString('selectedMode')).assertEqual("SelectedMode.BOARD");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SelectedMode_static_0100
     * @tc.name      Tests the indicator.getString('selectedMode') property of the tabs component
     * @tc.desc      the default indicator.getString('selectedMode') parameter is "SelectedMode.INDICATOR".
     */
    it('ArkUI_Tabs_SelectedMode_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SelectedMode_static_0100 start");
      let strJson = inspector.getInspectorByKey('indicatorTest5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SelectedMode_static_0100] selectedMode:" + obj.getElement('$attrs').getElement('tabBar').getString('selectedMode'));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('selectedMode')).assertEqual("SelectedMode.INDICATOR");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SelectedMode_static_0200
     * @tc.name      Tests the indicator.getString('selectedMode') property of the tabs component
     * @tc.desc      set indicator.getString('selectedMode') to SelectedMode.INDICATOR
     */
    it('ArkUI_Tabs_SelectedMode_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SelectedMode_static_0200 start");

      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SelectedMode_static_0200] selectedMode:" + obj.getElement('$attrs').getElement('tabBar').getString('selectedMode'));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('selectedMode')).assertEqual("SelectedMode.INDICATOR");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SelectedMode_static_0300
     * @tc.name      Tests the indicator.getString('selectedMode') property of the tabs component
     * @tc.desc      set indicator.getString('selectedMode') to SelectedMode.BOARD
     */
    it('ArkUI_Tabs_SelectedMode_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_SelectedMode_static_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeight": 10,
            "selfSelectedMode": SelectedMode.BOARD
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SelectedMode_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SelectedMode_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SelectedMode_static_0300] selectedMode:" + obj.getElement('$attrs').getElement('tabBar').getString('selectedMode'));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('selectedMode')).assertEqual("SelectedMode.BOARD");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorMarginTop_static_0100
     * @tc.name      Tests the indicator.getString('marginTop') property of the tabs component
     * @tc.desc      the default indicator.getString('marginTop') parameter is "8.00vp".
     */
    it('ArkUI_Tabs_IndicatorMarginTop_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_static_0100 start");
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0100] default indicator:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let defaultIndicatorMarginTop: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');

      let strJson = inspector.getInspectorByKey('indicatorTest4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0100] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorMarginTop: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual(defaultIndicatorMarginTop);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorMarginTop_static_0200
     * @tc.name      Tests the indicator.getString('marginTop') property of the tabs component
     * @tc.desc      set indicator.getString('marginTop') to number type.
     */
    it('ArkUI_Tabs_IndicatorMarginTop_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_static_0200 start");
      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0200] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorMarginTop: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorMarginTop_static_0300
     * @tc.name      Tests the indicator.getString('marginTop') property of the tabs component
     * @tc.desc      set indicator.width to string type.
     */
    it('ArkUI_Tabs_IndicatorMarginTop_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_static_0300 start");
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0300] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorMarginTop: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorMarginTop_static_0400
     * @tc.name      Tests the indicator.getString('marginTop') property of the tabs component
     * @tc.desc      set indicator.width to Resource type.
     */
    it('ArkUI_Tabs_IndicatorMarginTop_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_static_0400 start");
      let strJson = inspector.getInspectorByKey('indicatorTest3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0400] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorMarginTop: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorMarginTop_static_0500
     * @tc.name      Tests the indicator.getString('marginTop') property of the tabs component
     * @tc.desc      set indicator.getString('marginTop') to abnormol value -1 then get the default value "8.00vp"
     */
    it('ArkUI_Tabs_IndicatorMarginTop_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_static_0500 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeight": 10,
            "selfMarginTop": -1
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = inspector.getInspectorByKey('defaultSubTab');
      let defaultObj = JSON.parseJsonElement(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0500] default indicator:" + defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let defaultIndicatorMarginTop: string = defaultObj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');

      let strJson = inspector.getInspectorByKey('indicatorTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0500] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorMarginTop: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual(defaultIndicatorMarginTop);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_IndicatorMarginTop_static_0600
     * @tc.name      Tests the indicator.getString('marginTop') property of the tabs component
     * @tc.desc      set indicator.getString('marginTop') with different length's unit
     */
    it('ArkUI_Tabs_IndicatorMarginTop_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_static_0600 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfMarginTopStr": "10px"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('indicatorTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      let indicatorMarginTop: string = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfMarginTopStr": "10fp"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorMarginTop = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfMarginTopStr": "10lpx"
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = inspector.getInspectorByKey('indicatorTest2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_static_0600] indicator:" + obj.getElement('$attrs').getElement('tabBar').getElement('indicator'));
      indicatorMarginTop = obj.getElement('$attrs').getElement('tabBar').getElement('indicator').getString('marginTop');
      expect(indicatorMarginTop).assertEqual("10.00lpx");
      done();
    });
  })
}
