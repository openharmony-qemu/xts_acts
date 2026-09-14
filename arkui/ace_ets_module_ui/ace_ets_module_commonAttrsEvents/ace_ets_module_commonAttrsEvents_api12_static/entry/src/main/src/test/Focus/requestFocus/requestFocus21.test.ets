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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';

import inspector from '@ohos.arkui.inspector';

import { AppStorage } from '@ohos.arkui.stateManagement';

export default function requestFocus21() {
  describe('requestFocus21', () => {
    beforeEach(async (): Promise<void> => {
      console.info("requestFocus21 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus21',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get requestFocus21 state pages:" + JSON.stringify(pages));
        if (!("requestFocus21" == pages.name)) {
          console.info("get requestFocus21 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push requestFocus21 page error:" + err);
      }
      console.info("requestFocus21 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
    });

    /**
     * @tc.number requestFocus21_static_0100
     * @tc.name   requestFocus21_static_0100
     * @tc.desc
     */
    it('requestFocus21_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('requestFocus21_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      inspector.sendEventByKey('requestFocus21_btn1', 10, "")
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('pushOne click after')

      inspector.sendEventByKey('requestFocus21_btn2', 10, "")
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('Focus-textInput1 click after')

      let textInput1 = inspector.getInspectorByKey('requestFocus21_textInput1');
      expect(JSON.stringify(JSON.parseJsonElement(textInput1).getElement('$attrs').getString('text')))
        .assertEqual('"TextInput_1"');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      console.info('requestFocus21_static_0100 END');
      done();
    });

  })
}