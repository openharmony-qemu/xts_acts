/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import { ON, Driver } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import CommonFunc from '../../../ets/MainAbility/common/Common'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextClockDateTimeOptionsTest() {
  describe('TextClockDateTimeOptionsTest', () => {

    beforeAll(() => {
      console.info("TextClockDateTimeOptionsTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/textClock/TextClockDateTimeOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });


    /* *
    * @tc.number: TextClockDateTimeOptionsTest_001
    * @tc.name  : TextClockDateTimeOptionsTest_static_001
    * @tc.desc  : To test the dateTimeOptions numeric
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextClockDateTimeOptionsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextClockDateTimeOptionsTest_static_001 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('numeric');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextClockDateTimeOptionsTest_static_001 component obj is: ' + obj.getElement('$attrs').getString('dateTimeOptions'));
      expect(obj.getElement('$attrs').getString('dateTimeOptions')).assertEqual('{"hour":"numeric"}');
      console.info('[TextClockDateTimeOptionsTest_static_001] END');
      done();
    });
    /* *
    * @tc.number: TextClockDateTimeOptionsTest_002
    * @tc.name  : TextClockDateTimeOptionsTest_static_002
    * @tc.desc  : To test the dateTimeOptions 2-digit
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextClockDateTimeOptionsTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextClockDateTimeOptionsTest_static_002 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('digit');

      let obj = JSON.parseJsonElement(strJson);
      console.info('TextClockDateTimeOptionsTest_static_002 component obj is: ' + obj.getElement('$attrs').getString('dateTimeOptions'));
      expect(obj.getElement('$attrs').getString('dateTimeOptions')).assertEqual('{"hour":"2-digit"}');
      console.info('[TextClockDateTimeOptionsTest_static_002] END');
      done();
    });
  })
}
