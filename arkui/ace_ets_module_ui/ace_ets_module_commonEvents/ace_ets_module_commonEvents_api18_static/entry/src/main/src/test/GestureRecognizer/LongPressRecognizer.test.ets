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

export default function LongPressRecognizerTest() {
  describe('LongPressRecognizerTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/LongPressRecognizer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get LongPressRecognizer state pages:' + JSON.stringify(pages));
        if (!('LongPressRecognizer' == pages.name)) {
          console.info('get LongPressRecognizer state pages.name:' + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push LongPressRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push LongPressRecognizer page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('LongPressRecognizer after each error: ' + err);
      }
      console.info('LongPressRecognizer after each called');
    });


    
    
/**
     * @tc.number   LongPressRecognizer_static_0100
     * @tc.name     LongPressRecognizer_static_0100
     * @tc.desc     LongPressRecognizer_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LongPressRecognizer_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      await CommonFunc.sleep(1000);
      console.info('LongPressRecognizer_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let Column = await driver.findComponent(ON.id('LongPressRecognizer1'));
      await (Column?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('LongPressRecognizer');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[LongPressRecognizer_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[LongPressRecognizer_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content'))
        .assertEqual('LongPressGesture\nfingers:1\nisFingerCountLimited:false\nrepeat:false\nduration:500');
      console.info('[LongPressRecognizer_static_0100] END');
      } catch (err) {
        console.error('[LongPressRecognizer_static_0100] error: ' + err);
        expect().assertFail();
      }
      done();
    });
  })
}
