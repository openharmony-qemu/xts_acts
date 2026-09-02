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

import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';

import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
export default function blankJsunit() {
  describe('BlankTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("BlankTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/Blank',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Blank state success " + "");
        if (!("Blank" == pages.name)) {
          console.info("get Blank state success " + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000)
        }
      } catch (err) {
        console.error("push Blank page error " + JSON.stringify(err));
      }
      try {
      await UtilsTest.msSleep(1000)
      } catch (err) {
      console.info('BlankTestTest await err: ' + JSON.stringify(err));
      }
    });


    afterEach(async () => {
      try {
      await UtilsTest.msSleep(1000)
      } catch (err) {
      console.info('BlankTestTest await err: ' + JSON.stringify(err));
      }
      console.info("Blank after each called");
    });

/**
     * @tc.number   BlankGetInspectorByKey_static_01
     * @tc.name     BlankGetInspectorByKey_static_01
     * @tc.desc     BlankGetInspectorByKey_static_01
     * @tc.level    Level.LEVEL0
     */
it('BlankGetInspectorByKey_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('BlankTest_blank');
     let obj = JSON.parseJsonElement(strJson);
     console.info("cd blank component obj is: " + JSON.stringify(obj));
     console.log("cd blank type" + JSON.stringify(obj.getString('$type')));
     console.log("cd blank min" + JSON.stringify(obj.getElement('$attrs').getString('min')));
     console.log("cd blank color" + JSON.stringify(obj.getElement('$attrs').getString('color')));
     expect(obj.getString('$type')).assertEqual('Blank');
     expect(obj.getElement('$attrs').getString('min')).assertEqual('100.00vp');
      console.info('cd BlankGetInspectorByKey END');
      done();
    });

  })
}
