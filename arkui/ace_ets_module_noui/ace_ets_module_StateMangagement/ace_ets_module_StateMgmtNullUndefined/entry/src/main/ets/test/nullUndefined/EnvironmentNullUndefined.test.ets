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

export default function environmentNullUndefinedTest() {
  describe('EnvironmentNullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[EnvironmentNullUndefinedTest] beforeAll');
    });
    beforeEach(() => {
      console.info('[EnvironmentNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[EnvironmentNullUndefinedTest] afterEach');
    });
    afterAll(() => {
      console.info('[EnvironmentNullUndefinedTest] afterAll');
    });

    /**
     * @tc.number Environment_envProp_key_null_001
     * @tc.name Environment_envProp_key_null_001
     * @tc.desc Test Environment.envProp with null key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_envProp_key_null_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_key_null_001] START');
      try {
        const key: string | null = null;
        Environment.envProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_envProp_key_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_envProp_key_null_001] END');
    });

    /**
     * @tc.number Environment_envProp_key_undefined_001
     * @tc.name Environment_envProp_key_undefined_001
     * @tc.desc Test Environment.envProp with undefined key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_envProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        Environment.envProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_envProp_key_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_envProp_key_undefined_001] END');
    });

    /**
     * @tc.number Environment_envProp_value_null_001
     * @tc.name Environment_envProp_value_null_001
     * @tc.desc Test Environment.envProp with null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_envProp_value_null_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_value_null_001] START');
      try {
        const value: string | null = null;
        Environment.envProp<string | null>('env_k_null', value);
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_envProp_value_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_envProp_value_null_001] END');
    });

    /**
     * @tc.number Environment_envProp_value_undefined_001
     * @tc.name Environment_envProp_value_undefined_001
     * @tc.desc Test Environment.envProp with undefined value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_envProp_value_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_value_undefined_001] START');
      try {
        const value: string | undefined = undefined;
        Environment.envProp<string | undefined>('env_k_undefined', value);
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_envProp_value_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_envProp_value_undefined_001] END');
    });

    /**
     * @tc.number Environment_EnvProp_key_null_001
     * @tc.name Environment_EnvProp_key_null_001
     * @tc.desc Test Environment.EnvProp with null key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_EnvProp_key_null_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_key_null_001] START');
      try {
        const key: string | null = null;
        Environment.EnvProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_EnvProp_key_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_EnvProp_key_null_001] END');
    });

    /**
     * @tc.number Environment_EnvProp_key_undefined_001
     * @tc.name Environment_EnvProp_key_undefined_001
     * @tc.desc Test Environment.EnvProp with undefined key
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_EnvProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        Environment.EnvProp<string>(key, 'default');
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_EnvProp_key_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_EnvProp_key_undefined_001] END');
    });

    /**
     * @tc.number Environment_EnvProp_value_null_001
     * @tc.name Environment_EnvProp_value_null_001
     * @tc.desc Test Environment.EnvProp with null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_EnvProp_value_null_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_value_null_001] START');
      try {
        const value: string | null = null;
        Environment.EnvProp<string | null>('env_k_null', value);
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_EnvProp_value_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_EnvProp_value_null_001] END');
    });

    /**
     * @tc.number Environment_EnvProp_value_undefined_001
     * @tc.name Environment_EnvProp_value_undefined_001
     * @tc.desc Test Environment.EnvProp with undefined value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_EnvProp_value_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_value_undefined_001] START');
      try {
        const value: string | undefined = undefined;
        Environment.EnvProp<string | undefined>('env_k_undefined', value);
        assertCallCompleted();
      } catch (err) {
        console.error('[Environment_EnvProp_value_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_EnvProp_value_undefined_001] END');
    });

    /**
     * @tc.number Environment_envProps_props_null_001
     * @tc.name Environment_envProps_props_null_001
     * @tc.desc Test Environment.envProps with null props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_envProps_props_null_001', Level.LEVEL2, () => {
      console.info('[Environment_envProps_props_null_001] START');
      assertExpectedError(() => {
        Environment.envProps(null);
      }, 'Environment_envProps_props_null_001');
      console.info('[Environment_envProps_props_null_001] END');
    });

    /**
     * @tc.number Environment_envProps_props_undefined_001
     * @tc.name Environment_envProps_props_undefined_001
     * @tc.desc Test Environment.envProps with undefined props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_envProps_props_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_envProps_props_undefined_001] START');
      assertExpectedError(() => {
        Environment.envProps(undefined);
      }, 'Environment_envProps_props_undefined_001');
      console.info('[Environment_envProps_props_undefined_001] END');
    });

    /**
     * @tc.number Environment_EnvProps_props_null_001
     * @tc.name Environment_EnvProps_props_null_001
     * @tc.desc Test Environment.EnvProps with null props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_EnvProps_props_null_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProps_props_null_001] START');
      assertExpectedError(() => {
        Environment.EnvProps(null);
      }, 'Environment_EnvProps_props_null_001');
      console.info('[Environment_EnvProps_props_null_001] END');
    });

    /**
     * @tc.number Environment_EnvProps_props_undefined_001
     * @tc.name Environment_EnvProps_props_undefined_001
     * @tc.desc Test Environment.EnvProps with undefined props
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_EnvProps_props_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProps_props_undefined_001] START');
      assertExpectedError(() => {
        Environment.EnvProps(undefined);
      }, 'Environment_EnvProps_props_undefined_001');
      console.info('[Environment_EnvProps_props_undefined_001] END');
    });

    /**
     * @tc.number Environment_keys_001
     * @tc.name Environment_keys_001
     * @tc.desc Test Environment.keys no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_keys_001', Level.LEVEL2, () => {
      console.info('[Environment_keys_001] START');
      try {
        const keys: Array<string> = Environment.keys();
        expect(Array.isArray(keys)).assertTrue();
      } catch (err) {
        console.error('[Environment_keys_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_keys_001] END');
    });

    /**
     * @tc.number Environment_Keys_001
     * @tc.name Environment_Keys_001
     * @tc.desc Test Environment.Keys no params
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Environment_Keys_001', Level.LEVEL2, () => {
      console.info('[Environment_Keys_001] START');
      try {
        const keys: Array<string> = Environment.Keys();
        expect(Array.isArray(keys)).assertTrue();
      } catch (err) {
        console.error('[Environment_Keys_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[Environment_Keys_001] END');
    });

  });
}
