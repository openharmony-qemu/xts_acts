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
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../ets/MainAbility/utils/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WorkerUseCurvesTest() {
  describe('WorkerUseCurvesTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("WorkerUseCurvesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WorkerUseCurves',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WorkerUseCurvesTest state pages:" + JSON.stringify(pages));
        if (!("WorkerUseCurves" == pages.name)) {
          console.info("get WorkerUseCurvesTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WorkerUseCurvesTest page error:" + err);
      }
      console.info("WorkerUseCurvesTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('WorkerUseCurvesTest err: ' + JSON.stringify(err));
      }
      console.info('WorkerUseCurves after each called');
    });
    
    /**
     * @tc.number   WorkerUseCurves_static_0100
     * @tc.name     WorkerUseCurves_static_0100
     * @tc.desc     WorkerUseCurves_static_0100
     * @tc.level    Level.LEVEL0
     */
it('WorkerUseCurves_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('WorkerUseCurves_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('WorkerUseCurves_static_0100 err: ' + JSON.stringify(err));
      }
      let button: Component | null;
      try {
        button = await driver.findComponent(ON.id('workClickId'));
      } catch (err) {
        console.info('WorkerUseCurves_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('WorkerUseCurves_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('WorkerUseCurves_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('WorkerUseCurves_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('workTextId');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('WorkerUseCurves_static_0100 err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(strJson);
      console.info('[workTextId_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[workTextId_0100] content obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('texttext');
      console.info('WorkerUseCurves_static_0100 END');
      done();
    });
  })
}