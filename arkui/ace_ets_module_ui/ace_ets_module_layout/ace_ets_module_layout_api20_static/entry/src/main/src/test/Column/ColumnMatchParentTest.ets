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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Driver
} from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function ColumnMatchParentTest() {
  describe('ColumnMatchParentTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ColumnMatchParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnMatchParent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnMatchParentTest state pages:" + JSON.stringify(pages));
        if (!("ColumnMatchParent" == pages.name)) {
          console.info("get ColumnMatchParentTest pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ColumnMatchParentTest page error:" + err);
        expect().assertFail();
      }
      console.info("ColumnMatchParentTest beforeEach end");
    });
    afterEach(async () => {
    });


/**
     * @tc.number   ColumnMatchParentTest_static_0100
     * @tc.name     ColumnMatchParentTest_static_0100
     * @tc.desc     ColumnMatchParentTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ColumnMatchParentTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[ColumnMatchParentTest_static_0100] START');
        let driver = Driver.create()
        await CommonFunc.sleep(1000);

        let strJson = inspector.getInspectorByKey('ColumnMatchParentTest_static_0100_child');
        let obj = JSON.parseJsonElement(strJson);
        let width = parseFloat(obj.getElement("$attrs").getString("width"))
        let height = parseFloat(obj.getElement("$attrs").getString("height"))
        console.info("[ColumnMatchParentTest_static_0100] width is: " + width);
        console.info("[ColumnMatchParentTest_static_0100] height is: " + height);

        expect(Math.floor(Math.abs(width - 120)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(height - 120)) <= 1).assertTrue();

        console.info('[ColumnMatchParentTest_static_0100] END');
        done();
      } catch (error) {
        console.error('[ColumnMatchParentTest_static_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });
  })
}
