'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';

import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function ArrayLikeStringTest(): void {
  describe('ArrayLikeStringTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('ArrayLikeStringTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/ArrayLike/ArrayLikeString',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pages = routerInstance.getState();
        console.info('get ArrayLikeStringTest state pages:' + JSON.stringify(pages));
        if (!('ArrayLikeString' === pages.name)) {
          console.info('get ArrayLikeStringTest pages.name:' + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('push ArrayLikeStringTest page error:' + err);
      }
      console.info('ArrayLikeStringTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('ArrayLikeStringTest afterEach error:' + err);
      }
      console.info('ArrayLikeStringTest after each called');
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ARRAYLIKE_STRING_0010
     * @tc.name     ArrayLikeStringTest_static_001
     * @tc.desc     test ArrayLikeString component.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('ArrayLikeStringTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArrayLikeStringTest_static_001] START');
      try {
        const driver: Driver = Driver.create();
        await CommonFunc.sleep(2000);
        const strJson = inspector.getInspectorByKey('TextString');
        const obj = JSON.parseJsonElement(strJson);
        const text1 = await driver.findComponent(ON.text('n2'));
        console.info('[ArrayLikeStringTest_static_001] component obj is:' + JSON.stringify(obj));
        expect(text1 != null).assertTrue();
      } catch (err) {
        console.log('ArrayLikeStringTest_static_001 error:' + err);
        expect(true).assertEqual(false);
      }
      console.info('[ArrayLikeStringTest_static_001] END');
      done();
    });
  });
}
