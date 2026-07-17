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

export default function persistentStorageNullUndefinedTest() {
  describe('PersistentStorageNullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[PersistentStorageNullUndefinedTest] beforeAll');
    });
    beforeEach(() => {
      console.info('[PersistentStorageNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[PersistentStorageNullUndefinedTest] afterEach');
    });
    afterAll(() => {
      console.info('[PersistentStorageNullUndefinedTest] afterAll');
    });

    /**
     * @tc.number PersistentStorage_persistProp_key_null_001
     * @tc.name PersistentStorage_persistProp_key_null_001
     * @tc.desc Test PersistentStorage.persistProp with null key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_persistProp_key_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProp_key_null_001] START');
      try {
        const key: string | null = null;
        PersistentStorage.persistProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_persistProp_key_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_persistProp_key_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_persistProp_key_undefined_001
     * @tc.name PersistentStorage_persistProp_key_undefined_001
     * @tc.desc Test PersistentStorage.persistProp with undefined key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_persistProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        PersistentStorage.persistProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_persistProp_key_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_persistProp_key_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_persistProp_defaultValue_null_001
     * @tc.name PersistentStorage_persistProp_defaultValue_null_001
     * @tc.desc Test PersistentStorage.persistProp with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_persistProp_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProp_defaultValue_null_001] START');
      try {
        const key: string = 'ps_persistProp_null';
        const defaultValue: string | null = null;
        PersistentStorage.persistProp<string | null>(key, defaultValue);
        PersistentStorage.deleteProp(key);
        AppStorage.delete(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_persistProp_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_persistProp_defaultValue_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_persistProp_defaultValue_undefined_001
     * @tc.name PersistentStorage_persistProp_defaultValue_undefined_001
     * @tc.desc Test PersistentStorage.persistProp with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_persistProp_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProp_defaultValue_undefined_001] START');
      try {
        const key: string = 'ps_persistProp_undefined';
        const defaultValue: string | undefined = undefined;
        PersistentStorage.persistProp<string | undefined>(key, defaultValue);
        PersistentStorage.deleteProp(key);
        AppStorage.delete(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_persistProp_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_persistProp_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_PersistProp_key_null_001
     * @tc.name PersistentStorage_PersistProp_key_null_001
     * @tc.desc Test PersistentStorage.PersistProp with null key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_PersistProp_key_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_PersistProp_key_null_001] START');
      try {
        const key: string | null = null;
        PersistentStorage.PersistProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_PersistProp_key_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_PersistProp_key_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_PersistProp_key_undefined_001
     * @tc.name PersistentStorage_PersistProp_key_undefined_001
     * @tc.desc Test PersistentStorage.PersistProp with undefined key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_PersistProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_PersistProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        PersistentStorage.PersistProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_PersistProp_key_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_PersistProp_key_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_PersistProp_defaultValue_null_001
     * @tc.name PersistentStorage_PersistProp_defaultValue_null_001
     * @tc.desc Test PersistentStorage.PersistProp with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_PersistProp_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_PersistProp_defaultValue_null_001] START');
      try {
        const key: string = 'ps_PersistProp_null';
        const defaultValue: string | null = null;
        PersistentStorage.PersistProp<string | null>(key, defaultValue);
        PersistentStorage.deleteProp(key);
        AppStorage.delete(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_PersistProp_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_PersistProp_defaultValue_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_PersistProp_defaultValue_undefined_001
     * @tc.name PersistentStorage_PersistProp_defaultValue_undefined_001
     * @tc.desc Test PersistentStorage.PersistProp with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_PersistProp_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_PersistProp_defaultValue_undefined_001] START');
      try {
        const key: string = 'ps_PersistProp_undefined';
        const defaultValue: string | undefined = undefined;
        PersistentStorage.PersistProp<string | undefined>(key, defaultValue);
        PersistentStorage.deleteProp(key);
        AppStorage.delete(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_PersistProp_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_PersistProp_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_deleteProp_key_null_001
     * @tc.name PersistentStorage_deleteProp_key_null_001
     * @tc.desc Test PersistentStorage.deleteProp with null key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_deleteProp_key_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_deleteProp_key_null_001] START');
      try {
        const key: string | null = null;
        PersistentStorage.deleteProp(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_deleteProp_key_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_deleteProp_key_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_deleteProp_key_undefined_001
     * @tc.name PersistentStorage_deleteProp_key_undefined_001
     * @tc.desc Test PersistentStorage.deleteProp with undefined key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_deleteProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_deleteProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        PersistentStorage.deleteProp(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_deleteProp_key_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_deleteProp_key_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_DeleteProp_key_null_001
     * @tc.name PersistentStorage_DeleteProp_key_null_001
     * @tc.desc Test PersistentStorage.DeleteProp with null key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_DeleteProp_key_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_DeleteProp_key_null_001] START');
      try {
        const key: string | null = null;
        PersistentStorage.DeleteProp(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_DeleteProp_key_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_DeleteProp_key_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_DeleteProp_key_undefined_001
     * @tc.name PersistentStorage_DeleteProp_key_undefined_001
     * @tc.desc Test PersistentStorage.DeleteProp with undefined key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_DeleteProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_DeleteProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        PersistentStorage.DeleteProp(key);
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistentStorage_DeleteProp_key_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_DeleteProp_key_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_persistProps_props_null_001
     * @tc.name PersistentStorage_persistProps_props_null_001
     * @tc.desc Test PersistentStorage.persistProps with null props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_persistProps_props_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProps_props_null_001] START');
      assertExpectedError(() => {
        PersistentStorage.persistProps(null);
      }, 'PersistentStorage_persistProps_props_null_001');
      console.info('[PersistentStorage_persistProps_props_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_persistProps_props_undefined_001
     * @tc.name PersistentStorage_persistProps_props_undefined_001
     * @tc.desc Test PersistentStorage.persistProps with undefined props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_persistProps_props_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProps_props_undefined_001] START');
      assertExpectedError(() => {
        PersistentStorage.persistProps(undefined);
      }, 'PersistentStorage_persistProps_props_undefined_001');
      console.info('[PersistentStorage_persistProps_props_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_PersistProps_props_null_001
     * @tc.name PersistentStorage_PersistProps_props_null_001
     * @tc.desc Test PersistentStorage.PersistProps with null props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_PersistProps_props_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_PersistProps_props_null_001] START');
      assertExpectedError(() => {
        PersistentStorage.PersistProps(null);
      }, 'PersistentStorage_PersistProps_props_null_001');
      console.info('[PersistentStorage_PersistProps_props_null_001] END');
    });

    /**
     * @tc.number PersistentStorage_PersistProps_props_undefined_001
     * @tc.name PersistentStorage_PersistProps_props_undefined_001
     * @tc.desc Test PersistentStorage.PersistProps with undefined props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_PersistProps_props_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_PersistProps_props_undefined_001] START');
      assertExpectedError(() => {
        PersistentStorage.PersistProps(undefined);
      }, 'PersistentStorage_PersistProps_props_undefined_001');
      console.info('[PersistentStorage_PersistProps_props_undefined_001] END');
    });

    /**
     * @tc.number PersistentStorage_keys_001
     * @tc.name PersistentStorage_keys_001
     * @tc.desc Test PersistentStorage.keys no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_keys_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_keys_001] START');
      try {
        const keys: Array<string> = PersistentStorage.keys();
        expect(Array.isArray(keys)).assertTrue();
      } catch (err) {
        console.error('[PersistentStorage_keys_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_keys_001] END');
    });

    /**
     * @tc.number PersistentStorage_Keys_001
     * @tc.name PersistentStorage_Keys_001
     * @tc.desc Test PersistentStorage.Keys no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistentStorage_Keys_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_Keys_001] START');
      try {
        const keys: Array<string> = PersistentStorage.Keys();
        expect(Array.isArray(keys)).assertTrue();
      } catch (err) {
        console.error('[PersistentStorage_Keys_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistentStorage_Keys_001] END');
    });

  });
}
