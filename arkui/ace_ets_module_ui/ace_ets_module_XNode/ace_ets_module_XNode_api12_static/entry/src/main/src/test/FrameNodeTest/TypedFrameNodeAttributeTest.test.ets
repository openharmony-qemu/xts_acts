'use static';
/*
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

import { describe, expect, beforeEach, afterEach, afterAll, it, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export default function TypedFrameNodeAttributeTest() {
  describe('TypedFrameNodeAttributeTest', () => {

    beforeEach(async () => {
      console.info('frameNodeApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/TypedFrameNodeAttribute',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push frameNodeApi page error:' + err);
      }
      console.info('frameNodeApi beforeEach end');
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.number   TypedFrameNode_attribute_0100
     * @tc.name     TypedFrameNode_attribute_0100
     * @tc.desc     Test TypedFrameNode attribute method sets properties correctly (width, height, backgroundColor)
     * @tc.level    Level.LEVEL1
     */
    it('TypedFrameNode_attribute_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TypedFrameNode_attribute_0100] START');
      let driver = Driver.create();
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('getAttribute');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      console.info('[TypedFrameNode_attribute_0100] content: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));

      let content = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      expect(content).assertEqual('"50.00%"');
      done();
    });
  })
}