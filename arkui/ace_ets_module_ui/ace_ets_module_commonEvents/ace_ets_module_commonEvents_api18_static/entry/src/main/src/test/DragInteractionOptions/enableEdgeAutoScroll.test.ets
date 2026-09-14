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

import {
  afterAll,
  afterEach,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function enableEdgeAutoScroll() {
  describe('enableEdgeAutoScroll', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragInteractionOptions/enableEdgeAutoScroll',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get enableEdgeAutoScroll state pages: ' + JSON.stringify(pages));
        if (!('enableEdgeAutoScroll' == pages.name)) {
          console.info('get enableEdgeAutoScroll state pages.name: ' + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push enableEdgeAutoScroll success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push enableEdgeAutoScroll page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('enableEdgeAutoScroll after each error: ' + err);
      }
      console.info('enableEdgeAutoScroll after each called');
    });


    /**
    * @tc.number   DenableEdgeAutoScroll_static_0010
    * @tc.name     DenableEdgeAutoScroll_static_0010
    * @tc.desc     DenableEdgeAutoScroll_static_0010
    * @tc.level    Level.LEVEL0
    */
    it('DenableEdgeAutoScroll_static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
        console.info('DenableEdgeAutoScroll_static_0010 START');
        let driver = Driver.create()
        let image = await driver.findComponent(ON.id('enableEdgeAutoScroll' + '_image'));
        let Column = await driver.findComponent(ON.id('enableEdgeAutoScroll' + '_Text'));
        await (image?.dragTo(Column!) as Promise<void>);
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('text_undefined');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[DenableEdgeAutoScroll_static_0010] component obj is: ' + JSON.stringify(obj));
        console.info('[DenableEdgeAutoScroll_static_0010] title: ' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(obj.getElement('$attrs').getString('content')).not().assertEqual('undefined');
        console.info('[DenableEdgeAutoScroll_static_0010] END');
        } catch (err) {
          console.error('[DenableEdgeAutoScroll_static_0010] error: ' + err);
          expect().assertFail();
        }
        done();
      });
  })
}