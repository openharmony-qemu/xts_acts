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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium-dynamic";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexWrapReverse_fixedParentMarPad() {
  describe('FlexWrapReverse_fixedParentMarPad', () => {
    beforeEach(async () => {
      console.info("FlexWrapReverse_fixedParentMarPad beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentMarPad',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentMarPad state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentMarPad" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentMarPad state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push FlexWrapReverse_fixedParentMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentMarPad page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentMarPad afterEach called");
    });

    /**
     * @tc.name   FlexWrapReverse_fixedParentMarPad_0100
     * @tc.number SUB_ACE_ARKUI_FlexWrapReverse_fixedParentMarPad_0100
     * @tc.desc   The parent component layout space is fixed, and the parent component setting padding and margin,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlexWrapReverse_fixedParentMarPad_0100',  Level.LEVEL0, async () => {
      console.info('new FlexWrapReverse_fixedParentMarPad_0100 START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 0
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest16');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest46');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest47');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest48');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest16');

      expect(Math.floor(Math.abs((locationFlex.right - locationText1.right) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.left - locationText2.right)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText2.left - locationFlex.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.left - locationText1.left)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationText3.right - locationText1.right)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText1.top - locationFlex.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.top - locationText1.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationText3.top - locationText2.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1).assertTrue();
      console.info('new FlexWrapReverse_fixedParentMarPad_0100 END');

    });

    /**
     * @tc.name   FlexWrapReverse_fixedParentMarPad_0200
     * @tc.number SUB_ACE_ARKUI_FlexWrapReverse_fixedParentMarPad_0200
     * @tc.desc   The parent component layout space is fixed, and the parent component setting padding and margin,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlexWrapReverse_fixedParentMarPad_0200',  Level.LEVEL0, async () => {
      console.info('new FlexWrapReverse_fixedParentMarPad_0200 START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 0
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest16');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest46');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest47');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest48');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest16');

      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi1:' + Math.floor(Math.abs((locationFlex.right - locationText1.right) - vp2px(70))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi2:' + Math.floor(Math.abs((locationText1.left - locationText2.right) - vp2px(20))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi3:' + Math.floor(Math.abs((locationText2.left - locationFlex.left) - vp2px(110))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi4:' + Math.floor(Math.abs((locationText3.left - locationText1.left) - vp2px(20))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi5:' + Math.floor(Math.abs((locationFlex.right - locationText3.right) - vp2px(50))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi6:' + Math.floor(Math.abs((locationText1.top - locationFlex.top) - vp2px(70))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi7:' + Math.floor(Math.abs((locationText2.top - locationFlex.top) - vp2px(50))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi8:' + Math.floor(Math.abs(locationText3.top - locationText2.bottom)));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi9:' + Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi10:' + Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi11:' + Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi12:' + Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(150))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi13:' + Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi14:' + Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))));
      console.info('FlexWrapReverse_fixedParentMarPad_0200_chazhi15:' + Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))));

      expect(Math.floor(Math.abs((locationFlex.right - locationText1.right) - vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationText2.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationFlex.left) - vp2px(110))) <= 2).assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationText1.left) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationFlex.right - locationText3.right) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationFlex.top) - vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationFlex.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.top - locationText2.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1).assertTrue();

      console.info('new FlexWrapReverse_fixedParentMarPad_0200 END');
    });

    /**
     * @tc.name   FlexWrapReverse_fixedParentMarPad_0300
     * @tc.number SUB_ACE_ARKUI_FlexWrapReverse_fixedParentMarPad_0300
     * @tc.desc   The parent component layout space is fixed, and the parent component setting padding and margin,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlexWrapReverse_fixedParentMarPad_0300',  Level.LEVEL0, async () => {
      console.info('new FlexWrapReverse_fixedParentMarPad_0300 START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 30
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest16');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest46');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest47');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest48');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest16');

      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi1:' + Math.floor(Math.abs((locationFlex.right - locationText1.right) - vp2px(70))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi2:' + Math.floor(Math.abs((locationText1.left - locationText2.right) - vp2px(20))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi3:' + Math.floor(Math.abs((locationText2.left - locationFlex.left) - vp2px(110))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi4:' + Math.floor(Math.abs((locationText3.left - locationText1.left) - vp2px(20))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi5:' + Math.floor(Math.abs((locationFlex.right - locationText3.right) - vp2px(50))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi6:' + Math.floor(Math.abs((locationText1.top - locationFlex.top) - vp2px(70))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi7:' + Math.floor(Math.abs((locationText2.top - locationFlex.top) - vp2px(50))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi8:' + Math.floor(Math.abs(locationText3.top - locationText2.bottom)));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi9:' + Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi10:' + Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi11:' + Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi12:' + Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(150))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi13:' + Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(60))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi14:' + Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))));
      console.info('FlexWrapReverse_fixedParentMarPad_0300_chazhi15:' + Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))));

      expect(Math.floor(Math.abs((locationFlex.right - locationText1.right) - vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationText2.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationFlex.left) - vp2px(110))) <= 2).assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationText1.left) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationFlex.right - locationText3.right) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationFlex.top) - vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationFlex.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.top - locationText2.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(60))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1).assertTrue();

      console.info('new FlexWrapReverse_fixedParentMarPad_0300 END');
    });

  })
}