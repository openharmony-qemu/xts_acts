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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { assertCallCompleted, assertExpectedError, assertUnexpectedError } from './NullUndefinedAssertHelper';
import { UIUtils } from '@kit.ArkUI';


export default function uiUtilsNullUndefinedTest() {
  describe('UIUtilsNullUndefinedTest', () => {
    beforeAll(() => { console.info('[UIUtilsNullUndefinedTest] beforeAll'); });
    beforeEach(() => { console.info('[UIUtilsNullUndefinedTest] beforeEach'); });
    afterEach(() => { console.info('[UIUtilsNullUndefinedTest] afterEach'); });
    afterAll(() => { console.info('[UIUtilsNullUndefinedTest] afterAll'); });

    /**
     * @tc.number UIUtils_getTarget_source_null_001
     * @tc.name UIUtils_getTarget_source_null_001
     * @tc.desc Test UIUtils.getTarget with null source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_getTarget_source_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getTarget_source_null_001] START');
      try {
        UIUtils.getTarget(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_getTarget_source_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_getTarget_source_null_001] END');
    });
    /**
     * @tc.number UIUtils_getTarget_source_undefined_001
     * @tc.name UIUtils_getTarget_source_undefined_001
     * @tc.desc Test UIUtils.getTarget with undefined source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_getTarget_source_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getTarget_source_undefined_001] START');
      try {
        UIUtils.getTarget(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_getTarget_source_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_getTarget_source_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_makeObserved_source_null_001
     * @tc.name UIUtils_makeObserved_source_null_001
     * @tc.desc Test UIUtils.makeObserved with null source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeObserved_source_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeObserved_source_null_001] START');
      try {
        UIUtils.makeObserved(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeObserved_source_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeObserved_source_null_001] END');
    });
    /**
     * @tc.number UIUtils_makeObserved_source_undefined_001
     * @tc.name UIUtils_makeObserved_source_undefined_001
     * @tc.desc Test UIUtils.makeObserved with undefined source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeObserved_source_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeObserved_source_undefined_001] START');
      try {
        UIUtils.makeObserved(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeObserved_source_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeObserved_source_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_makeV1Observed_source_null_001
     * @tc.name UIUtils_makeV1Observed_source_null_001
     * @tc.desc Test UIUtils.makeV1Observed with null source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeV1Observed_source_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeV1Observed_source_null_001] START');
      try {
        UIUtils.makeV1Observed(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeV1Observed_source_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeV1Observed_source_null_001] END');
    });
    /**
     * @tc.number UIUtils_makeV1Observed_source_undefined_001
     * @tc.name UIUtils_makeV1Observed_source_undefined_001
     * @tc.desc Test UIUtils.makeV1Observed with undefined source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeV1Observed_source_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeV1Observed_source_undefined_001] START');
      try {
        UIUtils.makeV1Observed(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeV1Observed_source_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeV1Observed_source_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_enableV2Compatibility_source_null_001
     * @tc.name UIUtils_enableV2Compatibility_source_null_001
     * @tc.desc Test UIUtils.enableV2Compatibility with null source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_enableV2Compatibility_source_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_enableV2Compatibility_source_null_001] START');
      try {
        UIUtils.enableV2Compatibility(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_enableV2Compatibility_source_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_enableV2Compatibility_source_null_001] END');
    });
    /**
     * @tc.number UIUtils_enableV2Compatibility_source_undefined_001
     * @tc.name UIUtils_enableV2Compatibility_source_undefined_001
     * @tc.desc Test UIUtils.enableV2Compatibility with undefined source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_enableV2Compatibility_source_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_enableV2Compatibility_source_undefined_001] START');
      try {
        UIUtils.enableV2Compatibility(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_enableV2Compatibility_source_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_enableV2Compatibility_source_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_canBeObserved_source_null_001
     * @tc.name UIUtils_canBeObserved_source_null_001
     * @tc.desc Test UIUtils.canBeObserved with null source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_canBeObserved_source_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_canBeObserved_source_null_001] START');
      try {
        UIUtils.canBeObserved(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_canBeObserved_source_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_canBeObserved_source_null_001] END');
    });
    /**
     * @tc.number UIUtils_canBeObserved_source_undefined_001
     * @tc.name UIUtils_canBeObserved_source_undefined_001
     * @tc.desc Test UIUtils.canBeObserved with undefined source
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_canBeObserved_source_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_canBeObserved_source_undefined_001] START');
      try {
        UIUtils.canBeObserved(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_canBeObserved_source_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_canBeObserved_source_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_getLifecycle_null_001
     * @tc.name UIUtils_getLifecycle_null_001
     * @tc.desc Test UIUtils.getLifecycle with null
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_getLifecycle_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getLifecycle_null_001] START');
      try {
        UIUtils.getLifecycle(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_getLifecycle_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_getLifecycle_null_001] END');
    });
    /**
     * @tc.number UIUtils_getLifecycle_undefined_001
     * @tc.name UIUtils_getLifecycle_undefined_001
     * @tc.desc Test UIUtils.getLifecycle with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_getLifecycle_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getLifecycle_undefined_001] START');
      try {
        UIUtils.getLifecycle(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_getLifecycle_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_getLifecycle_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_getCustomComponentContext_null_001
     * @tc.name UIUtils_getCustomComponentContext_null_001
     * @tc.desc Test UIUtils.getCustomComponentContext with null
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_getCustomComponentContext_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getCustomComponentContext_null_001] START');
      try {
        UIUtils.getCustomComponentContext(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_getCustomComponentContext_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_getCustomComponentContext_null_001] END');
    });
    /**
     * @tc.number UIUtils_getCustomComponentContext_undefined_001
     * @tc.name UIUtils_getCustomComponentContext_undefined_001
     * @tc.desc Test UIUtils.getCustomComponentContext with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_getCustomComponentContext_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getCustomComponentContext_undefined_001] START');
      try {
        UIUtils.getCustomComponentContext(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_getCustomComponentContext_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_getCustomComponentContext_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_addMonitor_target_null_001
     * @tc.name UIUtils_addMonitor_target_null_001
     * @tc.desc Test UIUtils.addMonitor with null target
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_target_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_target_null_001] START');
      assertExpectedError(() => {
        UIUtils.addMonitor(null, 'p', (m: object) => {});
      }, 'UIUtils_addMonitor_target_null_001');
      console.info('[UIUtils_addMonitor_target_null_001] END');
    });
    /**
     * @tc.number UIUtils_addMonitor_path_null_001
     * @tc.name UIUtils_addMonitor_path_null_001
     * @tc.desc Test UIUtils.addMonitor with null path
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_path_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_path_null_001] START');
      assertExpectedError(() => {
        class T { public v: number = 1; }
        UIUtils.addMonitor(new T(), null, (m: object) => {});
      }, 'UIUtils_addMonitor_path_null_001');
      console.info('[UIUtils_addMonitor_path_null_001] END');
    });
    /**
     * @tc.number UIUtils_addMonitor_callback_null_001
     * @tc.name UIUtils_addMonitor_callback_null_001
     * @tc.desc Test UIUtils.addMonitor with null callback
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_callback_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_callback_null_001] START');
      assertExpectedError(() => {
        class T { public v: number = 1; }
        UIUtils.addMonitor(new T(), 'v', null);
      }, 'UIUtils_addMonitor_callback_null_001');
      console.info('[UIUtils_addMonitor_callback_null_001] END');
    });
    /**
     * @tc.number UIUtils_clearMonitor_target_null_001
     * @tc.name UIUtils_clearMonitor_target_null_001
     * @tc.desc Test UIUtils.clearMonitor with null target
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_clearMonitor_target_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_target_null_001] START');
      assertExpectedError(() => {
        UIUtils.clearMonitor(null, 'p');
      }, 'UIUtils_clearMonitor_target_null_001');
      console.info('[UIUtils_clearMonitor_target_null_001] END');
    });
    /**
     * @tc.number UIUtils_clearMonitor_path_null_001
     * @tc.name UIUtils_clearMonitor_path_null_001
     * @tc.desc Test UIUtils.clearMonitor with null path
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_clearMonitor_path_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_path_null_001] START');
      assertExpectedError(() => {
        class T { public v: number = 1; }
        UIUtils.clearMonitor(new T(), null);
      }, 'UIUtils_clearMonitor_path_null_001');
      console.info('[UIUtils_clearMonitor_path_null_001] END');
    });
    /**
     * @tc.number UIUtils_addMonitor_target_undefined_001
     * @tc.name UIUtils_addMonitor_target_undefined_001
     * @tc.desc Test UIUtils.addMonitor with undefined target
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_target_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_target_undefined_001] START');
      assertExpectedError(() => {
        UIUtils.addMonitor(undefined, 'p', (m: object) => {});
      }, 'UIUtils_addMonitor_target_undefined_001');
      console.info('[UIUtils_addMonitor_target_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_addMonitor_path_undefined_001
     * @tc.name UIUtils_addMonitor_path_undefined_001
     * @tc.desc Test UIUtils.addMonitor with undefined path
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_path_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_path_undefined_001] START');
      assertExpectedError(() => {
        class T { public v: number = 1; }
        UIUtils.addMonitor(new T(), undefined, (m: object) => {});
      }, 'UIUtils_addMonitor_path_undefined_001');
      console.info('[UIUtils_addMonitor_path_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_addMonitor_callback_undefined_001
     * @tc.name UIUtils_addMonitor_callback_undefined_001
     * @tc.desc Test UIUtils.addMonitor with undefined callback
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_addMonitor_callback_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_callback_undefined_001] START');
      assertExpectedError(() => {
        class T { public v: number = 1; }
        UIUtils.addMonitor(new T(), 'v', undefined);
      }, 'UIUtils_addMonitor_callback_undefined_001');
      console.info('[UIUtils_addMonitor_callback_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_clearMonitor_target_undefined_001
     * @tc.name UIUtils_clearMonitor_target_undefined_001
     * @tc.desc Test UIUtils.clearMonitor with undefined target
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_clearMonitor_target_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_target_undefined_001] START');
      assertExpectedError(() => {
        UIUtils.clearMonitor(undefined, 'p');
      }, 'UIUtils_clearMonitor_target_undefined_001');
      console.info('[UIUtils_clearMonitor_target_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_clearMonitor_path_undefined_001
     * @tc.name UIUtils_clearMonitor_path_undefined_001
     * @tc.desc Test UIUtils.clearMonitor with undefined path
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_clearMonitor_path_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_path_undefined_001] START');
      assertExpectedError(() => {
        class T { public v: number = 1; }
        UIUtils.clearMonitor(new T(), undefined);
      }, 'UIUtils_clearMonitor_path_undefined_001');
      console.info('[UIUtils_clearMonitor_path_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_makeBinding_getter_null_001
     * @tc.name UIUtils_makeBinding_getter_null_001
     * @tc.desc Test UIUtils.makeBinding with null getter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeBinding_getter_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeBinding_getter_null_001] START');
      try {
        UIUtils.makeBinding<number>(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeBinding_getter_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeBinding_getter_null_001] END');
    });
    /**
     * @tc.number UIUtils_makeBinding_setter_null_001
     * @tc.name UIUtils_makeBinding_setter_null_001
     * @tc.desc Test UIUtils.makeBinding with null setter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeBinding_setter_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeBinding_setter_null_001] START');
      try {
        UIUtils.makeBinding<number>(() => 1, null);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeBinding_setter_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeBinding_setter_null_001] END');
    });
    /**
     * @tc.number UIUtils_applySync_task_null_001
     * @tc.name UIUtils_applySync_task_null_001
     * @tc.desc Test UIUtils.applySync with null task
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_applySync_task_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_applySync_task_null_001] START');
      assertExpectedError(() => {
        UIUtils.applySync<number>(null);
      }, 'UIUtils_applySync_task_null_001');
      console.info('[UIUtils_applySync_task_null_001] END');
    });
    /**
     * @tc.number UIUtils_makeBinding_getter_undefined_001
     * @tc.name UIUtils_makeBinding_getter_undefined_001
     * @tc.desc Test UIUtils.makeBinding with undefined getter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeBinding_getter_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeBinding_getter_undefined_001] START');
      try {
        UIUtils.makeBinding<number>(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeBinding_getter_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeBinding_getter_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_makeBinding_setter_undefined_001
     * @tc.name UIUtils_makeBinding_setter_undefined_001
     * @tc.desc Test UIUtils.makeBinding with undefined setter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_makeBinding_setter_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeBinding_setter_undefined_001] START');
      try {
        UIUtils.makeBinding<number>(() => 1, undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_makeBinding_setter_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_makeBinding_setter_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_applySync_task_undefined_001
     * @tc.name UIUtils_applySync_task_undefined_001
     * @tc.desc Test UIUtils.applySync with undefined task
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_applySync_task_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_applySync_task_undefined_001] START');
      try {
        UIUtils.applySync<number>(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_applySync_task_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_applySync_task_undefined_001] END');
    });
    /**
     * @tc.number UIUtils_flushUpdates_001
     * @tc.name UIUtils_flushUpdates_001
     * @tc.desc Test UIUtils.flushUpdates no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_flushUpdates_001', Level.LEVEL2, () => {
      console.info('[UIUtils_flushUpdates_001] START');
      try {
        UIUtils.flushUpdates();
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_flushUpdates_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_flushUpdates_001] END');
    });
    /**
     * @tc.number UIUtils_flushUIUpdates_001
     * @tc.name UIUtils_flushUIUpdates_001
     * @tc.desc Test UIUtils.flushUIUpdates no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_flushUIUpdates_001', Level.LEVEL2, () => {
      console.info('[UIUtils_flushUIUpdates_001] START');
      try {
        UIUtils.flushUIUpdates();
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_flushUIUpdates_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_flushUIUpdates_001] END');
    });

  });
}
