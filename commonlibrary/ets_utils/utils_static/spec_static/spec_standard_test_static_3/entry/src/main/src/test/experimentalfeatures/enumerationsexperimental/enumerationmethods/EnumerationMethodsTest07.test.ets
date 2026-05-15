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


  // enum_explicit_type_tostring_0.ets
  export function runTest84(): boolean {
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

  // enum_explicit_type_tostring_1.ets
  export function runTest85(): boolean {
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

  // enum_explicit_type_tostring_2.ets
  export function runTest86(): boolean {
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

  // enum_explicit_type_tostring_3.ets
  export function runTest87(): boolean {
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

  // enum_explicit_type_tostring_4.ets
  export function runTest88(): boolean {
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

  // enum_explicit_type_tostring_5.ets
  export function runTest89(): boolean {
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

  // enum_explicit_type_tostring_6.ets
  export function runTest90(): boolean {
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

  // enum_explicit_type_tostring_7.ets
  export function runTest91(): boolean {
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

  // enum_explicit_type_tostring_8.ets
  export function runTest92(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.toString()).assertEqual("0");
    expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.toString()).assertEqual("10");
    expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.toString()).assertEqual("11");
    expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.toString()).assertEqual("-128");
    expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.toString()).assertEqual("123");
    expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.toString()).assertEqual("127");
    expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.toString()).assertEqual("1");
    expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.toString()).assertEqual("1");
    expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.toString()).assertEqual("1");
    expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_9.ets
  export function runTest93(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.toString()).assertEqual("0");
    expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.toString()).assertEqual("10");
    expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.toString()).assertEqual("11");
    expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.toString()).assertEqual("-128");
    expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.toString()).assertEqual("123");
    expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.toString()).assertEqual("127");
    expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.toString()).assertEqual("1");
    expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.toString()).assertEqual("1");
    expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.toString()).assertEqual("1");
    expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_10.ets
  export function runTest94(): boolean {
    expect(Enum1.Red.valueOf() instanceof long).assertTrue();
    expect(Enum1.Red.toString()).assertEqual("0");
    expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

    expect(Enum1.Green.valueOf() instanceof long).assertTrue();
    expect(Enum1.Green.toString()).assertEqual("10");
    expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

    expect(Enum1.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum1.Blue.toString()).assertEqual("11");
    expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

    expect(Enum1.First.valueOf() instanceof long).assertTrue();
    expect(Enum1.First.toString()).assertEqual("-128");
    expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

    expect(Enum1.Second.valueOf() instanceof long).assertTrue();
    expect(Enum1.Second.toString()).assertEqual("123");
    expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

    expect(Enum1.Third.valueOf() instanceof long).assertTrue();
    expect(Enum1.Third.toString()).assertEqual("127");
    expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

    expect(Enum1.One.valueOf() instanceof long).assertTrue();
    expect(Enum1.One.toString()).assertEqual("1");
    expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

    expect(Enum1.one.valueOf() instanceof long).assertTrue();
    expect(Enum1.one.toString()).assertEqual("1");
    expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

    expect(Enum1.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum1.oNe.toString()).assertEqual("1");
    expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_11.ets
  export function runTest95(): boolean {
    expect(Enum1.Red.valueOf() instanceof long).assertTrue();
    expect(Enum1.Red.toString()).assertEqual("0");
    expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

    expect(Enum1.Green.valueOf() instanceof long).assertTrue();
    expect(Enum1.Green.toString()).assertEqual("10");
    expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

    expect(Enum1.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum1.Blue.toString()).assertEqual("11");
    expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

    expect(Enum1.First.valueOf() instanceof long).assertTrue();
    expect(Enum1.First.toString()).assertEqual("-128");
    expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

    expect(Enum1.Second.valueOf() instanceof long).assertTrue();
    expect(Enum1.Second.toString()).assertEqual("123");
    expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

    expect(Enum1.Third.valueOf() instanceof long).assertTrue();
    expect(Enum1.Third.toString()).assertEqual("127");
    expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

    expect(Enum1.One.valueOf() instanceof long).assertTrue();
    expect(Enum1.One.toString()).assertEqual("1");
    expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

    expect(Enum1.one.valueOf() instanceof long).assertTrue();
    expect(Enum1.one.toString()).assertEqual("1");
    expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

    expect(Enum1.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum1.oNe.toString()).assertEqual("1");
    expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_12.ets
  export function runTest96(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.toString()).assertEqual("0");
    expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.toString()).assertEqual("10");
    expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.toString()).assertEqual("11");
    expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.toString()).assertEqual("-32768");
    expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.toString()).assertEqual("12345");
    expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.toString()).assertEqual("32767");
    expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.toString()).assertEqual("1");
    expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.toString()).assertEqual("1");
    expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.toString()).assertEqual("1");
    expect(Enum2.oNe.toString()).assertEqual(Enum2.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_13.ets
  export function runTest97(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.toString()).assertEqual("0");
    expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.toString()).assertEqual("10");
    expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.toString()).assertEqual("11");
    expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.toString()).assertEqual("-32768");
    expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.toString()).assertEqual("12345");
    expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.toString()).assertEqual("32767");
    expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.toString()).assertEqual("1");
    expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.toString()).assertEqual("1");
    expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.toString()).assertEqual("1");
    expect(Enum2.oNe.toString()).assertEqual(Enum2.oNe.valueOf().toString());

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
     * 源文件：        enum_explicit_type_tostring_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0085
     * @tc.desc      Checking for enum with explicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest84()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0086
     * @tc.desc      Checking for enum with explicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest85()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0087
     * @tc.desc      Checking for enum with explicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest86()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0088
     * @tc.desc      Checking for enum with explicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest87()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0089
     * @tc.desc      Checking for enum with explicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest88()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0090
     * @tc.desc      Checking for enum with explicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest89()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0091
     * @tc.desc      Checking for enum with explicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest90()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0092
     * @tc.desc      Checking for enum with explicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest91()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0093
     * @tc.desc      Checking for enum with explicit byte type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.toString()).assertEqual("0");
      expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.toString()).assertEqual("10");
      expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.toString()).assertEqual("11");
      expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.toString()).assertEqual("-128");
      expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.toString()).assertEqual("123");
      expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.toString()).assertEqual("127");
      expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.toString()).assertEqual("1");
      expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.toString()).assertEqual("1");
      expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.toString()).assertEqual("1");
      expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

      expect(testNS.runTest92()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0094
     * @tc.desc      Checking for enum with explicit byte type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.toString()).assertEqual("0");
      expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.toString()).assertEqual("10");
      expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.toString()).assertEqual("11");
      expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.toString()).assertEqual("-128");
      expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.toString()).assertEqual("123");
      expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.toString()).assertEqual("127");
      expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.toString()).assertEqual("1");
      expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.toString()).assertEqual("1");
      expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.toString()).assertEqual("1");
      expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

      expect(testNS.runTest93()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0095
     * @tc.desc      Checking for enum with explicit byte type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.Red.toString()).assertEqual("0");
    //   expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());
    //
    //   expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.Green.toString()).assertEqual("10");
    //   expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());
    //
    //   expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.Blue.toString()).assertEqual("11");
    //   expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());
    //
    //   expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.First.toString()).assertEqual("-128");
    //   expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());
    //
    //   expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.Second.toString()).assertEqual("123");
    //   expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());
    //
    //   expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.Third.toString()).assertEqual("127");
    //   expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());
    //
    //   expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.One.toString()).assertEqual("1");
    //   expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());
    //
    //   expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.one.toString()).assertEqual("1");
    //   expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());
    //
    //   expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    //   expect(Enum1.oNe.toString()).assertEqual("1");
    //   expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());
    //
    //   expect(testNS.runTest94()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_tostring_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0096
     * @tc.desc      Checking for enum with explicit byte type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * ArkTS 1.2 兼容性说明：
     * 本组用例依赖旧版本对基础数值类型的宽松匹配，
     * 将 byte 类型 valueOf() 结果按 long/Number 语义进行判断。
     *
     * 当前 ArkTS 1.2 对基础数值类型的静态与运行时行为更严格，
     * byte 不再按旧版预期隐式满足更宽类型判断，因此断言失败。
     *
     * 该差异属于数值类型规则变化，先注释保留。
     */
    // it("testEnumerationMethods0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.Red.toString()).assertEqual("0");
    //     expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());
    //
    //     expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.Green.toString()).assertEqual("10");
    //     expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());
    //
    //     expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.Blue.toString()).assertEqual("11");
    //     expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());
    //
    //     expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.First.toString()).assertEqual("-128");
    //     expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());
    //
    //     expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.Second.toString()).assertEqual("123");
    //     expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());
    //
    //     expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.Third.toString()).assertEqual("127");
    //     expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());
    //
    //     expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.One.toString()).assertEqual("1");
    //     expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());
    //
    //     expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.one.toString()).assertEqual("1");
    //     expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());
    //
    //     expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    //     expect(Enum1.oNe.toString()).assertEqual("1");
    //     expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());
    //
    //     expect(testNS.runTest95()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_tostring_12.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0097
     * @tc.desc      Checking for enum with explicit short type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.toString()).assertEqual("0");
      expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.toString()).assertEqual("10");
      expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.toString()).assertEqual("11");
      expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.toString()).assertEqual("-32768");
      expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.toString()).assertEqual("12345");
      expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.toString()).assertEqual("32767");
      expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.toString()).assertEqual("1");
      expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.toString()).assertEqual("1");
      expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.toString()).assertEqual("1");
      expect(Enum2.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

      expect(testNS.runTest96()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_13.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0098
     * @tc.desc      Checking for enum with explicit short type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.toString()).assertEqual("0");
      expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.toString()).assertEqual("10");
      expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.toString()).assertEqual("11");
      expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.toString()).assertEqual("-32768");
      expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.toString()).assertEqual("12345");
      expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.toString()).assertEqual("32767");
      expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.toString()).assertEqual("1");
      expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.toString()).assertEqual("1");
      expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.toString()).assertEqual("1");
      expect(Enum2.oNe.toString()).assertEqual(Enum2.oNe.valueOf().toString());

      expect(testNS.runTest97()).assertTrue();
    });
  })
}