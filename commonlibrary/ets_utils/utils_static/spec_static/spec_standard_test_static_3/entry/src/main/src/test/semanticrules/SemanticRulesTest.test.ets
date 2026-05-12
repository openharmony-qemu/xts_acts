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
} from "../../../../hypium/index";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// Case 01
class Base01 {
  methodOne(p: Base01): Base01 {
    return p;
  }
}

class Derived01 extends Base01 {
  override methodOne(p: Base01): Base01 {
    return p;
  }
}

// Case 02
class Base02 {
  methodOne(p: Base02): string {
    return "base";
  }
}

class Derived02 extends Base02 {
  override methodOne(p: Base02): string {
    return "derived";
  }
}

// Case 03
class Base03 {
  methodOne(p: Base03): Base03 | null {
    return p;
  }
}

class Derived03 extends Base03 {
  override methodOne(p: Base03): Base03 | null {
    return p;
  }
}

// Case 04
class Base04 {
  methodOne(p: Base04): Base04 | undefined {
    return p;
  }
}

class Derived04 extends Base04 {
  override methodOne(p: Base04): Base04 | undefined {
    return p;
  }
}

// Case 05
enum MyEnum05 {
  A,
  B
}

class Base05 {
  methodOne(p: Base05): MyEnum05 {
    return MyEnum05.A;
  }
}

class Derived05 extends Base05 {
  override methodOne(p: Base05): MyEnum05 {
    return MyEnum05.A;
  }
}

// Case 07
class Base07 {
  methodOne(p: Base07): Base07 {
    return p;
  }
}

class Derived07 extends Base07 {
  override methodOne(p: Base07): Base07 {
    return p;
  }
}

// Case 08
class Base08 {
  methodOne(p: Base08): Base08 {
    return p;
  }
}

class Derived08 extends Base08 {
  override methodOne(p: Base08): Base08 {
    return p;
  }
}

// Case 09
class Base09 {
  methodOne(p: Base09): "literal" {
    return "literal";
  }
}

class Derived09 extends Base09 {
  override methodOne(p: Base09): "literal" {
    return "literal";
  }
}

// Case 12
class Base12 {
  methodOne(p: Base12): Base12 {
    return p;
  }
}

class Derived12 extends Base12 {
  override methodOne(p: Base12): Base12 {
    return p;
  }
}

// Case 13
class Base13 {
  public methodOne(p: Base13): Base13 {
    return p;
  }
}

class Derived13 extends Base13 {
  public override methodOne(p: Base13): Base13 {
    return p;
  }
}

// Case 14
class Base14 {
  methodOne(p: Base14 = new Base14()): Base14 {
    return p;
  }
}

class Derived14 extends Base14 {
  override methodOne(p: Base14 = new Base14()): Base14 {
    return p;
  }
}

// Case 15
class Base15 {
  methodOne(...p: Base15[]): Base15 {
    return p[0];
  }
}

class Derived15 extends Base15 {
  override methodOne(...p: Base15[]): Base15 {
    return p[0];
  }
}

// Case 16
class Base16 {
  methodOne(p: Base16): Base16 | null {
    return p;
  }
}

class Derived16 extends Base16 {
  override methodOne(p: Base16): Base16 | null {
    return p;
  }
}

// Case 17
class Base17 {
  methodOne(p: Base17): void {
    console.log("Base methodOne called");
  }
}

class Derived17 extends Base17 {
  override methodOne(p: Base17): void {
    console.log("Derived methodOne called");
  }
}

// Case 18
class Base18 {
  methodOne(p: Base18): never {
    throw new Error("Never");
  }
}

class Derived18 extends Base18 {
  override methodOne(p: Base18): never {
    throw new Error("Never");
  }
}

// Case 19
class Base19 {
  methodOne(p: Base19): () => void {
    return () => {};
  }
}

class Derived19 extends Base19 {
  override methodOne(p: Base19): () => void {
    return () => {};
  }
}

// Case 20
class Base20 {
  methodOne(p: Base20): number {
    return 1;
  }
}

class Derived20 extends Base20 {
  override methodOne(p: Base20): number {
    return 1;
  }
}

// Case 21
class Base21 {
  methodOne(p: Base21): string {
    return this.process("base");
  }

  protected process(value: string): string {
    return value;
  }
}

class Derived21 extends Base21 {
  override methodOne(p: Base21): string {
    return this.process("derived");
  }
}

// Case 25
class Base25<T> {
  methodOne(p: T): T {
    return p;
  }
}

class Derived25<T> extends Base25<T> {
  override methodOne(p: T): T {
    return p;
  }
}

