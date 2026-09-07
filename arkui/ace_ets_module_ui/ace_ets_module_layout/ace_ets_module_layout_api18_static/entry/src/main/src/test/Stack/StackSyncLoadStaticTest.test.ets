'use static';

/*
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


import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Driver
} from '@ohos.UiTest';

import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function StackSyncLoadStaticTest() {
  describe('StackSyncLoadStaticTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("StackSyncLoadStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackSyncLoadStatic',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StackSyncLoadStatic state pages:" + JSON.stringify(pages));
        if (!("StackSyncLoadStatic" == pages.name)) {
          console.info("get StackSyncLoadStatic pages.name:" + JSON.stringify(pages.name));

          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push StackSyncLoadStatic page error:" + err);
        expect().assertFail();
      }
      console.info("StackSyncLoadStaticTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.name   StackSyncLoadStaticTest_0100
     * @tc.number SUB_ARKUI_API_StackSyncLoadStaticTest_0100
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StackSyncLoadStaticTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[StackSyncLoadStaticTest_0100] START');
        let driver = Driver.create()
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('StackSyncLoadStatic1');
        let strJson2 = inspector.getInspectorByKey('StackSyncLoadStatic2');

        console.info('[StackSyncLoadStaticTest_0100]:' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('alignContent'))
        console.info('[StackSyncLoadStaticTest_0100]:' + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('alignContent'))

        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');

        console.info('[StackSyncLoadStaticTest_0100] END');
        done();
      } catch (err) {
        console.error('[StackSyncLoadStaticTest_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });


  })
}