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

import { describe, beforeEach, it, expect, Level, Size, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function ButtonTypeTest() {
  describe('ButtonTypeTest', () => {

    beforeEach(async () => {
      console.info("ButtonTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ButtonType/ButtonTypeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ButtonTypeTest state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ButtonTypeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ButtonTypeTest page error:" + err);
      }
      console.info("ButtonTypeTest beforeEach end");
    });
    
    afterEach(async () => {
    });

    
    
    
    
    /**
     * @tc.number   ButtonTypeTest_static_0100
     * @tc.name     ButtonTypeTest_static_0100
     * @tc.desc     ButtonTypeTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ButtonTypeTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('ButtonTypeTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let btn = inspector.getInspectorByKey('btn');
      console.info("ButtonTypeTest_static_0100 component obj is: " + JSON.stringify(btn));
      console.info("[ButtonTypeTest_static_0100] title: " + JSON.stringify(JSON.parseJsonElement(btn).getElement('$attrs').getString('type')));
      expect(JSON.stringify(JSON.parseJsonElement(btn).getElement('$attrs').getString('type'))).assertEqual('"ButtonType.ROUNDED_RECTANGLE"');
      console.info('ButtonTypeTest_static_0100 END');
      done();
    });
  
  })
}