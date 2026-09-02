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
import { describe, afterEach, afterAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';

import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function enumsHorizontalAlignJsunit() {
  describe('enumsHorizontalAlign', () => {
   beforeEach(async (): Promise<void> => {
     console.info("enumsHorizontalAlign beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Column/enumsHorizontalAlign',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('beforeEach get enumsHorizontalAlign state pages:' + "");
        if (!('enumsHorizontalAlign' == pages.name)) {
          console.info('beforeEach get enumsHorizontalAlign state pages.name:' + "");
          
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          
        }
      } catch (err) {
        console.error('beforeEach push enumsHorizontalAlign page error:' + err);
      }
    });

    afterEach(async () => {
      try {
      await Utils.sleep(1000);
      } catch (err) {
      console.info('enumsHorizontalAlignTest await err: ' + JSON.stringify(err));
      }
      console.info('[ afterEach ] ===================enumsFlexItemTest test after each called===================');
    });

    
    

/**
     * @tc.number   enumsHorizontalAlignTest_static_0100
     * @tc.name     enumsHorizontalAlignTest_static_0100
     * @tc.desc     enumsHorizontalAlignTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('enumsHorizontalAlignTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('enumsHorizontalAlignTest_static_0100 START');
      try {
      await Utils.sleep(1500);
      } catch (err) {
      console.info('enumsHorizontalAlignTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('HorizontalAlign');
      console.info("enumsHorizontalAlignTest_static_0100 component strJson:" + strJson);
     console.info("enumsHorizontalAlignTest_static_0100 component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Center');
      console.info('enumsHorizontalAlignTest_static_0100 END');
      done();
    });
  })
}
