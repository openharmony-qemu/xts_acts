'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from '../../Util.test'

let emptyArray0: number[] = [];
let emptyArray1: number[] = [];
let emptyArray2: number[] = [];
let emptyArray3: number[] = [];

type NOS0 = number | string;
type NOS1 = number | string;
type NOS2 = number | string;
type TL0 = () => number;
type TL1 = () => number;

class A0 {
  ind: string = '';
  val: number = 0.0;

  $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class A1 {
  ind: string = '';
  val: number = 0.0;

  $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }
}

class A2 {
  ind: string = '';
  val: number = 0.0;

  $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  private $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class A3 {
  ind: string = '';
  val: number = 0.0;

  $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class A4 {
  ind: string = '';
  val: number = 0.0;

  private $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class A5 {
  ind: string = '';
  val: number = 0.0;

  public $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  public $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class B5 extends A5 {
  push(ind: string, val: number) {
    super[ind] = val;
  }

  pull(ind: string): number {
    return super[ind];
  }
}

class A6 {
  ind: string = '';
  val: number = 0.0;

  protected $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  protected $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class B6 extends A6 {
  push(ind: string, val: number) {
    super[ind] = val;
  }

  pull(ind: string): number {
    return super[ind];
  }
}

class B7 {
  ind: string = '';
  val: number = 0.0;

  private $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  private $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }

  public push(ind: string, val: number) {
    this[ind] = val;
  }

  public pull(ind: string): number {
    return this[ind];
  }
}

class A8 {
  ind: string = '';
  val: number = 0.0;

  $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class A9 {
  ind: string = '';
  val: number[] = [];

  $_get(i: string): number[] {
    return i == this.ind ? this.val : emptyArray0;
  }

  $_set(i: string, v: number[]) {
    this.ind = i;
    this.val = v;
  }
}

class A10 {
  ind: int = 0;
  val: number[] = [];

  $_get(i: int): number[] {
    return i == this.ind ? this.val : emptyArray1;
  }

  $_set(i: int, v: number[]) {
    this.ind = i;
    this.val = v;
  }
}

class A11 {
  ind: int = 0;
  val: number[] = [];

  $_get(i: int): number[] {
    return i == this.ind ? this.val : emptyArray2;
  }

  $_set(i: int, v: number[]) {
    this.ind = i;
    this.val = v;
  }
}

class B12 {
  ind: int = 0;
  val: number[] = [];

  $_get(i: int): number[] {
    return i == this.ind ? this.val : emptyArray3;
  }

  $_set(i: int, v: number[]) {
    this.ind = i;
    this.val = v;
  }
}

class A12 {
  ind: int = 0;
  val: B12 = new B12();

  $_get(i: int): B12 {
    return i == this.ind ? this.val : new B12();
  }

  $_set(i: int, v: B12) {
    this.ind = i;
    this.val = v;
  }
}

class A13 {
  ind: string = '';
  val: number = 0.0;

  $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }
}

class A14 {
  ind: string = '';
  val: NOS0 = Number.NaN;

  $_get(i: string): NOS0 {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }

  $_set(i: string, v: string) {
    this.ind = i;
    this.val = v;
  }
}

class A15 {
  ind: string = '';
  val: NOS1 = Number.NaN;

  $_get(i: string): NOS1 {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }

  $_set(i: string, v: string) {
    this.ind = i;
    this.val = v;
  }
}

class A16 {
  ind: string = '';
  val: number = 0.0;

  $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: TL0) {
    this.ind = i;
    this.val = v();
  }
}

class A17 {
  ind: string = '';
  val: NOS2 = Number.NaN;

  $_get(i: string): NOS2 {
    return i == this.ind ? this.val : Number.NaN;
  }

  set_N(i: string, v: number) {
    this.ind = i;
    this.val = v;
  }

  set_S(i: string, v: string) {
    this.ind = i;
    this.val = v;
  }

  overload $_set { set_N, set_S }
}

class A18 {
  ind: string = '';
  val: number = 0.0;

  $_get(i: string): number {
    return i == this.ind ? this.val : Number.NaN;
  }

  $_set(i: string, v: TL1) {
    this.ind = i;
    this.val = v();
  }
}

export default function IndexableTypesTest(): void {
  describe('IndexableTypesTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0001
     * @tc.name      testIndexableTypesTest0001
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A0 = new A0();
      a['a'] = 42.0;
      expect(a['a']).assertEqual(42.0);
      a['a'] = 43.0;
      expect(a['a']).assertEqual(43.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0002
     * @tc.name      testIndexableTypesTest0002
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1();
      expect(Number.isNaN(a['a'])).assertEqual(true);
      expect(a['']).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0003
     * @tc.name      testIndexableTypesTest0003
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A2 = new A2();
      expect(Number.isNaN(a['a'])).assertEqual(true);
      expect(a['']).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0004
     * @tc.name      testIndexableTypesTest0004
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A3 = new A3();
      a['a'] = 42.0;
      expect(a.val).assertEqual(42.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0005
     * @tc.name      testIndexableTypesTest0005
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A4 = new A4();
      a['a'] = 42.0;
      expect(a.val).assertEqual(42.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0006
     * @tc.name      testIndexableTypesTest0006
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B5 = new B5();
      b.push('a', 11.0);
      expect(b.pull('a')).assertEqual(11.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0007
     * @tc.name      testIndexableTypesTest0007
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B6 = new B6();
      b.push('a', 11.0);
      expect(b.pull('a')).assertEqual(11.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0008
     * @tc.name      testIndexableTypesTest0008
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B7 = new B7();
      b.push('a', 11.0);
      expect(b.pull('a')).assertEqual(11.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0009
     * @tc.name      testIndexableTypesTest0009
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A8 = new A8();
      a.$_set('a', 42.0);
      expect(a.$_get('a')).assertEqual(42.0);
      a.$_set('a', 43.0);
      expect(a.$_get('a')).assertEqual(43.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0010
     * @tc.name      testIndexableTypesTest0010
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A9 = new A9();
      a['a'] = [42.0];
      expect(a['a'][0]).assertEqual(42.0);
      a['a'] = [43.0, 44.0];
      expect(a['a'][1]).assertEqual(44.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0011
     * @tc.name      testIndexableTypesTest0011
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A10 = new A10();
      a[0] = [42.0];
      expect(a[0][0]).assertEqual(42.0);
      a[1] = [43.0, 44.0];
      expect(a[1][1]).assertEqual(44.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0012
     * @tc.name      testIndexableTypesTest0012
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A11[] = [new A11(), new A11()];
      a[0][0] = [42.0];
      expect(a[0][0][0]).assertEqual(42.0);
      a[1][1] = [43.0, 44.0];
      expect(a[1][1][1]).assertEqual(44.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0013
     * @tc.name      testIndexableTypesTest0013
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A12 = new A12();
      let b1: B12 = new B12();
      a[0] = b1;
      a[0][0] = [42.0];
      expect(a[0][0][0]).assertEqual(42.0);

      let b2: B12 = new B12();
      a[1] = b2;
      a[1][1] = [43.0, 44.0];
      expect(a[1][1][1]).assertEqual(44.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0014
     * @tc.name      testIndexableTypesTest0014
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A13 = new A13();
      let sa = a.$_set;
      let sg = a.$_get;

      sa('a', 42.0);
      expect(sg('a')).assertEqual(42.0);
      sa('a', 43.0);
      expect(sg('a')).assertEqual(43.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0015
     * @tc.name      testIndexableTypesTest0015
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A14 = new A14();
      a.$_set('a', 42.0);
      expect(a.$_get('a')).assertEqual(42.0);
      a.$_set('a', '43.0');
      expect(a.$_get('a')).assertEqual('43.0');
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0016
     * @tc.name      testIndexableTypesTest0016
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A15 = new A15();
      a['a'] = 42.0;
      expect(a.$_get('a')).assertEqual(42.0);
      a['a'] = '43.0';
      expect(a.$_get('a')).assertEqual('43.0');
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0017
     * @tc.name      testIndexableTypesTest0017
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A16 = new A16();
      a.$_set('a', (): number => {
        return 42.0;
      });
      expect(a.$_get('a')).assertEqual(42.0);

      a.$_set('a', (): number => {
        return 43.0;
      });
      expect(a.$_get('a')).assertEqual(43.0);
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0018
     * @tc.name      testIndexableTypesTest0018
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A17 = new A17();
      a['a'] = 42.0;
      expect(a.$_get('a')).assertEqual(42.0);
      a.$_set('a', '43.0');
      expect(a.$_get('a')).assertEqual('43.0');
    });

    /**
     * @tc.number    SUB_INDEXABLE_TYPES_TEST_0019
     * @tc.name      testIndexableTypesTest0019
     * @tc.desc      If a class or an interface declares one or two functions with names $_get and
     *               $_set, and signatures (index: Type1): Type2 and (index: Type1, value: Type2) respectively,
     *               then an indexing expression can be applied to variables of such types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexableTypesTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A18 = new A18();
      a['a'] = (() => {
        return 42.0;
      });
      expect(a.$_get('a')).assertEqual(42.0);

      a['a'] = (() => {
        return 43.0;
      });
      expect(a.$_get('a')).assertEqual(43.0);
    });
  });
}