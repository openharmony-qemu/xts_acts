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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


interface TextBackgroundStyle {
  color: string;
}

interface ComponentAttrs {
  textBackgroundStyle: TextBackgroundStyle;
}

export default function APITextBackgroundStyleJsunit() {
  describe('APITextBackgroundStyleJsunit', (): void => {
    beforeAll(() => {
      console.info("APITextBackgroundStyleJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    it('APITextBackgroundStyleJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('APITextBackgroundStyleJsunit_0100 START');
      const strJson = inspector.getInspectorByKey('APITextBackgroundStyleSpan');
      const obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('APITextBackgroundStyleJsunit_0100 component obj is: ' + JSON.stringify(obj));
      console.info('APITextBackgroundStyleJsunit_0100 component obj.$attrs is: ' + obj.getElement('$attrs'));
      console.info('APITextBackgroundStyleJsunit_0100 component obj.$attrs.textBackgroundStyle is: ' +
      obj.getElement('$attrs').getElement('textBackgroundStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textBackgroundStyle').getString('color')).assertEqual('#FF209B08');
      console.info('APITextBackgroundStyleJsunit_0100 END')
      done();
    });
  })
}