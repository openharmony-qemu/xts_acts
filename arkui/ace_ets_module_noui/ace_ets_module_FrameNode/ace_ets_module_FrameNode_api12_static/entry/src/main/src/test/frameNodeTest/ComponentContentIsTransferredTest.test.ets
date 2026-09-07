'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Driver,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ComponentContentIsTransferredTest() {
  describe('ComponentContentIsTransferredTest', () => {
    beforeEach(async () => {
      console.info("ComponentContentIsTransferredTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/ComponentContentIsTransferred",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ComponentContentIsTransferredTest state pages: " + JSON.stringify(pages));
        if (!("ComponentContentIsTransferred" == pages.name)) {
          console.info("get ComponentContentIsTransferredTest state pages.name: " + JSON.stringify(pages.name));

          await router.replaceUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ComponentContentIsTransferredTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   ComponentContentIsTransferredTest_0100
     * @tc.number SUB_ARKUI_FRAMENODE_COMPONENTCONTENTISTRANSFERRED_0100
     * @tc.desc   Test ComponentContent.isTransferred
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComponentContentIsTransferredTest_0100', Level.LEVEL0, async (done: ()=>void) => {
      try {
        console.info('ComponentContentIsTransferredTest_0100 START');
        let driver: Driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn_componentContent_isTransferred'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        expect(AppStorage.get<boolean>('componentContentIsTransferred')).assertEqual(false);
        expect(AppStorage.get<boolean>('reactiveComponentContentIsTransferred')).assertEqual(false);
        AppStorage.delete('componentContentIsTransferred')
        AppStorage.delete('reactiveComponentContentIsTransferred')
        console.info('[ComponentContentIsTransferredTest_0100] END');
        done();
      } catch (error) {
        console.error('[ComponentContentIsTransferredTest_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })
  })
}
