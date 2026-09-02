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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';

import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function enumsVerticalAlignJsunit() {
  describe('enumsVerticalAlign', () => {
    beforeEach(async (): Promise<void> => {
      console.info('beforeEach ===================enumsFlexItem test beforeEach called===================');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/enumsVerticalAlign',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('beforeEach get enumsVerticalAlign state pages:' + "");
        if (!('enumsVerticalAlign' == pages.name)) {
          console.info('beforeEach get enumsVerticalAlign state pages.name:' + "");
          
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          
        }
      } catch (err) {
        console.error('beforeEach push enumsVerticalAlign page error:' + err);
      }
    });

    afterEach(async () => {
      try {
      await Utils.sleep(1000);
      } catch (err) {
      console.info('enumsVerticalAlignTest await err: ' + JSON.stringify(err));
      }
      console.info('[ afterEach ] ===================enumsFlexItemTest test after each called===================');
    });

    
    

/**
     * @tc.number   enumsVerticalAlignTest_static_0100
     * @tc.name     enumsVerticalAlignTest_static_0100
     * @tc.desc     enumsVerticalAlignTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('enumsVerticalAlignTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('enumsVerticalAlignTest_static_0100 START');
      try {
      await Utils.sleep(1500);
      } catch (err) {
      console.info('enumsVerticalAlignTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('VerticalAlign');
      console.info("enumsVerticalAlignTest_static_0100 component strJson:" + strJson);
     console.info("enumsVerticalAlignTest_static_0100 component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')));
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')).assertEqual('VerticalAlign.Center');
      console.info('enumsVerticalAlignTest_static_0100 END');
      done();
    });
  })
}
