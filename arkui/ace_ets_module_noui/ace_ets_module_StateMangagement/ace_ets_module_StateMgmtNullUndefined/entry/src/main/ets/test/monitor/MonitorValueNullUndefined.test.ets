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
import { pushPage, assertTitleVisible, sleepMs } from '../common/PagePushHelper';

export default function monitorValueNullUndefinedTest() {
  describe('MonitorValueNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[MonitorValueNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[MonitorValueNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number MonitorDecorator_IMonitor_value_null_undefined_001
     * @tc.name MonitorDecorator_IMonitor_value_null_undefined_001
     * @tc.desc Cover @Monitor and IMonitor.value(null/undefined)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('MonitorDecorator_IMonitor_value_null_undefined_001', Level.LEVEL2, async () => {
      console.info('[MonitorDecorator_IMonitor_value_null_undefined_001] START');
      try {
        await pushPage('MainAbility/pages/monitor/MonitorValueCover', 'MonitorValueCover');
        await assertTitleVisible('monitor_value_cover_title');
        const driver: Driver = await Driver.create();
        const btn = await driver.findComponent(ON.id('monitor_value_cover_btn'));
        await btn.click();
        await sleepMs(500);
        const nullText: string =
          await (await driver.findComponent(ON.id('monitor_value_cover_null'))).getText();
        const undefText: string =
          await (await driver.findComponent(ON.id('monitor_value_cover_undef'))).getText();
        expect(nullText.indexOf('name') >= 0).assertTrue();
        expect(undefText.indexOf('name') >= 0).assertTrue();
      } catch (err) {
        console.error('[MonitorDecorator_IMonitor_value_null_undefined_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[MonitorDecorator_IMonitor_value_null_undefined_001] END');
    });
  });
}
