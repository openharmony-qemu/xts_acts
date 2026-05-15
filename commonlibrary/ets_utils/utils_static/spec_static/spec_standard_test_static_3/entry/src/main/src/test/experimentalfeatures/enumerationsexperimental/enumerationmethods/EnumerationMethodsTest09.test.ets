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
  // enum_explicit_type_valueof_0.ets
  export function runTest112(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.valueOf()).assertEqual(0);

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.valueOf()).assertEqual(10);

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.valueOf()).assertEqual(11);

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.valueOf()).assertEqual(-2147483648);

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.valueOf()).assertEqual(12345);

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.valueOf()).assertEqual(2147483647);

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.valueOf()).assertEqual(1);

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.valueOf()).assertEqual(1);

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_1.ets
  export function runTest113(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.valueOf()).assertEqual(0);

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.valueOf()).assertEqual(10);

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.valueOf()).assertEqual(11);

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.valueOf()).assertEqual(-2147483648);

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.valueOf()).assertEqual(12345);

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.valueOf()).assertEqual(2147483647);

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.valueOf()).assertEqual(1);

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.valueOf()).assertEqual(1);

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_2.ets
  export function runTest114(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.valueOf()).assertEqual(0);

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.valueOf()).assertEqual(10);

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.valueOf()).assertEqual(11);

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.valueOf()).assertEqual(-2147483648);

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.valueOf()).assertEqual(12345);

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.valueOf()).assertEqual(2147483647);

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.valueOf()).assertEqual(1);

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.valueOf()).assertEqual(1);

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_3.ets
  export function runTest115(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.valueOf()).assertEqual(0);

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.valueOf()).assertEqual(10);

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.valueOf()).assertEqual(11);

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.valueOf()).assertEqual(-2147483648);

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.valueOf()).assertEqual(12345);

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.valueOf()).assertEqual(2147483647);

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.valueOf()).assertEqual(1);

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.valueOf()).assertEqual(1);

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_4.ets
  export function runTest116(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.valueOf()).assertEqual(0);

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.valueOf()).assertEqual(10);

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.valueOf()).assertEqual(11);

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.valueOf()).assertEqual(12345);

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.valueOf()).assertEqual(1);

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.valueOf()).assertEqual(1);

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_5.ets
  export function runTest117(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.valueOf()).assertEqual(0);

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.valueOf()).assertEqual(10);

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.valueOf()).assertEqual(11);

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.valueOf()).assertEqual(12345);

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.valueOf()).assertEqual(1);

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.valueOf()).assertEqual(1);

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_6.ets
  export function runTest118(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.valueOf()).assertEqual(0);

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.valueOf()).assertEqual(10);

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.valueOf()).assertEqual(11);

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.valueOf()).assertEqual(12345);

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.valueOf()).assertEqual(1);

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.valueOf()).assertEqual(1);

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_7.ets
  export function runTest119(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.valueOf()).assertEqual(0);

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.valueOf()).assertEqual(10);

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.valueOf()).assertEqual(11);

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.valueOf()).assertEqual(12345);

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.valueOf()).assertEqual(1);

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.valueOf()).assertEqual(1);

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_8.ets
  export function runTest120(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.valueOf()).assertEqual(0);

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.valueOf()).assertEqual(10);

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.valueOf()).assertEqual(11);

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.valueOf()).assertEqual(-128);

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.valueOf()).assertEqual(123);

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.valueOf()).assertEqual(127);

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.valueOf()).assertEqual(1);

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.valueOf()).assertEqual(1);

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_9.ets
  export function runTest121(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.valueOf()).assertEqual(0);

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.valueOf()).assertEqual(10);

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.valueOf()).assertEqual(11);

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.valueOf()).assertEqual(-128);

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.valueOf()).assertEqual(123);

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.valueOf()).assertEqual(127);

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.valueOf()).assertEqual(1);

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.valueOf()).assertEqual(1);

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_10.ets
  export function runTest122(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.valueOf()).assertEqual(0);

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.valueOf()).assertEqual(10);

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.valueOf()).assertEqual(11);

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.valueOf()).assertEqual(-128);

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.valueOf()).assertEqual(123);

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.valueOf()).assertEqual(127);

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.valueOf()).assertEqual(1);

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.valueOf()).assertEqual(1);

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_11.ets
  export function runTest123(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.valueOf()).assertEqual(0);

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.valueOf()).assertEqual(10);

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.valueOf()).assertEqual(11);

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.valueOf()).assertEqual(-128);

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.valueOf()).assertEqual(123);

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.valueOf()).assertEqual(127);

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.valueOf()).assertEqual(1);

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.valueOf()).assertEqual(1);

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_12.ets
  export function runTest124(): boolean {
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

  // enum_explicit_type_valueof_13.ets
  export function runTest125(): boolean {
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
     * 源文件：        enum_explicit_type_valueof_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0113
     * @tc.desc      Checking for enum with explicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.valueOf()).assertEqual(0);

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.valueOf()).assertEqual(10);

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.valueOf()).assertEqual(11);

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.valueOf()).assertEqual(-2147483648);

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.valueOf()).assertEqual(12345);

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.valueOf()).assertEqual(2147483647);

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.valueOf()).assertEqual(1);

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.valueOf()).assertEqual(1);

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest112()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0114
     * @tc.desc      Checking for enum with explicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.valueOf()).assertEqual(0);

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.valueOf()).assertEqual(10);

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.valueOf()).assertEqual(11);

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.valueOf()).assertEqual(-2147483648);

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.valueOf()).assertEqual(12345);

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.valueOf()).assertEqual(2147483647);

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.valueOf()).assertEqual(1);

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.valueOf()).assertEqual(1);

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest113()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0115
     * @tc.desc      Checking for enum with explicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.valueOf()).assertEqual(0);

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.valueOf()).assertEqual(10);

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.valueOf()).assertEqual(11);

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.valueOf()).assertEqual(-2147483648);

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.valueOf()).assertEqual(12345);

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.valueOf()).assertEqual(2147483647);

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.valueOf()).assertEqual(1);

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.valueOf()).assertEqual(1);

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest114()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0116
     * @tc.desc      Checking for enum with explicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.valueOf()).assertEqual(0);

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.valueOf()).assertEqual(10);

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.valueOf()).assertEqual(11);

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.valueOf()).assertEqual(-2147483648);

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.valueOf()).assertEqual(12345);

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.valueOf()).assertEqual(2147483647);

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.valueOf()).assertEqual(1);

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.valueOf()).assertEqual(1);

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest115()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0117
     * @tc.desc      Checking for enum with explicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.valueOf()).assertEqual(0);

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.valueOf()).assertEqual(10);

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.valueOf()).assertEqual(11);

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.valueOf()).assertEqual(12345);

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.valueOf()).assertEqual(1);

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.valueOf()).assertEqual(1);

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest116()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0118
     * @tc.desc      Checking for enum with explicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.valueOf()).assertEqual(0);

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.valueOf()).assertEqual(10);

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.valueOf()).assertEqual(11);

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.valueOf()).assertEqual(12345);

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.valueOf()).assertEqual(1);

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.valueOf()).assertEqual(1);

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest117()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0119
     * @tc.desc      Checking for enum with explicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.valueOf()).assertEqual(0);

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.valueOf()).assertEqual(10);

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.valueOf()).assertEqual(11);

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.valueOf()).assertEqual(12345);

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.valueOf()).assertEqual(1);

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.valueOf()).assertEqual(1);

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest118()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0120
     * @tc.desc      Checking for enum with explicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.valueOf()).assertEqual(0);

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.valueOf()).assertEqual(10);

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.valueOf()).assertEqual(11);

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.valueOf()).assertEqual(12345);

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.valueOf()).assertEqual(1);

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.valueOf()).assertEqual(1);

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest119()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0121
     * @tc.desc      Checking for enum with explicit byte type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.valueOf()).assertEqual(0);

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.valueOf()).assertEqual(10);

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.valueOf()).assertEqual(11);

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.valueOf()).assertEqual(-128);

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.valueOf()).assertEqual(123);

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.valueOf()).assertEqual(127);

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.valueOf()).assertEqual(1);

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.valueOf()).assertEqual(1);

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest120()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0122
     * @tc.desc      Checking for enum with explicit byte type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.valueOf()).assertEqual(0);

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.valueOf()).assertEqual(10);

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.valueOf()).assertEqual(11);

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.valueOf()).assertEqual(-128);

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.valueOf()).assertEqual(123);

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.valueOf()).assertEqual(127);

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.valueOf()).assertEqual(1);

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.valueOf()).assertEqual(1);

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest121()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0123
     * @tc.desc      Checking for enum with explicit byte type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.valueOf()).assertEqual(0);

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.valueOf()).assertEqual(10);

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.valueOf()).assertEqual(11);

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.valueOf()).assertEqual(-128);

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.valueOf()).assertEqual(123);

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.valueOf()).assertEqual(127);

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.valueOf()).assertEqual(1);

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.valueOf()).assertEqual(1);

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest122()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0124
     * @tc.desc      Checking for enum with explicit byte type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.valueOf()).assertEqual(0);

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.valueOf()).assertEqual(10);

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.valueOf()).assertEqual(11);

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.valueOf()).assertEqual(-128);

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.valueOf()).assertEqual(123);

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.valueOf()).assertEqual(127);

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.valueOf()).assertEqual(1);

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.valueOf()).assertEqual(1);

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest123()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_12.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0125
     * @tc.desc      Checking for enum with explicit short type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest124()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_valueof_13.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0126
     * @tc.desc      Checking for enum with explicit short type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest125()).assertTrue();
    });
  })
}