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
import events_emitter from '@ohos.events.emitter'
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function enableJsunit() {
  describe('appInfoTest_four_4', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("path beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/path/path',
      }
      try {
        const path = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        path.clear();
        let pages = path.getState();
        console.info("get path state pages: " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get overlay state pages.name:" + JSON.stringify(pages.name));
          let result = path.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push path page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push path page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("path after each called");
    });

    it('testPath01_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testPath01] START');
      await CommonFunc.sleep(1000);
      let strJson = JSON.parseJsonElement('path1');
      console.info("[testPath01] strJson is: " + JSON.stringify(strJson));
      expect(strJson.getElement('$attrs').getString('width')).assertEqual('300.00px');
      expect(strJson.getElement('$attrs').getString('height')).assertEqual('10.00px');
      console.info('[testPath01] END');
      done();
    });

    it('testPath02_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testPath02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "height": '200.00px',
            "commands": "M0 110 L900 0",
            "width": '200.00px',
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 151,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[testPath02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testPath02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = JSON.parseJsonElement('path1');
      console.info("[testPath02] strJson is: " + JSON.stringify(strJson));
      expect(strJson.getElement('$attrs').getString('width')).assertEqual('200.00px');
      expect(strJson.getElement('$attrs').getString('height')).assertEqual('200.00px');
      console.info('testPath02 END');
      done();
    });
  })
}
