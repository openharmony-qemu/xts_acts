'use static';
/*
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

import CommonFunc from '../../ets/MainAbility/common/Common';
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
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
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function Blur() {
  describe('Blur', () => {

    beforeEach(async (): Promise<void> => {
      console.info("Blur beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blur',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Blur state pages:" + JSON.stringify(pages));
        if (!("Blur" == pages.name)) {
          console.info("get Blur pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setPolyToPoly page error:" + err);
      }
      console.info("setPolyToPoly beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('Blur err: ' + JSON.stringify(err));
      }
      console.info("Blur after each called");
    });




/**
     * @tc.number   Blur_static_0100
     * @tc.name     Blur_static_0100
     * @tc.desc     Blur_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Blur_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('Blur_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('Blur err: ' + JSON.stringify(err));
      }

      let driver = Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('Blur err: ' + JSON.stringify(err));
      }

      let strJson2 = inspector.getInspectorByKey('blurId');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Blur err: ' + JSON.stringify(err));
      }
      console.log('test strJson2 ' + JSON.stringify(strJson2))
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[MultiNavigation_0100] component obj is: ' + JSON.stringify(obj2));
      console.info('[MultiNavigation_0100] content obj is: ' +
      JSON.stringify(obj2.getElement('$attrs').getDouble('blur')));
      expect(obj2.getElement('$attrs').getDouble('blur')).assertEqual(5);

      console.info('Blur_static_0100 END');
      done();
    });


  })
}
