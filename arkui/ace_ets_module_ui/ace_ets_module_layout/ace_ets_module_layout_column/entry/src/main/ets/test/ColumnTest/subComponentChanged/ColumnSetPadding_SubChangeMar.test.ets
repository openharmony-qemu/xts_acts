/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function ColumnSetPadding_SubChangeMar() {
  describe('ColumnSetPadding_SubChangeMar', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPadding_SubChangeMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get parentComponentSetPadding state success " + JSON.stringify(pages));
        if (!("parentComponentSetPadding" == pages.name)) {
          console.info("get parentComponentSetPadding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push parentComponentSetPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push parentComponentSetPadding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("parentComponentSetPadding after each called");
    });

    /**
     * @tc.name   ColumnSetPadding_SubChangeMar_0100
     * @tc.number SUB_ACE_ARKUI_ColumnSetPadding_SubChangeMar_0100
     * @tc.desc   Parent component set paddding,subcomponent set margin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ColumnSetPadding_SubChangeMar_0100',  Level.LEVEL0, async () => {
      console.info('new ColumnSetPadding_SubChangeMar_0100 START');
      await CommonFunc.sleep(2000);
      let columnSetPad_1: RectValue = CommonFunc.getComponentRect('columnSetPad_1');
      let columnSetPad_2: RectValue = CommonFunc.getComponentRect('columnSetPad_2');
      let columnSetPad_3: RectValue = CommonFunc.getComponentRect('columnSetPad_3');
      let columnSetPad: RectValue = CommonFunc.getComponentRect('columnSetPad');
      expect(columnSetPad.bottom).assertLess(columnSetPad_3.bottom)

      console.info('ColumnSetPadding_SubChangeMar_0100 chazhi1:'+ Math.floor(Math.abs((columnSetPad_1.top - columnSetPad.top) - vp2px(40))));
      console.info('ColumnSetPadding_SubChangeMar_0100 chazhi2:'+ Math.floor(Math.abs((columnSetPad_2.top - columnSetPad_1.bottom) - vp2px(50))));
      console.info('ColumnSetPadding_SubChangeMar_0100 chazhi3:'+ Math.floor(Math.abs((columnSetPad_3.top - columnSetPad_2.bottom) - vp2px(30))));
      console.info('ColumnSetPadding_SubChangeMar_0100 chazhi4:'+ Math.floor(Math.abs((columnSetPad_1.right - columnSetPad_1.left) - vp2px(300))));
      console.info('ColumnSetPadding_SubChangeMar_0100 chazhi5:'+ Math.floor(Math.abs((columnSetPad_2.right - columnSetPad_2.left) - vp2px(300))));
      console.info('ColumnSetPadding_SubChangeMar_0100 chazhi6:'+ Math.floor(Math.abs((columnSetPad_3.right - columnSetPad_3.left) - vp2px(300))));

      expect(Math.floor(Math.abs((columnSetPad_1.top - columnSetPad.top) - vp2px(40))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((columnSetPad_2.top - columnSetPad_1.bottom) - vp2px(50))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((columnSetPad_3.top - columnSetPad_2.bottom) - vp2px(30))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((columnSetPad_1.right - columnSetPad_1.left) - vp2px(300))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((columnSetPad_2.right - columnSetPad_2.left) - vp2px(300))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((columnSetPad_3.right - columnSetPad_3.left) - vp2px(300))) <= 1).assertTrue()

      console.info('new ColumnSetPadding_SubChangeMar_0100 END');
    });
  })
}
