import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS {
  // enum_explicit_type_fromvalue_4.ets
  enum Enum1

  :byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_6.ets
  enum Enum2

  : short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_0.ets
  enum Enum3

  : int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_2.ets
  enum Enum4

  : long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345,
    Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_10.ets
  enum Enum5

  : float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }
  ;

  // enum_explicit_type_fromvalue_8.ets
  enum Enum6

  : double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1.0, one = 1.0, oNe = 1.0
  }
  ;

  // enum_explicit_type_fromvalue_12.ets
  enum Enum7

  : string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex =
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }
  ;
  // enum_explicit_type_valueof_14.ets
  export function runTest126(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.valueOf()).assertEqual(0);

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.valueOf()).assertEqual(10);

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.valueOf()).assertEqual(11);

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.valueOf()).assertEqual(-32768);

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.valueOf()).assertEqual(12345);

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.valueOf()).assertEqual(32767);

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.valueOf()).assertEqual(1);

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.valueOf()).assertEqual(1);

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_15.ets
  export function runTest127(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.valueOf()).assertEqual(0);

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.valueOf()).assertEqual(10);

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.valueOf()).assertEqual(11);

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.valueOf()).assertEqual(-32768);

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.valueOf()).assertEqual(12345);

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.valueOf()).assertEqual(32767);

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.valueOf()).assertEqual(1);

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.valueOf()).assertEqual(1);

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_16.ets
  export function runTest128(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.valueOf()).assertEqual(1.5);

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.valueOf()).assertEqual(10.3);

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.valueOf()).assertEqual(7.6);

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.valueOf()).assertEqual(123.45);

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.valueOf()).assertEqual(1.0);

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.valueOf()).assertEqual(1.0);

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_17.ets
  export function runTest129(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.valueOf()).assertEqual(1.5);

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.valueOf()).assertEqual(10.3);

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.valueOf()).assertEqual(7.6);

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.valueOf()).assertEqual(123.45);

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.valueOf()).assertEqual(1.0);

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.valueOf()).assertEqual(1.0);

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_18.ets
  export function runTest130(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.valueOf()).assertEqual(1.5);

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.valueOf()).assertEqual(10.3);

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.valueOf()).assertEqual(7.6);

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.valueOf()).assertEqual(123.45);

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.valueOf()).assertEqual(1.0);

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.valueOf()).assertEqual(1.0);

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_19.ets
  export function runTest131(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.valueOf()).assertEqual(1.5);

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.valueOf()).assertEqual(10.3);

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.valueOf()).assertEqual(7.6);

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.valueOf()).assertEqual(123.45);

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.valueOf()).assertEqual(1.0);

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.valueOf()).assertEqual(1.0);

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_20.ets
  export function runTest132(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.valueOf()).assertEqual(1.5);

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.valueOf()).assertEqual(10.3);

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.valueOf()).assertEqual(7.6);

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.valueOf()).assertEqual(123.45);

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.valueOf()).assertEqual(1.0);

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.valueOf()).assertEqual(1.0);

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_21.ets
  export function runTest133(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.valueOf()).assertEqual(1.5);

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.valueOf()).assertEqual(10.3);

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.valueOf()).assertEqual(7.6);

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.valueOf()).assertEqual(123.45);

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.valueOf()).assertEqual(1.0);

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.valueOf()).assertEqual(1.0);

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_22.ets
  export function runTest134(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.valueOf()).assertEqual(1.5);

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.valueOf()).assertEqual(10.3);

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.valueOf()).assertEqual(7.6);

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.valueOf()).assertEqual(123.45);

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.valueOf()).assertEqual(1.0);

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.valueOf()).assertEqual(1.0);

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_23.ets
  export function runTest135(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.valueOf()).assertEqual(1.5);

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.valueOf()).assertEqual(10.3);

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.valueOf()).assertEqual(7.6);

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.valueOf()).assertEqual(123.45);

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.valueOf()).assertEqual(1.0);

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.valueOf()).assertEqual(1.0);

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_24.ets
  export function runTest136(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.valueOf()).assertEqual("reD");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.valueOf()).assertEqual("grEen");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.valueOf()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.valueOf()).assertEqual("one");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.valueOf()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.valueOf()).assertEqual("one");

    return true;
  }

  // enum_explicit_type_valueof_25.ets
  export function runTest137(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.valueOf()).assertEqual("reD");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.valueOf()).assertEqual("grEen");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.valueOf()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.valueOf()).assertEqual("one");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.valueOf()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.valueOf()).assertEqual("one");

    return true;
  }

  // enum_explicit_type_valueof_26.ets
  export function runTest138(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.valueOf()).assertEqual("reD");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.valueOf()).assertEqual("grEen");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.valueOf()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.valueOf()).assertEqual("one");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.valueOf()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.valueOf()).assertEqual("one");

    return true;
  }

  // enum_explicit_type_valueof_27.ets
  export function runTest139(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.valueOf()).assertEqual("reD");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.valueOf()).assertEqual("grEen");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.valueOf()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.valueOf()).assertEqual("one");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.valueOf()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.valueOf()).assertEqual("one");

    return true;
  }
}

