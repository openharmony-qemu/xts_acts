/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import { UtilsTest, startAbility } from '../Util.test.ets';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function cachedShowFlow() {
  describe('cachedShowFlow', () => {
    beforeAll(() => {
      console.info("cachedShowFlow beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("cachedShowFlow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/cachedShowFlow",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get cachedShowFlow state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get cachedShowFlow pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push cachedShowFlow page error:" + err);
      }
      console.info("cachedShowFlow beforeEach end");
    });


    /*
     * @tc.number   cachedShowFlow_static_0100
     * @tc.name     cachedShowFlow_static_0100
     * @tc.desc     cachedShowFlow_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('cachedShowFlow_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[cachedShowFlow_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let btnEvent: Component | null = await driver.findComponent(ON.id('Grid_addCommonEvent_01'));
      await (btnEvent?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('cachedCount_show_flow');
      console.info("[cachedShowFlow_static_0100] component obj is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      console.info("[cachedShowFlow_static_0100] cachedCount: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('WaterFlow');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('content')).assertEqual(6);
      await driver.assertComponentExist(ON.text('N9'));
      console.info('[cachedShowFlow_static_0100] END');
      done();
    });


    /*
     * @tc.number   cachedShowFlow_static_0200
     * @tc.name     cachedShowFlow_static_0200
     * @tc.desc     cachedShowFlow_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('cachedShowFlow_static_0200', Level.LEVEL1, (done: () => void): Promise<void> => {
      console.info('[cachedShowFlow_static_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            "show1": false
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[cachedShowFlow_static_0200] start to publish emit:" + JSON.stringify(eventData?.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowFlow_static_0200] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText: Component | null = await driver.findComponent(ON.id('Scroll_addCommonEvent_03'));
      await CommonFunc.sleep(1500);
      console.info("[cachedShowFlow_static_0200] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_static_0200] END');
      done();
    });


    /*
     * @tc.number   cachedShowFlow_static_0300
     * @tc.name     cachedShowFlow_static_0300
     * @tc.desc     cachedShowFlow_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('cachedShowFlow_static_0300', Level.LEVEL1, (done: () => void): Promise<void> => {
      console.info('[cachedShowFlow_static_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": true,
            "show1": false
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[cachedShowFlow_static_0300] start to publish emit:" + JSON.stringify(eventData?.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowGrid_0300] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText: Component | null = await driver.findComponent(ON.id('show_flow_9'));
      console.info("[cachedShowFlow_static_0300] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_static_0300] END');
      done();
    });


    /*
     * @tc.number   cachedShowFlow_static_0400
     * @tc.name     cachedShowFlow_static_0400
     * @tc.desc     cachedShowFlow_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('cachedShowFlow_static_0400', Level.LEVEL1, (done: () => void): Promise<void> => {

      try {
        console.info('[cachedShowFlow_static_0400] START');
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "clip1": true,
              "show1": false
            } as Record<String, RecordData>
          } as events_emitter.EventData
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 125,
            priority: events_emitter.EventPriority.LOW
          } as events_emitter.InnerEvent
          console.info("[cachedShowFlow_static_0400] start to publish emit:" + JSON.stringify(eventData?.data));
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[cachedShowFlow_static_0400] change component data error: " + (err as Error)?.message);
        }
        await CommonFunc.sleep(2000);
        let driver = Driver.create()
        let onText = await driver.findComponent(ON.id('show_flow_9'));
        let text = onText?.getText();
        console.info("[cachedShowFlow_static_0400'] text is: " + text);
        driver.assertComponentExist(ON.text('N9'));
        console.info('[cachedShowFlow_static_0400] END');
        done();
      } catch (err) {
        expect().assertFail();
      }
    });


    /*
     * @tc.number   cachedShowFlow_static_0500
     * @tc.name     cachedShowFlow_static_0500
     * @tc.desc     cachedShowFlow_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('cachedShowFlow_static_0500', Level.LEVEL1, (done: () => void): Promise<void> => {
      console.info('[cachedShowFlow_static_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            "show1": false
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[cachedShowFlow_static_0500] start to publish emit:" + JSON.stringify(eventData?.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowFlow_static_0500] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText: Component | null = await driver.findComponent(ON.id('show_flow_9'));
      console.info("[cachedShowFlow_static_0500] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_static_0500] END');
      done();
    });


    /*
     * @tc.number   cachedShowFlow_static_0600
     * @tc.name     cachedShowFlow_static_0600
     * @tc.desc     cachedShowFlow_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('cachedShowFlow_static_0600', Level.LEVEL1, (done: () => void): Promise<void> => {
      console.info('[cachedShowFlow_static_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            "show1": false
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[cachedShowFlow_static_0600] start to publish emit:" + JSON.stringify(eventData?.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowFlow_static_0600] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let onText: Component | null = await driver.findComponent(ON.id('show_flow_9'));
      console.info("[cachedShowFlow_static_0600] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_static_0600] END');
      done();
    });
  })
}
