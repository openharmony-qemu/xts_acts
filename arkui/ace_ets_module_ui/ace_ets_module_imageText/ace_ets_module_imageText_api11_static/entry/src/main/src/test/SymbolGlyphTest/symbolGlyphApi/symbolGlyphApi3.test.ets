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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
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
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';

export default function symbolGlyphApi3() {
  describe('symbolGlyphApi3', () => {
    beforeAll(() => {
      console.info("symbolGlyphApi3 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("symbolGlyphApi3 beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/symbolGlyphApi3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get symbolGlyphApi3 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get symbolGlyphApi3 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push symbolGlyphApi3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolGlyphApi3 page error:" + err);
      }
      console.info("symbolGlyphApi3 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("symbolGlyphApi3 after each called");
    });

    /**
     * @tc.number SUB_ACE_RICHEDITOR_symbolGlyphApi3_static_0100
     * @tc.name symbolGlyphApi3_static_0100
     * @tc.desc set api
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('symbolGlyphApi3_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolGlyphApi3_static_0100] START');
      await CommonFunc.sleep(2000);

      // let driver = Driver.create();
      // await CommonFunc.sleep(300);

      let symbolGlyphApi3 = inspector.getInspectorByKey('symbolGlyphApi3');
      let Obj1 = JSON.parseJsonElement(symbolGlyphApi3);
      expect(Obj1.getElement('$attrs').getString('renderingStrategy'))
        .assertEqual('SymbolRenderingStrategy.MULTIPLE_OPACITY');
      console.info('[testRichEditor_0100] END');
      done();
    });
  })
}