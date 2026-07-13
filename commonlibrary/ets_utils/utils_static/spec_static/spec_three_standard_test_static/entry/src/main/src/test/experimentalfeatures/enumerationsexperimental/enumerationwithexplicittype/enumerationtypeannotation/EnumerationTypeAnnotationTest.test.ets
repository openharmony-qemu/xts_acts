'use static';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

const a: short = 1;
const b: short = 1;
const a1: int = 1;
const b1: int = 2;
const a2: byte = 1;
const b2: byte = 2;
const c: byte = 126;

class Enum0 {
  static readonly first: number = 2.3;
  static readonly second: number = 3.4;
  static readonly third: number = 4.5;
}

class Enum1 {
  static readonly first: number = 10e1;
  static readonly second: number = 1.1;
  static readonly third: number = 2.1;
}

class Enum2 {
  static readonly first: short = a;
  static readonly second: short = b;
  static readonly third: short = 0;
}

class Enum3 {
  static readonly first: byte = 1;
  static readonly second: byte = 2;
  static readonly third: byte = 1;
}

class Enum4 {
  static readonly first: int = a2;
  static readonly second: int = b2;
  static readonly third: int = b2 - 1;
}

class Enum5 {
  static readonly first: int = 1;
}

class Enum6 {
  static readonly first: number = 1.2;
}

class Enum7 {
  static readonly a: int = c;
  static readonly b: int = c + 1;
}

class Enum8 {
  static readonly a: byte = 126;
  static readonly b: byte = 127;
}

export default function EnumerationTypeAnnotationTest(): void {
  describe('EnumerationTypeAnnotationTest', () => {
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
     * @tc.number    SUB_ENUMERATION_TYPE_ANNOTATION_TEST_0100
     * @tc.name      testEnumerationTypeAnnotation0001
     * @tc.desc      Type annotation for enumeration for types int, long and double.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationTypeAnnotation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum0.first).assertEqual(2.3);
      expect(Enum0.second).assertEqual(3.4);
      expect(Enum0.third).assertEqual(4.5);
    });

    /**
     * @tc.number    SUB_ENUMERATION_TYPE_ANNOTATION_TEST_0300
     * @tc.name      testEnumerationTypeAnnotation0003
     * @tc.desc      Type annotation for enumeration for types int, long and double.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationTypeAnnotation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.first).assertEqual(a);
      expect(Enum2.second).assertEqual(b);
      expect(Enum2.third).assertEqual(b - 1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_TYPE_ANNOTATION_TEST_0600
     * @tc.name      testEnumerationTypeAnnotation0006
     * @tc.desc      Type annotation for enumeration for types int, long and double.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationTypeAnnotation0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum5.first).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_TYPE_ANNOTATION_TEST_0700
     * @tc.name      testEnumerationTypeAnnotation0007
     * @tc.desc      Type annotation for enumeration for types int, long and double.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationTypeAnnotation0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.first).assertEqual(1.2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_TYPE_ANNOTATION_TEST_0800
     * @tc.name      testEnumerationTypeAnnotation0008
     * @tc.desc      Type annotation for enumeration for types int, long and double.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationTypeAnnotation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.a).assertEqual(c);
    });
  })
}
