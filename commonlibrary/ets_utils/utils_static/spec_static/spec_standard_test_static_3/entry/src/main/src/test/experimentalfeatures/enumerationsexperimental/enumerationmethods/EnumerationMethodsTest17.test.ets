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

  // enum_implicit_type_tostring_0.ets
  export function runTest190(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.toString()).assertEqual("0");
    expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.toString()).assertEqual("10");
    expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.toString()).assertEqual("11");
    expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.toString()).assertEqual("-2147483648");
    expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.toString()).assertEqual("12345");
    expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.toString()).assertEqual("2147483647");
    expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.toString()).assertEqual("1");
    expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.toString()).assertEqual("1");
    expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.toString()).assertEqual("1");
    expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_1.ets
  export function runTest191(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.toString()).assertEqual("0");
    expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.toString()).assertEqual("10");
    expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.toString()).assertEqual("11");
    expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.toString()).assertEqual("-2147483648");
    expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.toString()).assertEqual("12345");
    expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.toString()).assertEqual("2147483647");
    expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.toString()).assertEqual("1");
    expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.toString()).assertEqual("1");
    expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.toString()).assertEqual("1");
    expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_2.ets
  export function runTest192(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.toString()).assertEqual("0");
    expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.toString()).assertEqual("10");
    expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.toString()).assertEqual("11");
    expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.toString()).assertEqual("-2147483648");
    expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.toString()).assertEqual("12345");
    expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.toString()).assertEqual("2147483647");
    expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.toString()).assertEqual("1");
    expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.toString()).assertEqual("1");
    expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.toString()).assertEqual("1");
    expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_3.ets
  export function runTest193(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.toString()).assertEqual("0");
    expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.toString()).assertEqual("10");
    expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.toString()).assertEqual("11");
    expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.toString()).assertEqual("-2147483648");
    expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.toString()).assertEqual("12345");
    expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.toString()).assertEqual("2147483647");
    expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.toString()).assertEqual("1");
    expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.toString()).assertEqual("1");
    expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.toString()).assertEqual("1");
    expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_4.ets
  export function runTest194(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.toString()).assertEqual("0");
    expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.toString()).assertEqual("10");
    expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.toString()).assertEqual("11");
    expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
    expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.toString()).assertEqual("12345");
    expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
    expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.toString()).assertEqual("1");
    expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.toString()).assertEqual("1");
    expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.toString()).assertEqual("1");
    expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_5.ets
  export function runTest195(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.toString()).assertEqual("0");
    expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.toString()).assertEqual("10");
    expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.toString()).assertEqual("11");
    expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
    expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.toString()).assertEqual("12345");
    expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
    expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.toString()).assertEqual("1");
    expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.toString()).assertEqual("1");
    expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.toString()).assertEqual("1");
    expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_6.ets
  export function runTest196(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.toString()).assertEqual("0");
    expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.toString()).assertEqual("10");
    expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.toString()).assertEqual("11");
    expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
    expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.toString()).assertEqual("12345");
    expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
    expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.toString()).assertEqual("1");
    expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.toString()).assertEqual("1");
    expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.toString()).assertEqual("1");
    expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_7.ets
  export function runTest197(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.toString()).assertEqual("0");
    expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.toString()).assertEqual("10");
    expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.toString()).assertEqual("11");
    expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
    expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.toString()).assertEqual("12345");
    expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
    expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.toString()).assertEqual("1");
    expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.toString()).assertEqual("1");
    expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.toString()).assertEqual("1");
    expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_8.ets
  export function runTest198(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_9.ets
  export function runTest199(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_10.ets
  export function runTest200(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

    return true;
  }

  // enum_implicit_type_tostring_11.ets
  export function runTest201(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

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
     * 源文件：        enum_implicit_type_tostring_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0191
     * @tc.desc      Checking for enum with implicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.toString()).assertEqual("0");
      expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.toString()).assertEqual("10");
      expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.toString()).assertEqual("11");
      expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.toString()).assertEqual("-2147483648");
      expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.toString()).assertEqual("12345");
      expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.toString()).assertEqual("2147483647");
      expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.toString()).assertEqual("1");
      expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.toString()).assertEqual("1");
      expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.toString()).assertEqual("1");
      expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());


      expect(testNS.runTest190()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0192
     * @tc.desc      Checking for enum with implicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.toString()).assertEqual("0");
      expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.toString()).assertEqual("10");
      expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.toString()).assertEqual("11");
      expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.toString()).assertEqual("-2147483648");
      expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.toString()).assertEqual("12345");
      expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.toString()).assertEqual("2147483647");
      expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.toString()).assertEqual("1");
      expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.toString()).assertEqual("1");
      expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.toString()).assertEqual("1");
      expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());


      expect(testNS.runTest191()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0193
     * @tc.desc      Checking for enum with implicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.toString()).assertEqual("0");
      expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.toString()).assertEqual("10");
      expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.toString()).assertEqual("11");
      expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.toString()).assertEqual("-2147483648");
      expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.toString()).assertEqual("12345");
      expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.toString()).assertEqual("2147483647");
      expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.toString()).assertEqual("1");
      expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.toString()).assertEqual("1");
      expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.toString()).assertEqual("1");
      expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

      expect(testNS.runTest192()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0194
     * @tc.desc      Checking for enum with implicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.toString()).assertEqual("0");
      expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.toString()).assertEqual("10");
      expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.toString()).assertEqual("11");
      expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.toString()).assertEqual("-2147483648");
      expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.toString()).assertEqual("12345");
      expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.toString()).assertEqual("2147483647");
      expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.toString()).assertEqual("1");
      expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.toString()).assertEqual("1");
      expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.toString()).assertEqual("1");
      expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

      expect(testNS.runTest193()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0195
     * @tc.desc      Checking for enum with implicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.toString()).assertEqual("0");
      expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.toString()).assertEqual("10");
      expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.toString()).assertEqual("11");
      expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.toString()).assertEqual("12345");
      expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.toString()).assertEqual("1");
      expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.toString()).assertEqual("1");
      expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.toString()).assertEqual("1");
      expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

      expect(testNS.runTest194()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0196
     * @tc.desc      Checking for enum with implicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.toString()).assertEqual("0");
      expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.toString()).assertEqual("10");
      expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.toString()).assertEqual("11");
      expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.toString()).assertEqual("12345");
      expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.toString()).assertEqual("1");
      expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.toString()).assertEqual("1");
      expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.toString()).assertEqual("1");
      expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

      expect(testNS.runTest195()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0197
     * @tc.desc      Checking for enum with implicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.toString()).assertEqual("0");
      expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.toString()).assertEqual("10");
      expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.toString()).assertEqual("11");
      expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.toString()).assertEqual("12345");
      expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.toString()).assertEqual("1");
      expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.toString()).assertEqual("1");
      expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.toString()).assertEqual("1");
      expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());


      expect(testNS.runTest196()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0198
     * @tc.desc      Checking for enum with implicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.toString()).assertEqual("0");
      expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.toString()).assertEqual("10");
      expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.toString()).assertEqual("11");
      expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.toString()).assertEqual("12345");
      expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.toString()).assertEqual("1");
      expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.toString()).assertEqual("1");
      expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.toString()).assertEqual("1");
      expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());


      expect(testNS.runTest197()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0199
     * @tc.desc      Checking for enum with implicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

      expect(testNS.runTest198()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0200
     * @tc.desc      Checking for enum with implicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

      expect(testNS.runTest199()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0201
     * @tc.desc      Checking for enum with implicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());


      expect(testNS.runTest200()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_tostring_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0202
     * @tc.desc      Checking for enum with implicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

      expect(testNS.runTest201()).assertTrue();
    });
  })
}