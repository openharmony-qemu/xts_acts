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

import { describe, beforeEach, it, expect, Level, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function selectApi1() {
  describe('selectApi1', () => {

    beforeEach(async () => {
      console.info("selectApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/selectApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get selectApi1 state pages:" + JSON.stringify(pages));
        if (!("selectApi1" == pages.name)) {
          console.info("get selectApi1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectApi1 page error:" + err);
      }
      console.info("selectApi1 beforeEach end");
    });

    afterEach(async () => {
    });

    
    
/**
     * @tc.number   selectApi1_static_0100
     * @tc.name     selectApi1_static_0100
     * @tc.desc     selectApi1_static_0100
     * @tc.level    Level.LEVEL1
     */
it('selectApi1_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('selectApi1_static_0100 START');
        await CommonFunc.sleep(1000);

        inspector.sendEventByKey('selectApi1_Select',10,"")
        await CommonFunc.sleep(1000);
        console.info('click after')

        let text1 = inspector.getInspectorByKey('selectApi1_text');
        expect(JSON.stringify(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('"item1"');
        await CommonFunc.sleep(1000);

        console.info('selectApi1_static_0100 END');
        done();
      } catch (err) {
        console.error('[selectApi1_static_0100] error: ' + err);
        expect().assertFail();
        done();
      }
    });

  })
}