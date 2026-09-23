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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
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

export default function scrollBarState() {
  describe('scrollBarState', () => {
    beforeAll(() => {
      console.info("scrollBarState beforeAll start")
    })

    beforeEach(async (done: Function) => {
      console.info("scrollBarState beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/scrollBarState",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollBarState state pages: " + JSON.stringify(pages));
        if (!("scrollBarState" == pages.name)) {
          console.info("get scrollBarState state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollBarState success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBarState page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   scrollBarState_0100
     * @tc.number SUB_ACE_BindSheet_scrollBarState_0100
     * @tc.desc   set scrollBarState: BarState.Off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarState_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('scrollBarState_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_scrollBarState_Off'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[scrollBarState_0100] obj2 is: " + JSON.stringify(obj2));

      let scrollAttrs: ESObject = obj2.$children[1].$children[0].$children[2].$attrs;
      console.info("[scrollBarState_0100] scrollAttrs is: " + JSON.stringify(scrollAttrs));
      let scrollBarAttr: string = scrollAttrs?.scrollBar;
      console.info("[scrollBarState_0100] scrollBar is: " + JSON.stringify(scrollBarAttr));
      expect(scrollBarAttr).assertEqual('BarState.Off');

      let btn2: Component = await driver.findComponent(ON.id('close_scrollBarState'));
      await btn2.click();
      console.info('scrollBarState_0100 END');
      done();
    });

    /**
     * @tc.name   scrollBarState_0200
     * @tc.number SUB_ACE_BindSheet_scrollBarState_0200
     * @tc.desc   set scrollBarState: BarState.On
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarState_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('scrollBarState_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_scrollBarState_On'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[scrollBarState_0200] obj2 is: " + JSON.stringify(obj2));

      let scrollAttrs: ESObject = obj2.$children[1].$children[0].$children[2].$attrs;
      console.info("[scrollBarState_0200] scrollAttrs is: " + JSON.stringify(scrollAttrs));
      let scrollBarAttr: string = scrollAttrs?.scrollBar;
      console.info("[scrollBarState_0200] scrollBar is: " + JSON.stringify(scrollBarAttr));
      expect(scrollBarAttr).assertEqual('BarState.On');

      let btn2: Component = await driver.findComponent(ON.id('close_scrollBarState'));
      await btn2.click();
      console.info('scrollBarState_0200 END');
      done();
    });

    /**
     * @tc.name   scrollBarState_0300
     * @tc.number SUB_ACE_BindSheet_scrollBarState_0300
     * @tc.desc   set scrollBarState: BarState.Auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarState_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('scrollBarState_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_scrollBarState_Auto'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[scrollBarState_0300] obj2 is: " + JSON.stringify(obj2));

      let scrollAttrs: ESObject = obj2.$children[1].$children[0].$children[2].$attrs;
      console.info("[scrollBarState_0300] scrollAttrs is: " + JSON.stringify(scrollAttrs));
      let scrollBarAttr: string = scrollAttrs?.scrollBar;
      console.info("[scrollBarState_0300] scrollBar is: " + JSON.stringify(scrollBarAttr));
      expect(scrollBarAttr).assertEqual('BarState.Auto');

      let btn2: Component = await driver.findComponent(ON.id('close_scrollBarState'));
      await btn2.click();
      console.info('scrollBarState_0300 END');
      done();
    });

    /**
     * @tc.name   scrollBarState_0400
     * @tc.number SUB_ACE_BindSheet_scrollBarState_0400
     * @tc.desc   set scrollBarState: undefined (default BarState.Off)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarState_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('scrollBarState_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_scrollBarState_undefined'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[scrollBarState_0400] obj2 is: " + JSON.stringify(obj2));

      let scrollAttrs: ESObject = obj2.$children[1].$children[0].$children[2].$attrs;
      console.info("[scrollBarState_0400] scrollAttrs is: " + JSON.stringify(scrollAttrs));
      let scrollBarAttr: string = scrollAttrs?.scrollBar;
      console.info("[scrollBarState_0400] scrollBar is: " + JSON.stringify(scrollBarAttr));
      expect(scrollBarAttr).assertEqual('BarState.Off');

      let btn2: Component = await driver.findComponent(ON.id('close_scrollBarState'));
      await btn2.click();
      console.info('scrollBarState_0400 END');
      done();
    });
  })
}
