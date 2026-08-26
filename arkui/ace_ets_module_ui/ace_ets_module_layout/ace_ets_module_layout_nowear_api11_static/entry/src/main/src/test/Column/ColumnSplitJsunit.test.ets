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
} from '../../../../hypium/index'
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ColumnSplitJsunit() {
  describe('ColumnSplitJsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ColumnSplitJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/columnSplitPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSplitJsunit state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get ColumnSplitJsunit pages.name:" + "");
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ColumnSplitJsunit page error:" + err);
        expect().assertFail();
      }
      console.info("ColumnSplitJsunit beforeEach end");
    });


    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('ColumnSplitJsunit afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("columnSplit after each called");
    })


    /**
     * @tc.number   testColumnSplitResizeable_static_01
     * @tc.name     testColumnSplitResizeable_static_01
     * @tc.desc     testColumnSplitResizeable_static_01
     * @tc.level    0
     */
    it('testColumnSplitResizeable_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let tagName = 'testColumnSplitResizeable_static_01';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000)
        let strJson = inspector.getInspectorByKey('columnsplitkey');
        console.info('[' + tagName + '] component obj is: ' + strJson);
        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ColumnSplit');
        console.info('[' + tagName + '] END ===========================');
      } catch (error) {
        console.error('[testColumnSplitResizeable_static_01] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });
  })
}
