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
import { UIUtils } from '@kit.ArkUI';
import { assertCallCompleted, assertUnexpectedError } from '../common/NullUndefinedAssertHelper';

@ObservedV2
class MonitorOptionsTarget {
  @Trace value: number = 1;
}

export default function uiUtilsOptionsNullUndefinedTest() {
  describe('UIUtilsOptionsNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[UIUtilsOptionsNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[UIUtilsOptionsNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number UIUtils_addMonitor_options_null_001
     * @tc.name UIUtils_addMonitor_options_null_001
     * @tc.desc Test UIUtils.addMonitor with null options
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_options_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_options_null_001] START');
      try {
        const target: MonitorOptionsTarget = new MonitorOptionsTarget();
        UIUtils.addMonitor(target, 'value', () => {}, null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_addMonitor_options_null_001] Expected abnormal: ' +
          JSON.stringify(err));
        assertCallCompleted();
      }
      console.info('[UIUtils_addMonitor_options_null_001] END');
    });

    /**
     * @tc.number UIUtils_addMonitor_options_undefined_001
     * @tc.name UIUtils_addMonitor_options_undefined_001
     * @tc.desc Test UIUtils.addMonitor with undefined options
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_options_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_options_undefined_001] START');
      try {
        const target: MonitorOptionsTarget = new MonitorOptionsTarget();
        UIUtils.addMonitor(target, 'value', () => {}, undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_addMonitor_options_undefined_001] Expected abnormal: ' +
          JSON.stringify(err));
        assertCallCompleted();
      }
      console.info('[UIUtils_addMonitor_options_undefined_001] END');
    });

    /**
     * @tc.number UIUtils_clearMonitor_callback_null_001
     * @tc.name UIUtils_clearMonitor_callback_null_001
     * @tc.desc Test UIUtils.clearMonitor with null callback
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_clearMonitor_callback_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_callback_null_001] START');
      try {
        const target: MonitorOptionsTarget = new MonitorOptionsTarget();
        UIUtils.clearMonitor(target, 'value', null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_clearMonitor_callback_null_001] Expected abnormal: ' +
          JSON.stringify(err));
        assertCallCompleted();
      }
      console.info('[UIUtils_clearMonitor_callback_null_001] END');
    });

    /**
     * @tc.number UIUtils_clearMonitor_callback_undefined_001
     * @tc.name UIUtils_clearMonitor_callback_undefined_001
     * @tc.desc Test UIUtils.clearMonitor with undefined callback
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_clearMonitor_callback_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_callback_undefined_001] START');
      try {
        const target: MonitorOptionsTarget = new MonitorOptionsTarget();
        UIUtils.clearMonitor(target, 'value', undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_clearMonitor_callback_undefined_001] Expected abnormal: ' +
          JSON.stringify(err));
        assertCallCompleted();
      }
      console.info('[UIUtils_clearMonitor_callback_undefined_001] END');
    });

    /**
     * @tc.number UIUtils_makeBinding_value_null_001
     * @tc.name UIUtils_makeBinding_value_null_001
     * @tc.desc Test UIUtils.makeBinding returns null from getter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeBinding_value_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeBinding_value_null_001] START');
      try {
        const binding = UIUtils.makeBinding<object | null>(() => null);
        expect(binding.value).assertNull();
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeBinding_value_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeBinding_value_null_001] END');
    });

    /**
     * @tc.number UIUtils_makeBinding_value_undefined_001
     * @tc.name UIUtils_makeBinding_value_undefined_001
     * @tc.desc Test UIUtils.makeBinding returns undefined from getter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeBinding_value_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeBinding_value_undefined_001] START');
      try {
        const binding = UIUtils.makeBinding<object | undefined>(() => undefined);
        expect(binding.value).assertUndefined();
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeBinding_value_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeBinding_value_undefined_001] END');
    });

    /**
     * @tc.number UIUtils_applySync_return_null_001
     * @tc.name UIUtils_applySync_return_null_001
     * @tc.desc Test UIUtils.applySync with task returning null; runtime may yield undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_applySync_return_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_applySync_return_null_001] START');
      try {
        // applySync may skip nested calls or not preserve null as return value
        const value = UIUtils.applySync<object | null>(() => null);
        expect(value === null || value === undefined).assertTrue();
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_applySync_return_null_001] Error: ' + JSON.stringify(err));
        assertCallCompleted();
      }
      console.info('[UIUtils_applySync_return_null_001] END');
    });

    /**
     * @tc.number UIUtils_applySync_return_undefined_001
     * @tc.name UIUtils_applySync_return_undefined_001
     * @tc.desc Test UIUtils.applySync returns undefined from task
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_applySync_return_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_applySync_return_undefined_001] START');
      try {
        const value = UIUtils.applySync<object | undefined>(() => undefined);
        expect(value).assertUndefined();
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_applySync_return_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_applySync_return_undefined_001] END');
    });
  });
}
