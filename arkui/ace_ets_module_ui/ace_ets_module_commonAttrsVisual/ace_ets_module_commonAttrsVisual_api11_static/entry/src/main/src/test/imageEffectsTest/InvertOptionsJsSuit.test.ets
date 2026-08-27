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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import emitter from '@ohos.events.emitter'

export default function InvertOptionsJsSuit() {
  describe('InvertOptionsJsSuit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("InvertOptionsJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/InvertOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get InvertOptionsJsSuit state pages:" + JSON.stringify(pages));
        if (!("InvertOptions" == pages.name)) {
          console.info("get InvertOptionsJsSuit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push InvertOptionsJsSuit page error:" + err);
      }
      console.info("InvertOptionsJsSuit beforeEach end");
    });


    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('InvertOptionsJsSuitTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("overlay after each called");
    });


    
    
/**
     * @tc.number   InvertOptionsJsSuit_static_0100
     * @tc.name     InvertOptionsJsSuit_static_0100
     * @tc.desc     InvertOptionsJsSuit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('InvertOptionsJsSuit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[InvertOptionsJsSuit_0100] START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
        let button_Bottom = await driver.findComponent(ON.id('InvertOptionsenum'));
        await (button_Bottom?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('InvertOptionsJsSuitTest action err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('InvertOptionsenum');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('InvertOptionsJsSuitTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[InvertOptionsJsSuit_0100] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('invert')
        .getElement('thresholdRange')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('invert')
        .getDouble('low') == 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('invert').getDouble('high') == 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('invert').getDouble('threshold') == 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('invert')
        .getDouble('thresholdRange') == 1).assertTrue();
      console.info('[InvertOptionsJsSuit_0100] END');
      done();
    });
  })
}