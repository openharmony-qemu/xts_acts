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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import inspector from '@ohos.arkui.inspector'
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function cachedShowGrid() {
  describe('cachedShowGrid', () => {
    beforeAll(() => {
      console.info("cachedShowGrid beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("cachedShowGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/cachedShowGrid",
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get cachedShowGrid state pages:" + JSON.stringify(pages));
        if (!("cachedShowGrid" == pages.name)) {
          console.info("get cachedShowGrid pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push cachedShowGrid page error:" + err);
      }
      console.info("cachedShowGrid beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listLevel1 after each called");
    });

    /**
     * @tc.number    cachedShowGrid_001
     * @tc.name      cachedShowGrid_0100
     * @tc.desc      Set the number of GridItems to be preloaded and display the preloaded nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowGrid_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[cachedShowGrid_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let strJson = inspector.getInspectorByKey('cachedCount_show_grid');
      console.info("[cachedShowGrid_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[cachedShowGrid_static_0100] cachedCount: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('cachedCount')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Grid');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('cachedCount')).assertEqual(2);
      await driver.assertComponentExist(ON.text('10'));
      console.info('[cachedShowGrid_static_0100] END');
      done();
    });

    /**
     * @tc.number    cachedShowGrid_002
     * @tc.name      cachedShowGrid_0200
     * @tc.desc      Do not crop sub components, and do not display preloaded nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowGrid_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[cachedShowGrid_static_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            "show1": false
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowGrid_static_0200] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[cachedShowGrid_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let txt = await driver.findComponent(ON.id('show_grid_10'));
      console.info("[cachedShowGrid_static_0200'] txt is: " + txt);
      expect(txt).assertEqual(null);
      console.info('[cachedShowGrid_static_0200] END');
      done();
    });

    /**
     * @tc.number    cachedShowGrid_003
     * @tc.name      cachedShowGrid_0300
     * @tc.desc      Crop sub components without displaying preloaded nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowGrid_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('[cachedShowGrid_static_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": true,
            "show1": false
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowGrid_static_0300] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[cachedShowGrid_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let txt = await driver.findComponent(ON.id('show_grid_10'));
      console.info("[cachedShowGrid_static_0300'] txt is: " + txt);
      expect(txt).assertEqual(null);
      console.info('[cachedShowGrid_static_0300] END');
      done();
    });

    /**
     * @tc.number    cachedShowGrid_004
     * @tc.name      cachedShowGrid_0400
     * @tc.desc      Configure to display preloaded nodes and crop sub components.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowGrid_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('[cachedShowGrid_static_0400] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": true,
            "show1": true
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowGrid_static_0400] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[cachedShowGrid_static_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let txt = await driver.findComponent(ON.id('show_grid_10'));
      let text = await (txt?.getText() as Promise<string>);
      console.info("[cachedShowGrid_static_0400'] text is: " + text);
      await driver.assertComponentExist(ON.text('10'));
      console.info('[cachedShowGrid_static_0400] END');
      done();
    });

    /**
     * @tc.number    cachedShowGrid_005
     * @tc.name      cachedShowGrid_0500
     * @tc.desc      Do not crop the sub components, configure the property parameter 'show' as null.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowGrid_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('[cachedShowGrid_static_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            // "show1": null
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowGrid_static_0500] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[cachedShowGrid_static_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let txt = await driver.findComponent(ON.id('show_grid_10'));
      console.info("[cachedShowGrid_static_0500'] txt is: " + txt);
      expect(txt).assertEqual(null);
      console.info('[cachedShowGrid_static_0500] END');
      done();
    });

    /**
     * @tc.number    cachedShowGrid_006
     * @tc.name      cachedShowGrid_0600
     * @tc.desc      Do not crop the sub components, configure the property parameter 'show' as undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowGrid_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('[cachedShowGrid_static_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            // "show1": undefined
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowGrid_static_0600] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[cachedShowGrid_static_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let txt = await driver.findComponent(ON.id('show_grid_10'));
      console.info("[cachedShowGrid_static_0600'] txt is: " + txt);
      expect(txt).assertEqual(null);
      console.info('[cachedShowGrid_static_0600] END');
      done();
    });
  })
}