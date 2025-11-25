'use static';
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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function curvesTabs() {
  describe('curvesTabs', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("curvesTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/curvesTabs",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get curvesTabs state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/Tabs/curvesTabs" == pages.name)) {
          console.info("get curvesTabs pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push curvesTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push curvesTabs page error:" + err);
      }
      console.info("curvesTabs beforeEach end");
    });
    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });
    
    /*
     * @tc.number   curvesTabs_static_0100
     * @tc.name     curvesTabs_static_0100
     * @tc.desc     curvesTabs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('curvesTabs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[curvesTabs_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_bar_curve');
      console.info("[curvesTabs_static_0100] barHeight: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barHeight')));
      console.info("[curvesTabs_static_0100] animationCurve: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('animationCurve')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('animationCurve'))
        .assertEqual("cubic-bezier(0.250000,0.100000,0.250000,1.000000)");

      let driver = Driver.create();
      let tabsComponent = await driver.findComponent(ON.text('Yellow')) as Component;
      await tabsComponent.click();
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('tabs_text1_curve');
      console.info("[curvesTabs_static_0100] content: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content')).assertEqual('index: 1');
      console.info('[curvesTabs_static_0100] END');
      done();
    });
  })
}
