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
import { assertCallCompleted, assertExpectedError, assertUnexpectedError } from '../common/NullUndefinedAssertHelper';
import { PersistenceV2, UIUtils } from '@kit.ArkUI';

@ObservedV2
class PersistSample {
  @Trace name: string = 'n';
}


export default function persistenceV2NullUndefinedTest() {
  describe('PersistenceV2NullUndefinedTest', () => {
    beforeAll(() => { console.info('[PersistenceV2NullUndefinedTest] beforeAll'); });
    beforeEach(() => { console.info('[PersistenceV2NullUndefinedTest] beforeEach'); });
    afterEach(() => { console.info('[PersistenceV2NullUndefinedTest] afterEach'); });
    afterAll(() => { console.info('[PersistenceV2NullUndefinedTest] afterAll'); });

    /**
     * @tc.number PersistenceV2_globalConnect_type_null_001
     * @tc.name PersistenceV2_globalConnect_type_null_001
     * @tc.desc Test PersistenceV2.globalConnect with null
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_globalConnect_type_null_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_globalConnect_type_null_001] START');
      assertExpectedError(() => {
        PersistenceV2.globalConnect<object>(null);
      }, 'PersistenceV2_globalConnect_type_null_001');
      console.info('[PersistenceV2_globalConnect_type_null_001] END');
    });
    /**
     * @tc.number PersistenceV2_save_keyOrType_null_001
     * @tc.name PersistenceV2_save_keyOrType_null_001
     * @tc.desc Test PersistenceV2.save with null
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_save_keyOrType_null_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_save_keyOrType_null_001] START');
      try {
        PersistenceV2.save(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistenceV2_save_keyOrType_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistenceV2_save_keyOrType_null_001] END');
    });
    /**
     * @tc.number PersistenceV2_notifyOnError_callback_null_001
     * @tc.name PersistenceV2_notifyOnError_callback_null_001
     * @tc.desc Test PersistenceV2.notifyOnError with null
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_notifyOnError_callback_null_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_notifyOnError_callback_null_001] START');
      try {
        PersistenceV2.notifyOnError(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistenceV2_notifyOnError_callback_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistenceV2_notifyOnError_callback_null_001] END');
    });
    /**
     * @tc.number PersistenceV2_globalConnect_type_undefined_001
     * @tc.name PersistenceV2_globalConnect_type_undefined_001
     * @tc.desc Test PersistenceV2.globalConnect with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_globalConnect_type_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_globalConnect_type_undefined_001] START');
      assertExpectedError(() => {
        PersistenceV2.globalConnect<object>(undefined);
      }, 'PersistenceV2_globalConnect_type_undefined_001');
      console.info('[PersistenceV2_globalConnect_type_undefined_001] END');
    });
    /**
     * @tc.number PersistenceV2_save_keyOrType_undefined_001
     * @tc.name PersistenceV2_save_keyOrType_undefined_001
     * @tc.desc Test PersistenceV2.save with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_save_keyOrType_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_save_keyOrType_undefined_001] START');
      try {
        PersistenceV2.save(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistenceV2_save_keyOrType_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistenceV2_save_keyOrType_undefined_001] END');
    });
    /**
     * @tc.number PersistenceV2_notifyOnError_callback_undefined_001
     * @tc.name PersistenceV2_notifyOnError_callback_undefined_001
     * @tc.desc Test PersistenceV2.notifyOnError with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_notifyOnError_callback_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_notifyOnError_callback_undefined_001] START');
      try {
        PersistenceV2.notifyOnError(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistenceV2_notifyOnError_callback_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistenceV2_notifyOnError_callback_undefined_001] END');
    });

  });
}
