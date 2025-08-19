/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Component, Driver, ON } from '@ohos.UiTest'
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';

import { BusinessError } from '@ohos.base';
import CommonFunc from '../../../ets/MainAbility/common/Common';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { FunctionKey } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';


export default function ShortcutKeyTest() {

  const SUITE = 'ShortcutKey'


  const functionKey: FunctionKey[] = [
    FunctionKey.ESC,
    FunctionKey.F1,
    FunctionKey.F2,
    FunctionKey.F3,
    FunctionKey.F4,
    FunctionKey.F5,
    FunctionKey.F6,
    FunctionKey.F7,
    FunctionKey.F8,
    FunctionKey.F9,
    FunctionKey.F10,
    FunctionKey.F11,
    FunctionKey.F12,
  ]


  const baseEvent = 62000
  const baseEvent2 = 73000

  describe('ShortcutKeyTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ShortcutKeyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/ShortcutKeyTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ShortcutKeyTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ShortcutKeyTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ShortcutKeyTest page error:" + err);
      }
      console.info("ShortcutKeyTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(2000)
    });

    /*
     * @tc.number    ArkUI_Shortcut_Key_static_0100
     * @tc.name      ArkUI_Shortcut_Key_static_0100
     * @tc.desc      ArkUI_Shortcut_Key_static_0100
     * @tc.level     2
     */
    it('ArkUI_Shortcut_Key_static_0100', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0100'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(((event.data) as ESObject).getProperty('msg')).assertEqual('Ctrl_B');
        console.info(`${SUITE} ${CASE} event.data?.msg:` + ((event.data) as ESObject).getProperty('msg'));
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()


      console.info(`${SUITE} ${CASE} END`);
    });


    /*
     * @tc.number    ArkUI_Shortcut_Key_static_0200
     * @tc.name      ArkUI_Shortcut_Key_static_0200
     * @tc.desc      ArkUI_Shortcut_Key_static_0200
     * @tc.level     2
     */
    it('ArkUI_Shortcut_Key_static_0200', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0200'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(((event.data) as ESObject).getProperty('msg')).assertEqual('Shift_1');
        console.info(`${SUITE} ${CASE} event.data?.msg:` + ((event.data) as ESObject).getProperty('msg'));
      }
      let event: events_emitter.InnerEvent = {
        eventId: 72002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()


      console.info(`${SUITE} ${CASE} END`);
    });


    /*
     * @tc.number    ArkUI_Shortcut_Key_static_0300
     * @tc.name      ArkUI_Shortcut_Key_static_0300
     * @tc.desc      ArkUI_Shortcut_Key_static_0300
     * @tc.level     2
     */
    it('ArkUI_Shortcut_Key_static_0300', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0300'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(((event.data) as ESObject).getProperty('msg')).assertEqual('Alt_Q');
        console.info(`${SUITE} ${CASE} event.data?.msg:` + ((event.data) as ESObject).getProperty('msg'));
      }
      let event: events_emitter.InnerEvent = {
        eventId: 72003,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()


      console.info(`${SUITE} ${CASE} END`);
    });

    /*
     * @tc.number    ArkUI_Shortcut_Key_static_0400
     * @tc.name      ArkUI_Shortcut_Key_static_0400
     * @tc.desc      ArkUI_Shortcut_Key_static_0400
     * @tc.level     2
     */
    it('ArkUI_Shortcut_Key_static_0400', Level.LEVEL0, async () => {
      let CASE = 'ArkUI_Shortcut_Key_0400'
      console.info(`${SUITE} ${CASE} START`);

      let start = 0
      let end = functionKey.length
      let driver = Driver.create()
      for (let i = start; i < end; i++) {
        let item = functionKey[i]

        let callback = (event: events_emitter.EventData) => {
          expect(((event.data) as ESObject).getProperty('msg')).assertEqual('Alt_Q');
          console.info(`${SUITE} ${CASE} event.data?.msg:` + ((event.data) as ESObject).getProperty('msg'));
          if (i == end - 1) {
          }
        }
        let event: events_emitter.InnerEvent = {
          eventId: baseEvent2 + i,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);

      }

      console.info(`${SUITE} ${CASE} END`);
    });

  })
}
