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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router'
import { Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, loadAndSetUpUiTest} from '@ohos.UiTest';
//import input from '@ohos.multimodalInput.keyCode';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();

export default function ShortcutKeyTABTest() {
  describe('ShortcutKeyTABTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyboardShortcut/ShortcutKeyTAB",
      }
      try {
        const router = AppStorage.get<Router>('router', Type.from<Router>()) as Router
        let pages = router.getState();
        if (pages == null || !("ShortcutKeyTAB" == pages.name)) {
          // await router.pushUrl(options).then(() => {
          //   console.info(`ShortcutKeyTABTest router.pushUrl success`);
          // }).catch((err: Error) => {
          //   console.error(`ShortcutKeyTABTest router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          // })
          router.pushUrl(options)
        }
      } catch (err) {
        console.error(`ShortcutKeyTABTest beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
    });

    /*
     *tc.number api
     *tc.name   ShortcutKeyTABTest_0100
     *tc.desc   Custom keyboard shortcuts TAB
    */
    it('ShortcutKeyTABTest_static_0100', Level.LEVEL0, async () => {
      let CASE = 'ShortcutKeyTABTest_0100'
      console.info(`ShortcutKeyTABTest_0100 START`);
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.['']).assertEqual('CTRL+TAB');
        console.info(`ShortcutKeyTABTest_0100 event.data?.msg:` + event.data?.['msg']);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 75000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      //await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_TAB)
      console.info(`ShortcutKeyTABTest_0100 END`);
    });
  })
}
