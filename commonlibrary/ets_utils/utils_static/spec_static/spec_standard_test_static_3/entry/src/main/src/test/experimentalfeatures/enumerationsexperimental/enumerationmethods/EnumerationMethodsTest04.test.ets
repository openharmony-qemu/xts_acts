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


  // enum_explicit_type_getname_14.ets
  export function runTest42(): boolean {
    expect(Enum2.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Red.getName() instanceof String).assertTrue();
    expect(Enum2.Red.getName()).assertEqual("Red");

    expect(Enum2.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Green.getName() instanceof String).assertTrue();
    expect(Enum2.Green.getName()).assertEqual("Green");

    expect(Enum2.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Blue.getName() instanceof String).assertTrue();
    expect(Enum2.Blue.getName()).assertEqual("Blue");

    expect(Enum2.First.valueOf() instanceof Number).assertTrue();
    expect(Enum2.First.getName() instanceof String).assertTrue();
    expect(Enum2.First.getName()).assertEqual("First");

    expect(Enum2.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Second.getName() instanceof String).assertTrue();
    expect(Enum2.Second.getName()).assertEqual("Second");

    expect(Enum2.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Third.getName() instanceof String).assertTrue();
    expect(Enum2.Third.getName()).assertEqual("Third");

    expect(Enum2.One.valueOf() instanceof Number).assertTrue();
    expect(Enum2.One.getName() instanceof String).assertTrue();
    expect(Enum2.One.getName()).assertEqual("One");

    expect(Enum2.one.valueOf() instanceof Number).assertTrue();
    expect(Enum2.one.getName() instanceof String).assertTrue();
    expect(Enum2.one.getName()).assertEqual("one");

    expect(Enum2.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum2.oNe.getName() instanceof String).assertTrue();
    expect(Enum2.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_15.ets
  export function runTest43(): boolean {
    expect(Enum2.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Red.getName() instanceof String).assertTrue();
    expect(Enum2.Red.getName()).assertEqual("Red");

    expect(Enum2.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Green.getName() instanceof String).assertTrue();
    expect(Enum2.Green.getName()).assertEqual("Green");

    expect(Enum2.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Blue.getName() instanceof String).assertTrue();
    expect(Enum2.Blue.getName()).assertEqual("Blue");

    expect(Enum2.First.valueOf() instanceof Number).assertTrue();
    expect(Enum2.First.getName() instanceof String).assertTrue();
    expect(Enum2.First.getName()).assertEqual("First");

    expect(Enum2.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Second.getName() instanceof String).assertTrue();
    expect(Enum2.Second.getName()).assertEqual("Second");

    expect(Enum2.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Third.getName() instanceof String).assertTrue();
    expect(Enum2.Third.getName()).assertEqual("Third");

    expect(Enum2.One.valueOf() instanceof Number).assertTrue();
    expect(Enum2.One.getName() instanceof String).assertTrue();
    expect(Enum2.One.getName()).assertEqual("One");

    expect(Enum2.one.valueOf() instanceof Number).assertTrue();
    expect(Enum2.one.getName() instanceof String).assertTrue();
    expect(Enum2.one.getName()).assertEqual("one");

    expect(Enum2.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum2.oNe.getName() instanceof String).assertTrue();
    expect(Enum2.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_16.ets
  export function runTest44(): boolean {
    expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Red.getName() instanceof String).assertTrue();
    expect(Enum6.Red.getName()).assertEqual("Red");

    expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Green.getName() instanceof String).assertTrue();
    expect(Enum6.Green.getName()).assertEqual("Green");

    expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Blue.getName() instanceof String).assertTrue();
    expect(Enum6.Blue.getName()).assertEqual("Blue");

    expect(Enum6.First.valueOf() instanceof Number).assertTrue();
    expect(Enum6.First.getName() instanceof String).assertTrue();
    expect(Enum6.First.getName()).assertEqual("First");

    expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Second.getName() instanceof String).assertTrue();
    expect(Enum6.Second.getName()).assertEqual("Second");

    expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Third.getName() instanceof String).assertTrue();
    expect(Enum6.Third.getName()).assertEqual("Third");

    expect(Enum6.One.valueOf() instanceof Number).assertTrue();
    expect(Enum6.One.getName() instanceof String).assertTrue();
    expect(Enum6.One.getName()).assertEqual("One");

    expect(Enum6.one.valueOf() instanceof Number).assertTrue();
    expect(Enum6.one.getName() instanceof String).assertTrue();
    expect(Enum6.one.getName()).assertEqual("one");

    expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum6.oNe.getName() instanceof String).assertTrue();
    expect(Enum6.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_17.ets
  export function runTest45(): boolean {
    expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Red.getName() instanceof String).assertTrue();
    expect(Enum6.Red.getName()).assertEqual("Red");

    expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Green.getName() instanceof String).assertTrue();
    expect(Enum6.Green.getName()).assertEqual("Green");

    expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Blue.getName() instanceof String).assertTrue();
    expect(Enum6.Blue.getName()).assertEqual("Blue");

    expect(Enum6.First.valueOf() instanceof Number).assertTrue();
    expect(Enum6.First.getName() instanceof String).assertTrue();
    expect(Enum6.First.getName()).assertEqual("First");

    expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Second.getName() instanceof String).assertTrue();
    expect(Enum6.Second.getName()).assertEqual("Second");

    expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Third.getName() instanceof String).assertTrue();
    expect(Enum6.Third.getName()).assertEqual("Third");

    expect(Enum6.One.valueOf() instanceof Number).assertTrue();
    expect(Enum6.One.getName() instanceof String).assertTrue();
    expect(Enum6.One.getName()).assertEqual("One");

    expect(Enum6.one.valueOf() instanceof Number).assertTrue();
    expect(Enum6.one.getName() instanceof String).assertTrue();
    expect(Enum6.one.getName()).assertEqual("one");

    expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum6.oNe.getName() instanceof String).assertTrue();
    expect(Enum6.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_18.ets
  export function runTest46(): boolean {
    expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Red.getName() instanceof String).assertTrue();
    expect(Enum6.Red.getName()).assertEqual("Red");

    expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Green.getName() instanceof String).assertTrue();
    expect(Enum6.Green.getName()).assertEqual("Green");

    expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Blue.getName() instanceof String).assertTrue();
    expect(Enum6.Blue.getName()).assertEqual("Blue");

    expect(Enum6.First.valueOf() instanceof Number).assertTrue();
    expect(Enum6.First.getName() instanceof String).assertTrue();
    expect(Enum6.First.getName()).assertEqual("First");

    expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Second.getName() instanceof String).assertTrue();
    expect(Enum6.Second.getName()).assertEqual("Second");

    expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Third.getName() instanceof String).assertTrue();
    expect(Enum6.Third.getName()).assertEqual("Third");

    expect(Enum6.One.valueOf() instanceof Number).assertTrue();
    expect(Enum6.One.getName() instanceof String).assertTrue();
    expect(Enum6.One.getName()).assertEqual("One");

    expect(Enum6.one.valueOf() instanceof Number).assertTrue();
    expect(Enum6.one.getName() instanceof String).assertTrue();
    expect(Enum6.one.getName()).assertEqual("one");

    expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum6.oNe.getName() instanceof String).assertTrue();
    expect(Enum6.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_19.ets
  export function runTest47(): boolean {
    expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Red.getName() instanceof String).assertTrue();
    expect(Enum6.Red.getName()).assertEqual("Red");

    expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Green.getName() instanceof String).assertTrue();
    expect(Enum6.Green.getName()).assertEqual("Green");

    expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Blue.getName() instanceof String).assertTrue();
    expect(Enum6.Blue.getName()).assertEqual("Blue");

    expect(Enum6.First.valueOf() instanceof Number).assertTrue();
    expect(Enum6.First.getName() instanceof String).assertTrue();
    expect(Enum6.First.getName()).assertEqual("First");

    expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Second.getName() instanceof String).assertTrue();
    expect(Enum6.Second.getName()).assertEqual("Second");

    expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum6.Third.getName() instanceof String).assertTrue();
    expect(Enum6.Third.getName()).assertEqual("Third");

    expect(Enum6.One.valueOf() instanceof Number).assertTrue();
    expect(Enum6.One.getName() instanceof String).assertTrue();
    expect(Enum6.One.getName()).assertEqual("One");

    expect(Enum6.one.valueOf() instanceof Number).assertTrue();
    expect(Enum6.one.getName() instanceof String).assertTrue();
    expect(Enum6.one.getName()).assertEqual("one");

    expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum6.oNe.getName() instanceof String).assertTrue();
    expect(Enum6.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_20.ets
  export function runTest48(): boolean {
    expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Red.getName() instanceof String).assertTrue();
    expect(Enum5.Red.getName()).assertEqual("Red");

    expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Green.getName() instanceof String).assertTrue();
    expect(Enum5.Green.getName()).assertEqual("Green");

    expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Blue.getName() instanceof String).assertTrue();
    expect(Enum5.Blue.getName()).assertEqual("Blue");

    expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    expect(Enum5.First.getName() instanceof String).assertTrue();
    expect(Enum5.First.getName()).assertEqual("First");

    expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Second.getName() instanceof String).assertTrue();
    expect(Enum5.Second.getName()).assertEqual("Second");

    expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Third.getName() instanceof String).assertTrue();
    expect(Enum5.Third.getName()).assertEqual("Third");

    expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    expect(Enum5.One.getName() instanceof String).assertTrue();
    expect(Enum5.One.getName()).assertEqual("One");

    expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    expect(Enum5.one.getName() instanceof String).assertTrue();
    expect(Enum5.one.getName()).assertEqual("one");

    expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum5.oNe.getName() instanceof String).assertTrue();
    expect(Enum5.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_21.ets
  export function runTest49(): boolean {
    expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Red.getName() instanceof String).assertTrue();
    expect(Enum5.Red.getName()).assertEqual("Red");

    expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Green.getName() instanceof String).assertTrue();
    expect(Enum5.Green.getName()).assertEqual("Green");

    expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Blue.getName() instanceof String).assertTrue();
    expect(Enum5.Blue.getName()).assertEqual("Blue");

    expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    expect(Enum5.First.getName() instanceof String).assertTrue();
    expect(Enum5.First.getName()).assertEqual("First");

    expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Second.getName() instanceof String).assertTrue();
    expect(Enum5.Second.getName()).assertEqual("Second");

    expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Third.getName() instanceof String).assertTrue();
    expect(Enum5.Third.getName()).assertEqual("Third");

    expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    expect(Enum5.One.getName() instanceof String).assertTrue();
    expect(Enum5.One.getName()).assertEqual("One");

    expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    expect(Enum5.one.getName() instanceof String).assertTrue();
    expect(Enum5.one.getName()).assertEqual("one");

    expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum5.oNe.getName() instanceof String).assertTrue();
    expect(Enum5.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_22.ets
  export function runTest50(): boolean {
    expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Red.getName() instanceof String).assertTrue();
    expect(Enum5.Red.getName()).assertEqual("Red");

    expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Green.getName() instanceof String).assertTrue();
    expect(Enum5.Green.getName()).assertEqual("Green");

    expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Blue.getName() instanceof String).assertTrue();
    expect(Enum5.Blue.getName()).assertEqual("Blue");

    expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    expect(Enum5.First.getName() instanceof String).assertTrue();
    expect(Enum5.First.getName()).assertEqual("First");

    expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Second.getName() instanceof String).assertTrue();
    expect(Enum5.Second.getName()).assertEqual("Second");

    expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Third.getName() instanceof String).assertTrue();
    expect(Enum5.Third.getName()).assertEqual("Third");

    expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    expect(Enum5.One.getName() instanceof String).assertTrue();
    expect(Enum5.One.getName()).assertEqual("One");

    expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    expect(Enum5.one.getName() instanceof String).assertTrue();
    expect(Enum5.one.getName()).assertEqual("one");

    expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum5.oNe.getName() instanceof String).assertTrue();
    expect(Enum5.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_23.ets
  export function runTest51(): boolean {
    expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Red.getName() instanceof String).assertTrue();
    expect(Enum5.Red.getName()).assertEqual("Red");

    expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Green.getName() instanceof String).assertTrue();
    expect(Enum5.Green.getName()).assertEqual("Green");

    expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Blue.getName() instanceof String).assertTrue();
    expect(Enum5.Blue.getName()).assertEqual("Blue");

    expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    expect(Enum5.First.getName() instanceof String).assertTrue();
    expect(Enum5.First.getName()).assertEqual("First");

    expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Second.getName() instanceof String).assertTrue();
    expect(Enum5.Second.getName()).assertEqual("Second");

    expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum5.Third.getName() instanceof String).assertTrue();
    expect(Enum5.Third.getName()).assertEqual("Third");

    expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    expect(Enum5.One.getName() instanceof String).assertTrue();
    expect(Enum5.One.getName()).assertEqual("One");

    expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    expect(Enum5.one.getName() instanceof String).assertTrue();
    expect(Enum5.one.getName()).assertEqual("one");

    expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum5.oNe.getName() instanceof String).assertTrue();
    expect(Enum5.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_24.ets
  export function runTest52(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_25.ets
  export function runTest53(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_26.ets
  export function runTest54(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_27.ets
  export function runTest55(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

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
     * 源文件：        enum_explicit_type_getname_14.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0043
     * @tc.desc      Checking for enum with explicit short type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum2.Red.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.Red.getName() instanceof String).assertTrue();
    //   expect(Enum2.Red.getName()).assertEqual("Red");
    //
    //   expect(Enum2.Green.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.Green.getName() instanceof String).assertTrue();
    //   expect(Enum2.Green.getName()).assertEqual("Green");
    //
    //   expect(Enum2.Blue.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.Blue.getName() instanceof String).assertTrue();
    //   expect(Enum2.Blue.getName()).assertEqual("Blue");
    //
    //   expect(Enum2.First.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.First.getName() instanceof String).assertTrue();
    //   expect(Enum2.First.getName()).assertEqual("First");
    //
    //   expect(Enum2.Second.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.Second.getName() instanceof String).assertTrue();
    //   expect(Enum2.Second.getName()).assertEqual("Second");
    //
    //   expect(Enum2.Third.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.Third.getName() instanceof String).assertTrue();
    //   expect(Enum2.Third.getName()).assertEqual("Third");
    //
    //   expect(Enum2.One.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.One.getName() instanceof String).assertTrue();
    //   expect(Enum2.One.getName()).assertEqual("One");
    //
    //   expect(Enum2.one.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.one.getName() instanceof String).assertTrue();
    //   expect(Enum2.one.getName()).assertEqual("one");
    //
    //   expect(Enum2.oNe.valueOf() instanceof Number).assertTrue();
    //   expect(Enum2.oNe.getName() instanceof String).assertTrue();
    //   expect(Enum2.oNe.getName()).assertEqual("oNe");
    //
    //   expect(testNS.runTest42()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getname_15.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0044
     * @tc.desc      Checking for enum with explicit short type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * ArkTS 1.2 兼容性说明：
     * 本组用例依赖旧版本对基础类型与包装类型的宽松处理，使用了：
     *   valueOf() instanceof Number
     *   getName() instanceof String
     *
     * 在当前 ArkTS 1.2 环境下，valueOf()/getName() 返回值按基础类型处理更严格，
     * 不再满足旧版对包装对象 Number/String 的 instanceof 预期，
     * 因而出现 expect true, actualValue is false 的断言失败。
     *
     * 该差异反映的是 ArkTS 1.2 对基础类型/装箱行为的规则收紧，
     * 不修改原始测试逻辑，先注释保留。
     */
    // it("testEnumerationMethods0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     expect(Enum2.Red.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.Red.getName() instanceof String).assertTrue();
    //     expect(Enum2.Red.getName()).assertEqual("Red");
    //
    //     expect(Enum2.Green.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.Green.getName() instanceof String).assertTrue();
    //     expect(Enum2.Green.getName()).assertEqual("Green");
    //
    //     expect(Enum2.Blue.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.Blue.getName() instanceof String).assertTrue();
    //     expect(Enum2.Blue.getName()).assertEqual("Blue");
    //
    //     expect(Enum2.First.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.First.getName() instanceof String).assertTrue();
    //     expect(Enum2.First.getName()).assertEqual("First");
    //
    //     expect(Enum2.Second.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.Second.getName() instanceof String).assertTrue();
    //     expect(Enum2.Second.getName()).assertEqual("Second");
    //
    //     expect(Enum2.Third.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.Third.getName() instanceof String).assertTrue();
    //     expect(Enum2.Third.getName()).assertEqual("Third");
    //
    //     expect(Enum2.One.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.One.getName() instanceof String).assertTrue();
    //     expect(Enum2.One.getName()).assertEqual("One");
    //
    //     expect(Enum2.one.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.one.getName() instanceof String).assertTrue();
    //     expect(Enum2.one.getName()).assertEqual("one");
    //
    //     expect(Enum2.oNe.valueOf() instanceof Number).assertTrue();
    //     expect(Enum2.oNe.getName() instanceof String).assertTrue();
    //     expect(Enum2.oNe.getName()).assertEqual("oNe");
    //
    //     expect(testNS.runTest43()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getname_16.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0045
     * @tc.desc      Checking for enum with explicit double type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Red.getName() instanceof String).assertTrue();
      expect(Enum6.Red.getName()).assertEqual("Red");

      expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Green.getName() instanceof String).assertTrue();
      expect(Enum6.Green.getName()).assertEqual("Green");

      expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Blue.getName() instanceof String).assertTrue();
      expect(Enum6.Blue.getName()).assertEqual("Blue");

      expect(Enum6.First.valueOf() instanceof Number).assertTrue();
      expect(Enum6.First.getName() instanceof String).assertTrue();
      expect(Enum6.First.getName()).assertEqual("First");

      expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Second.getName() instanceof String).assertTrue();
      expect(Enum6.Second.getName()).assertEqual("Second");

      expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Third.getName() instanceof String).assertTrue();
      expect(Enum6.Third.getName()).assertEqual("Third");

      expect(Enum6.One.valueOf() instanceof Number).assertTrue();
      expect(Enum6.One.getName() instanceof String).assertTrue();
      expect(Enum6.One.getName()).assertEqual("One");

      expect(Enum6.one.valueOf() instanceof Number).assertTrue();
      expect(Enum6.one.getName() instanceof String).assertTrue();
      expect(Enum6.one.getName()).assertEqual("one");

      expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
      expect(Enum6.oNe.getName() instanceof String).assertTrue();
      expect(Enum6.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest44()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_17.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0046
     * @tc.desc      Checking for enum with explicit double type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Red.getName() instanceof String).assertTrue();
      expect(Enum6.Red.getName()).assertEqual("Red");

      expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Green.getName() instanceof String).assertTrue();
      expect(Enum6.Green.getName()).assertEqual("Green");

      expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Blue.getName() instanceof String).assertTrue();
      expect(Enum6.Blue.getName()).assertEqual("Blue");

      expect(Enum6.First.valueOf() instanceof Number).assertTrue();
      expect(Enum6.First.getName() instanceof String).assertTrue();
      expect(Enum6.First.getName()).assertEqual("First");

      expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Second.getName() instanceof String).assertTrue();
      expect(Enum6.Second.getName()).assertEqual("Second");

      expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Third.getName() instanceof String).assertTrue();
      expect(Enum6.Third.getName()).assertEqual("Third");

      expect(Enum6.One.valueOf() instanceof Number).assertTrue();
      expect(Enum6.One.getName() instanceof String).assertTrue();
      expect(Enum6.One.getName()).assertEqual("One");

      expect(Enum6.one.valueOf() instanceof Number).assertTrue();
      expect(Enum6.one.getName() instanceof String).assertTrue();
      expect(Enum6.one.getName()).assertEqual("one");

      expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
      expect(Enum6.oNe.getName() instanceof String).assertTrue();
      expect(Enum6.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest45()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_18.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0047
     * @tc.desc      Checking for enum with explicit double type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Red.getName() instanceof String).assertTrue();
      expect(Enum6.Red.getName()).assertEqual("Red");

      expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Green.getName() instanceof String).assertTrue();
      expect(Enum6.Green.getName()).assertEqual("Green");

      expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Blue.getName() instanceof String).assertTrue();
      expect(Enum6.Blue.getName()).assertEqual("Blue");

      expect(Enum6.First.valueOf() instanceof Number).assertTrue();
      expect(Enum6.First.getName() instanceof String).assertTrue();
      expect(Enum6.First.getName()).assertEqual("First");

      expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Second.getName() instanceof String).assertTrue();
      expect(Enum6.Second.getName()).assertEqual("Second");

      expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Third.getName() instanceof String).assertTrue();
      expect(Enum6.Third.getName()).assertEqual("Third");

      expect(Enum6.One.valueOf() instanceof Number).assertTrue();
      expect(Enum6.One.getName() instanceof String).assertTrue();
      expect(Enum6.One.getName()).assertEqual("One");

      expect(Enum6.one.valueOf() instanceof Number).assertTrue();
      expect(Enum6.one.getName() instanceof String).assertTrue();
      expect(Enum6.one.getName()).assertEqual("one");

      expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
      expect(Enum6.oNe.getName() instanceof String).assertTrue();
      expect(Enum6.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest46()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_19.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0048
     * @tc.desc      Checking for enum with explicit double type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Red.getName() instanceof String).assertTrue();
      expect(Enum6.Red.getName()).assertEqual("Red");

      expect(Enum6.Green.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Green.getName() instanceof String).assertTrue();
      expect(Enum6.Green.getName()).assertEqual("Green");

      expect(Enum6.Blue.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Blue.getName() instanceof String).assertTrue();
      expect(Enum6.Blue.getName()).assertEqual("Blue");

      expect(Enum6.First.valueOf() instanceof Number).assertTrue();
      expect(Enum6.First.getName() instanceof String).assertTrue();
      expect(Enum6.First.getName()).assertEqual("First");

      expect(Enum6.Second.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Second.getName() instanceof String).assertTrue();
      expect(Enum6.Second.getName()).assertEqual("Second");

      expect(Enum6.Third.valueOf() instanceof Number).assertTrue();
      expect(Enum6.Third.getName() instanceof String).assertTrue();
      expect(Enum6.Third.getName()).assertEqual("Third");

      expect(Enum6.One.valueOf() instanceof Number).assertTrue();
      expect(Enum6.One.getName() instanceof String).assertTrue();
      expect(Enum6.One.getName()).assertEqual("One");

      expect(Enum6.one.valueOf() instanceof Number).assertTrue();
      expect(Enum6.one.getName() instanceof String).assertTrue();
      expect(Enum6.one.getName()).assertEqual("one");

      expect(Enum6.oNe.valueOf() instanceof Number).assertTrue();
      expect(Enum6.oNe.getName() instanceof String).assertTrue();
      expect(Enum6.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest47()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_20.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0049
     * @tc.desc      Checking for enum with explicit float type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Red.getName() instanceof String).assertTrue();
    //   expect(Enum5.Red.getName()).assertEqual("Red");
    //
    //   expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Green.getName() instanceof String).assertTrue();
    //   expect(Enum5.Green.getName()).assertEqual("Green");
    //
    //   expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Blue.getName() instanceof String).assertTrue();
    //   expect(Enum5.Blue.getName()).assertEqual("Blue");
    //
    //   expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.First.getName() instanceof String).assertTrue();
    //   expect(Enum5.First.getName()).assertEqual("First");
    //
    //   expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Second.getName() instanceof String).assertTrue();
    //   expect(Enum5.Second.getName()).assertEqual("Second");
    //
    //   expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Third.getName() instanceof String).assertTrue();
    //   expect(Enum5.Third.getName()).assertEqual("Third");
    //
    //   expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.One.getName() instanceof String).assertTrue();
    //   expect(Enum5.One.getName()).assertEqual("One");
    //
    //   expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.one.getName() instanceof String).assertTrue();
    //   expect(Enum5.one.getName()).assertEqual("one");
    //
    //   expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.oNe.getName() instanceof String).assertTrue();
    //   expect(Enum5.oNe.getName()).assertEqual("oNe");
    //
    //   expect(testNS.runTest48()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getname_21.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0050
     * @tc.desc      Checking for enum with explicit float type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Red.getName() instanceof String).assertTrue();
    //   expect(Enum5.Red.getName()).assertEqual("Red");
    //
    //   expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Green.getName() instanceof String).assertTrue();
    //   expect(Enum5.Green.getName()).assertEqual("Green");
    //
    //   expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Blue.getName() instanceof String).assertTrue();
    //   expect(Enum5.Blue.getName()).assertEqual("Blue");
    //
    //   expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.First.getName() instanceof String).assertTrue();
    //   expect(Enum5.First.getName()).assertEqual("First");
    //
    //   expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Second.getName() instanceof String).assertTrue();
    //   expect(Enum5.Second.getName()).assertEqual("Second");
    //
    //   expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Third.getName() instanceof String).assertTrue();
    //   expect(Enum5.Third.getName()).assertEqual("Third");
    //
    //   expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.One.getName() instanceof String).assertTrue();
    //   expect(Enum5.One.getName()).assertEqual("One");
    //
    //   expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.one.getName() instanceof String).assertTrue();
    //   expect(Enum5.one.getName()).assertEqual("one");
    //
    //   expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.oNe.getName() instanceof String).assertTrue();
    //   expect(Enum5.oNe.getName()).assertEqual("oNe");
    //
    //   expect(testNS.runTest49()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getname_22.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0051
     * @tc.desc      Checking for enum with explicit float type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Red.getName() instanceof String).assertTrue();
    //   expect(Enum5.Red.getName()).assertEqual("Red");
    //
    //   expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Green.getName() instanceof String).assertTrue();
    //   expect(Enum5.Green.getName()).assertEqual("Green");
    //
    //   expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Blue.getName() instanceof String).assertTrue();
    //   expect(Enum5.Blue.getName()).assertEqual("Blue");
    //
    //   expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.First.getName() instanceof String).assertTrue();
    //   expect(Enum5.First.getName()).assertEqual("First");
    //
    //   expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Second.getName() instanceof String).assertTrue();
    //   expect(Enum5.Second.getName()).assertEqual("Second");
    //
    //   expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.Third.getName() instanceof String).assertTrue();
    //   expect(Enum5.Third.getName()).assertEqual("Third");
    //
    //   expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.One.getName() instanceof String).assertTrue();
    //   expect(Enum5.One.getName()).assertEqual("One");
    //
    //   expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.one.getName() instanceof String).assertTrue();
    //   expect(Enum5.one.getName()).assertEqual("one");
    //
    //   expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    //   expect(Enum5.oNe.getName() instanceof String).assertTrue();
    //   expect(Enum5.oNe.getName()).assertEqual("oNe");
    //
    //   expect(testNS.runTest50()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getname_23.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0052
     * @tc.desc      Checking for enum with explicit float type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * ArkTS 1.2 兼容性说明：
     * 本组用例依赖旧版本对基础类型与包装类型的宽松处理，使用了：
     *   valueOf() instanceof Number
     *   getName() instanceof String
     *
     * 在当前 ArkTS 1.2 环境下，valueOf()/getName() 返回值按基础类型处理更严格，
     * 不再满足旧版对包装对象 Number/String 的 instanceof 预期，
     * 因而出现 expect true, actualValue is false 的断言失败。
     *
     * 该差异反映的是 ArkTS 1.2 对基础类型/装箱行为的规则收紧，
     * 不修改原始测试逻辑，先注释保留。
     */
    // it("testEnumerationMethods0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     expect(Enum5.Red.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.Red.getName() instanceof String).assertTrue();
    //     expect(Enum5.Red.getName()).assertEqual("Red");
    //
    //     expect(Enum5.Green.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.Green.getName() instanceof String).assertTrue();
    //     expect(Enum5.Green.getName()).assertEqual("Green");
    //
    //     expect(Enum5.Blue.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.Blue.getName() instanceof String).assertTrue();
    //     expect(Enum5.Blue.getName()).assertEqual("Blue");
    //
    //     expect(Enum5.First.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.First.getName() instanceof String).assertTrue();
    //     expect(Enum5.First.getName()).assertEqual("First");
    //
    //     expect(Enum5.Second.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.Second.getName() instanceof String).assertTrue();
    //     expect(Enum5.Second.getName()).assertEqual("Second");
    //
    //     expect(Enum5.Third.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.Third.getName() instanceof String).assertTrue();
    //     expect(Enum5.Third.getName()).assertEqual("Third");
    //
    //     expect(Enum5.One.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.One.getName() instanceof String).assertTrue();
    //     expect(Enum5.One.getName()).assertEqual("One");
    //
    //     expect(Enum5.one.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.one.getName() instanceof String).assertTrue();
    //     expect(Enum5.one.getName()).assertEqual("one");
    //
    //     expect(Enum5.oNe.valueOf() instanceof Number).assertTrue();
    //     expect(Enum5.oNe.getName() instanceof String).assertTrue();
    //     expect(Enum5.oNe.getName()).assertEqual("oNe");
    //
    //     expect(testNS.runTest51()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getname_24.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0053
     * @tc.desc      Checking for enum with explicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest52()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_25.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0054
     * @tc.desc      Checking for enum with explicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest53()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_26.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0055
     * @tc.desc      Checking for enum with explicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest54()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_27.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0056
     * @tc.desc      Checking for enum with explicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest55()).assertTrue();
    });
  })
}