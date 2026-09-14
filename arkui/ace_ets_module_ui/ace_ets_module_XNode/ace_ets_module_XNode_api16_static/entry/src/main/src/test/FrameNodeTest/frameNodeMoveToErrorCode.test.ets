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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function frameNodeMoveToErrorCodeTest() {
  describe('frameNodeMoveToErrorCodeTest', () => {
    beforeEach(async () => {
      console.info('frameNodeMoveToErrorCodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveToErrorCodeTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        router.replaceUrl(options);
        console.info('get frameNodeMoveToErrorCodeTest state pages:' + JSON.stringify(pages));
        if (!('frameNodeMoveToErrorCodeTest' == pages.name)) {
          console.info('get frameNodeMoveToErrorCodeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push frameNodeMoveToErrorCodeTest page error:' + err);
      }
      console.info('frameNodeMoveToErrorCodeTest beforeEach end');
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveToErrorCodeTest sleep err: ' + JSON.stringify(err));
      }
      console.info('frameNodeMoveToErrorCodeTest after each called');
    });

    afterAll(() => {})

    /**
     * @tc.number   frameNodeMoveToErrorCodeTest_static_0100
     * @tc.name     frameNodeMoveToErrorCodeTest_static_0100
     * @tc.desc     frameNodeMoveToErrorCodeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('frameNodeMoveToErrorCodeTest_static_0100', Level.LEVEL2, async (done: () => void) => {

      console.info('frameNodeMoveOneTest_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveToErrorCodeTest sleep err: ' + JSON.stringify(err));
      }
      let button: Component | null = null;
      try {
        button = await (driver.findComponent(ON.id('check_error_id')) as Promise<Component | null>);
      } catch (err) {
        console.info('frameNodeMoveToErrorCodeTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveToErrorCodeTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveToErrorCodeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('error_str_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[frameNodeMoveToErrorCodeTest_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100021:The FrameNode is not modifiable.');
      console.info('[frameNodeMoveToErrorCodeTest_0100] END');
      done();
    });

  })
}
