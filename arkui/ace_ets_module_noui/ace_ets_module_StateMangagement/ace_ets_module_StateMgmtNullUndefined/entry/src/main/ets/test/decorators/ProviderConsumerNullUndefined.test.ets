/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import { pushPage, assertTitleVisible } from '../common/PagePushHelper';

export default function providerConsumerNullUndefinedTest() {
  describe('ProviderConsumerNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[ProviderConsumerNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[ProviderConsumerNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number Provider_Consumer_Monitor_null_undefined_001
     * @tc.name Provider_Consumer_Monitor_null_undefined_001
     * @tc.desc Cover @Provider/@Consumer/@Monitor with null/undefined args
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Provider_Consumer_Monitor_null_undefined_001', Level.LEVEL2, async () => {
      console.info('[Provider_Consumer_Monitor_null_undefined_001] START');
      try {
        await pushPage('MainAbility/pages/decorators/DecoratorNullArgsCover',
          'DecoratorNullArgsCover');
        await assertTitleVisible('deco_null_args_title');
        const driver: Driver = await Driver.create();
        const text: string =
          await (await driver.findComponent(ON.id('deco_null_args_provider'))).getText();
        expect(text.indexOf('ageUndef:') >= 0).assertTrue();
        expect(text.indexOf('ageNull:') >= 0).assertTrue();
      } catch (err) {
        console.error('[Provider_Consumer_Monitor_null_undefined_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[Provider_Consumer_Monitor_null_undefined_001] END');
    });
  });
}
