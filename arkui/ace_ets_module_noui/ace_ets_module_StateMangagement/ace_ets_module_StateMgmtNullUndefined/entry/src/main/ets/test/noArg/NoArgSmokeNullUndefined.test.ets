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

/**
 * Cover no-arg Method APIs from Excel (cannot pass null/undefined; smoke call only).
 */
export default function noArgSmokeNullUndefinedTest() {
  describe('NoArgSmokeNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[NoArgSmokeNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[NoArgSmokeNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number AppStorage_clear_smoke_001
     * @tc.name AppStorage_clear_smoke_001
     * @tc.desc Smoke call AppStorage.clear/Clear (no-arg, cannot pass null/undefined)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_clear_smoke_001', Level.LEVEL2, () => {
      console.info('[AppStorage_clear_smoke_001] START');
      try {
        AppStorage.setOrCreate('no_arg_smoke', 1);
        AppStorage.clear();
        AppStorage.Clear();
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_clear_smoke_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_clear_smoke_001] END');
    });

    /**
     * @tc.number Environment_keys_smoke_001
     * @tc.name Environment_keys_smoke_001
     * @tc.desc Smoke call Environment.keys/Keys (no-arg)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_keys_smoke_001', Level.LEVEL2, () => {
      console.info('[Environment_keys_smoke_001] START');
      try {
        const k1: Array<string> = Environment.keys();
        const k2: Array<string> = Environment.Keys();
        expect(k1 !== undefined).assertTrue();
        expect(k2 !== undefined).assertTrue();
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_keys_smoke_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_keys_smoke_001] END');
    });

    /**
     * @tc.number PersistentStorage_keys_smoke_001
     * @tc.name PersistentStorage_keys_smoke_001
     * @tc.desc Smoke call PersistentStorage.keys/Keys (no-arg)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_keys_smoke_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_keys_smoke_001] START');
      try {
        const k1: Array<string> = PersistentStorage.keys();
        const k2: Array<string> = PersistentStorage.Keys();
        expect(k1 !== undefined).assertTrue();
        expect(k2 !== undefined).assertTrue();
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_keys_smoke_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_keys_smoke_001] END');
    });

    /**
     * @tc.number LocalStorage_clear_smoke_001
     * @tc.name LocalStorage_clear_smoke_001
     * @tc.desc Smoke call LocalStorage.clear (no-arg)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_clear_smoke_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_clear_smoke_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        storage.setOrCreate('ls_smoke', 1);
        storage.clear();
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_clear_smoke_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_clear_smoke_001] END');
    });

    /**
     * @tc.number UIUtils_flushUpdates_smoke_001
     * @tc.name UIUtils_flushUpdates_smoke_001
     * @tc.desc Smoke call UIUtils.flushUpdates/flushUIUpdates (no-arg)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('UIUtils_flushUpdates_smoke_001', Level.LEVEL2, () => {
      console.info('[UIUtils_flushUpdates_smoke_001] START');
      try {
        UIUtils.flushUpdates();
        UIUtils.flushUIUpdates();
        assertCallCompleted();
      } catch (err) {
        console.error('[UIUtils_flushUpdates_smoke_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[UIUtils_flushUpdates_smoke_001] END');
    });
  });
}