// Case 26
class Base26 {
  methodOne(p: Base26): never {
    throw new Error("Never");
  }
}

class Derived26 extends Base26 {
  override methodOne(p: Base26): never {
    throw new Error("Never");
  }
}

export default function SemanticRulesTest():void {
  describe('SemanticRulesTest', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0100
     * @tc.name      testSemanticRules0001
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0001';
      console.log(TAG + ' start');

      let a = new Base01();
      let b = new Derived01();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0200
     * @tc.name      testSemanticRules0002
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0002';
      console.log(TAG + ' start');

      let a = new Base02();
      let b = new Derived02();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA !== resultB).assertTrue();
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0300
     * @tc.name      testSemanticRules0003
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0003';
      console.log(TAG + ' start');

      let a = new Base03();
      let b = new Derived03();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0400
     * @tc.name      testSemanticRules0004
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0004';
      console.log(TAG + ' start');

      let a = new Base04();
      let b = new Derived04();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0500
     * @tc.name      testSemanticRules0005
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0005';
      console.log(TAG + ' start');

      let a = new Base05();
      let b = new Derived05();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0700
     * @tc.name      testSemanticRules0007
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0007';
      console.log(TAG + ' start');

      let a = new Base07();
      let b = new Derived07();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0800
     * @tc.name      testSemanticRules0008
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0008';
      console.log(TAG + ' start');

      let a = new Base08();
      let b = new Derived08();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_0900
     * @tc.name      testSemanticRules0009
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0009';
      console.log(TAG + ' start');

      let a = new Base09();
      let b = new Derived09();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1200
     * @tc.name      testSemanticRules0012
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0012';
      console.log(TAG + ' start');

      let a = new Base12();
      let b = new Derived12();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1300
     * @tc.name      testSemanticRules0013
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0013';
      console.log(TAG + ' start');

      let a = new Base13();
      let b = new Derived13();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1400
     * @tc.name      testSemanticRules0014
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0014';
      console.log(TAG + ' start');

      let a = new Base14();
      let b = new Derived14();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1500
     * @tc.name      testSemanticRules0015
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0015';
      console.log(TAG + ' start');

      let a = new Base15();
      let b = new Derived15();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1600
     * @tc.name      testSemanticRules0016
     * @tc.desc      The notion of the least upper bound (LUB) is used where a single type must be
     *               found that is a common supertype for a set of reference types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0016';
      console.log(TAG + ' start');

      let a = new Base16();
      let b = new Derived16();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1700
     * @tc.name      testSemanticRules0017
     * @tc.desc      Ensuring that method override in subclasses keeps void return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0017';
      console.log(TAG + ' start');

      let a = new Base17();
      let b = new Derived17();

      a.methodOne(a);
      b.methodOne(a);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1800
     * @tc.name      testSemanticRules0018
     * @tc.desc      Ensuring that method override in subclasses keeps never return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0018';
      console.log(TAG + ' start');

      let a = new Base18();
      let b = new Derived18();

      try {
        a.methodOne(a);
      } catch (e) {}

      try {
        b.methodOne(a);
      } catch (e) {}
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_1900
     * @tc.name      testSemanticRules0019
     * @tc.desc      Ensuring that method override in subclasses keeps function return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0019';
      console.log(TAG + ' start');

      let a = new Base19();
      let b = new Derived19();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(typeof resultA).assertEqual(typeof resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_2000
     * @tc.name      testSemanticRules0020
     * @tc.desc      Ensuring that method override in subclasses keeps number return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0020';
      console.log(TAG + ' start');

      let a = new Base20();
      let b = new Derived20();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_2100
     * @tc.name      testSemanticRules0021
     * @tc.desc      Ensuring that method override in subclasses keeps Promise return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0021';
      console.log(TAG + ' start');

      let a = new Base21();
      let b = new Derived21();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual("base");
      expect(resultB).assertEqual("derived");
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_2500
     * @tc.name      testSemanticRules0025
     * @tc.desc      Ensuring that method override in subclasses keeps generic return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0025';
      console.log(TAG + ' start');

      let a = new Base25<number>();
      let b = new Derived25<number>();

      let resultA = a.methodOne(1);
      let resultB = b.methodOne(1);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TEST_2600
     * @tc.name      testSemanticRules0026
     * @tc.desc      Ensuring that method override in subclasses keeps never return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRules0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSemanticRules0026';
      console.log(TAG + ' start');

      let a = new Base26();
      let b = new Derived26();

      try {
        a.methodOne(a);
      } catch (e) {
      }

      try {
        b.methodOne(a);
      } catch (e) {
      }
    });

  })

}