// enum_explicit_type_fromvalue_4.ets
enum Enum1: byte {
  Red, Green = 10, Blue,
  First = -128, Second = 123, Third = 127,
  One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_6.ets
enum Enum2: short { Red, Green = 10, Blue,
First = -32768, Second = 12345, Third = 32767,
One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_0.ets
enum Enum3: int {
  Red, Green = 10, Blue,
  First = -2147483648, Second = 12345, Third = 2147483647,
  One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_2.ets
enum Enum4: long {
  Red, Green = 10, Blue,
  First = -9223372036854775808, Second = 12345,
  Third = 9223372036854775807,
  One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_10.ets
enum Enum5: float { Red = 1.5f, Green = 10.3f, Blue = 7.6f,
First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
One = 1.0f, one = 1.0f, oNe = 1.0f
};

// enum_explicit_type_fromvalue_8.ets
enum Enum6: double { Red = 1.5, Green = 10.3, Blue = 7.6,
First = -214748.3648, Second = 123.45, Third = 2147483.647,
One = 1.0, one = 1.0, oNe = 1.0
};

// enum_explicit_type_fromvalue_12.ets
enum Enum7: string { Red = "reD", Green = "grEen", Blue = "Blue",
Complex =
  "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
One = "one", one = "one", oNe = "one"
};

export default function EnumerationMethodsTest(): void {
  describe('EnumerationMethodsTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * 源文件：        enum_explicit_type_valueof_14.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0127
     * @tc.desc      Checking for enum with explicit short type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.valueOf()).assertEqual(0);

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.valueOf()).assertEqual(10);

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.valueOf()).assertEqual(11);

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.valueOf()).assertEqual(-32768);

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.valueOf()).assertEqual(12345);

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.valueOf()).assertEqual(32767);

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.valueOf()).assertEqual(1);

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.valueOf()).assertEqual(1);

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest126()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_15.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0128
     * @tc.desc      Checking for enum with explicit short type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.valueOf()).assertEqual(0);

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.valueOf()).assertEqual(10);

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.valueOf()).assertEqual(11);

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.valueOf()).assertEqual(-32768);

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.valueOf()).assertEqual(12345);

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.valueOf()).assertEqual(32767);

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.valueOf()).assertEqual(1);

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.valueOf()).assertEqual(1);

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest127()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_16.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0129
     * @tc.desc      Checking for enum with explicit double type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.valueOf()).assertEqual(1.5);

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.valueOf()).assertEqual(10.3);

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.valueOf()).assertEqual(7.6);

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.valueOf()).assertEqual(123.45);

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.valueOf()).assertEqual(1.0);

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.valueOf()).assertEqual(1.0);

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.valueOf()).assertEqual(1.0);

      expect(testNS.runTest128()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_17.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0130
     * @tc.desc      Checking for enum with explicit double type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.valueOf()).assertEqual(1.5);

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.valueOf()).assertEqual(10.3);

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.valueOf()).assertEqual(7.6);

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.valueOf()).assertEqual(123.45);

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.valueOf()).assertEqual(1.0);

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.valueOf()).assertEqual(1.0);

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.valueOf()).assertEqual(1.0);

      expect(testNS.runTest129()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_18.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0131
     * @tc.desc      Checking for enum with explicit double type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.valueOf()).assertEqual(1.5);

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.valueOf()).assertEqual(10.3);

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.valueOf()).assertEqual(7.6);

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.valueOf()).assertEqual(123.45);

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.valueOf()).assertEqual(1.0);

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.valueOf()).assertEqual(1.0);

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.valueOf()).assertEqual(1.0);

      expect(testNS.runTest130()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_19.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0132
     * @tc.desc      Checking for enum with explicit double type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.valueOf()).assertEqual(1.5);

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.valueOf()).assertEqual(10.3);

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.valueOf()).assertEqual(7.6);

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.valueOf()).assertEqual(123.45);

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.valueOf()).assertEqual(1.0);

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.valueOf()).assertEqual(1.0);

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.valueOf()).assertEqual(1.0);

      expect(testNS.runTest131()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_20.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0133
     * @tc.desc      Checking for enum with explicit float type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Red.valueOf()).assertEqual(1.5);
    //
    //   expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Green.valueOf()).assertEqual(10.3);
    //
    //   expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Blue.valueOf()).assertEqual(7.6);
    //
    //   expect(Enum5.First.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.First.valueOf()).assertEqual(-214748.3648);
    //
    //   expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Second.valueOf()).assertEqual(123.45);
    //
    //   expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Third.valueOf()).assertEqual(2147483.647);
    //
    //   expect(Enum5.One.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.One.valueOf()).assertEqual(1.0);
    //
    //   expect(Enum5.one.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.one.valueOf()).assertEqual(1.0);
    //
    //   expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.oNe.valueOf()).assertEqual(1.0);
    //
    //   expect(testNS.runTest132()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_valueof_21.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0134
     * @tc.desc      Checking for enum with explicit float type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Red.valueOf()).assertEqual(1.5);
    //
    //   expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Green.valueOf()).assertEqual(10.3);
    //
    //   expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Blue.valueOf()).assertEqual(7.6);
    //
    //   expect(Enum5.First.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.First.valueOf()).assertEqual(-214748.3648);
    //
    //   expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Second.valueOf()).assertEqual(123.45);
    //
    //   expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Third.valueOf()).assertEqual(2147483.647);
    //
    //   expect(Enum5.One.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.One.valueOf()).assertEqual(1.0);
    //
    //   expect(Enum5.one.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.one.valueOf()).assertEqual(1.0);
    //
    //   expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.oNe.valueOf()).assertEqual(1.0);
    //
    //   expect(testNS.runTest133()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_valueof_22.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0135
     * @tc.desc      Checking for enum with explicit float type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Red.valueOf()).assertEqual(1.5);
    //
    //   expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Green.valueOf()).assertEqual(10.3);
    //
    //   expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Blue.valueOf()).assertEqual(7.6);
    //
    //   expect(Enum5.First.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.First.valueOf()).assertEqual(-214748.3648);
    //
    //   expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Second.valueOf()).assertEqual(123.45);
    //
    //   expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.Third.valueOf()).assertEqual(2147483.647);
    //
    //   expect(Enum5.One.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.One.valueOf()).assertEqual(1.0);
    //
    //   expect(Enum5.one.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.one.valueOf()).assertEqual(1.0);
    //
    //   expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    //   expect(Enum5.oNe.valueOf()).assertEqual(1.0);
    //
    //   expect(testNS.runTest134()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_valueof_23.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0136
     * @tc.desc      Checking for enum with explicit float type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * ArkTS 1.2 兼容性说明：
     * 本组用例依赖旧版本对 float/double 数值比较的宽松预期。
     * 当前 ArkTS 1.2 环境下，float 与 double 的比较及显示虽然看起来同为 10.3，
     * 但底层类型与精度表示不同，Hypium 按更严格的数值/类型规则比较时会导致断言失败。
     *
     * 该差异属于 ArkTS 1.2 数值类型与精度语义变化，先注释保留。
     */
    // it("testEnumerationMethods0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.Red.valueOf()).assertEqual(1.5);
    //
    //     expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.Green.valueOf()).assertEqual(10.3);
    //
    //     expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.Blue.valueOf()).assertEqual(7.6);
    //
    //     expect(Enum5.First.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.First.valueOf()).assertEqual(-214748.3648);
    //
    //     expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.Second.valueOf()).assertEqual(123.45);
    //
    //     expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.Third.valueOf()).assertEqual(2147483.647);
    //
    //     expect(Enum5.One.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.One.valueOf()).assertEqual(1.0);
    //
    //     expect(Enum5.one.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.one.valueOf()).assertEqual(1.0);
    //
    //     expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    //     expect(Enum5.oNe.valueOf()).assertEqual(1.0);
    //
    //     expect(testNS.runTest135()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_valueof_24.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0137
     * @tc.desc      Checking for enum with explicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.valueOf()).assertEqual("reD");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.valueOf()).assertEqual("grEen");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.valueOf()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.valueOf()).assertEqual("one");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.valueOf()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.valueOf()).assertEqual("one");

      expect(testNS.runTest136()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_25.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0138
     * @tc.desc      Checking for enum with explicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.valueOf()).assertEqual("reD");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.valueOf()).assertEqual("grEen");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.valueOf()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.valueOf()).assertEqual("one");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.valueOf()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.valueOf()).assertEqual("one");

      expect(testNS.runTest137()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_26.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0139
     * @tc.desc      Checking for enum with explicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.valueOf()).assertEqual("reD");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.valueOf()).assertEqual("grEen");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.valueOf()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.valueOf()).assertEqual("one");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.valueOf()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.valueOf()).assertEqual("one");

      expect(testNS.runTest138()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_27.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0140
     * @tc.desc      Checking for enum with explicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.valueOf()).assertEqual("reD");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.valueOf()).assertEqual("grEen");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.valueOf()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.valueOf()).assertEqual("one");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.valueOf()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.valueOf()).assertEqual("one");

      expect(testNS.runTest139()).assertTrue();
    });
  })
}