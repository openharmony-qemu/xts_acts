'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();

let testAbilityContext: common.UIAbilityContext;

export default function WebViewTextSelectionTest():void {

  describe('WebViewTextSelectionTestSuite', (): void => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log('App start')
    });

    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name       testOnTextSelectionChangeBasicStatic
     * @tc.number      SUB_ACE_WEB_TEXT_SELECT_0100
     * @tc.desc       onTextSelectionChange TextSelectionChangeCallback basic test.
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testOnTextSelectionChangeBasicStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
          let driver = Driver.create()
          Utils.emitEvent('emitOnTextSelectionChangeBasic', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnTextSelectionChangeBasicStatic', '这是一段用于自动化测试的可选中文本', 202601301, done);
          await Utils.msSleep(2000);
          let button = await driver.findComponent(ON.id('WebViewTextSelectionButton'));
          await Utils.msSleep(2000);
          button?.click();
          await Utils.msSleep(1000);
          button?.click();
          await Utils.msSleep(1000);
          button?.click();
          await Utils.msSleep(8000);
        } catch(err) {
         console.log('testOnTextSelectionChangeBasicStatic' + err);
        }
        done();
      })

    /**
     * @tc.name       testOnTextSelectionChangeClearStatic
     * @tc.number     SUB_ACE_WEB_TEXT_SELECT_0200
     * @tc.desc       onTextSelectionChange TextSelectionChangeCallback clear selection test.
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testOnTextSelectionChangeClearStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let driver = Driver.create()
          Utils.emitEvent('emitOnTextSelectionChangeClear', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnTextSelectionChangeClearStatic', 'empty', 202601302, done);
          await Utils.msSleep(2000);
          let button = await driver.findComponent(ON.id('WebViewTextSelectionButton'));
          await Utils.msSleep(2000);
          button?.click();
          await Utils.msSleep(1000);
          button?.click();
          await Utils.msSleep(1000);
          button?.click();
          await Utils.msSleep(10000);
        } catch(err) {
          console.log('testOnTextSelectionChangeClearStatic' + err);
        }
        done();
      })

    /**
     * @tc.name       testOnTextSelectionChangePartialStatic
     * @tc.number     SUB_ACE_WEB_TEXT_SELECT_0300
     * @tc.desc       onTextSelectionChange TextSelectionChangeCallback partial selection test.
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testOnTextSelectionChangePartialStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let driver = Driver.create()
          Utils.emitEvent('emitOnTextSelectionChangePartial', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnTextSelectionChangePartialStatic', '这是一段用于', 202601301, done);
          await Utils.msSleep(2000);
          let button = await driver.findComponent(ON.id('WebViewTextSelectionButton'));
          await Utils.msSleep(2000);
          button?.click();
          await Utils.msSleep(1000);
          button?.click();
          await Utils.msSleep(1000);
          button?.click();
          await Utils.msSleep(8000);
        } catch(err) {
          console.log('testOnTextSelectionChangePartialStatic' + err);
        }
        done();
      })
  })
}