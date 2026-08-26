'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, it, expect, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function ComponentNodeDefaultTest() {
  describe('ComponentNodeDefaultTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("themePageToggleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/XComponent/ComponentNodeDefaultTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get themePageToggleTest state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/XComponent/ComponentNodeDefaultTest" == pages.name)) {
          console.info("get themePageToggleTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push themePageToggleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push themePageToggleTest page error:" + err);
      }
      console.info("themePageToggleTest beforeEach end");
    });

    /**
     * @tc.number ComponentNodeDefaultTest_001
     * @tc.name ComponentNodeDefaultTest_001
     * @tc.desc Test XComponent page title renders
     */
    it('ComponentNodeDefaultTest_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ComponentNodeDefaultTest_001 execute: START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('componentNodeDefault_id'));
        let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('componentNodeDefault1_id'));
        console.info("[ComponentNodeDefaultTest_001] component obj is: " + obj.getElement('$attrs'));
        console.info("[ComponentNodeDefaultTest_001] component obj is backgroundColor: " + obj.getElement('$attrs').getString('backgroundColor'));
        console.info("[ComponentNodeDefaultTest_001] component obj1 is: " + obj1.getElement('$attrs'));
        console.info("[ComponentNodeDefaultTest_001] component obj1 is backgroundColor: " + obj1.getElement('$attrs').getString('backgroundColor'));

        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF808080')
        expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000')
        done();
      } catch (error) {
        console.error('ComponentNodeDefaultTest_001 execute: ComponentNodeWithOptions error:' + error);
        expect().assertFail();
        done();
      }
    });


  });
}
