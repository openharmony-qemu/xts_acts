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

import { describe, beforeEach, afterEach, it, expect, Level,beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
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
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function SXSymbolGlyphSINGLE01Jsunit() {
  describe('SXSymbolGlyphSINGLE01Jsunit', () => {
    beforeAll(() => {
      console.info("SXSymbolGlyphSINGLE01Jsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SpanTextShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/SpanTextShadowTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SpanTextShadowTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SpanTextShadowTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SpanTextShadowTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpanTextShadowTest page error:" + err);
      }
      console.info("SpanTextShadowTest beforeEach end");
    });

    it('SXSymbolGlyphSINGLE01Jsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 START');
      let strcontent = inspector.getInspectorByKey('SXSymbolGlyphSINGLE01Key');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj is: ' + obj);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj.$attrs is: ' + obj.getElement('$attrs'));
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj.$attrs.textBackgroundStyle is: ' +
      obj.getElement('$attrs').getString('renderingStrategy'));
      expect(obj.getElement('$attrs').getString('renderingStrategy')).assertEqual('SymbolRenderingStrategy.SINGLE');
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 END')
      done();
    });
  })
}