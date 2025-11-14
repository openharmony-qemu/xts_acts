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

export default function swiperItemSize2() {
  describe('swiperItemSizeTest2', () => {
    beforeAll(() => {
      console.info("swiperItemSize2 beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemSize2',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemSize2 state success " + JSON.stringify(pages));
        if (!("swiperItemSize2" == pages.name)) {
          console.info("get swiperItemSize2 state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperItemSize2 page success ");
        }
      } catch (err) {
        console.error("push swiperItemSize2 page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSize2 after each called");
    });


    // /**原代码注释
    //  * @tc.number   testSwiperItemSizeExceed2_static
    //  * @tc.name     testSwiperItemSizeExceed2_static
    //  * @tc.desc     testSwiperItemSizeExceed2_static
    //  * @tc.level    0
    //  */
    // it('testSwiperItemSizeExceed2_static', Level.LEVEL0, async (done: Function) => {
    //   console.info('new testSwiperItemSizeExceed2_static START');
    //   globalThis.value.message.notify({ name: 'index', value: 0 });
    //   globalThis.value.message.notify({ name: 'height', value: 350 });
    //   globalThis.value.message.notify({ name: 'width', value: 350 });
    //   await CommonFunc.sleep(1000);
    //   let strJson = inspector.getInspectorByKey('itemSizekey2');
    //
    //   let itemSizekey2: RectValue = CommonFunc.getComponentRect('itemSizekey2');
    //   let itemSizekey2_01: RectValue = CommonFunc.getComponentRect('itemSizekey2_01');
    //   let itemSizekey2_02: RectValue = CommonFunc.getComponentRect('itemSizekey2_02');
    //   let itemSizekey2_03: RectValue = CommonFunc.getComponentRect('itemSizekey2_03');
    //   // Before flipping the page.
    //   console.info("Before page turning , the itemSizekey2.left value is " + JSON.stringify(itemSizekey2.left));
    //   console.info("Before page turning , the itemSizekey2_01.left value is " + JSON.stringify(itemSizekey2_01.left));
    //   expect(itemSizekey2.left).assertEqual(itemSizekey2_01.left);
    //   expect(itemSizekey2.right).assertEqual(itemSizekey2_01.right);
    //   expect(itemSizekey2.top).assertEqual(itemSizekey2_01.top);
    //   expect(itemSizekey2.bottom).assertEqual(itemSizekey2_01.bottom);
    //   // Flipping.
    //   let driver = Driver.create();
    //   //  await driver.swipe(250, 230, 200, 230);
    //   await CommonFunc.sleep(500);
    //   await driver.swipe(UIContext.getFocusedUIContext()!.vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //   await CommonFunc.sleep(1000);
    //   // After flipping the page.
    //   itemSizekey2: RectValue = CommonFunc.getComponentRect('itemSizekey2');
    //   itemSizekey2_01: RectValue = CommonFunc.getComponentRect('itemSizekey2_01');
    //   itemSizekey2_02: RectValue = CommonFunc.getComponentRect('itemSizekey2_02');
    //   itemSizekey2_03: RectValue = CommonFunc.getComponentRect('itemSizekey2_03');
    //   console.info("After page turning , the itemSizekey2.left value is " + JSON.stringify(itemSizekey2.left));
    //   console.info("After page turning , the itemSizekey2_02.left value is " + JSON.stringify(itemSizekey2_02.left));
    //   expect(itemSizekey2.left).assertEqual(itemSizekey2_02.left);
    //   expect(itemSizekey2.right).assertEqual(itemSizekey2_02.right);
    //   expect(itemSizekey2.top).assertEqual(itemSizekey2_02.top);
    //   expect(itemSizekey2.bottom).assertEqual(itemSizekey2_02.bottom);
    //   console.info("The type value is " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
    //   console.info("The loop value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
    //   console.info("The displayCount value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
    //   expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new testSwiperItemSizeExceed2_static END');
    //   done();
    // });原代码注释
  })
}