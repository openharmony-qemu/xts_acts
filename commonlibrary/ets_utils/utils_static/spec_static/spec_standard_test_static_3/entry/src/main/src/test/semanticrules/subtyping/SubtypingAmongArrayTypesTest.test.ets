import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';


class B {}

class B2 {}

class A {}

class B3 extends A {
  private constructor() {
    super();
  }

  static create(): B3 {
    return new B3();
  }
}

export default function SubtypingAmongArrayTypesTest(): void {
  describe('SubtypingAmongArrayTypesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0100
     * @tc.name      testSubtypingAmongArrayTypes0001
     * @tc.desc      Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStaticAndInstanceFields0001';
      let a: number[];
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0200
     * @tc.name      testSubtypingAmongArrayTypes0002
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1 = new B();
      let b2 = new B();
      let instance: Object = [b1, b2];
      expect((instance as B[])[0]).assertEqual(b1);
      expect((instance as B[])[1]).assertEqual(b2);
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0300
     * @tc.name      testSubtypingAmongArrayTypes0003
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStaticAndInstanceFields0003';

      let b1 = new B2();
      let b2 = new B2();
      let instance: Object[] = [b1, b2];
      expect(instance[0] instanceof B2).assertTrue();
      expect(instance[1] instanceof B2).assertTrue();
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0400
     * @tc.name      testSubtypingAmongArrayTypes0004
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStaticAndInstanceFields0004';

      let b1 = B3.create();
      let b2 = B3.create();
      let instance: A[] = [b1, b2];
      expect(instance[0] instanceof A).assertTrue();
      expect(instance[0] instanceof B3).assertTrue();
      expect(instance[1] instanceof A).assertTrue();
      expect(instance[1] instanceof B3).assertTrue();
    })

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0500
     * @tc.name      testSubtypingAmongArrayTypes0005
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStaticAndInstanceFields0005';

      let instance: Object[] = [1, 2];
      expect(typeof instance[0]).assertEqual('int');
      expect(typeof instance[1]).assertEqual('int');
    });
  })
}