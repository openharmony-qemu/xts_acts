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
import { beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WidthTest() {
  describe('WidthTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("WidthTest beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/width/WidthPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WidthTest state pages: " + JSON.stringify(pages));
        if (!("WidthPage" == pages.name)) {
          console.info("get WidthTest state pages.name: " + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WidthTest page error: " + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   WidthTest_static_0100
     * @tc.name     WidthTest_static_0100
     * @tc.desc     WidthTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('WidthTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('WidthTest_static_0100 START');
      try {
        await CommonFunc.sleep(1000);

        let column_parent = Utils.getComponentRect('WidthTest_0100_Column_Parent');
        let column_parent_width = column_parent.right - column_parent.left;
        let column_parent_height = column_parent.bottom - column_parent.top;
        let column_child = Utils.getComponentRect('WidthTest_0100_Column_Child');
        let column_child_width = column_child.right - column_child.left;
        let column_child_height = column_child.bottom - column_child.top;
        console.log('[WidthTest_static_0100] column_parent_width is:' + column_parent_width);
        console.log('[WidthTest_static_0100] column_parent_height is:' + column_parent_height);
        console.log('[WidthTest_static_0100] column_child_width is:' + column_child_width);
        console.log('[WidthTest_static_0100] column_child_height is:' + column_child_height);

        expect(Math.floor(Math.abs(column_parent_width - column_child_width)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(column_parent_height - column_child_height)) <= 1).assertTrue();

        console.info('[WidthTest_static_0100] END');
      } catch (error) {
        console.error('[WidthTest_static_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

  })
}

