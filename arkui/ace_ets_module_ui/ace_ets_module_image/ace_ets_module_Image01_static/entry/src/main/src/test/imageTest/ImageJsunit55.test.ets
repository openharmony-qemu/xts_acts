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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
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

export default function imageJsunit55() {
  describe('imageText55', () => {
    beforeAll(() => {
      console.info("imageJsunit55 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaInputTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/image55",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaInputTest state pages:" + JSON.stringify(pages));
        if (!("image55" == pages.name)) {
          console.info("get textAreaInputTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaInputTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaInputTest page error:" + err);
      }
      console.info("textAreaInputTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("image after each called");
    });

    it('imageTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTest_0100 START');
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('text');
      console.info("imageTest_0100 component strJson:" + strJson);
      console.info("imageTest_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') is: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('string_hello');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual('9.00fp');
      console.info('imageTest_0100 END');
      done();
    });

    it('imageTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTest_0200 START');
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('image');
      console.info("imageTest_0200 component strJson:" + strJson);
      console.info("imageTest_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('src') is: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('src'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('src'))
        .assertEqual('resource://rawfile/test.png');
      console.info('imageTest_0200 END');
      done();
    });
  })
}