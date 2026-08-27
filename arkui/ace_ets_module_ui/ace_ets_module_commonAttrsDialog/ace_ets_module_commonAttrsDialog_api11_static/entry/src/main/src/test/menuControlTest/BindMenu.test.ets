'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector'
import events_emitter from '@ohos.events.emitter';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

const SUITE: string = 'BindMenu'
const waitUiReadyMs: Int = 500;

export default function BindMenuTest() {

  describe('BindMenuTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("BindMenuTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/menuControl/BindMenu",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BindMenuTest state pages:" + JSON.stringify(pages));
        if (!("BindMenu" == pages.name)) {
          console.info("get BindMenuTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push BindMenuTest page error:" + err);
      }
      console.info("BindMenuTest beforeEach end");
    });

    
    /**
     * @tc.number   ArkUI_Menu_static_0100
     * @tc.name     ArkUI_Menu_static_0100
     * @tc.desc     ArkUI_Menu_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Menu_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Menu_0100'
      console.info(`${SUITE} ${CASE} START`);
      let callback = (event: events_emitter.EventData) => {
        const data = event.data as Record<String,RecordData>
        const action = data['action'] as Record<String,RecordData>
        expect(action).assertEqual('onAppear');
      }
      let event: events_emitter.InnerEvent = {
        eventId: 50000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('ArkUI_Menu_0100 delayMs err: ' + JSON.stringify(err));
      }
      inspector.sendEventByKey('BindMenu_bindMenu1', 10, "")

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ArkUI_Menu_0100 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.text('Menu1'));
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ArkUI_Menu_0100 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ArkUI_Menu_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    
    /**
     * @tc.number   ArkUI_Menu_static_0200
     * @tc.name     ArkUI_Menu_static_0200
     * @tc.desc     ArkUI_Menu_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Menu_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Menu_0200'
      console.info(`${SUITE} ${CASE} START`);
      let callback = (event: events_emitter.EventData) => {
        const data = event.data as Record<String,RecordData>
        const action = data['action'] as Record<String,RecordData>
        expect(action).assertEqual('onAppear');
      }
      let event: events_emitter.InnerEvent = {
        eventId: 60002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver: Driver = Driver.create()
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('ArkUI_Menu_0200 delayMs err: ' + JSON.stringify(err));
      }
      inspector.sendEventByKey('BindMenu_bindContextMenu1', 11, "")

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ArkUI_Menu_0200 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.text('Menu1'));
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ArkUI_Menu_0200 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ArkUI_Menu_0200 sleep err: ' + JSON.stringify(err));
      }

      console.info(`${SUITE} ${CASE} END`);
      done()
    });
  })
}

