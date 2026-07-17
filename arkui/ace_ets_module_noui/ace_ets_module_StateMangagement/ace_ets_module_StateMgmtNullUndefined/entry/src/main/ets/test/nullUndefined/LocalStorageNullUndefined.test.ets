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

export default function localStorageNullUndefinedTest() {
  describe('LocalStorageNullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[LocalStorageNullUndefinedTest] beforeAll');
    });
    beforeEach(() => {
      console.info('[LocalStorageNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[LocalStorageNullUndefinedTest] afterEach');
    });
    afterAll(() => {
      console.info('[LocalStorageNullUndefinedTest] afterAll');
    });

    /**
     * @tc.number LocalStorage_constructor_undefined_001
     * @tc.name LocalStorage_constructor_undefined_001
     * @tc.desc Test LocalStorage constructor with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_constructor_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_constructor_undefined_001] START');
      try {
        const init: Object | undefined = undefined;
        const storage: LocalStorage = new LocalStorage(init);
        expect(storage !== undefined).assertTrue();
      } catch (err) {
        console.error('[LocalStorage_constructor_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_constructor_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_ref_propName_null_001
     * @tc.name LocalStorage_ref_propName_null_001
     * @tc.desc Test LocalStorage.ref with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_ref_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_ref_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.ref<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_ref_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_ref_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_ref_propName_undefined_001
     * @tc.name LocalStorage_ref_propName_undefined_001
     * @tc.desc Test LocalStorage.ref with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_ref_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_ref_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.ref<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_ref_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_ref_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_has_propName_null_001
     * @tc.name LocalStorage_has_propName_null_001
     * @tc.desc Test LocalStorage.has with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_has_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_has_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.has(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_has_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_has_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_has_propName_undefined_001
     * @tc.name LocalStorage_has_propName_undefined_001
     * @tc.desc Test LocalStorage.has with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_has_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_has_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.has(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_has_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_has_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_get_propName_null_001
     * @tc.name LocalStorage_get_propName_null_001
     * @tc.desc Test LocalStorage.get with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_get_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_get_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.get<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_get_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_get_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_get_propName_undefined_001
     * @tc.name LocalStorage_get_propName_undefined_001
     * @tc.desc Test LocalStorage.get with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_get_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_get_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.get<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_get_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_get_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_link_propName_null_001
     * @tc.name LocalStorage_link_propName_null_001
     * @tc.desc Test LocalStorage.link with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_link_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_link_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.link<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_link_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_link_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_link_propName_undefined_001
     * @tc.name LocalStorage_link_propName_undefined_001
     * @tc.desc Test LocalStorage.link with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_link_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_link_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.link<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_link_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_link_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_prop_propName_null_001
     * @tc.name LocalStorage_prop_propName_null_001
     * @tc.desc Test LocalStorage.prop with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_prop_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.prop<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_prop_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_prop_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_prop_propName_undefined_001
     * @tc.name LocalStorage_prop_propName_undefined_001
     * @tc.desc Test LocalStorage.prop with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_prop_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.prop<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_prop_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_prop_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_delete_propName_null_001
     * @tc.name LocalStorage_delete_propName_null_001
     * @tc.desc Test LocalStorage.delete with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_delete_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_delete_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_delete_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_delete_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_delete_propName_undefined_001
     * @tc.name LocalStorage_delete_propName_undefined_001
     * @tc.desc Test LocalStorage.delete with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_delete_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_delete_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_delete_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_delete_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndRef_propName_null_001
     * @tc.name LocalStorage_setAndRef_propName_null_001
     * @tc.desc Test LocalStorage.setAndRef with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndRef_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.setAndRef<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndRef_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndRef_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndRef_propName_undefined_001
     * @tc.name LocalStorage_setAndRef_propName_undefined_001
     * @tc.desc Test LocalStorage.setAndRef with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndRef_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.setAndRef<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndRef_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndRef_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndRef_defaultValue_null_001
     * @tc.name LocalStorage_setAndRef_defaultValue_null_001
     * @tc.desc Test LocalStorage.setAndRef with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndRef_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_defaultValue_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const defaultValue: string | null = null;
        storage.setAndRef<string | null>('k_setAndRef_null', defaultValue);
        storage.delete('k_setAndRef_null');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndRef_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndRef_defaultValue_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndRef_defaultValue_undefined_001
     * @tc.name LocalStorage_setAndRef_defaultValue_undefined_001
     * @tc.desc Test LocalStorage.setAndRef with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndRef_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_defaultValue_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const defaultValue: string | undefined = undefined;
        storage.setAndRef<string | undefined>('k_setAndRef_undefined', defaultValue);
        storage.delete('k_setAndRef_undefined');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndRef_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndRef_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_set_propName_null_001
     * @tc.name LocalStorage_set_propName_null_001
     * @tc.desc Test LocalStorage.set with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_set_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.set<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_set_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_set_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_set_propName_undefined_001
     * @tc.name LocalStorage_set_propName_undefined_001
     * @tc.desc Test LocalStorage.set with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_set_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.set<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_set_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_set_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_set_newValue_null_001
     * @tc.name LocalStorage_set_newValue_null_001
     * @tc.desc Test LocalStorage.set with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_set_newValue_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_newValue_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const newValue: string | null = null;
        storage.set<string | null>('k_set_null', newValue);
        storage.delete('k_set_null');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_set_newValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_set_newValue_null_001] END');
    });

    /**
     * @tc.number LocalStorage_set_newValue_undefined_001
     * @tc.name LocalStorage_set_newValue_undefined_001
     * @tc.desc Test LocalStorage.set with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_set_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_newValue_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const newValue: string | undefined = undefined;
        storage.set<string | undefined>('k_set_undefined', newValue);
        storage.delete('k_set_undefined');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_set_newValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_set_newValue_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setOrCreate_propName_null_001
     * @tc.name LocalStorage_setOrCreate_propName_null_001
     * @tc.desc Test LocalStorage.setOrCreate with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setOrCreate_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.setOrCreate<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setOrCreate_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setOrCreate_propName_undefined_001
     * @tc.name LocalStorage_setOrCreate_propName_undefined_001
     * @tc.desc Test LocalStorage.setOrCreate with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setOrCreate_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.setOrCreate<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setOrCreate_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setOrCreate_newValue_null_001
     * @tc.name LocalStorage_setOrCreate_newValue_null_001
     * @tc.desc Test LocalStorage.setOrCreate with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setOrCreate_newValue_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_newValue_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const newValue: string | null = null;
        storage.setOrCreate<string | null>('k_setOrCreate_null', newValue);
        storage.delete('k_setOrCreate_null');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_newValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setOrCreate_newValue_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setOrCreate_newValue_undefined_001
     * @tc.name LocalStorage_setOrCreate_newValue_undefined_001
     * @tc.desc Test LocalStorage.setOrCreate with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setOrCreate_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_newValue_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const newValue: string | undefined = undefined;
        storage.setOrCreate<string | undefined>('k_setOrCreate_undefined', newValue);
        storage.delete('k_setOrCreate_undefined');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_newValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setOrCreate_newValue_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndLink_propName_null_001
     * @tc.name LocalStorage_setAndLink_propName_null_001
     * @tc.desc Test LocalStorage.setAndLink with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndLink_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndLink_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.setAndLink<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndLink_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndLink_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndLink_propName_undefined_001
     * @tc.name LocalStorage_setAndLink_propName_undefined_001
     * @tc.desc Test LocalStorage.setAndLink with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndLink_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndLink_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.setAndLink<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndLink_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndLink_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndLink_defaultValue_null_001
     * @tc.name LocalStorage_setAndLink_defaultValue_null_001
     * @tc.desc Test LocalStorage.setAndLink with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndLink_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndLink_defaultValue_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const defaultValue: string | null = null;
        storage.setAndLink<string | null>('k_setAndLink_null', defaultValue);
        storage.delete('k_setAndLink_null');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndLink_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndLink_defaultValue_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndLink_defaultValue_undefined_001
     * @tc.name LocalStorage_setAndLink_defaultValue_undefined_001
     * @tc.desc Test LocalStorage.setAndLink with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndLink_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndLink_defaultValue_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const defaultValue: string | undefined = undefined;
        storage.setAndLink<string | undefined>('k_setAndLink_undefined', defaultValue);
        storage.delete('k_setAndLink_undefined');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndLink_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndLink_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndProp_propName_null_001
     * @tc.name LocalStorage_setAndProp_propName_null_001
     * @tc.desc Test LocalStorage.setAndProp with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndProp_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndProp_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        storage.setAndProp<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndProp_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndProp_propName_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndProp_propName_undefined_001
     * @tc.name LocalStorage_setAndProp_propName_undefined_001
     * @tc.desc Test LocalStorage.setAndProp with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndProp_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndProp_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        storage.setAndProp<string>(propName, 'v');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndProp_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndProp_propName_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndProp_defaultValue_null_001
     * @tc.name LocalStorage_setAndProp_defaultValue_null_001
     * @tc.desc Test LocalStorage.setAndProp with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndProp_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndProp_defaultValue_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const defaultValue: string | null = null;
        storage.setAndProp<string | null>('k_setAndProp_null', defaultValue);
        storage.delete('k_setAndProp_null');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndProp_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndProp_defaultValue_null_001] END');
    });

    /**
     * @tc.number LocalStorage_setAndProp_defaultValue_undefined_001
     * @tc.name LocalStorage_setAndProp_defaultValue_undefined_001
     * @tc.desc Test LocalStorage.setAndProp with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_setAndProp_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndProp_defaultValue_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const defaultValue: string | undefined = undefined;
        storage.setAndProp<string | undefined>('k_setAndProp_undefined', defaultValue);
        storage.delete('k_setAndProp_undefined');
        assertCallCompleted();
      } catch (err) {
        console.error('[LocalStorage_setAndProp_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_setAndProp_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number LocalStorage_clear_001
     * @tc.name LocalStorage_clear_001
     * @tc.desc Test LocalStorage.clear no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('LocalStorage_clear_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_clear_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        storage.setOrCreate<string>('tmp', '1');
        const r: boolean = storage.clear();
        expect(typeof r).assertEqual('boolean');
      } catch (err) {
        console.error('[LocalStorage_clear_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[LocalStorage_clear_001] END');
    });

  });
}
