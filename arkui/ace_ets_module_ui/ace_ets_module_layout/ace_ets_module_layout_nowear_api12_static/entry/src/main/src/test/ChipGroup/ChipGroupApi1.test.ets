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

import {
  describe,
  beforeEach,
  afterEach,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function ChipGroupApi1() {
  describe('ChipGroupApi1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ChipGroupApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/ChipGroupApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipGroupApi1 state pages:" + "");
        if (!("ChipGroupApi1" == pages.name)) {
          console.info("get ChipGroupApi1 pages.name:" + "");
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipGroupApi1 page error:" + err);
        expect().assertFail();
      }
      console.info("ChipGroupApi1 beforeEach end");
    });
    afterEach(async () => {
    });



    /**
     * @tc.number   ChipGroupApi1_static_0100
     * @tc.name     ChipGroupApi1_static_0100
     * @tc.desc     ChipGroupApi1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ChipGroupApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('ChipGroupApi1_static_0100 START');
        await CommonFunc.sleep(1000);

        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn1 = await driver.findComponent(ON.id("ChipGroupApi1_btn1"));
        console.info('ChipGroupApi1_static_0100 findComponent');
        await (btn1?.click() as Promise<void>)
        console.info('ChipGroupApi1_static_0100 START');
        console.info('ChipGroupApi1_static_0100 CLICK SUCCESS');
        await CommonFunc.sleep(1000);

        console.info('ChipGroupApi1_static_0100 CLICK SUCCESS');

        let text1 = inspector.getInspectorByKey('ChipGroupApi1_text1');
        console.info('ChipGroupApi1_static_0100 getInspectorByKey1 SUCCESS');
        expect(JSON.parseJsonElement(text1).getElement("$attrs").getString('content'))
          .assertEqual('{"top":"4.00vp","right":"16.00vp","bottom":"4.00vp","left":"16.00vp"}');
        await CommonFunc.sleep(1000);

        console.info('ChipGroupApi1_static_0100 END');
        done();
      } catch (err) {
        console.error('ChipGroupApi1_static_0100 error: ' + err);
        expect(false).assertTrue();
        done();
      }
    });

  })
}
