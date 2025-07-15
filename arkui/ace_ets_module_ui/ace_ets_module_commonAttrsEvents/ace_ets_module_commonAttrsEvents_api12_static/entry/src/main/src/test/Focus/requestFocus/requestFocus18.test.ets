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
import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../../hypium/index';
import { Driver, ON ,Component} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import {UtilsTest} from '../../Util.test'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import {UtilsTest} from '../../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function requestFocus18() {
  describe('requestFocus18', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
 beforeEach(async (): Promise<void> => {
      console.info("requestFocus18 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus18',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get requestFocus18 state pages:" + JSON.stringify(pages));
        if (!("requestFocus18" == pages.name)) {
          console.info("get requestFocus18 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // let result = await requestFocus18.pushUrl(options);
          // await CommonFunc.sleep(2000);
          // console.info("push requestFocus18 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push requestFocus18 page error:" + err);
      }
      console.info("requestFocus18 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
    });

    /**
     * @tc.number requestFocus18_static_0100
     * @tc.name   requestFocus18_static_0100
     * @tc.desc
     */
    it('requestFocus18_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('requestFocus18_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('requestFocus18_btn1',10,"")
      await CommonFunc.sleep(1000);
      console.info('modalPageOne click after')

      inspector.sendEventByKey('requestFocus18_btn2',10,"")
      await CommonFunc.sleep(1000);
      console.info('Focus-textInput1 click after')

      let textInput1 = inspector.getInspectorByKey('requestFocus18_textInput1');
      expect(JSON.stringify(JSON.parseJsonElement(textInput1).getElement('$attrs').getString('text'))).assertEqual('"TextInput_1"');
      await CommonFunc.sleep(1000);

      console.info('requestFocus18_static_0100 END');
      done();
    });

  })
}