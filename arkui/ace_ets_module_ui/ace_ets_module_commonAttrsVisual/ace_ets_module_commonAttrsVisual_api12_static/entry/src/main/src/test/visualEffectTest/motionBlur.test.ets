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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function motionBlurTest() {
  describe('motionBlurTest', () => {
    beforeEach(() => {
      console.info("motionBlurTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/visualEffect/motionBlur',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get motionBlurTest state pages: " + JSON.stringify(pages));
        if (!("motionBlur" == pages.name)) {
          console.info("get motionBlurTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push motionBlurTest page error: " + err);
        expect().assertFail();
      }
    });



    /**
     * @tc.number   motionBlurTest_static_0100
     * @tc.name     motionBlurTest_static_0100
     * @tc.desc     motionBlurTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('motionBlurTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('motionBlurTest_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('motionBlurTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('motionBlur_id');
      console.log('motionBlurTest_static_0100 :'
        + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('motionBlur').getDouble('radius'))
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('motionBlur').getDouble('radius'))
        .assertEqual(0);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('motionBlur')
        .getElement('anchor').getDouble('x')).assertEqual(0);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('motionBlur')
        .getElement('anchor').getDouble('y')).assertEqual(0);
      console.info('motionBlurTest_static_0100 END');
      done();
    });
  })
}
