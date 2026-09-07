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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function backgroundImageResizableTest() {
  describe('backgroundImageResizableTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("backgroundImageResizableTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/backgroundImage/backgroundImageResizable',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get backgroundImageResizableTest state pages: " + JSON.stringify(pages));
        if (!("backgroundImageResizable" == pages.name)) {
          console.info("get backgroundImageResizableTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push backgroundImageResizableTest page error: " + err);
        expect().assertFail();
      }
    });
    
    
    
/**
      * @tc.number   backgroundImageResizableTest_static_0100
      * @tc.name     backgroundImageResizableTest_static_0100
      * @tc.desc     backgroundImageResizableTest_static_0100
      * @tc.level    Level.LEVEL2
      */
it('backgroundImageResizableTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('backgroundImageResizableTest_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('backgroundImageResizableTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('backgroundImageResizable_1');
      console.log('backgroundImageResizableTest_static_0100', JSON.parseJsonElement(strJson).getElement('$attrs'))
      console.log('backgroundImageResizableTest_static_0100', JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('backgroundImageResizable'))
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundImageResizable'))
        .assertEqual(('ImageResizableSlice: {left: 20.00px, right: 20.00px, top: 20.00px, bottom: 20.00px}'));
      console.info('[backgroundImageResizableTest_static_0100] END');
      done();
    });
  })
}
