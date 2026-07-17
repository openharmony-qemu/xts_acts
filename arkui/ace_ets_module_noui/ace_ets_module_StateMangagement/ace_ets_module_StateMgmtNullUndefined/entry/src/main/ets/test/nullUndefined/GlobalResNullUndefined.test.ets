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
import { assertCallCompleted, assertUnexpectedError } from './NullUndefinedAssertHelper';

export default function globalResNullUndefinedTest() {
  describe('GlobalResNullUndefinedTest', () => {
    beforeAll(() => { console.info('[GlobalResNullUndefinedTest] beforeAll'); });
    beforeEach(() => { console.info('[GlobalResNullUndefinedTest] beforeEach'); });
    afterEach(() => { console.info('[GlobalResNullUndefinedTest] afterEach'); });
    afterAll(() => { console.info('[GlobalResNullUndefinedTest] afterAll'); });

    /**
     * @tc.number global_r_value_null_001
     * @tc.name global_r_value_null_001
     * @tc.desc Test $r with null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('global_r_value_null_001', Level.LEVEL2, () => {
      console.info('[global_r_value_null_001] START');
      try {
        $r(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[global_r_value_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[global_r_value_null_001] END');
    });
    /**
     * @tc.number global_r_value_undefined_001
     * @tc.name global_r_value_undefined_001
     * @tc.desc Test $r with undefined value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('global_r_value_undefined_001', Level.LEVEL2, () => {
      console.info('[global_r_value_undefined_001] START');
      try {
        const value: string | undefined = undefined;
        $r(value);
        assertCallCompleted();
      } catch (err) {
        console.error('[global_r_value_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[global_r_value_undefined_001] END');
    });
    /**
     * @tc.number global_rawfile_value_null_001
     * @tc.name global_rawfile_value_null_001
     * @tc.desc Test $rawfile with null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('global_rawfile_value_null_001', Level.LEVEL2, () => {
      console.info('[global_rawfile_value_null_001] START');
      try {
        $rawfile(null);
        assertCallCompleted();
      } catch (err) {
        console.error('[global_rawfile_value_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[global_rawfile_value_null_001] END');
    });
    /**
     * @tc.number global_rawfile_value_undefined_001
     * @tc.name global_rawfile_value_undefined_001
     * @tc.desc Test $rawfile with undefined value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('global_rawfile_value_undefined_001', Level.LEVEL2, () => {
      console.info('[global_rawfile_value_undefined_001] START');
      try {
        const value: string | undefined = undefined;
        $rawfile(value);
        assertCallCompleted();
      } catch (err) {
        console.error('[global_rawfile_value_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[global_rawfile_value_undefined_001] END');
    });

  });
}
