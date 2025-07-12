/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Utils.test';
// // import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitUserAgent";

// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function loadingProgressCircularJsunit() {
  describe('loadingProgressCircularJsunit', () => {
    beforeAll(() => {
      console.info("loadingProgressCircularJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LoadingProgress/loadingProgress",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("loadingProgressCircular after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testloadingProgressCircular_static_0011
     * @tc.desic         aceloadingProgressCircularEtsTest0011
     */
    it('testloadingProgressCircular_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('loadingProgressCircular testloadingProgressCircular_static_0010 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('CircularText');
      console.info("[testloadingProgressCircular_static_0011] component textAlign strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual(undefined);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('100.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('margin')).assertEqual('5.00vp');
      console.info("[testloadingProgressCircular_static_0011] color value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('color'));
      console.info("[testloadingProgressCircular_static_0011] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
      console.info("[testloadingProgressCircular_static_0011] margin value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('margin'));
      done();
    });

    /*
     * @tc.number       testloadingProgressOrbital_static_0001
     * @tc.name         testloadingProgressOrbital_static_0001
     * @tc.desic         aceloadingProgressCircularEtsTest0011
     */
    it('testloadingProgressOrbital_static_0001',Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('loadingProgressOrbital testloadingProgressCircular_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('OrbitalText');
      console.info("[testloadingProgressOrbital0001] component textAlign strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual(undefined);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('100.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('margin')).assertEqual('5.00vp');
      console.info("[testloadingProgressOrbital0001] color value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('color'));
      console.info("[testloadingProgressOrbital0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
      console.info("[testloadingProgressOrbital0001] margin value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('margin'));
      done();
    });
  })
}
