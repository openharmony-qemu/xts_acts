/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
// m_instance_method_overload: class A_inst, B_inst, foo1-foo2
class A_inst {
  foo1(x: A_inst): string {
    return 'foo1';
  }
  overload foo { foo1 }
}

class B_inst extends A_inst {
  foo2(x: B_inst): string {
    return 'foo2';
  }
  overload foo { foo2, foo1 }
}

// m_numeric_parameters: fB, fS, fI, fL, fF, fN
class A_num {
  fB(a: byte): string {
    return 'fB';
  }

  fS(a: short): string {
    return 'fS';
  }

  fI(a: number): string {
    return 'fI';
  }

  fL(a: long): string {
    return 'fL';
  }

  fF(a: float): string {
    return 'fF';
  }

  fN(a: number): string {
    return 'fN';
  }

  overload foo { fB, fS, fI, fL, fF, fN };
}

// m_enum_parameters: Color, SizeEnum, foo1-foo5
enum Color { Red, Green, Blue }

enum SizeEnum { S = 'S', M = 'M', L = 'L' }

class A_enum {
  foo1(a: number): string {
    return 'foo1';
  }

  foo2(a: string): string {
    return 'foo2';
  }

  foo3(a: Color): string {
    return 'foo3';
  }

  foo4(a: SizeEnum): string {
    return 'foo4';
  }

  foo5(a: Color|SizeEnum): string {
    return 'foo5';
  }

  overload foo { foo1, foo2, foo3, foo4, foo5 };
}

// m_array_and_tuple_parameters: foo1-foo4
class A_arr {
  foo1(a: [number, number]): string {
    return 'foo1';
  }

  foo2(a: [number, number]): string {
    return 'foo2';
  }

  foo3(a: number[]): string {
    return 'foo3';
  }

  foo4(a: number[]): string {
    return 'foo4';
  }

  overload foo { foo1, foo2, foo3, foo4 };
}

// m_optional_and_rest_parameters: foo1-foo4
class A_opt {
  foo1(a: 'a'|'b'): string {
    return 'foo1';
  }

  foo2(a: string): string {
    return 'foo2';
  }

  foo3(a: string, b?: number): string {
    return 'foo3';
  }

  foo4(a: string, ...b: number[]): string {
    return 'foo4';
  }

  overload foo { foo1, foo2, foo3, foo4 };
}

// m_subtyping_params: class A_sub, B_sub, foo1-foo2
class A_sub {}
class B_sub extends A_sub {}

class C_sub {
  foo1(a: A_sub): string {
    return 'foo1';
  }

  overload foo { foo1 }
}

class D_sub extends C_sub {
  foo2(a: B_sub): string {
    return 'foo2';
  }

  overload foo { foo2, foo1 }
}

// m_array_and_tuple_parameters variations with different overload order
class A_arr2 {
  foo1(a: [number, number]): string {
    return 'foo1';
  }

  foo2(a: [number, number]): string {
    return 'foo2';
  }

  foo3(a: number[]): string {
    return 'foo3';
  }

  foo4(a: number[]): string {
    return 'foo4';
  }

  overload foo { foo2, foo3, foo4, foo1 };
}

class A_arr3 {
  foo1(a: [number, number]): string {
    return 'foo1';
  }

  foo2(a: [number, number]): string {
    return 'foo2';
  }

  foo3(a: number[]): string {
    return 'foo3';
  }

  foo4(a: number[]): string {
    return 'foo4';
  }

  overload foo { foo3, foo4, foo1, foo2 };
}

class A_arr4 {
  foo1(a: [number, number]): string {
    return 'foo1';
  }

  foo2(a: [number, number]): string {
    return 'foo2';
  }

  foo3(a: number[]): string {
    return 'foo3';
  }

  foo4(a: number[]): string {
    return 'foo4';
  }

  overload foo { foo4, foo1, foo2, foo3 };
}

// overload_method tests
class A_overload {
  foo1(x: A_overload): string {
    return 'foo1';
  }

