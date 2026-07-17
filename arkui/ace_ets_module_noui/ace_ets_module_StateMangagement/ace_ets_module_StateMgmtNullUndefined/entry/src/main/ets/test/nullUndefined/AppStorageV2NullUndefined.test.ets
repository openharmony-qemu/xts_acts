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
import { AppStorageV2 } from '@kit.ArkUI';

@ObservedV2
class SampleClass {
  @Trace id: number = 0;
}


export default function appStorageV2NullUndefinedTest() {
  describe('AppStorageV2NullUndefinedTest', () => {
    beforeAll(() => { console.info('[AppStorageV2NullUndefinedTest] beforeAll'); });
    beforeEach(() => { console.info('[AppStorageV2NullUndefinedTest] beforeEach'); });
    afterEach(() => { console.info('[AppStorageV2NullUndefinedTest] afterEach'); });
    afterAll(() => { console.info('[AppStorageV2NullUndefinedTest] afterAll'); });

    /**
     * @tc.number AppStorageV2_connect_type_null_001
     * @tc.name AppStorageV2_connect_type_null_001
     * @tc.desc Test AppStorageV2.connect with null type
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_connect_type_null_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_type_null_001] START');
      assertExpectedError(() => {
        AppStorageV2.connect<object>(null);
      }, 'AppStorageV2_connect_type_null_001');
      console.info('[AppStorageV2_connect_type_null_001] END');
    });
    /**
     * @tc.number AppStorageV2_connect_keyOrDefaultCreator_null_001
     * @tc.name AppStorageV2_connect_keyOrDefaultCreator_null_001
     * @tc.desc Test AppStorageV2.connect with null keyOrDefaultCreator
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_connect_keyOrDefaultCreator_null_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_keyOrDefaultCreator_null_001] START');
      try {
        AppStorageV2.connect<SampleClass>(SampleClass, () => new SampleClass());
        AppStorageV2.connect<SampleClass>(SampleClass, null);
        AppStorageV2.remove(SampleClass);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorageV2_connect_keyOrDefaultCreator_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorageV2_connect_keyOrDefaultCreator_null_001] END');
    });
    /**
     * @tc.number AppStorageV2_connect_defaultCreator_null_001
     * @tc.name AppStorageV2_connect_defaultCreator_null_001
     * @tc.desc Test AppStorageV2.connect with null defaultCreator
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_connect_defaultCreator_null_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_defaultCreator_null_001] START');
      try {
        AppStorageV2.connect<SampleClass>(
          SampleClass, 'asv2_key_null', () => new SampleClass());
        AppStorageV2.connect<SampleClass>(SampleClass, 'asv2_key_null', null);
        AppStorageV2.remove('asv2_key_null');
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorageV2_connect_defaultCreator_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorageV2_connect_defaultCreator_null_001] END');
    });
    /**
     * @tc.number AppStorageV2_remove_keyOrType_null_001
     * @tc.name AppStorageV2_remove_keyOrType_null_001
     * @tc.desc Test AppStorageV2.remove with null keyOrType
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_remove_keyOrType_null_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_remove_keyOrType_null_001] START');
      try {
        AppStorageV2.remove(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorageV2_remove_keyOrType_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorageV2_remove_keyOrType_null_001] END');
    });
    /**
     * @tc.number AppStorageV2_connect_type_undefined_001
     * @tc.name AppStorageV2_connect_type_undefined_001
     * @tc.desc Test AppStorageV2.connect with undefined type
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_connect_type_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_type_undefined_001] START');
      assertExpectedError(() => {
        AppStorageV2.connect<object>(undefined);
      }, 'AppStorageV2_connect_type_undefined_001');
      console.info('[AppStorageV2_connect_type_undefined_001] END');
    });
    /**
     * @tc.number AppStorageV2_connect_keyOrDefaultCreator_undefined_001
     * @tc.name AppStorageV2_connect_keyOrDefaultCreator_undefined_001
     * @tc.desc Test AppStorageV2.connect with undefined keyOrDefaultCreator
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_connect_keyOrDefaultCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_keyOrDefaultCreator_undefined_001] START');
      try {
        AppStorageV2.connect<SampleClass>(SampleClass, () => new SampleClass());
        AppStorageV2.connect<SampleClass>(SampleClass, undefined);
        AppStorageV2.remove(SampleClass);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorageV2_connect_keyOrDefaultCreator_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorageV2_connect_keyOrDefaultCreator_undefined_001] END');
    });
    /**
     * @tc.number AppStorageV2_connect_defaultCreator_undefined_001
     * @tc.name AppStorageV2_connect_defaultCreator_undefined_001
     * @tc.desc Test AppStorageV2.connect with undefined defaultCreator
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_connect_defaultCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_defaultCreator_undefined_001] START');
      try {
        AppStorageV2.connect<SampleClass>(
          SampleClass, 'asv2_key_undefined', () => new SampleClass());
        AppStorageV2.connect<SampleClass>(SampleClass, 'asv2_key_undefined', undefined);
        AppStorageV2.remove('asv2_key_undefined');
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorageV2_connect_defaultCreator_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorageV2_connect_defaultCreator_undefined_001] END');
    });
    /**
     * @tc.number AppStorageV2_remove_keyOrType_undefined_001
     * @tc.name AppStorageV2_remove_keyOrType_undefined_001
     * @tc.desc Test AppStorageV2.remove with undefined keyOrType
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorageV2_remove_keyOrType_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_remove_keyOrType_undefined_001] START');
      try {
        AppStorageV2.remove(undefined);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorageV2_remove_keyOrType_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorageV2_remove_keyOrType_undefined_001] END');
    });

  });
}
