/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { PersistenceV2, Type } from '@kit.ArkUI';

@ObservedV2
class SampleChild {
  @Trace id: number = 0;
  count: number = 10;
}

@ObservedV2
class Sample {
  @Trace sampleChild: SampleChild = new SampleChild();
}

export default function PersistenceV2NullUndefinedTest() {
  describe('PersistenceV2NullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[PersistenceV2NullUndefinedTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[PersistenceV2NullUndefinedTest] beforeEach called');
    });

    afterEach(() => {
      console.info('[PersistenceV2NullUndefinedTest] afterEach called');
    });

    afterAll(() => {
      console.info('[PersistenceV2NullUndefinedTest] afterAll called');
    });


    /**
     * @tc.name   PersistenceV2_save_keyOrType_null_001
     * @tc.number SUB_ARKUI_PERSISTENCEV2_SAVE_PARAM_NULL_001
     * @tc.desc   Test PersistenceV2.save with null keyOrType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistenceV2_save_keyOrType_null_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_save_keyOrType_null_001] START');
      try {
        PersistenceV2.save(null);
        console.info('[PersistenceV2_save_keyOrType_null_001] save called with null');
        console.info('[PersistenceV2_save_keyOrType_null_001] END');
      } catch (err) {
        console.error('[PersistenceV2_save_keyOrType_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistenceV2_save_keyOrType_undefined_001
     * @tc.number SUB_ARKUI_PERSISTENCEV2_SAVE_PARAM_UNDEFINED_001
     * @tc.desc   Test PersistenceV2.save with undefined keyOrType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistenceV2_save_keyOrType_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_save_keyOrType_undefined_001] START');
      try {
        PersistenceV2.save(undefined);
        console.info('[PersistenceV2_save_keyOrType_undefined_001] save called with undefined');
        console.info('[PersistenceV2_save_keyOrType_undefined_001] END');
      } catch (err) {
        console.error('[PersistenceV2_save_keyOrType_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistenceV2_notifyOnError_callback_null_001
     * @tc.number SUB_ARKUI_PERSISTENCEV2_NOTIFYONERROR_PARAM_NULL_001
     * @tc.desc   Test PersistenceV2.notifyOnError with null callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistenceV2_notifyOnError_callback_null_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_notifyOnError_callback_null_001] START');
      try {
        PersistenceV2.notifyOnError(null);
        console.info('[PersistenceV2_notifyOnError_callback_null_001] notifyOnError called with null');
        console.info('[PersistenceV2_notifyOnError_callback_null_001] END');
      } catch (err) {
        console.error('[PersistenceV2_notifyOnError_callback_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistenceV2_notifyOnError_callback_undefined_001
     * @tc.number SUB_ARKUI_PERSISTENCEV2_NOTIFYONERROR_PARAM_UNDEFINED_001
     * @tc.desc   Test PersistenceV2.notifyOnError with undefined callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistenceV2_notifyOnError_callback_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_notifyOnError_callback_undefined_001] START');
      try {
        PersistenceV2.notifyOnError(undefined);
        console.info('[PersistenceV2_notifyOnError_callback_undefined_001] notifyOnError called with undefined');
        console.info('[PersistenceV2_notifyOnError_callback_undefined_001] END');
      } catch (err) {
        console.error('[PersistenceV2_notifyOnError_callback_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });
  });
}
