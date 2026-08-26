'use static';
/**
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
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function enumFolderTest() {
  describe('enumFolderTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("enumFolderTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FolderStack/folder_stack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get enumFolderTest state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get enumFolderTest pages.name:" + "");
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enumFolderTest page error:" + err);
        expect().assertFail();
      }
      console.info("enumFolderTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (error) {
        console.error("enumFolderTest afterEach error:" + error);
      }
      console.info("enumFolderTest after each called");
    });


    /**
     * @tc.number   enumFolderTest_static_0100
     * @tc.name     enumFolderTest_static_0100
     * @tc.desc     enumFolderTest_static_0100
     * @tc.level    0
     */
    it('enumFolderTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[enumFolderTest_static_0100] START');
        await CommonFunc.sleep(2000);
        // no trigger
        let json = inspector.getInspectorByKey('flod_tx3');
        let Obj1 = JSON.parseJsonElement(json);
        console.info("enumFolderTest_static_0100 json info " + JSON.stringify(json));
        expect(Obj1.getElement('$attrs').getString('content')).assertEqual("")
      } catch (error) {
        console.error('[enumFolderTest_static_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

  })
}
