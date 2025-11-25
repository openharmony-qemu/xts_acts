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
import { Message, GlobalMessage } from '../../../../ets/MainAbility/common/MessageManager';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperLoopTrue() {
  describe('swiperLoopTest', () => {
    beforeAll(() => {
      console.info("swiperLoopTrue beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperLoopTrue',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperLoopTrue state success " + JSON.stringify(pages));
        if (!("swiperLoopTrue" == pages.name)) {
          console.info("get swiperLoopTrue state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperLoopTrue page success ");
        }
      } catch (err) {
        console.error("push swiperLoopTrue page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperLoopTrueTest');
      globalMessage?.message.notify({
        name: 'swiperLoop', value: true
      });
      globalMessage?.message.notify({
        name: 'index', value: 0
      });
      console.info("swiperVertical after each called");
    });


    //保持1.1中注释
    // /**
    //  * @tc.number   testSwiperSetLoopTrue_static
    //  * @tc.name     testSwiperSetLoopTrue_static
    //  * @tc.desc     testSwiperSetLoopTrue_static
    //  * @tc.level    0
    //  */
    // it('testSwiperSetLoopTrue_static', Level.LEVEL0, async (done: Function) => {
    //   console.info('new testSwiperSetLoopTrue_static START');
    //   await CommonFunc.sleep(1000);
    //   // Page turning.
    //   let driver = Driver.create();
    //   await CommonFunc.sleep(500);
    //   await driver.swipe(UIContext.getFocusedUIContext()!.vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //   //  await driver.swipe(250, 230, 200, 230);
    //   await CommonFunc.sleep(1000);
    //   let loopTrue: RectValue = CommonFunc.getComponentRect('loopTrue');
    //   let strJson = inspector.getInspectorByKey('loopTrue');
    //
    //   let loopTrue01: RectValue = CommonFunc.getComponentRect('loopTrue01');
    //   let loopTrue02: RectValue = CommonFunc.getComponentRect('loopTrue02');
    //   let loopTrue03: RectValue = CommonFunc.getComponentRect('loopTrue03');
    //   let loopTrue04: RectValue = CommonFunc.getComponentRect('loopTrue04');
    //   let loopTrue05: RectValue = CommonFunc.getComponentRect('loopTrue05');
    //   let loopTrue06: RectValue = CommonFunc.getComponentRect('loopTrue06');
    //   // After flipping the page
    //   console.info("After page turning , the loopTrue.left value is " + JSON.stringify(loopTrue.left));
    //   console.info("After page turning , the loopTrue02.left value is " + JSON.stringify(loopTrue02.left));
    //   expect(loopTrue.left).assertEqual(loopTrue02.left);
    //   expect(loopTrue.right).assertEqual(loopTrue02.right);
    //   expect(loopTrue.top).assertEqual(loopTrue02.top);
    //   expect(loopTrue.bottom).assertEqual(loopTrue02.bottom);
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
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('index')).assertEqual('1');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
    //   console.info('new testSwiperSetLoopTrue_static END');
    //   done();
    // });
  })
}