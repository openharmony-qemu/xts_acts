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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON } from '@ohos.UiTest';
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

export default function ImageAttr() {
  describe('ImageAttr', () => {
    beforeAll(() => {
      console.info("ImageAttr beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageAttr beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/ImageAttr",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageAttr state pages:" + JSON.stringify(pages));
        if (!("ImageAttr" == pages.name)) {
          console.info("get ImageAttr pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageAttr page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageAttr page error:" + err);
      }
      console.info("ImageAttr beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageAttr after each called");
    });

    /**
     * @tc.number ImageAttr_001
     * @tc.name ImageAttr_001
     * @tc.desc Image test
     * @tc.level Level 2
     */
    it('ImageAttr_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ImageAttr_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('changeTop'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('changeBottom'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_test');
      await CommonFunc.sleep(200);
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('30');
      let strJson2 = inspector.getInspectorByKey('bottom_test');
      await CommonFunc.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[ImageAttr_001] END');
      done();
    });

    /**
     * @tc.number ImageAttr_002
     * @tc.name ImageAttr_002
     * @tc.desc Image test
     * @tc.level Level 2
     */
    it('ImageAttr_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ImageAttr_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()

      let button2 = await driver.findComponent(ON.id('changeleft'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let button3 = await driver.findComponent(ON.id('changeright'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('left_test');
      await CommonFunc.sleep(200);
      let obj3 = JSON.parseJsonElement(strJson3);
      await CommonFunc.sleep(1000);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('30');

      let strJson4 = inspector.getInspectorByKey('right_test');
      await CommonFunc.sleep(200);
      let obj4 = JSON.parseJsonElement(strJson4);
      await CommonFunc.sleep(1000);
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('0');

      console.info('[ImageAttr_002] END');
      done();
    });
  })
}


