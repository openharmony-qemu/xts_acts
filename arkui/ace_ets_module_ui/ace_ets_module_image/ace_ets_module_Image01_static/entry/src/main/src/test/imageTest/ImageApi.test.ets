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


export default function ImageApi() {
  describe('ImageApi', () => {
    beforeAll(() => {
      console.info("ImageApi beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageApi beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/ImageApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageApi state pages:" + JSON.stringify(pages));
        if (!("ImageApi" == pages.name)) {
          console.info("get ImageApi pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageApi page error:" + err);
      }
      console.info("ImageApi beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageApi after each called");
    });

    /**
     * @tc.number ImageApi_001
     * @tc.name ImageApi_001
     * @tc.desc Image test
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('ImageApi_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ImageApi_001] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('ImageApi_Image');
      await CommonFunc.sleep(1000);
      console.info("[ImageApi_001] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Image');
      console.info('[ImageApi_001] END');
      done();
    });
  })
}


