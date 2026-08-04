/**
 * Copyright (c) 2026 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function Grid_Row_GutterOption_String() {
  describe('Grid_Row_GutterOption_String', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_GutterOption_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_String",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_GutterOption_String state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_GutterOption_String" == pages.name)) {
          console.info("get Grid_Row_GutterOption_String pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_GutterOption_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_GutterOption_String page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_GutterOption_String beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_GutterOption_String after each called")
    });

    /**
     * @tc.name   SUB_ACE_GridRowGutterOption_STRING_0100
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_STRING_0100
     * @tc.desc   Set the GridRowSizeOption of GridRow to '80px'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GridRowGutterOption_STRING_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 START');
      globalThis.value.message.notify({
        name: 'length', value: '80px'
      })
      await CommonFunc.sleep(2000)

      let firstGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String0');
      let secondGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String1');
      let thirdGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String2');
      
      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 chazhi1:'+ Math.floor(Math.abs((secondGutterOptionStr.left - firstGutterOptionStr.right) - 80)));
      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 chazhi2:'+ Math.floor(Math.abs((thirdGutterOptionStr.top - firstGutterOptionStr.bottom) - 80)));
      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 dpi:'+ vp2px(1));
      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 padding1:'+ (secondGutterOptionStr.left - firstGutterOptionStr.right));
      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 padding2:'+ (thirdGutterOptionStr.top - firstGutterOptionStr.bottom));
      
      expect(Math.floor(Math.abs((secondGutterOptionStr.left - firstGutterOptionStr.right) - 80)) <= 4).assertTrue();
      expect(Math.floor(Math.abs((thirdGutterOptionStr.top - firstGutterOptionStr.bottom) - 80)) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_GridRowGutterOption_STRING_0200
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_STRING_0200
     * @tc.desc   Set the GridRowSizeOption of GridRow to '30%'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GridRowGutterOption_STRING_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_STRING_0200 START');
      globalThis.value.message.notify({
        name: 'length', value: '30%'
      })
      await CommonFunc.sleep(2000)

      let firstGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String0');
      let secondGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String1');
      let thirdGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String2');

      console.info('SUB_ACE_GridRowGutterOption_STRING_0200 chazhi1:'+ Math.floor(Math.abs((secondGutterOptionStr.left - firstGutterOptionStr.right) - 0)));
      console.info('SUB_ACE_GridRowGutterOption_STRING_0200 chazhi2:'+ Math.floor(Math.abs((thirdGutterOptionStr.top - firstGutterOptionStr.bottom) - 0)));

      expect(Math.floor(Math.abs((secondGutterOptionStr.left - firstGutterOptionStr.right) - 0)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdGutterOptionStr.top - firstGutterOptionStr.bottom) - 0)) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_STRING_0200 END');
      done();
    });
  })
}
