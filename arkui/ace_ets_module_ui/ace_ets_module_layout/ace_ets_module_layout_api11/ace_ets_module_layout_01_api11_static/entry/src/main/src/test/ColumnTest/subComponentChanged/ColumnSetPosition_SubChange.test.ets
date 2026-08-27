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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index'
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';




export default function ColumnSetPosition_SubChange() {
  describe('ColumnSetPositionTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetPositionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPosition_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetPositionTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSetPosition_SubChange" == pages.name)) {
          console.info("get ColumnSetPositionTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info("push ColumnSetPositionTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPositionTest page error:" + err);
      }
      console.info("ColumnSetPositionTest beforeEach end");
    });

    afterEach(async () => {
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ColumnSetPositionTest sleep err: ' + JSON.stringify(err));
      }
      console.info("SetPosition after each called");
    });


    /**
     * @tc.number   testColumnSubcomponentSetPosition_static
     * @tc.name     testColumnSubcomponentSetPosition_static
     * @tc.desc     testColumnSubcomponentSetPosition_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSubcomponentSetPosition_static', Level.LEVEL0, async () => {
      console.info('new testColumnSubcomponentSetPosition_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'position_x', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'position_y', value: 10
      });
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ColumnSetPositionTest sleep err: ' + JSON.stringify(err));
      }
      let columnPosition_1: RectValue = CommonFunc.getComponentRect('columnPosition_1');
      let columnPosition_2: RectValue = CommonFunc.getComponentRect('columnPosition_2');
      let columnPosition_3: RectValue = CommonFunc.getComponentRect('columnPosition_3');
      let columnPosition: RectValue = CommonFunc.getComponentRect('columnPosition');

      expect(Math.abs(columnPosition_1.top - columnPosition.top - Math.round(uiContext!.vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(columnPosition_1.left - columnPosition.left - Math.round(uiContext!.vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(columnPosition_2.top - columnPosition.top) <= 1).assertTrue()
      expect(Math.abs(columnPosition_3.top - columnPosition_2.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(columnPosition_3.bottom).assertLess(columnPosition.bottom)
      console.info('new testColumnSubcomponentSetPosition_static END');
    });
  })
}
