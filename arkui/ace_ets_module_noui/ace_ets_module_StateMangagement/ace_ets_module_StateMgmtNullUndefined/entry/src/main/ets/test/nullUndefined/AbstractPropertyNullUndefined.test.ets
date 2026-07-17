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
import { assertUnexpectedError } from './NullUndefinedAssertHelper';

export default function abstractPropertyNullUndefinedTest() {
  describe('AbstractPropertyNullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[AbstractPropertyNullUndefinedTest] beforeAll');
    });
    beforeEach(() => {
      console.info('[AbstractPropertyNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[AbstractPropertyNullUndefinedTest] afterEach');
    });
    afterAll(() => {
      console.info('[AbstractPropertyNullUndefinedTest] afterAll');
    });

    /**
     * @tc.number AbstractProperty_set_null_001
     * @tc.name AbstractProperty_set_null_001
     * @tc.desc Test AbstractProperty.set with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AbstractProperty_set_null_001', Level.LEVEL2, () => {
      console.info('[AbstractProperty_set_null_001] START');
      try {
        const propName: string = 'abs_set_null';
        const prop: AbstractProperty<string | null> =
          AppStorage.setAndRef<string | null>(propName, 'init');
        prop.set(null);
        expect(AppStorage.get<string | null>(propName)).assertEqual(null);
        AppStorage.delete(propName);
      } catch (err) {
        console.error('[AbstractProperty_set_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AbstractProperty_set_null_001] END');
    });

    /**
     * @tc.number AbstractProperty_set_undefined_001
     * @tc.name AbstractProperty_set_undefined_001
     * @tc.desc Test AbstractProperty.set with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('AbstractProperty_set_undefined_001', Level.LEVEL2, () => {
      console.info('[AbstractProperty_set_undefined_001] START');
      try {
        const propName: string = 'abs_set_undefined';
        const prop: AbstractProperty<string | undefined> =
          AppStorage.setAndRef<string | undefined>(propName, 'init');
        prop.set(undefined);
        expect(AppStorage.get<string | undefined>(propName)).assertEqual(undefined);
        AppStorage.delete(propName);
      } catch (err) {
        console.error('[AbstractProperty_set_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[AbstractProperty_set_undefined_001] END');
    });

    /**
     * @tc.number SubscribedAbstractProperty_set_null_001
     * @tc.name SubscribedAbstractProperty_set_null_001
     * @tc.desc Test SubscribedAbstractProperty.set with null newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('SubscribedAbstractProperty_set_null_001', Level.LEVEL2, () => {
      console.info('[SubscribedAbstractProperty_set_null_001] START');
      try {
        const propName: string = 'sub_set_null';
        const prop: SubscribedAbstractProperty<string | null> =
          AppStorage.setAndLink<string | null>(propName, 'init');
        prop.set(null);
        expect(AppStorage.get<string | null>(propName)).assertEqual(null);
        prop.aboutToBeDeleted();
        AppStorage.delete(propName);
      } catch (err) {
        console.error('[SubscribedAbstractProperty_set_null_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[SubscribedAbstractProperty_set_null_001] END');
    });

    /**
     * @tc.number SubscribedAbstractProperty_set_undefined_001
     * @tc.name SubscribedAbstractProperty_set_undefined_001
     * @tc.desc Test SubscribedAbstractProperty.set with undefined newValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('SubscribedAbstractProperty_set_undefined_001', Level.LEVEL2, () => {
      console.info('[SubscribedAbstractProperty_set_undefined_001] START');
      try {
        const propName: string = 'sub_set_undefined';
        const prop: SubscribedAbstractProperty<string | undefined> =
          AppStorage.setAndLink<string | undefined>(propName, 'init');
        prop.set(undefined);
        expect(AppStorage.get<string | undefined>(propName)).assertEqual(undefined);
        prop.aboutToBeDeleted();
        AppStorage.delete(propName);
      } catch (err) {
        console.error('[SubscribedAbstractProperty_set_undefined_001] Error: ' +
          JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[SubscribedAbstractProperty_set_undefined_001] END');
    });
  });
}
