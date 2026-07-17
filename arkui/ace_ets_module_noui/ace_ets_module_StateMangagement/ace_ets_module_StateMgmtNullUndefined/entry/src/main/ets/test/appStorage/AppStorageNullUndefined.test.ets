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
import { assertCallCompleted, assertUnexpectedError } from '../common/NullUndefinedAssertHelper';

export default function appStorageNullUndefinedTest() {
  describe('AppStorageNullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[AppStorageNullUndefinedTest] beforeAll');
    });
    beforeEach(() => {
      console.info('[AppStorageNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[AppStorageNullUndefinedTest] afterEach');
    });
    afterAll(() => {
      console.info('[AppStorageNullUndefinedTest] afterAll');
    });

    /**
     * @tc.number AppStorage_ref_propName_null_001
     * @tc.name AppStorage_ref_propName_null_001
     * @tc.desc Test AppStorage.ref with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_ref_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_ref_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.ref<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_ref_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_ref_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_ref_propName_undefined_001
     * @tc.name AppStorage_ref_propName_undefined_001
     * @tc.desc Test AppStorage.ref with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_ref_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_ref_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.ref<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_ref_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_ref_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_link_propName_null_001
     * @tc.name AppStorage_link_propName_null_001
     * @tc.desc Test AppStorage.link with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_link_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_link_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.link<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_link_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_link_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_link_propName_undefined_001
     * @tc.name AppStorage_link_propName_undefined_001
     * @tc.desc Test AppStorage.link with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_link_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_link_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.link<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_link_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_link_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_Link_propName_null_001
     * @tc.name AppStorage_Link_propName_null_001
     * @tc.desc Test AppStorage.Link with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Link_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Link_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.Link(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Link_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Link_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_Link_propName_undefined_001
     * @tc.name AppStorage_Link_propName_undefined_001
     * @tc.desc Test AppStorage.Link with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Link_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Link_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.Link(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Link_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Link_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_prop_propName_null_001
     * @tc.name AppStorage_prop_propName_null_001
     * @tc.desc Test AppStorage.prop with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_prop_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_prop_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.prop<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_prop_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_prop_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_prop_propName_undefined_001
     * @tc.name AppStorage_prop_propName_undefined_001
     * @tc.desc Test AppStorage.prop with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_prop_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_prop_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.prop<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_prop_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_prop_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_Prop_propName_null_001
     * @tc.name AppStorage_Prop_propName_null_001
     * @tc.desc Test AppStorage.Prop with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Prop_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Prop_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.Prop(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Prop_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Prop_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_Prop_propName_undefined_001
     * @tc.name AppStorage_Prop_propName_undefined_001
     * @tc.desc Test AppStorage.Prop with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Prop_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Prop_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.Prop(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Prop_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Prop_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_has_propName_null_001
     * @tc.name AppStorage_has_propName_null_001
     * @tc.desc Test AppStorage.has with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_has_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_has_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.has(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_has_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_has_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_has_propName_undefined_001
     * @tc.name AppStorage_has_propName_undefined_001
     * @tc.desc Test AppStorage.has with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_has_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_has_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.has(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_has_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_has_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_Has_propName_null_001
     * @tc.name AppStorage_Has_propName_null_001
     * @tc.desc Test AppStorage.Has with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Has_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Has_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.Has(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Has_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Has_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_Has_propName_undefined_001
     * @tc.name AppStorage_Has_propName_undefined_001
     * @tc.desc Test AppStorage.Has with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Has_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Has_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.Has(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Has_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Has_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_get_propName_null_001
     * @tc.name AppStorage_get_propName_null_001
     * @tc.desc Test AppStorage.get with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_get_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_get_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.get<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_get_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_get_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_get_propName_undefined_001
     * @tc.name AppStorage_get_propName_undefined_001
     * @tc.desc Test AppStorage.get with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_get_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_get_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.get<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_get_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_get_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_Get_propName_null_001
     * @tc.name AppStorage_Get_propName_null_001
     * @tc.desc Test AppStorage.Get with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Get_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Get_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.Get<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Get_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Get_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_Get_propName_undefined_001
     * @tc.name AppStorage_Get_propName_undefined_001
     * @tc.desc Test AppStorage.Get with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Get_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Get_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.Get<string>(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Get_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Get_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_delete_propName_null_001
     * @tc.name AppStorage_delete_propName_null_001
     * @tc.desc Test AppStorage.delete with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_delete_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_delete_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_delete_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_delete_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_delete_propName_undefined_001
     * @tc.name AppStorage_delete_propName_undefined_001
     * @tc.desc Test AppStorage.delete with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_delete_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_delete_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_delete_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_delete_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_Delete_propName_null_001
     * @tc.name AppStorage_Delete_propName_null_001
     * @tc.desc Test AppStorage.Delete with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Delete_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Delete_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.Delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Delete_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Delete_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_Delete_propName_undefined_001
     * @tc.name AppStorage_Delete_propName_undefined_001
     * @tc.desc Test AppStorage.Delete with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Delete_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Delete_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.Delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Delete_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Delete_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_IsMutable_propName_null_001
     * @tc.name AppStorage_IsMutable_propName_null_001
     * @tc.desc Test AppStorage.IsMutable with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_IsMutable_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_IsMutable_propName_null_001] START');
      try {
        const propName: string | null = null;
        AppStorage.IsMutable(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_IsMutable_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_IsMutable_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_IsMutable_propName_undefined_001
     * @tc.name AppStorage_IsMutable_propName_undefined_001
     * @tc.desc Test AppStorage.IsMutable with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_IsMutable_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_IsMutable_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        AppStorage.IsMutable(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_IsMutable_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_IsMutable_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setAndRef_propName_null_001
     * @tc.name AppStorage_setAndRef_propName_null_001
     * @tc.desc Test AppStorage.setAndRef with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndRef_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_propName_null_001] START');
      try {
        const propName: string | null = null;
        const defaultValue: string = 'v';
        AppStorage.setAndRef<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndRef_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndRef_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_setAndRef_propName_undefined_001
     * @tc.name AppStorage_setAndRef_propName_undefined_001
     * @tc.desc Test AppStorage.setAndRef with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndRef_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: string = 'v';
        AppStorage.setAndRef<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndRef_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndRef_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setAndRef_defaultValue_null_001
     * @tc.name AppStorage_setAndRef_defaultValue_null_001
     * @tc.desc Test AppStorage.setAndRef with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndRef_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_defaultValue_null_001] START');
      try {
        const propName: string = 'k_setAndRef_null';
        const defaultValue: string | null = null;
        AppStorage.setAndRef<string | null>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndRef_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndRef_defaultValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_setAndRef_defaultValue_undefined_001
     * @tc.name AppStorage_setAndRef_defaultValue_undefined_001
     * @tc.desc Test AppStorage.setAndRef with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndRef_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_defaultValue_undefined_001] START');
      try {
        const propName: string = 'k_setAndRef_undefined';
        const defaultValue: string | undefined = undefined;
        AppStorage.setAndRef<string | undefined>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndRef_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndRef_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setAndLink_propName_null_001
     * @tc.name AppStorage_setAndLink_propName_null_001
     * @tc.desc Test AppStorage.setAndLink with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndLink_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_propName_null_001] START');
      try {
        const propName: string | null = null;
        const defaultValue: string = 'v';
        AppStorage.setAndLink<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndLink_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndLink_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_setAndLink_propName_undefined_001
     * @tc.name AppStorage_setAndLink_propName_undefined_001
     * @tc.desc Test AppStorage.setAndLink with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndLink_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: string = 'v';
        AppStorage.setAndLink<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndLink_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndLink_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setAndLink_defaultValue_null_001
     * @tc.name AppStorage_setAndLink_defaultValue_null_001
     * @tc.desc Test AppStorage.setAndLink with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndLink_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_defaultValue_null_001] START');
      try {
        const propName: string = 'k_setAndLink_null';
        const defaultValue: string | null = null;
        AppStorage.setAndLink<string | null>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndLink_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndLink_defaultValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_setAndLink_defaultValue_undefined_001
     * @tc.name AppStorage_setAndLink_defaultValue_undefined_001
     * @tc.desc Test AppStorage.setAndLink with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndLink_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_defaultValue_undefined_001] START');
      try {
        const propName: string = 'k_setAndLink_undefined';
        const defaultValue: string | undefined = undefined;
        AppStorage.setAndLink<string | undefined>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndLink_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndLink_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndLink_propName_null_001
     * @tc.name AppStorage_SetAndLink_propName_null_001
     * @tc.desc Test AppStorage.SetAndLink with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndLink_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_propName_null_001] START');
      try {
        const propName: string | null = null;
        const defaultValue: string = 'v';
        AppStorage.SetAndLink<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndLink_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndLink_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndLink_propName_undefined_001
     * @tc.name AppStorage_SetAndLink_propName_undefined_001
     * @tc.desc Test AppStorage.SetAndLink with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndLink_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: string = 'v';
        AppStorage.SetAndLink<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndLink_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndLink_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndLink_defaultValue_null_001
     * @tc.name AppStorage_SetAndLink_defaultValue_null_001
     * @tc.desc Test AppStorage.SetAndLink with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndLink_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_defaultValue_null_001] START');
      try {
        const propName: string = 'k_SetAndLink_null';
        const defaultValue: string | null = null;
        AppStorage.SetAndLink<string | null>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndLink_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndLink_defaultValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndLink_defaultValue_undefined_001
     * @tc.name AppStorage_SetAndLink_defaultValue_undefined_001
     * @tc.desc Test AppStorage.SetAndLink with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndLink_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_defaultValue_undefined_001] START');
      try {
        const propName: string = 'k_SetAndLink_undefined';
        const defaultValue: string | undefined = undefined;
        AppStorage.SetAndLink<string | undefined>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndLink_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndLink_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setAndProp_propName_null_001
     * @tc.name AppStorage_setAndProp_propName_null_001
     * @tc.desc Test AppStorage.setAndProp with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndProp_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_propName_null_001] START');
      try {
        const propName: string | null = null;
        const defaultValue: string = 'v';
        AppStorage.setAndProp<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndProp_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndProp_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_setAndProp_propName_undefined_001
     * @tc.name AppStorage_setAndProp_propName_undefined_001
     * @tc.desc Test AppStorage.setAndProp with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndProp_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: string = 'v';
        AppStorage.setAndProp<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndProp_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndProp_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setAndProp_defaultValue_null_001
     * @tc.name AppStorage_setAndProp_defaultValue_null_001
     * @tc.desc Test AppStorage.setAndProp with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndProp_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_defaultValue_null_001] START');
      try {
        const propName: string = 'k_setAndProp_null';
        const defaultValue: string | null = null;
        AppStorage.setAndProp<string | null>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndProp_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndProp_defaultValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_setAndProp_defaultValue_undefined_001
     * @tc.name AppStorage_setAndProp_defaultValue_undefined_001
     * @tc.desc Test AppStorage.setAndProp with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setAndProp_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_defaultValue_undefined_001] START');
      try {
        const propName: string = 'k_setAndProp_undefined';
        const defaultValue: string | undefined = undefined;
        AppStorage.setAndProp<string | undefined>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setAndProp_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setAndProp_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndProp_propName_null_001
     * @tc.name AppStorage_SetAndProp_propName_null_001
     * @tc.desc Test AppStorage.SetAndProp with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndProp_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndProp_propName_null_001] START');
      try {
        const propName: string | null = null;
        const defaultValue: string = 'v';
        AppStorage.SetAndProp<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndProp_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndProp_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndProp_propName_undefined_001
     * @tc.name AppStorage_SetAndProp_propName_undefined_001
     * @tc.desc Test AppStorage.SetAndProp with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndProp_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndProp_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: string = 'v';
        AppStorage.SetAndProp<string>(propName, defaultValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndProp_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndProp_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndProp_defaultValue_null_001
     * @tc.name AppStorage_SetAndProp_defaultValue_null_001
     * @tc.desc Test AppStorage.SetAndProp with null defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndProp_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndProp_defaultValue_null_001] START');
      try {
        const propName: string = 'k_SetAndProp_null';
        const defaultValue: string | null = null;
        AppStorage.SetAndProp<string | null>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndProp_defaultValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndProp_defaultValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_SetAndProp_defaultValue_undefined_001
     * @tc.name AppStorage_SetAndProp_defaultValue_undefined_001
     * @tc.desc Test AppStorage.SetAndProp with undefined defaultValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetAndProp_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndProp_defaultValue_undefined_001] START');
      try {
        const propName: string = 'k_SetAndProp_undefined';
        const defaultValue: string | undefined = undefined;
        AppStorage.SetAndProp<string | undefined>(propName, defaultValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetAndProp_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetAndProp_defaultValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_set_propName_null_001
     * @tc.name AppStorage_set_propName_null_001
     * @tc.desc Test AppStorage.set with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_set_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'v';
        AppStorage.set<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_set_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_set_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_set_propName_undefined_001
     * @tc.name AppStorage_set_propName_undefined_001
     * @tc.desc Test AppStorage.set with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_set_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'v';
        AppStorage.set<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_set_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_set_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_set_newValue_null_001
     * @tc.name AppStorage_set_newValue_null_001
     * @tc.desc Test AppStorage.set with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_set_newValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_newValue_null_001] START');
      try {
        const propName: string = 'k_set_null';
        const newValue: string | null = null;
        AppStorage.set<string | null>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_set_newValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_set_newValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_set_newValue_undefined_001
     * @tc.name AppStorage_set_newValue_undefined_001
     * @tc.desc Test AppStorage.set with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_set_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_newValue_undefined_001] START');
      try {
        const propName: string = 'k_set_undefined';
        const newValue: string | undefined = undefined;
        AppStorage.set<string | undefined>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_set_newValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_set_newValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_Set_propName_null_001
     * @tc.name AppStorage_Set_propName_null_001
     * @tc.desc Test AppStorage.Set with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Set_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'v';
        AppStorage.Set<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Set_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Set_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_Set_propName_undefined_001
     * @tc.name AppStorage_Set_propName_undefined_001
     * @tc.desc Test AppStorage.Set with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Set_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'v';
        AppStorage.Set<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Set_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Set_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_Set_newValue_null_001
     * @tc.name AppStorage_Set_newValue_null_001
     * @tc.desc Test AppStorage.Set with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Set_newValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_newValue_null_001] START');
      try {
        const propName: string = 'k_Set_null';
        const newValue: string | null = null;
        AppStorage.Set<string | null>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Set_newValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Set_newValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_Set_newValue_undefined_001
     * @tc.name AppStorage_Set_newValue_undefined_001
     * @tc.desc Test AppStorage.Set with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Set_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_newValue_undefined_001] START');
      try {
        const propName: string = 'k_Set_undefined';
        const newValue: string | undefined = undefined;
        AppStorage.Set<string | undefined>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_Set_newValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Set_newValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setOrCreate_propName_null_001
     * @tc.name AppStorage_setOrCreate_propName_null_001
     * @tc.desc Test AppStorage.setOrCreate with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setOrCreate_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'v';
        AppStorage.setOrCreate<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setOrCreate_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setOrCreate_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_setOrCreate_propName_undefined_001
     * @tc.name AppStorage_setOrCreate_propName_undefined_001
     * @tc.desc Test AppStorage.setOrCreate with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setOrCreate_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'v';
        AppStorage.setOrCreate<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setOrCreate_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setOrCreate_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_setOrCreate_newValue_null_001
     * @tc.name AppStorage_setOrCreate_newValue_null_001
     * @tc.desc Test AppStorage.setOrCreate with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setOrCreate_newValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_newValue_null_001] START');
      try {
        const propName: string = 'k_setOrCreate_null';
        const newValue: string | null = null;
        AppStorage.setOrCreate<string | null>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setOrCreate_newValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setOrCreate_newValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_setOrCreate_newValue_undefined_001
     * @tc.name AppStorage_setOrCreate_newValue_undefined_001
     * @tc.desc Test AppStorage.setOrCreate with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_setOrCreate_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_newValue_undefined_001] START');
      try {
        const propName: string = 'k_setOrCreate_undefined';
        const newValue: string | undefined = undefined;
        AppStorage.setOrCreate<string | undefined>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_setOrCreate_newValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_setOrCreate_newValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_SetOrCreate_propName_null_001
     * @tc.name AppStorage_SetOrCreate_propName_null_001
     * @tc.desc Test AppStorage.SetOrCreate with null propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetOrCreate_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'v';
        AppStorage.SetOrCreate<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_propName_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetOrCreate_propName_null_001] END');
    });

    /**
     * @tc.number AppStorage_SetOrCreate_propName_undefined_001
     * @tc.name AppStorage_SetOrCreate_propName_undefined_001
     * @tc.desc Test AppStorage.SetOrCreate with undefined propName
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetOrCreate_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'v';
        AppStorage.SetOrCreate<string>(propName, newValue);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_propName_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetOrCreate_propName_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_SetOrCreate_newValue_null_001
     * @tc.name AppStorage_SetOrCreate_newValue_null_001
     * @tc.desc Test AppStorage.SetOrCreate with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetOrCreate_newValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_newValue_null_001] START');
      try {
        const propName: string = 'k_SetOrCreate_null';
        const newValue: string | null = null;
        AppStorage.SetOrCreate<string | null>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_newValue_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetOrCreate_newValue_null_001] END');
    });

    /**
     * @tc.number AppStorage_SetOrCreate_newValue_undefined_001
     * @tc.name AppStorage_SetOrCreate_newValue_undefined_001
     * @tc.desc Test AppStorage.SetOrCreate with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_SetOrCreate_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_newValue_undefined_001] START');
      try {
        const propName: string = 'k_SetOrCreate_undefined';
        const newValue: string | undefined = undefined;
        AppStorage.SetOrCreate<string | undefined>(propName, newValue);
        AppStorage.delete(propName);
        assertCallCompleted();
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_newValue_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_SetOrCreate_newValue_undefined_001] END');
    });

    /**
     * @tc.number AppStorage_clear_001
     * @tc.name AppStorage_clear_001
     * @tc.desc Test AppStorage.clear no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_clear_001', Level.LEVEL2, () => {
      console.info('[AppStorage_clear_001] START');
      try {
        AppStorage.setOrCreate<string>('tmpClear', '1');
        const r: boolean = AppStorage.clear();
        expect(typeof r).assertEqual('boolean');
      } catch (err) {
        console.error('[AppStorage_clear_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_clear_001] END');
    });

    /**
     * @tc.number AppStorage_Clear_001
     * @tc.name AppStorage_Clear_001
     * @tc.desc Test AppStorage.Clear no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AppStorage_Clear_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Clear_001] START');
      try {
        AppStorage.setOrCreate<string>('tmpClear', '1');
        const r: boolean = AppStorage.Clear();
        expect(typeof r).assertEqual('boolean');
      } catch (err) {
        console.error('[AppStorage_Clear_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AppStorage_Clear_001] END');
    });

  });
}
