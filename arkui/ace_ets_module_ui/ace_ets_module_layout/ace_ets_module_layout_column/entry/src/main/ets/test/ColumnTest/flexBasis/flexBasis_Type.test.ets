/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function flexBasis_Type() {
  describe('flexBasis_Type', () => {
    beforeEach(async () => {
      console.info("flexBasis_Type beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/flexBasis/flexBasis_Type",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flexBasis_Type state pages:" + JSON.stringify(pages));
        if (!("flexBasis_Type" == pages.name)) {
          console.info("get flexBasis_Type pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flexBasis_Type page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexBasis_Type page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("flexBasis_Type after each called")
    });
    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0100
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0100
     * @tc.desc   column1 is set to flexBasis(100) , the height of column1 is 100vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0100',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0100] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexBasis1', value: 100
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011: RectValue = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012: RectValue = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013: RectValue = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01: RectValue = CommonFunc.getComponentRect('Column_flexBasis_01');

      expect(Math.floor(Math.abs((Column_flexBasis_011.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_013.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - (Column_flexBasis_013.top - Column_flexBasis_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.top - Column_flexBasis_012.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_01.top - Column_flexBasis_011.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_011.bottom - Column_flexBasis_011.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.bottom - Column_flexBasis_012.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.bottom - Column_flexBasis_013.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_011.right - Column_flexBasis_011.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.right - Column_flexBasis_012.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.right - Column_flexBasis_013.left) - vp2px(300))) <= 1).assertTrue();

      console.info('[SUB_ACE_flexBasis_Type_TEST_0100] END');
    });
    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0200
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0200
     * @tc.desc   column1 is set to flexBasis(0) , the height of column1 is  the original height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0200',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0200] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexBasis1', value: 0
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011: RectValue = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012: RectValue = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013: RectValue = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01: RectValue = CommonFunc.getComponentRect('Column_flexBasis_01');

      expect(Math.floor(Math.abs((Column_flexBasis_011.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_013.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - (Column_flexBasis_013.top - Column_flexBasis_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.top - Column_flexBasis_012.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_01.top - Column_flexBasis_011.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_011.bottom - Column_flexBasis_011.top) - vp2px(200))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.bottom - Column_flexBasis_012.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.bottom - Column_flexBasis_013.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_011.right - Column_flexBasis_011.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_012.right - Column_flexBasis_012.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_013.right - Column_flexBasis_013.left) - vp2px(300))) <= 1).assertTrue();

      console.info('[SUB_ACE_flexBasis_Type_TEST_0200] END');
    });

    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0300
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0300
     * @tc.desc   column1 is set to flexBasis('auto') , the height of column1 is  the original height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0300',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0300] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addflexBasis2', value: 'auto'
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');

      expect(Math.floor(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - vp2px(220))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300))) <= 1).assertTrue();

      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
    });
    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.desc   column1 is set to flexBasis('200vp') , the height of column1 is 200vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0400',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addflexBasis2', value: '200vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');

      expect(Math.floor(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - vp2px(200))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300))) <= 1).assertTrue();

      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
    });
    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0500
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0500
     * @tc.desc   column1 is set to flexBasis('200px') , the height of column1 is 200px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0500',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addflexBasis2', value: '200px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');

      expect(Math.floor(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - 200)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300))) <= 1).assertTrue();

      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] END');
    });
    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0600
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0600
     * @tc.desc   column1 is set to flexBasis('200fp') , the height of column1 is 200fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0600',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addflexBasis2', value: '200fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');

      expect(Math.floor(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - fp2px(200))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300))) <= 1).assertTrue();

      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] END');
    });
    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0700
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0700
     * @tc.desc   column1 is set to flexBasis('200lpx') , the height of column1 is 200lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0700',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addflexBasis2', value: '200lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');

      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi1:' + Math.floor(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) -
        (Column_flexBasis_02.right - Column_flexBasis_021.right))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi2:' + Math.floor(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) -
        (Column_flexBasis_02.right - Column_flexBasis_022.right))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi3:' + Math.floor(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) -
        (Column_flexBasis_02.right - Column_flexBasis_023.right))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi4:' + Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) -
        (Column_flexBasis_023.top - Column_flexBasis_022.bottom))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi5:' + Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi6:' + Math.floor(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi7:' + Math.floor(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi8:' + Math.floor(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - lpx2px(200))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi9:' + Math.floor(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi10:' + Math.floor(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi11:' + Math.floor(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi12:' + Math.floor(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300))));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] chazhi13:' + Math.floor(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300))));

      expect(Math.floor(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - lpx2px(200))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300))) <= 1).assertTrue();

      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] END');
    });
  })
}