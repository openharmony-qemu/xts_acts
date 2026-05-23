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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { ExpandMode, ChildrenCountMode } from '@kit.ArkUI';
export default function FrameNodeProvideChildTest() {
  describe('FrameNodeProvideChildTest', () => {
    
    beforeEach(async (done: Function) => {
      console.info('FrameNodeProvideChildTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/FrameNodeProvideChild',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get FrameNodeProvideChild state pages:' + JSON.stringify(pages));
        if (!('FrameNodeProvideChild' == pages.name)) {
          console.info('get FrameNodeProvideChild pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(1000);
          console.info('push FrameNodeProvideChild page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FrameNodeProvideChild page error:' + err);
      }
      console.info('FrameNodeProvideChild beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeProvideChild after each called');
    });

    /**
     * @tc.name   FrameNodeProvideChildTest_0100
     * @tc.number SUB_ArkUI_Ace_FrameNodeProvideChildTest_0100
     * @tc.desc   add ArkUI api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeProvideChildTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeProvideChildTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('getUndefined'));
 	    await button.click();
 	    await CommonFunc.sleep(2000);

 	    let button1 = await driver.findComponent(ON.id('getNull'));
 	    await button1.click();
 	    await CommonFunc.sleep(2000);
     
      let button2 = await driver.findComponent(ON.id('getChildCountDefault'));
 	    await button2.click();
 	    await CommonFunc.sleep(2000);

      let button3 = await driver.findComponent(ON.id('getChildCount(ALL_EXPAND)'));
 	    await button3.click();
 	    await CommonFunc.sleep(2000);

      let button4 = await driver.findComponent(ON.id('getChildCount(ONLY_EXPANDED)'));
 	    await button4.click();
 	    await CommonFunc.sleep(2000);

      let button5 = await driver.findComponent(ON.id('getChildCount(ALL_NOT_EXPAND)'));
 	    await button5.click();
 	    await CommonFunc.sleep(2000);

      let button6 = await driver.findComponent(ON.id('getChildWithLazyExpand'));
 	    await button6.click();
 	    await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('FrameNodeProvideChildText');

      let button7 = await driver.findComponent(ON.id('getChildWithLazyNotExpand'));
 	    await button7.click();
 	    await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('FrameNodeProvideChildText');
      
      expect(ExpandMode.LAZY_EXPAND).assertEqual(2);
      expect(ExpandMode.LAZY_NOT_EXPAND).assertEqual(3);

      expect(ChildrenCountMode.ALL_EXPAND).assertEqual(0);
      expect(ChildrenCountMode.ONLY_EXPANDED).assertEqual(1);
      expect(ChildrenCountMode.ALL_NOT_EXPAND).assertEqual(2);

      console.info('[FrameNodeProvideChildTest_0100] END');
      done();
    });
  })
}