'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {
  Driver, ON
} from '@ohos.UiTest';

export default function BackgroundBlurStyleTest() {
  describe('BackgroundBlurStyleTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("BackgroundBlurStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/backgroundBlurStyle/backgroundBlurStyle',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get BackgroundBlurStyleTest state pages:" + JSON.stringify(pages));
        if (!("backgroundBlurStyle" == pages.name)) {
          console.info("get BackgroundBlurStyleTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BackgroundBlurStyleTest page error:" + err);
      }
      console.info("BackgroundBlurStyleTest beforeEach end");
    });
    /**
     * @tc.number    BackgroundBlurStyleUndefinedTest_static_0100
     * @tc.name      BackgroundBlurStyleUndefinedTest_static_0100
     * @tc.desc      BackgroundBlurStyleUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('BackgroundBlurStyleUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BackgroundBlurStyleUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BackgroundBlurStyleUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('backgroundBlurStyleTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BackgroundBlurStyleUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }

      console.info("[BackgroundBlurStyleUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[BackgroundBlurStyleUndefinedTest_static_0100] backgroundBlurStyle: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundBlurStyle')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundBlurStyle')))
        .assertEqual('{"value":"BlurStyle.NONE","options":{"colorMode":"ThemeColorMode.System","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_ACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#00000000","scale":1,"blurOption":"[0,0]"}}');
      let changeBtn = await driver.findComponent(ON.id('backgroundBlurStyle'));
      try {
        await (changeBtn?.click() as Promise<void>);
      } catch (err) {
        console.info('BackgroundBlurStyleUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BackgroundBlurStyleUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      console.info("[BackgroundBlurStyleUndefinedTest_static_0100] click backgroundBlurStyle");
      strJson = inspector.getInspectorByKey('backgroundBlurStyleTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BackgroundBlurStyleUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundBlurStyle')))
        .assertEqual('{"value":"BlurStyle.Thin","options":{"colorMode":"ThemeColorMode.Light","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_ACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#00000000","scale":1,"blurOption":"[0,0]"}}');
      console.info('[BackgroundBlurStyleUndefinedTest_static_0100] END');
      done();
    });
  })
}

