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
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function FocusApi1() {
  describe('FocusApi1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("FocusApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/FocusApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusApi1 state pages:" + JSON.stringify(pages));
        if (!("FocusApi1" == pages.name)) {
          console.info("get FocusApi1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FocusApi1 page error:" + err);
      }
      console.info("FocusApi1 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.number FocusApi1_static_0100
     * @tc.name   FocusApi1_static_0100
     * @tc.desc
     */
    it('FocusApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FocusApi1_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let driver = Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn1 = inspector.getInspectorByKey('FocusApi1_btn1');
      expect(JSON.stringify(JSON.parseJsonElement(btn1).getElement('$attrs').getString('label')))
        .assertEqual('"after focus"')

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      console.info('FocusApi1_static_0100 END');
      done();
    });

  })
}