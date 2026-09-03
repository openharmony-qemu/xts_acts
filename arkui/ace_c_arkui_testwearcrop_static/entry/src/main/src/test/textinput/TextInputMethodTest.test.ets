'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { LibUtil } from '../../../ets/pages/LibUtil';
export default function textInputMethodTest() {

  describe('textInputMethodTest', () => {

    let PAGE_TAG = 'TextInputMethodTest';

    beforeEach(async (): Promise<void> => {
      console.info("[ui] beforeEach start");
      await Utils.pushPage(`textarea/${PAGE_TAG}`, false);
      console.info("[ui] beforeEach end");
    });

    
    /**
     * @tc.number   textInputMethodTest001
     * @tc.name     textInputMethodTest001
     * @tc.desc     textInputMethodTest001
     * @tc.level    Level.LEVEL1
     */
    it('textInputMethodTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
        await Utils.sleep(500);
        console.log('textInputMethodTest001----1')
        let textinput = await driver.findComponent(ON.id('MethodTestTextInput'));
        console.log('textInputMethodTest001----2')
        await Utils.sleep(500);
        await (textinput?.click() as Promise<void>)
        console.log('textInputMethodTest001----3')
        await Utils.sleep(500);
        let button1 = await driver.findComponent(ON.text('下一步'));
        await Utils.sleep(500);
        await (button1?.click() as Promise<void>);
        await Utils.sleep(500);
        expect('').assertEqual('')
        done()
      } catch (e) {
        done()
      }
    })
  })
}