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

export default function swiperVertical() {
  describe('swiperVerticalTest', () => {
    beforeAll(() => {
      console.info("swiperVertical beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperVertical',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperVertical state success " + JSON.stringify(pages));
        if (!("swiperVertical" == pages.name)) {
          console.info("get swiperVertical state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperVertical page success ");
        }

      } catch (err) {
        console.error("push swiperVertical page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const globalMessage =
        AppStorage.get<GlobalMessage<boolean>>('SwiperVerticalTest');
      globalMessage?.message.notify({
        name: 'swiperVertical', value: false
      });
      console.info("swiperVertical after each called");
    });


    //保持1.1中注释
    // /**
    //  * @tc.number   testSwipeSetVerticalFalse
    //  * @tc.name     testSwipeSetVerticalFalse
    //  * @tc.desc     testSwipeSetVerticalFalse
    //  * @tc.level    0
    //  */
    // it('testSwipeSetVerticalFalse', Level.LEVEL0, async (done: Function) => {
    //   console.info('new testSwipeSetVerticalFalse START');
    //   let strJson = inspector.getInspectorByKey('verticalkey');
    //
    //   let verticalkey: RectValue = CommonFunc.getComponentRect('verticalkey');
    //   let verticalkey01: RectValue = CommonFunc.getComponentRect('verticalkey01');
    //   let verticalkey02: RectValue = CommonFunc.getComponentRect('verticalkey02');
    //   // Before flipping the page.
    //   console.info("Before page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //   console.info("Before page turning , the verticalkey01.left value is " + JSON.stringify(verticalkey01.left));
    //   expect(verticalkey.left).assertEqual(verticalkey01.left);
    //   expect(verticalkey.right).assertEqual(verticalkey01.right);
    //   expect(verticalkey.top).assertEqual(verticalkey01.top);
    //   expect(verticalkey.bottom).assertEqual(verticalkey01.bottom);
    //   // Page turning.
    //   let driver = Driver.create();
    //   await CommonFunc.sleep(500);
    //   await driver.swipe(UIContext.getFocusedUIContext()!.vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //   //  await driver.swipe(250, 230, 200, 230);
    //   await CommonFunc.sleep(1000);
    //   verticalkey01: RectValue = CommonFunc.getComponentRect('verticalkey01');
    //   verticalkey02: RectValue = CommonFunc.getComponentRect('verticalkey02');
    //   // After flipping the page.
    //   console.info("After page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //   console.info("After page turning , the verticalkey02.left value is " + JSON.stringify(verticalkey02.left));
    //   expect(verticalkey.left).assertEqual(verticalkey02.left);
    //   expect(verticalkey.right).assertEqual(verticalkey02.right);
    //   expect(verticalkey.top).assertEqual(verticalkey02.top);
    //   expect(verticalkey.bottom).assertEqual(verticalkey02.bottom);
    //   console.info("The type value is " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
    //   console.info("The index value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')));
    //   console.info("The autoPlay value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')));
    //   console.info("The vertical value is " + JSON.stringify(JSON.parse(strJson).$attrs.vertical));
    //   console.info("The loop value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
    //   console.info("The itemSpace value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
    //   console.info("The displayCount value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
    //   expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')).assertEqual('0');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')).assertEqual('false');
    //   expect(JSON.parse(strJson).$attrs.vertical).assertEqual('false');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new testSwipeSetVerticalFalse END');
    //   done();
    // });
    //
    // /**
    //  * @tc.number   testSwipeSetVerticalTrue
    //  * @tc.name     testSwipeSetVerticalTrue
    //  * @tc.desc     testSwipeSetVerticalTrue
    //  * @tc.level    0
    //  */
    // it('testSwipeSetVerticalTrue', Level.LEVEL0, async (done: Function) => {
    //   console.info('new testSwipeSetVerticalTrue START');
    //   globalThis.value.message.notify({ name: 'swiperVertical', value: true });
    //   await CommonFunc.sleep(1000);
    //   let strJson = inspector.getInspectorByKey('verticalkey');
    //
    //   let verticalkey: RectValue = CommonFunc.getComponentRect('verticalkey');
    //   let verticalkey01: RectValue = CommonFunc.getComponentRect('verticalkey01');
    //   let verticalkey02: RectValue = CommonFunc.getComponentRect('verticalkey02');
    //   // Before flipping the page.
    //   console.info("Before page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //   console.info("Before page turning , the verticalkey01.left value is " + JSON.stringify(verticalkey01.left));
    //   expect(verticalkey.left).assertEqual(verticalkey01.left);
    //   expect(verticalkey.right).assertEqual(verticalkey01.right);
    //   expect(verticalkey.top).assertEqual(verticalkey01.top);
    //   expect(verticalkey.bottom).assertEqual(verticalkey01.bottom);
    //   // Page turning.
    //   let driver = Driver.create();
    //   await CommonFunc.sleep(500);
    //   await driver.swipe(UIContext.getFocusedUIContext()!.vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //   //  await driver.swipe(230, 250, 230, 200);
    //   await CommonFunc.sleep(1000);
    //   verticalkey01: RectValue = CommonFunc.getComponentRect('verticalkey01');
    //   verticalkey02: RectValue = CommonFunc.getComponentRect('verticalkey02');
    //   // After flipping the page.
    //   console.info("After page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //   console.info("After page turning , the verticalkey02.left value is " + JSON.stringify(verticalkey02.left));
    //   expect(verticalkey.left).assertEqual(verticalkey02.left);
    //   expect(verticalkey.right).assertEqual(verticalkey02.right);
    //   expect(verticalkey.top).assertEqual(verticalkey02.top);
    //   expect(verticalkey.bottom).assertEqual(verticalkey02.bottom);
    //   console.info("The type value is " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
    //   console.info("The index value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')));
    //   console.info("The autoPlay value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')));
    //   console.info("The vertical value is " + JSON.stringify(JSON.parse(strJson).$attrs.vertical));
    //   console.info("The loop value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
    //   console.info("The itemSpace value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
    //   console.info("The displayCount value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
    //   expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')).assertEqual('0');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')).assertEqual('false');
    //   expect(JSON.parse(strJson).$attrs.vertical).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new testSwipeSetVerticalTrue END');
    //   done();
    // });
  })
}