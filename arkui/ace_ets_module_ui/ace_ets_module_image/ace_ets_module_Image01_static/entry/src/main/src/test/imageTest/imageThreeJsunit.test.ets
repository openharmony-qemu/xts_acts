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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { MessageManager, Callback, GlobalMessage } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;

export default function imageThreeJsunit() {
  describe('imageThreeJsunit', () => {
    beforeAll(() => {
      console.info("imageThreeJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageThreeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/imageThree",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageThreeJsunit state pages:" + JSON.stringify(pages));
        if (!("imageThree" == pages.name)) {
          console.info("get imageThreeJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageThreeJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageThreeJsunit page error:" + err);
      }
      console.info("imageThreeJsunit beforeEach end");
    });


    it('imageThreeJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageThreeJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // test the image complete Event
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('complete');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageThreeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('complete');
      done();
    });

    it('imageThreeJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageThreeJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // test the image finish Event
      let strJson = inspector.getInspectorByKey('Finish');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageThreeJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('init');
      done();
    });

    it('imageThreeJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageThreeJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // test the image click event
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('image2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('click');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageThreeJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('click');
      done();
    });

    it('imageThreeJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageThreeJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // test the image error event
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample3', Type.from<GlobalMessage>());
      globalMessage?.message.notify({
        name: 'imageName', value: '1.png'
      });
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('error');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageThreeJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('error');
      done();
    });
  })
}