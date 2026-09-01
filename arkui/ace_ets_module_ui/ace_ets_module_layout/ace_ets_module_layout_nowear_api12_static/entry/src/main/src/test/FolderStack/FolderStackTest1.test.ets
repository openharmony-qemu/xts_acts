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
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';


export default function FolderStackTest1() {
  describe('FolderStackTest1', () => {

    beforeEach(async (): Promise<void> => {
      console.info("FolderStackTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FolderStack/FolderStackTest1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FolderStackTest1 state pages:" + "");
        if (!("FolderStackTest1" == pages.name)) {
          console.info("get FolderStackTest1 pages.name:" + "");
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FolderStackTest1 page error:" + err);
        expect().assertFail();
      }
      console.info("FolderStackTest1 beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("FolderStackTest1 afterEach sleep error:" + err);
      }
      console.info("FolderStackTest1 after each called");
    });



    /**
     * @tc.number   FolderStackTest1_static_0100
     * @tc.name     FolderStackTest1_static_0100
     * @tc.desc     FolderStackTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('FolderStackTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('FolderStackTest1_static_0100 START');
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('FolderStackTest1_FolderStack');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(1000);
        console.info("[FolderStackTest1_static_0100] obj1 is: " + JSON.stringify(obj1));
        expect(obj1.getElement('$attrs').getString('width')).assertEqual('200.00vp');

        console.info('FolderStackTest1_static_0100 END');
      } catch (err) {
        console.error("FolderStackTest1_static_0100 error:" + err);
        expect(false).assertTrue();
      }
      done();
    });


  })
}