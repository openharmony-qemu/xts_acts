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

export default function ColumnSetPaddingMargin_SubChangeMar() {
  describe('ColumnSetPaddingMargin_SubChangeMar', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPaddingMargin_SubChangeMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetPaddingMargin_SubChangeMar state success " + JSON.stringify(pages));
        if (!("ColumnSetPaddingMargin_SubChangeMar" == pages.name)) {
          console.info("get ColumnSetPaddingMargin_SubChangeMar state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetPaddingMargin_SubChangeMar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPaddingMargin_SubChangeMar page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("ColumnSetPaddingMargin_SubChangeMar after each called");
    });

    /**
     * @tc.name   ColumnSetPaddingMargin_SubChangeMar_0100
     * @tc.number SUB_ACE_ARKUI_ColumnSetPaddingMargin_SubChangeMar_0100
     * @tc.desc   Parent component set paddding and margin,subcomponent set margin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ColumnSetPaddingMargin_SubChangeMar_0100',  Level.LEVEL0, async () => {
      console.info('new ColumnSetPaddingMargin_SubChangeMar_0100 START');
      await CommonFunc.sleep(2000);
      let setPadMar01: RectValue = CommonFunc.getComponentRect('setPadMar01');
      let setPadMar02: RectValue = CommonFunc.getComponentRect('setPadMar02');
      let setPadMar03: RectValue = CommonFunc.getComponentRect('setPadMar03');
      let setPadMar: RectValue = CommonFunc.getComponentRect('setPadMar');
      expect(setPadMar.bottom).assertLess(setPadMar03.bottom)

      console.info('ColumnSetPaddingMargin_SubChangeMar_0100 chazhi1:'+ Math.floor(Math.abs((setPadMar01.top - setPadMar.top) - vp2px(40))));
      console.info('ColumnSetPaddingMargin_SubChangeMar_0100 chazhi2:'+ Math.floor(Math.abs((setPadMar02.top - setPadMar01.bottom) - vp2px(50))));
      console.info('ColumnSetPaddingMargin_SubChangeMar_0100 chazhi3:'+ Math.floor(Math.abs((setPadMar03.top - setPadMar02.bottom) - vp2px(30))));
      console.info('ColumnSetPaddingMargin_SubChangeMar_0100 chazhi4:'+ Math.floor(Math.abs((setPadMar01.right - setPadMar01.left) - vp2px(300))));
      console.info('ColumnSetPaddingMargin_SubChangeMar_0100 chazhi5:'+ Math.floor(Math.abs((setPadMar02.right - setPadMar02.left) - vp2px(300))));
      console.info('ColumnSetPaddingMargin_SubChangeMar_0100 chazhi6:'+ Math.floor(Math.abs((setPadMar03.right - setPadMar03.left) - vp2px(300))));

      expect(Math.floor(Math.abs((setPadMar01.top - setPadMar.top) - vp2px(40))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((setPadMar02.top - setPadMar01.bottom) - vp2px(50))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((setPadMar03.top - setPadMar02.bottom) - vp2px(30))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((setPadMar01.right - setPadMar01.left) - vp2px(300))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((setPadMar02.right - setPadMar02.left) - vp2px(300))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((setPadMar03.right - setPadMar03.left) - vp2px(300))) <= 1).assertTrue()

      console.info('new ColumnSetPaddingMargin_SubChangeMar_0100 END');
    });
  })
}
