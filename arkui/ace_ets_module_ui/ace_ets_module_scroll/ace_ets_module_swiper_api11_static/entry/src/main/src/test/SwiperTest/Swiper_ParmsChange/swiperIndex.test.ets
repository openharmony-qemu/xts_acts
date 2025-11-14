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

export default function swiperIndex() {
  describe('swiperIndexTest', () => {
    beforeAll(() => {
      console.info("swiperIndex beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperIndex',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperIndex state success " + JSON.stringify(pages));
        if (!("swiperIndex" == pages.name)) {
          console.info("get swiperIndex state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperIndex page success ");
        }
      } catch (err) {
        console.error("push swiperIndex page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const globalMessage =
        AppStorage.get<GlobalMessage<number>>('SwiperIndexTest');
      globalMessage?.message.notify({
        name: 'swiperIndex', value: 0
      });
      console.info("swiperIndex after each called");
    });

    //保持1.1中的注释
    // /**
    //  * @tc.number   SUB_ACE_SWIPER_INDEXCHANGED_static_0100
    //  * @tc.name     SUB_ACE_SWIPER_INDEXCHANGED_static_0100
    //  * @tc.desc     SUB_ACE_SWIPER_INDEXCHANGED_static_0100
    //  * @tc.level    0
    //  */
    // it('SUB_ACE_SWIPER_INDEXCHANGED_static_0100', Level.LEVEL0, async (done: Function) => {
    //   console.info('new SUB_ACE_SWIPER_INDEXCHANGED_static_0100 START');
    //   globalThis.value.message.notify({ name: 'swiperIndex', value: 3 });
    //   await CommonFunc.sleep(1000);
    //   let strJson = inspector.getInspectorByKey('swiperkey');
    //
    //   let swiperkey: RectValue = CommonFunc.getComponentRect('swiperkey');
    //   let ckey04: RectValue = CommonFunc.getComponentRect('ckey04');
    //   let ckey05: RectValue = CommonFunc.getComponentRect('ckey05');
    //   // Before flipping the page.
    //   expect(swiperkey.left).assertEqual(ckey04.left);
    //   expect(swiperkey.right).assertEqual(ckey04.right);
    //   expect(swiperkey.top).assertEqual(ckey04.top);
    //   expect(swiperkey.bottom).assertEqual(ckey04.bottom);
    //   // Page turning.
    //   let driver = Driver.create();
    //   await CommonFunc.sleep(500);
    //   await driver.swipe(UIContext.getFocusedUIContext()!.vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //   //  await driver.swipe(250, 230, 200, 230);
    //   await CommonFunc.sleep(1000);
    //   ckey04: RectValue = CommonFunc.getComponentRect('ckey04');
    //   ckey05: RectValue = CommonFunc.getComponentRect('ckey05');
    //   // After flipping the page.
    //   expect(swiperkey.left).assertEqual(ckey05.left);
    //   expect(swiperkey.right).assertEqual(ckey05.right);
    //   expect(swiperkey.top).assertEqual(ckey05.top);
    //   expect(swiperkey.bottom).assertEqual(ckey05.bottom);
    //   console.info("The type value is " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
    //   console.info("The index value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')));
    //   console.info("The autoPlay value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')));
    //   console.info("The loop value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
    //   console.info("The itemSpace value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
    //   console.info("The displayCount value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
    //   expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')).assertEqual('3');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')).assertEqual('false');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new SUB_ACE_SWIPER_INDEXCHANGED_static_0100 END');
    //   done();
    // });
    //
    //
    // /**
    //  * @tc.number   SUB_ACE_SWIPER_INDEXCHANGED_static_0200
    //  * @tc.name     SUB_ACE_SWIPER_INDEXCHANGED_static_0200
    //  * @tc.desc     SUB_ACE_SWIPER_INDEXCHANGED_static_0200
    //  * @tc.level    0
    //  */
    // it('SUB_ACE_SWIPER_INDEXCHANGED_static_0200', Level.LEVEL0, async (done: Function) => {
    //   console.info('new SUB_ACE_SWIPER_INDEXCHANGED_static_0200 START');
    //   globalThis.value.message.notify({ name: 'swiperIndex', value: -1 });
    //   await CommonFunc.sleep(1000);
    //   let strJson = inspector.getInspectorByKey('swiperkey');
    //
    //   let swiperkey: RectValue = CommonFunc.getComponentRect('swiperkey');
    //   let ckey01: RectValue = CommonFunc.getComponentRect('ckey01');
    //   let ckey02: RectValue = CommonFunc.getComponentRect('ckey02');
    //   // Before flipping the page.
    //   console.info("Before page turning , the swiperkey.left value is " + JSON.stringify(swiperkey.left));
    //   console.info("Before page turning , the ckey01.left value is " + JSON.stringify(ckey01.left));
    //   expect(swiperkey.left).assertEqual(ckey01.left)
    //   expect(swiperkey.right).assertEqual(ckey01.right)
    //   expect(swiperkey.top).assertEqual(ckey01.top)
    //   expect(swiperkey.bottom).assertEqual(ckey01.bottom)
    //   // Page turning.
    //   let driver = Driver.create();
    //   await driver.swipe(250, 230, 200, 230);
    //   await CommonFunc.sleep(1000);
    //   ckey01: RectValue = CommonFunc.getComponentRect('ckey01');
    //   ckey02: RectValue = CommonFunc.getComponentRect('ckey02');
    //   // After flipping the page.
    //   console.info("After page turning , the swiperkey.left value is " + JSON.stringify(swiperkey.left));
    //   console.info("After page turning , the ckey02.left value is " + JSON.stringify(ckey02.left));
    //   expect(swiperkey.left).assertEqual(ckey02.left);
    //   expect(swiperkey.right).assertEqual(ckey02.right);
    //   expect(swiperkey.top).assertEqual(ckey02.top);
    //   expect(swiperkey.bottom).assertEqual(ckey02.bottom);
    //   console.info("The type value is " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
    //   console.info("The index value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')));
    //   console.info("The autoPlay value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')));
    //   console.info("The loop value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
    //   console.info("The itemSpace value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
    //   console.info("The displayCount value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
    //   expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')).assertEqual('0');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')).assertEqual('false');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new SUB_ACE_SWIPER_INDEXCHANGED_static_0200 END');
    //   done();
    // });
    //
    //
    // /**
    //  * @tc.number   SUB_ACE_SWIPER_INDEXCHANGED_static_0300
    //  * @tc.name     SUB_ACE_SWIPER_INDEXCHANGED_static_0300
    //  * @tc.desc     SUB_ACE_SWIPER_INDEXCHANGED_static_0300
    //  * @tc.level    0
    //  */
    // it('SUB_ACE_SWIPER_INDEXCHANGED_static_0300', Level.LEVEL0, async (done: Function) => {
    //   console.info('new SUB_ACE_SWIPER_INDEXCHANGED_static_0300 START');
    //   globalThis.value.message.notify({ name: 'swiperIndex', value: 11 });
    //   await CommonFunc.sleep(1000);
    //   let strJson = inspector.getInspectorByKey('swiperkey');
    //
    //   let swiperkey: RectValue = CommonFunc.getComponentRect('swiperkey');
    //   let ckey01: RectValue = CommonFunc.getComponentRect('ckey01');
    //   let ckey02: RectValue = CommonFunc.getComponentRect('ckey02');
    //   // Before flipping the page.
    //   console.info("Before page turning , the swiperkey.left value is " + JSON.stringify(swiperkey.left));
    //   console.info("Before page turning , the ckey01.left value is " + JSON.stringify(ckey01.left));
    //   expect(swiperkey.left).assertEqual(ckey01.left);
    //   expect(swiperkey.right).assertEqual(ckey01.right);
    //   expect(swiperkey.top).assertEqual(ckey01.top);
    //   expect(swiperkey.bottom).assertEqual(ckey01.bottom);
    //   // Page turning.
    //   let driver = Driver.create();
    //   await driver.swipe(250, 230, 200, 230);
    //   await driver.swipe(250, 230, 200, 230);
    //   await CommonFunc.sleep(1000);
    //   ckey01: RectValue = CommonFunc.getComponentRect('ckey01');
    //   ckey02: RectValue = CommonFunc.getComponentRect('ckey02');
    //   // After flipping the page.
    //   console.info("After page turning , the swiperkey.left value is " + JSON.stringify(swiperkey.left));
    //   console.info("After page turning , the ckey02.left value is " + JSON.stringify(ckey02.left));
    //   expect(swiperkey.left).assertEqual(ckey02.left);
    //   expect(swiperkey.right).assertEqual(ckey02.right);
    //   expect(swiperkey.top).assertEqual(ckey02.top);
    //   expect(swiperkey.bottom).assertEqual(ckey02.bottom);
    //   expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
    //   console.info("The type value is " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
    //   console.info("The index value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')));
    //   console.info("The autoPlay value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')));
    //   console.info("The loop value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
    //   console.info("The itemSpace value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
    //   console.info("The displayCount value is " +
    //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')).assertEqual('11');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')).assertEqual('false');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new SUB_ACE_SWIPER_INDEXCHANGED_static_0300 END');
    //   done();
    // });
  })
}