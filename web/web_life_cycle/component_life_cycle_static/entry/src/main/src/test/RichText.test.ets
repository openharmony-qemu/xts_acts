'use static';
/*
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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it } from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

export default function richTextTest(): void {

  describe('RichTextTest', () => {

    beforeAll(async (): Promise<void> => {
      console.log('App start');
      await Utils.msSleep(2000);
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context;
          console.log('onAbilityCreate end');
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          console.log('-----' + err.code);
        }
        console.log('BusinessError end');
      });
      await Utils.msSleep(2000);
      let cmd = 'aa start -a EntryAbility -b com.weblifecycleone.test.static';
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(2000);
      console.log('beforeAll end, Succeed!');
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('RichTextTest beforeEach start');
    });

    /**
     * @tc.name   testRichTextStatic001
     * @tc.number SUB_WEB_RICHTEXT_STATIC_0100
     * @tc.desc   test RichText component static call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRichTextStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPageRichText', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.msSleep(3000);
        Utils.emitEvent('emitRichTextStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRichTextStatic001', 'test content', 202603187, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('RichTextTestButton', 10, '');
        await Utils.msSleep(5000);
      })

    /**
     * @tc.name   testRichTextMethodReturnStatic001
     * @tc.number SUB_WEB_RICHTEXT_METHOD_RETURN_0100
     * @tc.desc   test RichText method export and return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRichTextMethodReturnStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPageRichText', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.msSleep(3000);
        Utils.emitEvent('emitRichTextMethodReturn001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRichTextMethodReturnStatic001', true, 202603188, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('RichTextTestButton', 10, '');
        await Utils.msSleep(5000);
      })

    /**
     * @tc.name   testRichTextEmptyStatic001
     * @tc.number SUB_WEB_RICHTEXT_EMPTY_PARAM_0100
     * @tc.desc   test RichText with empty string param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRichTextEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPageRichText', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.msSleep(3000);
        Utils.emitEvent('emitRichTextEmptyStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRichTextEmptyStatic001', true, 202603191, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('RichTextTestButton', 10, '');
        await Utils.msSleep(5000);
      })

    /**
     * @tc.name   testRichTextHtmlParamStatic001
     * @tc.number SUB_WEB_RICHTEXT_HTML_PARAM_0100
     * @tc.desc   test RichText with html content param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRichTextHtmlParamStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPageRichText', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.msSleep(3000);
        Utils.emitEvent('emitRichTextHtmlParamStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRichTextHtmlParamStatic001', true, 202603192, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('RichTextTestButton', 10, '');
        await Utils.msSleep(5000);
      })

    /**
     * @tc.name   testRichTextCallStatic001
     * @tc.number SUB_WEB_RICHTEXT_CALL_0100
     * @tc.desc   test RichText method call with normal param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRichTextCallStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPageRichText', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.msSleep(3000);
        Utils.emitEvent('emitRichTextCallStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRichTextCallStatic001', true, 202603193, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('RichTextTestButton', 10, '');
        await Utils.msSleep(5000);
      })

    /**
     * @tc.name   testRichTextClassStatic001
     * @tc.number SUB_WEB_RICHTEXT_CLASS_0100
     * @tc.desc   test RichText class export accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRichTextClassStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPageRichText', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.msSleep(3000);
        Utils.emitEvent('emitRichTextClass001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRichTextClassStatic001', true, 202603189, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('RichTextTestButton', 10, '');
        await Utils.msSleep(5000);
      })
  })
}