  overload foo { foo1 }
}

class B_overload extends A_overload {
  foo2(x: B_overload): string {
    return 'foo2';
  }

  overload foo { foo2, foo1 }
}

class C_overload {
  max2i(a: number, b: number): number {
    return 100 + (a > b ? a : b);
  }

  max2d(a: number, b: number): number {
    return 200 + (a > b ? a : b);
  }

  maxN(...a: number[]): number {
    let max: number = a[0];
    for (let x: number of a) {
      if (x > max) {
        max = x;
      }
    }
    return 300 + max;
  }

  overload maxFn { max2i, max2d, maxN };
}

export default function OverloadSetForClassInstanceMethodsTest():void {
  describe('OverloadSetForClassInstanceMethodsTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000100
     * @tc.name      testOverloadSetForClassInstanceMethods0001
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(a.foo(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000200
     * @tc.name      testOverloadSetForClassInstanceMethods0002
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(a.foo(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000300
     * @tc.name      testOverloadSetForClassInstanceMethods0003
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(a.foo(new A_inst()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000400
     * @tc.name      testOverloadSetForClassInstanceMethods0004
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(a.foo(new B_inst()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000500
     * @tc.name      testOverloadSetForClassInstanceMethods0005
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo2').assertEqual(b.foo(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000600
     * @tc.name      testOverloadSetForClassInstanceMethods0006
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(b.foo(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000700
     * @tc.name      testOverloadSetForClassInstanceMethods0007
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo2').assertEqual(b.foo(new B_inst()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000800
     * @tc.name      testOverloadSetForClassInstanceMethods0008
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(b.foo(new A_inst()));
    });

    // m_numeric_parameters_0-17
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_000900
     * @tc.name      testOverloadSetForClassInstanceMethods0009
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001000
     * @tc.name      testOverloadSetForClassInstanceMethods0010
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 2;
      let a: A_num = new A_num();
      expect('fS').assertEqual(a.foo(s));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001100
     * @tc.name      testOverloadSetForClassInstanceMethods0011
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 3;
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001200
     * @tc.name      testOverloadSetForClassInstanceMethods0012
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: long = 4;
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(l));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001300
     * @tc.name      testOverloadSetForClassInstanceMethods0013
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = 5.1;
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(f));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001400
     * @tc.name      testOverloadSetForClassInstanceMethods0014
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 6.2;
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(n));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001500
     * @tc.name      testOverloadSetForClassInstanceMethods0015
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001600
     * @tc.name      testOverloadSetForClassInstanceMethods0016
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(2));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001700
     * @tc.name      testOverloadSetForClassInstanceMethods0017
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(3));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001800
     * @tc.name      testOverloadSetForClassInstanceMethods0018
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_001900
     * @tc.name      testOverloadSetForClassInstanceMethods0019
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(5.1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002000
     * @tc.name      testOverloadSetForClassInstanceMethods0020
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(6.2));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002100
     * @tc.name      testOverloadSetForClassInstanceMethods0021
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(2));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002200
     * @tc.name      testOverloadSetForClassInstanceMethods0022
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(3));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002300
     * @tc.name      testOverloadSetForClassInstanceMethods0023
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fB').assertEqual(a.foo(4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002400
     * @tc.name      testOverloadSetForClassInstanceMethods0024
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(5.1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002500
     * @tc.name      testOverloadSetForClassInstanceMethods0025
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(6.2));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002600
     * @tc.name      testOverloadSetForClassInstanceMethods0026
     * @tc.desc      Overload Declarations - numeric parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_num = new A_num();
      expect('fI').assertEqual(a.foo(6.2));
    });

    // m_enum_parameters_0-19
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002700
     * @tc.name      testOverloadSetForClassInstanceMethods0027
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002800
     * @tc.name      testOverloadSetForClassInstanceMethods0028
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo("S"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_002900
     * @tc.name      testOverloadSetForClassInstanceMethods0029
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003000
     * @tc.name      testOverloadSetForClassInstanceMethods0030
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003100
     * @tc.name      testOverloadSetForClassInstanceMethods0031
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003200
     * @tc.name      testOverloadSetForClassInstanceMethods0032
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003300
     * @tc.name      testOverloadSetForClassInstanceMethods0033
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003400
     * @tc.name      testOverloadSetForClassInstanceMethods0034
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003500
     * @tc.name      testOverloadSetForClassInstanceMethods0035
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003600
     * @tc.name      testOverloadSetForClassInstanceMethods0036
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo("S"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003700
     * @tc.name      testOverloadSetForClassInstanceMethods0037
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003800
     * @tc.name      testOverloadSetForClassInstanceMethods0038
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_003900
     * @tc.name      testOverloadSetForClassInstanceMethods0039
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004000
     * @tc.name      testOverloadSetForClassInstanceMethods0040
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004100
     * @tc.name      testOverloadSetForClassInstanceMethods0041
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004200
     * @tc.name      testOverloadSetForClassInstanceMethods0042
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004300
     * @tc.name      testOverloadSetForClassInstanceMethods0043
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004400
     * @tc.name      testOverloadSetForClassInstanceMethods0044
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004500
     * @tc.name      testOverloadSetForClassInstanceMethods0045
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo2').assertEqual(a.foo(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004600
     * @tc.name      testOverloadSetForClassInstanceMethods0046
     * @tc.desc      Overload Declarations - enum parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum = new A_enum();
      expect('foo1').assertEqual(a.foo(Color.Red));
    });

    // m_array_and_tuple_parameters_0-11
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004700
     * @tc.name      testOverloadSetForClassInstanceMethods0047
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr = new A_arr();
      expect('foo1').assertEqual(a.foo([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004800
     * @tc.name      testOverloadSetForClassInstanceMethods0048
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr = new A_arr();
      expect('foo1').assertEqual(a.foo([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_004900
     * @tc.name      testOverloadSetForClassInstanceMethods0049
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr = new A_arr();
      expect('foo1').assertEqual(a.foo([5.6, 7.8]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005000
     * @tc.name      testOverloadSetForClassInstanceMethods0050
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr2 = new A_arr2();
      expect('foo2').assertEqual(a.foo([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005100
     * @tc.name      testOverloadSetForClassInstanceMethods0051
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr2 = new A_arr2();
      expect('foo2').assertEqual(a.foo([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005200
     * @tc.name      testOverloadSetForClassInstanceMethods0052
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr2 = new A_arr2();
      expect('foo2').assertEqual(a.foo([5.6, 7.8]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005300
     * @tc.name      testOverloadSetForClassInstanceMethods0053
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr3 = new A_arr3();
      expect('foo3').assertEqual(a.foo([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005400
     * @tc.name      testOverloadSetForClassInstanceMethods0054
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr3 = new A_arr3();
      expect('foo3').assertEqual(a.foo([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005500
     * @tc.name      testOverloadSetForClassInstanceMethods0055
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr3 = new A_arr3();
      expect('foo3').assertEqual(a.foo([5.6, 7.8]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005600
     * @tc.name      testOverloadSetForClassInstanceMethods0056
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr4 = new A_arr4();
      expect('foo4').assertEqual(a.foo([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005700
     * @tc.name      testOverloadSetForClassInstanceMethods0057
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr4 = new A_arr4();
      expect('foo4').assertEqual(a.foo([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005800
     * @tc.name      testOverloadSetForClassInstanceMethods0058
     * @tc.desc      Overload Declarations - array and tuple parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr4 = new A_arr4();
      expect('foo4').assertEqual(a.foo([5.6, 7.8]));
    });

    // m_optional_and_rest_parameters_0-3
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_005900
     * @tc.name      testOverloadSetForClassInstanceMethods0059
     * @tc.desc      Overload Declarations - optional and rest parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt = new A_opt();
      expect('foo1').assertEqual(a.foo("a"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006000
     * @tc.name      testOverloadSetForClassInstanceMethods0060
     * @tc.desc      Overload Declarations - optional and rest parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt = new A_opt();
      expect('foo1').assertEqual(a.foo("b"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006100
     * @tc.name      testOverloadSetForClassInstanceMethods0061
     * @tc.desc      Overload Declarations - optional and rest parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt = new A_opt();
      expect('foo2').assertEqual(a.foo("c"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006200
     * @tc.name      testOverloadSetForClassInstanceMethods0062
     * @tc.desc      Overload Declarations - optional and rest parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt = new A_opt();
      expect('foo3').assertEqual(a.foo("a", undefined));
    });

    // m_subtyping_params_0-7
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006300
     * @tc.name      testOverloadSetForClassInstanceMethods0063
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: C_sub = new C_sub();
      expect('foo1').assertEqual(c.foo(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006400
     * @tc.name      testOverloadSetForClassInstanceMethods0064
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: C_sub = new C_sub();
      expect('foo1').assertEqual(c.foo(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006500
     * @tc.name      testOverloadSetForClassInstanceMethods0065
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: C_sub = new C_sub();
      expect('foo1').assertEqual(c.foo(new A_sub()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006600
     * @tc.name      testOverloadSetForClassInstanceMethods0066
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: C_sub = new C_sub();
      expect('foo1').assertEqual(c.foo(new B_sub()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006700
     * @tc.name      testOverloadSetForClassInstanceMethods0067
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: D_sub = new D_sub();
      expect('foo1').assertEqual(c.foo(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006800
     * @tc.name      testOverloadSetForClassInstanceMethods0068
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: D_sub = new D_sub();
      expect('foo2').assertEqual(c.foo(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_006900
     * @tc.name      testOverloadSetForClassInstanceMethods0069
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: D_sub = new D_sub();
      expect('foo1').assertEqual(c.foo(new A_sub()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_007000
     * @tc.name      testOverloadSetForClassInstanceMethods0070
     * @tc.desc      Overload Declarations - subtyping parameters methods overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      let c: D_sub = new D_sub();
      expect('foo2').assertEqual(c.foo(new B_sub()));
    });

    // overload_method_0-4
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_007100
     * @tc.name      testOverloadSetForClassInstanceMethods0071
     * @tc.desc      Overload Resolution for Overload Declarations - method overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 1;
      let j: number = 2;
      let pi: number = 3.14;
      let a: C_overload = new C_overload();
      expect(102).assertEqual(a.maxFn(i, j));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_007200
     * @tc.name      testOverloadSetForClassInstanceMethods0072
     * @tc.desc      Overload Resolution for Overload Declarations - method overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 1;
      let j: number = 2;
      let pi: number = 3.14;
      let a: C_overload = new C_overload();
      expect(103.14).assertEqual(a.maxFn(i, pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_007300
     * @tc.name      testOverloadSetForClassInstanceMethods0073
     * @tc.desc      Overload Resolution for Overload Declarations - method overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 1;
      let j: number = 2;
      let pi: number = 3.14;
      let a: C_overload = new C_overload();
      expect(103.14).assertEqual(a.maxFn(pi, i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_007400
     * @tc.name      testOverloadSetForClassInstanceMethods0074
     * @tc.desc      Overload Resolution for Overload Declarations - method overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 1;
      let j: number = 2;
      let pi: number = 3.14;
      let a: C_overload = new C_overload();
      expect(105.5).assertEqual(a.maxFn(pi, 5.5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CLASS_INSTANCE_METHODS_007500
     * @tc.name      testOverloadSetForClassInstanceMethods0075
     * @tc.desc      Overload Resolution for Overload Declarations - method overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForClassInstanceMethods0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 1;
      let j: number = 2;
      let pi: number = 3.14;
      let a: C_overload = new C_overload();
      expect(304).assertEqual(a.maxFn(i, pi, 4));
    });
  })
}
