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
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function columnSplitJsunit() {


  describe('columnSplitTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("columnSplitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnSplit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get columnSplitTest state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get columnSplitTest pages.name:" + "");
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push columnSplitTest page error:" + err);
        expect().assertFail();
      }
      console.info("columnSplitTest beforeEach end");
    });


    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('columnSplitTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("ColumnSplit after each called");
    });


    /**
     * @tc.number   testColumnSplit_static_010
     * @tc.name     testColumnSplit_static_010
     * @tc.desc     testColumnSplit_static_010
     * @tc.level    0
     */
    it('testColumnSplit_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('new columnSplit0 START');
        let strJson = inspector.getInspectorByKey('columnSplit');
        await Utils.sleep(1000)
        let obj = JSON.parseJsonElement(strJson);
        console.info("component obj is: " + strJson);
        expect(obj.getString('$type')).assertEqual('ColumnSplit');
        console.info("yr ColumnSplit0 type: " + obj.getString('$type'));
        expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('true');
        console.info('new columnSplit0 END');
      } catch (error) {
        console.error('[testColumnSplit_static_010] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.number   testColumnSplit_static_020
     * @tc.name     testColumnSplit_static_020
     * @tc.desc     testColumnSplit_static_020
     * @tc.level    0
     */
    it('testColumnSplit_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('new columnSplit1 START');
        let strJson = inspector.getInspectorByKey('columnSplit1');
        await Utils.sleep(1000)
        let obj = JSON.parseJsonElement(strJson);
        console.info("component obj is: " + strJson);
        expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('false');
        console.info('new columnSplit1 END');
      } catch (error) {
        console.error('[testColumnSplit_static_020] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    })
  })
}
