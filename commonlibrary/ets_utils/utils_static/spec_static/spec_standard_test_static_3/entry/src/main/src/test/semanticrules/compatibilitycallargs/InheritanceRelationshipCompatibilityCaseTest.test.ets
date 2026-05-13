import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';



async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}


class Parent1 {}
class Child1 extends Parent1 {}

class Parent2 {}
interface Parent3 {}
class Child2 extends Parent2 implements Parent3 {}

interface MyInterface1 {
  method(): void;
}
class MyClass1 implements MyInterface1 {
  method(): void {}
}

class Parent4<T> {}
class Child4<T> extends Parent4<T> {}

function checkTypeIdentity1(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

class GrandParent1 {}
class Parent5 extends GrandParent1 {}
class Child5 extends Parent5 {}

function checkTypeIdentity2(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

class Base1 {
  methodOne(_p: object): string {
    return "value";
  }
}
class Derived extends Base1 {
  override methodOne(_p: object): "derivedValue" {
    return "derivedValue";
  }
}
function checkTypeIdentity3(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

interface ParentInterface1 {}
interface ChildInterface1 extends ParentInterface1 {}

function checkTypeIdentity4(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

abstract class AbstractClass1 {}
class ConcreteClass1 extends AbstractClass1 {}

function checkTypeIdentity5(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}








export default function InheritanceRelationshipCompatibilityCaseTest(): void {
  describe('InheritanceRelationshipCompatibilityCaseTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0100
     * @tc.name      testInheritanceRelationshipCompatibilityCase0001
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0001';
      

      const val1: Child1 = new Child1();
      const val2: Parent1 = new Parent1();

      expect(val1 instanceof Child1).assertEqual(true);
      expect(val1 instanceof Parent1).assertEqual(true);
      expect(val2 instanceof Child1).assertEqual(false);
      expect(val2 instanceof Parent1).assertEqual(true);

    });

    /**
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0200
     * @tc.name      testInheritanceRelationshipCompatibilityCase0002
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0002';
      

      const val1: Child2 = new Child2();
      const val2: Parent2 = new Parent2();

      expect(val1 instanceof Parent2).assertEqual(true);
      expect(val1 instanceof Parent3).assertEqual(true);
      expect(val2 instanceof Parent3).assertEqual(false);
    });

    /**
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0300
     * @tc.name      testInheritanceRelationshipCompatibilityCase0003
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0003';
      

      const val1: MyClass1 = new MyClass1();
      const val2: MyInterface1 = { method(): void {} };

      expect(val1 instanceof MyClass1).assertEqual(true);
      expect(val1 instanceof MyInterface1).assertEqual(true);
      expect(val2 instanceof MyClass1).assertEqual(false);
      expect(val2 instanceof MyInterface1).assertEqual(true);
    });

    /**
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0400
     * @tc.name      testInheritanceRelationshipCompatibilityCase0004
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0004';
      

      const val1: Child4<string> = new Child4<string>();
      const val2: Parent4<string> = new Parent4<string>();

      const result1 = checkTypeIdentity1(val1, val2);
      expect(result1).assertEqual(false);
    });

    /**
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0500
     * @tc.name      testInheritanceRelationshipCompatibilityCase0005
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0005';
      

      const val1: Child5 = new Child5();
      const val2: GrandParent1 = new GrandParent1();

      const result1 = checkTypeIdentity2(val1, val2);
      expect(result1).assertEqual(false);
    });

    /**
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0600
     * @tc.name      testInheritanceRelationshipCompatibilityCase0006
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0006';
      

      let a = new Base1();
      let b = new Derived();
      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);
      const result1 = checkTypeIdentity3(resultA, resultB);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0700
     * @tc.name      testInheritanceRelationshipCompatibilityCase0007
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0007';
      

      const val1: ChildInterface1 = {};
      const val2: ParentInterface1 = {};

      const result1 = checkTypeIdentity4(val1, val2);
      expect(result1).assertEqual(false);
    });

    /**
     * @tc.number    SUB_INHERITANCE_RELATIONSHIP_COMPATIBILITY_CASE_0800
     * @tc.name      testInheritanceRelationshipCompatibilityCase0008
     * @tc.desc      Verifying compatibility between child class and parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("inheritancerelationshipcompatibilitycaseTest0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():
      void => {
      const TAG = 'inheritancerelationshipcompatibilitycaseTest0008';
      

      const val1: ConcreteClass1 = new ConcreteClass1();
      const val2: AbstractClass1 = new ConcreteClass1();

      const result1 = checkTypeIdentity5(val1, val2);
      expect(result1).assertEqual(true);
    });
  })
}
