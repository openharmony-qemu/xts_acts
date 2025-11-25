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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Message, GlobalMessage } from '../../../../ets/MainAbility/common/MessageManager1';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperItemPadMar() {
  describe('swiperItemPadMarTest02', () => {
    beforeAll(() => {
      console.info("swiperItemPadMarTest beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemPadMar',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemPadMar state success " + JSON.stringify(pages));
        if (!("swiperItemPadMar" == pages.name)) {
          console.info("get swiperItemPadMar state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperItemPadMar page success ");
        }

      } catch (err) {
        console.error("push swiperItemPadMar page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const globalMessage =
        AppStorage.get<GlobalMessage<number>>('SwiperItemPadMarTest');
      if (globalMessage !== null) {
        globalMessage?.message.notify({
          name: 'index', value: 0
        });
        globalMessage?.message.notify({
          name: 'margin', value: 0
        });
        globalMessage?.message.notify({
          name: 'padding', value: 0
        });
      }
      console.info("swiperItemPadMar after each called");
    });

    // 原代码注释
    // /**
    //  * @tc.number   testSwiperItemSetPaddingMargin_static
    //  * @tc.name     testSwiperItemSetPaddingMargin_static
    //  * @tc.desc     testSwiperItemSetPaddingMargin_static
    //  * @tc.level    0
    //  */
    // it('testSwiperItemSetPaddingMargin_static', Level.LEVEL0, async (done: Function) => {
    //   console.info('new testSwiperItemSetPaddingMargin_static START');
    //   await CommonFunc.sleep(1000);
    //   let strJson = inspector.getInspectorByKey('swiperItemPadMar');
    //
    //   let swiperItemPadMar: RectValue = CommonFunc.getComponentRect('swiperItemPadMar');
    //   let swiperItemPadMar01: RectValue = CommonFunc.getComponentRect('swiperItemPadMar01');
    //   let swiperItemPadMar02: RectValue = CommonFunc.getComponentRect('swiperItemPadMar02');
    //   let swiperItemPadMar03: RectValue = CommonFunc.getComponentRect('swiperItemPadMar03');
    //   let swiperItemPadMar04: RectValue = CommonFunc.getComponentRect('swiperItemPadMar04');
    //   let swiperItemPadMar05: RectValue = CommonFunc.getComponentRect('swiperItemPadMar05');
    //   let swiperItemPadMar06: RectValue = CommonFunc.getComponentRect('swiperItemPadMar06');
    //   // Before flipping the page
    //   console.info("Before page turning , swiperItemPadMar01.left - swiperItemPadMar.left value is " +
    //   JSON.stringify(swiperItemPadMar01.left - swiperItemPadMar.left));
    //   expect(Math.round(swiperItemPadMar01.left - swiperItemPadMar.left)).assertEqual(UIContext.getFocusedUIContext()!.vp2px(20));
    //   expect(Math.round(swiperItemPadMar.right - swiperItemPadMar01.right)).assertEqual(UIContext.getFocusedUIContext()!.vp2px(20));
    //   expect(Math.round(swiperItemPadMar01.top - swiperItemPadMar.top)).assertEqual(UIContext.getFocusedUIContext()!.vp2px(20));
    //   expect(Math.round(swiperItemPadMar.bottom - swiperItemPadMar01.bottom)).assertEqual(UIContext.getFocusedUIContext()!.vp2px(20));
    //   // Page turning.
    //   let driver = Driver.create();
    //   await driver.swipe(250, 230, 200, 230);
    //   await CommonFunc.sleep(1000);
    //   swiperItemPadMar: RectValue = CommonFunc.getComponentRect('swiperItemPadMar');
    //   swiperItemPadMar01: RectValue = CommonFunc.getComponentRect('swiperItemPadMar01');
    //   swiperItemPadMar02: RectValue = CommonFunc.getComponentRect('swiperItemPadMar02');
    //   swiperItemPadMar03: RectValue = CommonFunc.getComponentRect('swiperItemPadMar03');
    //   swiperItemPadMar04: RectValue = CommonFunc.getComponentRect('swiperItemPadMar04');
    //   swiperItemPadMar05: RectValue = CommonFunc.getComponentRect('swiperItemPadMar05');
    //   swiperItemPadMar06: RectValue = CommonFunc.getComponentRect('swiperItemPadMar06');
    //   // After flipping the page.
    //   console.info("After page turning, the swiperItemPadMar.left value is " + JSON.stringify(swiperItemPadMar.left));
    //   console.info("After page turning,the swiperItemPadMar02.left.left value is " +
    //   JSON.stringify(swiperItemPadMar02.left));
    //   expect(swiperItemPadMar.left).assertEqual(swiperItemPadMar02.left);
    //   expect(swiperItemPadMar.right).assertEqual(swiperItemPadMar02.right);
    //   expect(swiperItemPadMar.top).assertEqual(swiperItemPadMar02.top);
    //   expect(swiperItemPadMar.bottom).assertEqual(swiperItemPadMar02.bottom);
    //   console.info("The type value is " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
    //   console.info("The loop value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
    //   console.info("The displayCount value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
    //   expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new testSwiperItemSetPaddingMargin_static END');
    //   done();
    // });
    // 原代码注释
  })
}