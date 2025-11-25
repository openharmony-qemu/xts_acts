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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function barMarginScroll() {
  describe('barMarginScroll', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("barMarginScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/barMarginScroll",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get barMarginScroll state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/Scroll/barMarginScroll" == pages.name)) {
          console.info("get barMarginScroll pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push barMarginScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barMarginScroll page error:" + err);
      }
      console.info("barMarginScroll beforeEach end");
    });
    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });
    
    /*
     * @tc.number   barMarginScroll_static_0100
     * @tc.name     barMarginScroll_static_0100
     * @tc.desc     barMarginScroll_static_0100
     * @tc.level    Level.LEVEL0
     */
it('barMarginScroll_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barMarginScroll_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('scroll_bar_margin');
      console.info("[barMarginScroll_static_0100] $type: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$type')));
      console.info("[barMarginScroll_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[barMarginScroll_static_0100] scrollBarMargin: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBarMargin')));
      console.info("[barMarginScroll_static_0100] start: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('scrollBarMargin')
        .getElement('start')));
      console.info("[barMarginScroll_static_0100] end: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('scrollBarMargin')
        .getElement('end')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Scroll");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarMargin'))
        .assertEqual("ScrollBarMargin start: 40.00px, end: 20.00vp");
      console.info('[barMarginScroll_static_0100] END');
      done();
    });
  })
}
