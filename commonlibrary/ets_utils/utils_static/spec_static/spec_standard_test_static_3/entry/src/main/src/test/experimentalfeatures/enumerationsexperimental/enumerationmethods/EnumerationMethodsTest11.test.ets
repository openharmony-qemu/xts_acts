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
  // enum_explicit_type_values_0.ets
  export function runTest140(): boolean {
    let values = Enum3.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum3).assertTrue();
    expect(values[0]).assertEqual(Enum3.Red);
    expect(values[0].valueOf() instanceof int).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum3.Red.valueOf());
    expect(Enum3[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum3).assertTrue();
    expect(values[1]).assertEqual(Enum3.Green);
    expect(values[1].valueOf() instanceof int).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum3.Green.valueOf());
    expect(Enum3[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum3).assertTrue();
    expect(values[2]).assertEqual(Enum3.Blue);
    expect(values[2].valueOf() instanceof int).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum3.Blue.valueOf());
    expect(Enum3[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum3).assertTrue();
    expect(values[3]).assertEqual(Enum3.First);
    expect(values[3].valueOf() instanceof int).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum3.First.valueOf());
    expect(Enum3[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum3).assertTrue();
    expect(values[4]).assertEqual(Enum3.Second);
    expect(values[4].valueOf() instanceof int).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum3.Second.valueOf());
    expect(Enum3[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum3).assertTrue();
    expect(values[5]).assertEqual(Enum3.Third);
    expect(values[5].valueOf() instanceof int).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum3.Third.valueOf());
    expect(Enum3[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum3).assertTrue();
    expect(values[6]).assertEqual(Enum3.One);
    expect(values[6].valueOf() instanceof int).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum3.One.valueOf());
    expect(Enum3[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum3).assertTrue();
    expect(values[7]).assertEqual(Enum3.one);
    expect(values[7].valueOf() instanceof int).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum3.one.valueOf());
    expect(Enum3[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum3).assertTrue();
    expect(values[8]).assertEqual(Enum3.oNe);
    expect(values[8].valueOf() instanceof int).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum3.oNe.valueOf());
    expect(Enum3[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_1.ets
  export function runTest141(): boolean {
    let values = Enum3.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum3).assertTrue();
    expect(values[0]).assertEqual(Enum3.Red);
    expect(values[0].valueOf() instanceof int).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum3.Red.valueOf());
    expect(Enum3[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum3).assertTrue();
    expect(values[1]).assertEqual(Enum3.Green);
    expect(values[1].valueOf() instanceof int).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum3.Green.valueOf());
    expect(Enum3[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum3).assertTrue();
    expect(values[2]).assertEqual(Enum3.Blue);
    expect(values[2].valueOf() instanceof int).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum3.Blue.valueOf());
    expect(Enum3[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum3).assertTrue();
    expect(values[3]).assertEqual(Enum3.First);
    expect(values[3].valueOf() instanceof int).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum3.First.valueOf());
    expect(Enum3[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum3).assertTrue();
    expect(values[4]).assertEqual(Enum3.Second);
    expect(values[4].valueOf() instanceof int).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum3.Second.valueOf());
    expect(Enum3[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum3).assertTrue();
    expect(values[5]).assertEqual(Enum3.Third);
    expect(values[5].valueOf() instanceof int).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum3.Third.valueOf());
    expect(Enum3[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum3).assertTrue();
    expect(values[6]).assertEqual(Enum3.One);
    expect(values[6].valueOf() instanceof int).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum3.One.valueOf());
    expect(Enum3[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum3).assertTrue();
    expect(values[7]).assertEqual(Enum3.one);
    expect(values[7].valueOf() instanceof int).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum3.one.valueOf());
    expect(Enum3[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum3).assertTrue();
    expect(values[8]).assertEqual(Enum3.oNe);
    expect(values[8].valueOf() instanceof int).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum3.oNe.valueOf());
    expect(Enum3[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_2.ets
  export function runTest142(): boolean {
    let values = Enum4.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum4).assertTrue();
    expect(values[0]).assertEqual(Enum4.Red);
    expect(values[0].valueOf() instanceof long).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum4.Red.valueOf());
    expect(Enum4[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum4).assertTrue();
    expect(values[1]).assertEqual(Enum4.Green);
    expect(values[1].valueOf() instanceof long).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum4.Green.valueOf());
    expect(Enum4[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum4).assertTrue();
    expect(values[2]).assertEqual(Enum4.Blue);
    expect(values[2].valueOf() instanceof long).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum4.Blue.valueOf());
    expect(Enum4[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum4).assertTrue();
    expect(values[3]).assertEqual(Enum4.First);
    expect(values[3].valueOf() instanceof long).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum4.First.valueOf());
    expect(Enum4[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum4).assertTrue();
    expect(values[4]).assertEqual(Enum4.Second);
    expect(values[4].valueOf() instanceof long).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum4.Second.valueOf());
    expect(Enum4[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum4).assertTrue();
    expect(values[5]).assertEqual(Enum4.Third);
    expect(values[5].valueOf() instanceof long).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum4.Third.valueOf());
    expect(Enum4[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum4).assertTrue();
    expect(values[6]).assertEqual(Enum4.One);
    expect(values[6].valueOf() instanceof long).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum4.One.valueOf());
    expect(Enum4[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum4).assertTrue();
    expect(values[7]).assertEqual(Enum4.one);
    expect(values[7].valueOf() instanceof long).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum4.one.valueOf());
    expect(Enum4[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum4).assertTrue();
    expect(values[8]).assertEqual(Enum4.oNe);
    expect(values[8].valueOf() instanceof long).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum4.oNe.valueOf());
    expect(Enum4[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_3.ets
  export function runTest143(): boolean {
    let values = Enum4.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum4).assertTrue();
    expect(values[0]).assertEqual(Enum4.Red);
    expect(values[0].valueOf() instanceof long).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum4.Red.valueOf());
    expect(Enum4[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum4).assertTrue();
    expect(values[1]).assertEqual(Enum4.Green);
    expect(values[1].valueOf() instanceof long).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum4.Green.valueOf());
    expect(Enum4[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum4).assertTrue();
    expect(values[2]).assertEqual(Enum4.Blue);
    expect(values[2].valueOf() instanceof long).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum4.Blue.valueOf());
    expect(Enum4[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum4).assertTrue();
    expect(values[3]).assertEqual(Enum4.First);
    expect(values[3].valueOf() instanceof long).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum4.First.valueOf());
    expect(Enum4[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum4).assertTrue();
    expect(values[4]).assertEqual(Enum4.Second);
    expect(values[4].valueOf() instanceof long).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum4.Second.valueOf());
    expect(Enum4[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum4).assertTrue();
    expect(values[5]).assertEqual(Enum4.Third);
    expect(values[5].valueOf() instanceof long).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum4.Third.valueOf());
    expect(Enum4[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum4).assertTrue();
    expect(values[6]).assertEqual(Enum4.One);
    expect(values[6].valueOf() instanceof long).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum4.One.valueOf());
    expect(Enum4[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum4).assertTrue();
    expect(values[7]).assertEqual(Enum4.one);
    expect(values[7].valueOf() instanceof long).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum4.one.valueOf());
    expect(Enum4[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum4).assertTrue();
    expect(values[8]).assertEqual(Enum4.oNe);
    expect(values[8].valueOf() instanceof long).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum4.oNe.valueOf());
    expect(Enum4[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_4.ets
  export function runTest144(): boolean {
    let values = Enum1.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum1).assertTrue();
    expect(values[0]).assertEqual(Enum1.Red);
    expect(values[0].valueOf() instanceof byte).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum1.Red.valueOf());
    expect(Enum1[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum1).assertTrue();
    expect(values[1]).assertEqual(Enum1.Green);
    expect(values[1].valueOf() instanceof byte).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum1.Green.valueOf());
    expect(Enum1[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum1).assertTrue();
    expect(values[2]).assertEqual(Enum1.Blue);
    expect(values[2].valueOf() instanceof byte).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum1.Blue.valueOf());
    expect(Enum1[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum1).assertTrue();
    expect(values[3]).assertEqual(Enum1.First);
    expect(values[3].valueOf() instanceof byte).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum1.First.valueOf());
    expect(Enum1[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum1).assertTrue();
    expect(values[4]).assertEqual(Enum1.Second);
    expect(values[4].valueOf() instanceof byte).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum1.Second.valueOf());
    expect(Enum1[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum1).assertTrue();
    expect(values[5]).assertEqual(Enum1.Third);
    expect(values[5].valueOf() instanceof byte).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum1.Third.valueOf());
    expect(Enum1[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum1).assertTrue();
    expect(values[6]).assertEqual(Enum1.One);
    expect(values[6].valueOf() instanceof byte).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum1.One.valueOf());
    expect(Enum1[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum1).assertTrue();
    expect(values[7]).assertEqual(Enum1.one);
    expect(values[7].valueOf() instanceof byte).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum1.one.valueOf());
    expect(Enum1[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum1).assertTrue();
    expect(values[8]).assertEqual(Enum1.oNe);
    expect(values[8].valueOf() instanceof byte).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum1.oNe.valueOf());
    expect(Enum1[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_5.ets
  export function runTest145(): boolean {
    let values = Enum1.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum1).assertTrue();
    expect(values[0]).assertEqual(Enum1.Red);
    expect(values[0].valueOf() instanceof byte).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum1.Red.valueOf());
    expect(Enum1[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum1).assertTrue();
    expect(values[1]).assertEqual(Enum1.Green);
    expect(values[1].valueOf() instanceof byte).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum1.Green.valueOf());
    expect(Enum1[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum1).assertTrue();
    expect(values[2]).assertEqual(Enum1.Blue);
    expect(values[2].valueOf() instanceof byte).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum1.Blue.valueOf());
    expect(Enum1[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum1).assertTrue();
    expect(values[3]).assertEqual(Enum1.First);
    expect(values[3].valueOf() instanceof byte).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum1.First.valueOf());
    expect(Enum1[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum1).assertTrue();
    expect(values[4]).assertEqual(Enum1.Second);
    expect(values[4].valueOf() instanceof byte).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum1.Second.valueOf());
    expect(Enum1[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum1).assertTrue();
    expect(values[5]).assertEqual(Enum1.Third);
    expect(values[5].valueOf() instanceof byte).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum1.Third.valueOf());
    expect(Enum1[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum1).assertTrue();
    expect(values[6]).assertEqual(Enum1.One);
    expect(values[6].valueOf() instanceof byte).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum1.One.valueOf());
    expect(Enum1[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum1).assertTrue();
    expect(values[7]).assertEqual(Enum1.one);
    expect(values[7].valueOf() instanceof byte).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum1.one.valueOf());
    expect(Enum1[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum1).assertTrue();
    expect(values[8]).assertEqual(Enum1.oNe);
    expect(values[8].valueOf() instanceof byte).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum1.oNe.valueOf());
    expect(Enum1[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_6.ets
  export function runTest146(): boolean {
    let values = Enum2.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum2).assertTrue();
    expect(values[0]).assertEqual(Enum2.Red);
    expect(values[0].valueOf() instanceof short).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum2.Red.valueOf());
    expect(Enum2[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum2).assertTrue();
    expect(values[1]).assertEqual(Enum2.Green);
    expect(values[1].valueOf() instanceof short).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
    expect(Enum2[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum2).assertTrue();
    expect(values[2]).assertEqual(Enum2.Blue);
    expect(values[2].valueOf() instanceof short).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum2.Blue.valueOf());
    expect(Enum2[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum2).assertTrue();
    expect(values[3]).assertEqual(Enum2.First);
    expect(values[3].valueOf() instanceof short).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum2.First.valueOf());
    expect(Enum2[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum2).assertTrue();
    expect(values[4]).assertEqual(Enum2.Second);
    expect(values[4].valueOf() instanceof short).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum2.Second.valueOf());
    expect(Enum2[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum2).assertTrue();
    expect(values[5]).assertEqual(Enum2.Third);
    expect(values[5].valueOf() instanceof short).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum2.Third.valueOf());
    expect(Enum2[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum2).assertTrue();
    expect(values[6]).assertEqual(Enum2.One);
    expect(values[6].valueOf() instanceof short).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum2.One.valueOf());
    expect(Enum2[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum2).assertTrue();
    expect(values[7]).assertEqual(Enum2.one);
    expect(values[7].valueOf() instanceof short).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum2.one.valueOf());
    expect(Enum2[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum2).assertTrue();
    expect(values[8]).assertEqual(Enum2.oNe);
    expect(values[8].valueOf() instanceof short).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum2.oNe.valueOf());
    expect(Enum2[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_7.ets
  export function runTest147(): boolean {
    let values = Enum2.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum2).assertTrue();
    expect(values[0]).assertEqual(Enum2.Red);
    expect(values[0].valueOf() instanceof short).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum2.Red.valueOf());
    expect(Enum2[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum2).assertTrue();
    expect(values[1]).assertEqual(Enum2.Green);
    expect(values[1].valueOf() instanceof short).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
    expect(Enum2[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum2).assertTrue();
    expect(values[2]).assertEqual(Enum2.Blue);
    expect(values[2].valueOf() instanceof short).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum2.Blue.valueOf());
    expect(Enum2[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum2).assertTrue();
    expect(values[3]).assertEqual(Enum2.First);
    expect(values[3].valueOf() instanceof short).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum2.First.valueOf());
    expect(Enum2[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum2).assertTrue();
    expect(values[4]).assertEqual(Enum2.Second);
    expect(values[4].valueOf() instanceof short).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum2.Second.valueOf());
    expect(Enum2[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum2).assertTrue();
    expect(values[5]).assertEqual(Enum2.Third);
    expect(values[5].valueOf() instanceof short).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum2.Third.valueOf());
    expect(Enum2[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum2).assertTrue();
    expect(values[6]).assertEqual(Enum2.One);
    expect(values[6].valueOf() instanceof short).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum2.One.valueOf());
    expect(Enum2[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum2).assertTrue();
    expect(values[7]).assertEqual(Enum2.one);
    expect(values[7].valueOf() instanceof short).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum2.one.valueOf());
    expect(Enum2[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum2).assertTrue();
    expect(values[8]).assertEqual(Enum2.oNe);
    expect(values[8].valueOf() instanceof short).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum2.oNe.valueOf());
    expect(Enum2[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_8.ets
  export function runTest148(): boolean {
    let values = Enum6.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum6).assertTrue();
    expect(values[0]).assertEqual(Enum6.Red);
    expect(values[0].valueOf() instanceof double).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum6.Red.valueOf());
    expect(Enum6[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum6).assertTrue();
    expect(values[1]).assertEqual(Enum6.Green);
    expect(values[1].valueOf() instanceof double).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum6.Green.valueOf());
    expect(Enum6[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum6).assertTrue();
    expect(values[2]).assertEqual(Enum6.Blue);
    expect(values[2].valueOf() instanceof double).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum6.Blue.valueOf());
    expect(Enum6[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum6).assertTrue();
    expect(values[3]).assertEqual(Enum6.First);
    expect(values[3].valueOf() instanceof double).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum6.First.valueOf());
    expect(Enum6[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum6).assertTrue();
    expect(values[4]).assertEqual(Enum6.Second);
    expect(values[4].valueOf() instanceof double).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum6.Second.valueOf());
    expect(Enum6[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum6).assertTrue();
    expect(values[5]).assertEqual(Enum6.Third);
    expect(values[5].valueOf() instanceof double).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum6.Third.valueOf());
    expect(Enum6[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum6).assertTrue();
    expect(values[6]).assertEqual(Enum6.One);
    expect(values[6].valueOf() instanceof double).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum6.One.valueOf());
    expect(Enum6[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum6).assertTrue();
    expect(values[7]).assertEqual(Enum6.one);
    expect(values[7].valueOf() instanceof double).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum6.one.valueOf());
    expect(Enum6[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum6).assertTrue();
    expect(values[8]).assertEqual(Enum6.oNe);
    expect(values[8].valueOf() instanceof double).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum6.oNe.valueOf());
    expect(Enum6[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_9.ets
  export function runTest149(): boolean {
    let values = Enum6.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum6).assertTrue();
    expect(values[0]).assertEqual(Enum6.Red);
    expect(values[0].valueOf() instanceof double).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum6.Red.valueOf());
    expect(Enum6[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum6).assertTrue();
    expect(values[1]).assertEqual(Enum6.Green);
    expect(values[1].valueOf() instanceof double).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum6.Green.valueOf());
    expect(Enum6[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum6).assertTrue();
    expect(values[2]).assertEqual(Enum6.Blue);
    expect(values[2].valueOf() instanceof double).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum6.Blue.valueOf());
    expect(Enum6[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum6).assertTrue();
    expect(values[3]).assertEqual(Enum6.First);
    expect(values[3].valueOf() instanceof double).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum6.First.valueOf());
    expect(Enum6[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum6).assertTrue();
    expect(values[4]).assertEqual(Enum6.Second);
    expect(values[4].valueOf() instanceof double).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum6.Second.valueOf());
    expect(Enum6[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum6).assertTrue();
    expect(values[5]).assertEqual(Enum6.Third);
    expect(values[5].valueOf() instanceof double).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum6.Third.valueOf());
    expect(Enum6[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum6).assertTrue();
    expect(values[6]).assertEqual(Enum6.One);
    expect(values[6].valueOf() instanceof double).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum6.One.valueOf());
    expect(Enum6[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum6).assertTrue();
    expect(values[7]).assertEqual(Enum6.one);
    expect(values[7].valueOf() instanceof double).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum6.one.valueOf());
    expect(Enum6[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum6).assertTrue();
    expect(values[8]).assertEqual(Enum6.oNe);
    expect(values[8].valueOf() instanceof double).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum6.oNe.valueOf());
    expect(Enum6[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_10.ets
  export function runTest150(): boolean {
    let values = Enum5.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum5).assertTrue();
    expect(values[0]).assertEqual(Enum5.Red);
    expect(values[0].valueOf() instanceof float).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum5.Red.valueOf());
    expect(Enum5[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum5).assertTrue();
    expect(values[1]).assertEqual(Enum5.Green);
    expect(values[1].valueOf() instanceof float).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum5.Green.valueOf());
    expect(Enum5[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum5).assertTrue();
    expect(values[2]).assertEqual(Enum5.Blue);
    expect(values[2].valueOf() instanceof float).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum5.Blue.valueOf());
    expect(Enum5[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum5).assertTrue();
    expect(values[3]).assertEqual(Enum5.First);
    expect(values[3].valueOf() instanceof float).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum5.First.valueOf());
    expect(Enum5[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum5).assertTrue();
    expect(values[4]).assertEqual(Enum5.Second);
    expect(values[4].valueOf() instanceof float).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum5.Second.valueOf());
    expect(Enum5[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum5).assertTrue();
    expect(values[5]).assertEqual(Enum5.Third);
    expect(values[5].valueOf() instanceof float).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum5.Third.valueOf());
    expect(Enum5[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum5).assertTrue();
    expect(values[6]).assertEqual(Enum5.One);
    expect(values[6].valueOf() instanceof float).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum5.One.valueOf());
    expect(Enum5[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum5).assertTrue();
    expect(values[7]).assertEqual(Enum5.one);
    expect(values[7].valueOf() instanceof float).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum5.one.valueOf());
    expect(Enum5[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum5).assertTrue();
    expect(values[8]).assertEqual(Enum5.oNe);
    expect(values[8].valueOf() instanceof float).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum5.oNe.valueOf());
    expect(Enum5[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_11.ets
  export function runTest151(): boolean {
    let values = Enum5.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum5).assertTrue();
    expect(values[0]).assertEqual(Enum5.Red);
    expect(values[0].valueOf() instanceof float).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum5.Red.valueOf());
    expect(Enum5[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum5).assertTrue();
    expect(values[1]).assertEqual(Enum5.Green);
    expect(values[1].valueOf() instanceof float).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum5.Green.valueOf());
    expect(Enum5[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum5).assertTrue();
    expect(values[2]).assertEqual(Enum5.Blue);
    expect(values[2].valueOf() instanceof float).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum5.Blue.valueOf());
    expect(Enum5[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum5).assertTrue();
    expect(values[3]).assertEqual(Enum5.First);
    expect(values[3].valueOf() instanceof float).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum5.First.valueOf());
    expect(Enum5[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum5).assertTrue();
    expect(values[4]).assertEqual(Enum5.Second);
    expect(values[4].valueOf() instanceof float).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum5.Second.valueOf());
    expect(Enum5[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum5).assertTrue();
    expect(values[5]).assertEqual(Enum5.Third);
    expect(values[5].valueOf() instanceof float).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum5.Third.valueOf());
    expect(Enum5[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum5).assertTrue();
    expect(values[6]).assertEqual(Enum5.One);
    expect(values[6].valueOf() instanceof float).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum5.One.valueOf());
    expect(Enum5[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum5).assertTrue();
    expect(values[7]).assertEqual(Enum5.one);
    expect(values[7].valueOf() instanceof float).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum5.one.valueOf());
    expect(Enum5[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum5).assertTrue();
    expect(values[8]).assertEqual(Enum5.oNe);
    expect(values[8].valueOf() instanceof float).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum5.oNe.valueOf());
    expect(Enum5[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_12.ets
  export function runTest152(): boolean {
    let values = Enum7.values();
    expect(values.length).assertEqual(7);

    expect(values[0] instanceof Enum7).assertTrue();
    expect(values[0]).assertEqual(Enum7.Red);
    expect(values[0].valueOf() instanceof String).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum7.Red.valueOf());
    expect(Enum7[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum7).assertTrue();
    expect(values[1]).assertEqual(Enum7.Green);
    expect(values[1].valueOf() instanceof String).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum7.Green.valueOf());
    expect(Enum7[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum7).assertTrue();
    expect(values[2]).assertEqual(Enum7.Blue);
    expect(values[2].valueOf() instanceof String).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum7.Blue.valueOf());
    expect(Enum7[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum7).assertTrue();
    expect(values[3]).assertEqual(Enum7.Complex);
    expect(values[3].valueOf() instanceof String).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum7.Complex.valueOf());
    expect(Enum7[values[3]]).assertEqual("Complex");

    expect(values[4] instanceof Enum7).assertTrue();
    expect(values[4]).assertEqual(Enum7.One);
    expect(values[4].valueOf() instanceof String).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum7.One.valueOf());
    expect(Enum7[values[4]]).assertEqual("One");

    expect(values[5] instanceof Enum7).assertTrue();
    expect(values[5]).assertEqual(Enum7.one);
    expect(values[5].valueOf() instanceof String).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum7.one.valueOf());
    expect(Enum7[values[5]]).assertEqual("one");

    expect(values[6] instanceof Enum7).assertTrue();
    expect(values[6]).assertEqual(Enum7.oNe);
    expect(values[6].valueOf() instanceof String).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum7.oNe.valueOf());
    expect(Enum7[values[6]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_13.ets
  export function runTest153(): boolean {
    let values = Enum7.values();
    expect(values.length).assertEqual(7);

    expect(values[0] instanceof Enum7).assertTrue();
    expect(values[0]).assertEqual(Enum7.Red);
    expect(values[0].valueOf() instanceof String).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum7.Red.valueOf());
    expect(Enum7[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum7).assertTrue();
    expect(values[1]).assertEqual(Enum7.Green);
    expect(values[1].valueOf() instanceof String).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum7.Green.valueOf());
    expect(Enum7[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum7).assertTrue();
    expect(values[2]).assertEqual(Enum7.Blue);
    expect(values[2].valueOf() instanceof String).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum7.Blue.valueOf());
    expect(Enum7[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum7).assertTrue();
    expect(values[3]).assertEqual(Enum7.Complex);
    expect(values[3].valueOf() instanceof String).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum7.Complex.valueOf());
    expect(Enum7[values[3]]).assertEqual("Complex");

    expect(values[4] instanceof Enum7).assertTrue();
    expect(values[4]).assertEqual(Enum7.One);
    expect(values[4].valueOf() instanceof String).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum7.One.valueOf());
    expect(Enum7[values[4]]).assertEqual("One");

    expect(values[5] instanceof Enum7).assertTrue();
    expect(values[5]).assertEqual(Enum7.one);
    expect(values[5].valueOf() instanceof String).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum7.one.valueOf());
    expect(Enum7[values[5]]).assertEqual("one");

    expect(values[6] instanceof Enum7).assertTrue();
    expect(values[6]).assertEqual(Enum7.oNe);
    expect(values[6].valueOf() instanceof String).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum7.oNe.valueOf());
    expect(Enum7[values[6]]).assertEqual("oNe");

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
     * 源文件：        enum_explicit_type_values_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0141
     * @tc.desc      Checking for enum with explicit int type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum3.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum3).assertTrue();
      expect(values[0]).assertEqual(Enum3.Red);
      expect(values[0].valueOf() instanceof int).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum3.Red.valueOf());
      expect(Enum3[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum3).assertTrue();
      expect(values[1]).assertEqual(Enum3.Green);
      expect(values[1].valueOf() instanceof int).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum3.Green.valueOf());
      expect(Enum3[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum3).assertTrue();
      expect(values[2]).assertEqual(Enum3.Blue);
      expect(values[2].valueOf() instanceof int).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum3.Blue.valueOf());
      expect(Enum3[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum3).assertTrue();
      expect(values[3]).assertEqual(Enum3.First);
      expect(values[3].valueOf() instanceof int).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum3.First.valueOf());
      expect(Enum3[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum3).assertTrue();
      expect(values[4]).assertEqual(Enum3.Second);
      expect(values[4].valueOf() instanceof int).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum3.Second.valueOf());
      expect(Enum3[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum3).assertTrue();
      expect(values[5]).assertEqual(Enum3.Third);
      expect(values[5].valueOf() instanceof int).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum3.Third.valueOf());
      expect(Enum3[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum3).assertTrue();
      expect(values[6]).assertEqual(Enum3.One);
      expect(values[6].valueOf() instanceof int).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum3.One.valueOf());
      expect(Enum3[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum3).assertTrue();
      expect(values[7]).assertEqual(Enum3.one);
      expect(values[7].valueOf() instanceof int).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum3.one.valueOf());
      expect(Enum3[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum3).assertTrue();
      expect(values[8]).assertEqual(Enum3.oNe);
      expect(values[8].valueOf() instanceof int).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum3.oNe.valueOf());
      expect(Enum3[values[8]]).assertEqual("oNe");

      expect(testNS.runTest140()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0142
     * @tc.desc      Checking for enum with explicit int type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum3.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum3).assertTrue();
      expect(values[0]).assertEqual(Enum3.Red);
      expect(values[0].valueOf() instanceof int).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum3.Red.valueOf());
      expect(Enum3[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum3).assertTrue();
      expect(values[1]).assertEqual(Enum3.Green);
      expect(values[1].valueOf() instanceof int).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum3.Green.valueOf());
      expect(Enum3[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum3).assertTrue();
      expect(values[2]).assertEqual(Enum3.Blue);
      expect(values[2].valueOf() instanceof int).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum3.Blue.valueOf());
      expect(Enum3[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum3).assertTrue();
      expect(values[3]).assertEqual(Enum3.First);
      expect(values[3].valueOf() instanceof int).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum3.First.valueOf());
      expect(Enum3[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum3).assertTrue();
      expect(values[4]).assertEqual(Enum3.Second);
      expect(values[4].valueOf() instanceof int).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum3.Second.valueOf());
      expect(Enum3[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum3).assertTrue();
      expect(values[5]).assertEqual(Enum3.Third);
      expect(values[5].valueOf() instanceof int).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum3.Third.valueOf());
      expect(Enum3[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum3).assertTrue();
      expect(values[6]).assertEqual(Enum3.One);
      expect(values[6].valueOf() instanceof int).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum3.One.valueOf());
      expect(Enum3[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum3).assertTrue();
      expect(values[7]).assertEqual(Enum3.one);
      expect(values[7].valueOf() instanceof int).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum3.one.valueOf());
      expect(Enum3[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum3).assertTrue();
      expect(values[8]).assertEqual(Enum3.oNe);
      expect(values[8].valueOf() instanceof int).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum3.oNe.valueOf());
      expect(Enum3[values[8]]).assertEqual("oNe");

      expect(testNS.runTest141()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0143
     * @tc.desc      Checking for enum with explicit long type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum4.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum4).assertTrue();
      expect(values[0]).assertEqual(Enum4.Red);
      expect(values[0].valueOf() instanceof long).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum4.Red.valueOf());
      expect(Enum4[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum4).assertTrue();
      expect(values[1]).assertEqual(Enum4.Green);
      expect(values[1].valueOf() instanceof long).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum4.Green.valueOf());
      expect(Enum4[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum4).assertTrue();
      expect(values[2]).assertEqual(Enum4.Blue);
      expect(values[2].valueOf() instanceof long).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum4.Blue.valueOf());
      expect(Enum4[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum4).assertTrue();
      expect(values[3]).assertEqual(Enum4.First);
      expect(values[3].valueOf() instanceof long).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum4.First.valueOf());
      expect(Enum4[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum4).assertTrue();
      expect(values[4]).assertEqual(Enum4.Second);
      expect(values[4].valueOf() instanceof long).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum4.Second.valueOf());
      expect(Enum4[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum4).assertTrue();
      expect(values[5]).assertEqual(Enum4.Third);
      expect(values[5].valueOf() instanceof long).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum4.Third.valueOf());
      expect(Enum4[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum4).assertTrue();
      expect(values[6]).assertEqual(Enum4.One);
      expect(values[6].valueOf() instanceof long).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum4.One.valueOf());
      expect(Enum4[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum4).assertTrue();
      expect(values[7]).assertEqual(Enum4.one);
      expect(values[7].valueOf() instanceof long).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum4.one.valueOf());
      expect(Enum4[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum4).assertTrue();
      expect(values[8]).assertEqual(Enum4.oNe);
      expect(values[8].valueOf() instanceof long).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum4.oNe.valueOf());
      expect(Enum4[values[8]]).assertEqual("oNe");

      expect(testNS.runTest142()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0144
     * @tc.desc      Checking for enum with explicit long type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum4.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum4).assertTrue();
      expect(values[0]).assertEqual(Enum4.Red);
      expect(values[0].valueOf() instanceof long).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum4.Red.valueOf());
      expect(Enum4[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum4).assertTrue();
      expect(values[1]).assertEqual(Enum4.Green);
      expect(values[1].valueOf() instanceof long).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum4.Green.valueOf());
      expect(Enum4[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum4).assertTrue();
      expect(values[2]).assertEqual(Enum4.Blue);
      expect(values[2].valueOf() instanceof long).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum4.Blue.valueOf());
      expect(Enum4[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum4).assertTrue();
      expect(values[3]).assertEqual(Enum4.First);
      expect(values[3].valueOf() instanceof long).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum4.First.valueOf());
      expect(Enum4[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum4).assertTrue();
      expect(values[4]).assertEqual(Enum4.Second);
      expect(values[4].valueOf() instanceof long).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum4.Second.valueOf());
      expect(Enum4[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum4).assertTrue();
      expect(values[5]).assertEqual(Enum4.Third);
      expect(values[5].valueOf() instanceof long).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum4.Third.valueOf());
      expect(Enum4[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum4).assertTrue();
      expect(values[6]).assertEqual(Enum4.One);
      expect(values[6].valueOf() instanceof long).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum4.One.valueOf());
      expect(Enum4[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum4).assertTrue();
      expect(values[7]).assertEqual(Enum4.one);
      expect(values[7].valueOf() instanceof long).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum4.one.valueOf());
      expect(Enum4[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum4).assertTrue();
      expect(values[8]).assertEqual(Enum4.oNe);
      expect(values[8].valueOf() instanceof long).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum4.oNe.valueOf());
      expect(Enum4[values[8]]).assertEqual("oNe");

      expect(testNS.runTest143()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0145
     * @tc.desc      Checking for enum with explicit byte type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum1.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum1).assertTrue();
      expect(values[0]).assertEqual(Enum1.Red);
      expect(values[0].valueOf() instanceof byte).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum1.Red.valueOf());
      expect(Enum1[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum1).assertTrue();
      expect(values[1]).assertEqual(Enum1.Green);
      expect(values[1].valueOf() instanceof byte).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum1.Green.valueOf());
      expect(Enum1[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum1).assertTrue();
      expect(values[2]).assertEqual(Enum1.Blue);
      expect(values[2].valueOf() instanceof byte).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum1.Blue.valueOf());
      expect(Enum1[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum1).assertTrue();
      expect(values[3]).assertEqual(Enum1.First);
      expect(values[3].valueOf() instanceof byte).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum1.First.valueOf());
      expect(Enum1[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum1).assertTrue();
      expect(values[4]).assertEqual(Enum1.Second);
      expect(values[4].valueOf() instanceof byte).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum1.Second.valueOf());
      expect(Enum1[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum1).assertTrue();
      expect(values[5]).assertEqual(Enum1.Third);
      expect(values[5].valueOf() instanceof byte).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum1.Third.valueOf());
      expect(Enum1[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum1).assertTrue();
      expect(values[6]).assertEqual(Enum1.One);
      expect(values[6].valueOf() instanceof byte).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum1.One.valueOf());
      expect(Enum1[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum1).assertTrue();
      expect(values[7]).assertEqual(Enum1.one);
      expect(values[7].valueOf() instanceof byte).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum1.one.valueOf());
      expect(Enum1[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum1).assertTrue();
      expect(values[8]).assertEqual(Enum1.oNe);
      expect(values[8].valueOf() instanceof byte).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum1.oNe.valueOf());
      expect(Enum1[values[8]]).assertEqual("oNe");

      expect(testNS.runTest144()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0146
     * @tc.desc      Checking for enum with explicit byte type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum1.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum1).assertTrue();
      expect(values[0]).assertEqual(Enum1.Red);
      expect(values[0].valueOf() instanceof byte).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum1.Red.valueOf());
      expect(Enum1[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum1).assertTrue();
      expect(values[1]).assertEqual(Enum1.Green);
      expect(values[1].valueOf() instanceof byte).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum1.Green.valueOf());
      expect(Enum1[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum1).assertTrue();
      expect(values[2]).assertEqual(Enum1.Blue);
      expect(values[2].valueOf() instanceof byte).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum1.Blue.valueOf());
      expect(Enum1[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum1).assertTrue();
      expect(values[3]).assertEqual(Enum1.First);
      expect(values[3].valueOf() instanceof byte).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum1.First.valueOf());
      expect(Enum1[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum1).assertTrue();
      expect(values[4]).assertEqual(Enum1.Second);
      expect(values[4].valueOf() instanceof byte).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum1.Second.valueOf());
      expect(Enum1[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum1).assertTrue();
      expect(values[5]).assertEqual(Enum1.Third);
      expect(values[5].valueOf() instanceof byte).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum1.Third.valueOf());
      expect(Enum1[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum1).assertTrue();
      expect(values[6]).assertEqual(Enum1.One);
      expect(values[6].valueOf() instanceof byte).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum1.One.valueOf());
      expect(Enum1[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum1).assertTrue();
      expect(values[7]).assertEqual(Enum1.one);
      expect(values[7].valueOf() instanceof byte).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum1.one.valueOf());
      expect(Enum1[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum1).assertTrue();
      expect(values[8]).assertEqual(Enum1.oNe);
      expect(values[8].valueOf() instanceof byte).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum1.oNe.valueOf());
      expect(Enum1[values[8]]).assertEqual("oNe");

      expect(testNS.runTest145()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0147
     * @tc.desc      Checking for enum with explicit short type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum2.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum2).assertTrue();
      expect(values[0]).assertEqual(Enum2.Red);
      expect(values[0].valueOf() instanceof short).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum2.Red.valueOf());
      expect(Enum2[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum2).assertTrue();
      expect(values[1]).assertEqual(Enum2.Green);
      expect(values[1].valueOf() instanceof short).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
      expect(Enum2[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum2).assertTrue();
      expect(values[2]).assertEqual(Enum2.Blue);
      expect(values[2].valueOf() instanceof short).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum2.Blue.valueOf());
      expect(Enum2[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum2).assertTrue();
      expect(values[3]).assertEqual(Enum2.First);
      expect(values[3].valueOf() instanceof short).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum2.First.valueOf());
      expect(Enum2[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum2).assertTrue();
      expect(values[4]).assertEqual(Enum2.Second);
      expect(values[4].valueOf() instanceof short).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum2.Second.valueOf());
      expect(Enum2[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum2).assertTrue();
      expect(values[5]).assertEqual(Enum2.Third);
      expect(values[5].valueOf() instanceof short).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum2.Third.valueOf());
      expect(Enum2[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum2).assertTrue();
      expect(values[6]).assertEqual(Enum2.One);
      expect(values[6].valueOf() instanceof short).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum2.One.valueOf());
      expect(Enum2[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum2).assertTrue();
      expect(values[7]).assertEqual(Enum2.one);
      expect(values[7].valueOf() instanceof short).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum2.one.valueOf());
      expect(Enum2[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum2).assertTrue();
      expect(values[8]).assertEqual(Enum2.oNe);
      expect(values[8].valueOf() instanceof short).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum2.oNe.valueOf());
      expect(Enum2[values[8]]).assertEqual("oNe");

      expect(testNS.runTest146()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0148
     * @tc.desc      Checking for enum with explicit short type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum2.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum2).assertTrue();
      expect(values[0]).assertEqual(Enum2.Red);
      expect(values[0].valueOf() instanceof short).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum2.Red.valueOf());
      expect(Enum2[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum2).assertTrue();
      expect(values[1]).assertEqual(Enum2.Green);
      expect(values[1].valueOf() instanceof short).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
      expect(Enum2[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum2).assertTrue();
      expect(values[2]).assertEqual(Enum2.Blue);
      expect(values[2].valueOf() instanceof short).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum2.Blue.valueOf());
      expect(Enum2[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum2).assertTrue();
      expect(values[3]).assertEqual(Enum2.First);
      expect(values[3].valueOf() instanceof short).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum2.First.valueOf());
      expect(Enum2[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum2).assertTrue();
      expect(values[4]).assertEqual(Enum2.Second);
      expect(values[4].valueOf() instanceof short).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum2.Second.valueOf());
      expect(Enum2[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum2).assertTrue();
      expect(values[5]).assertEqual(Enum2.Third);
      expect(values[5].valueOf() instanceof short).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum2.Third.valueOf());
      expect(Enum2[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum2).assertTrue();
      expect(values[6]).assertEqual(Enum2.One);
      expect(values[6].valueOf() instanceof short).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum2.One.valueOf());
      expect(Enum2[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum2).assertTrue();
      expect(values[7]).assertEqual(Enum2.one);
      expect(values[7].valueOf() instanceof short).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum2.one.valueOf());
      expect(Enum2[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum2).assertTrue();
      expect(values[8]).assertEqual(Enum2.oNe);
      expect(values[8].valueOf() instanceof short).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum2.oNe.valueOf());
      expect(Enum2[values[8]]).assertEqual("oNe");

      expect(testNS.runTest147()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0149
     * @tc.desc      Checking for enum with explicit double type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum6.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum6).assertTrue();
      expect(values[0]).assertEqual(Enum6.Red);
      expect(values[0].valueOf() instanceof double).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum6.Red.valueOf());
      expect(Enum6[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum6).assertTrue();
      expect(values[1]).assertEqual(Enum6.Green);
      expect(values[1].valueOf() instanceof double).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum6.Green.valueOf());
      expect(Enum6[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum6).assertTrue();
      expect(values[2]).assertEqual(Enum6.Blue);
      expect(values[2].valueOf() instanceof double).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum6.Blue.valueOf());
      expect(Enum6[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum6).assertTrue();
      expect(values[3]).assertEqual(Enum6.First);
      expect(values[3].valueOf() instanceof double).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum6.First.valueOf());
      expect(Enum6[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum6).assertTrue();
      expect(values[4]).assertEqual(Enum6.Second);
      expect(values[4].valueOf() instanceof double).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum6.Second.valueOf());
      expect(Enum6[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum6).assertTrue();
      expect(values[5]).assertEqual(Enum6.Third);
      expect(values[5].valueOf() instanceof double).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum6.Third.valueOf());
      expect(Enum6[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum6).assertTrue();
      expect(values[6]).assertEqual(Enum6.One);
      expect(values[6].valueOf() instanceof double).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum6.One.valueOf());
      expect(Enum6[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum6).assertTrue();
      expect(values[7]).assertEqual(Enum6.one);
      expect(values[7].valueOf() instanceof double).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum6.one.valueOf());
      expect(Enum6[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum6).assertTrue();
      expect(values[8]).assertEqual(Enum6.oNe);
      expect(values[8].valueOf() instanceof double).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum6.oNe.valueOf());
      expect(Enum6[values[8]]).assertEqual("oNe");

      expect(testNS.runTest148()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0150
     * @tc.desc      Checking for enum with explicit double type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum6.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum6).assertTrue();
      expect(values[0]).assertEqual(Enum6.Red);
      expect(values[0].valueOf() instanceof double).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum6.Red.valueOf());
      expect(Enum6[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum6).assertTrue();
      expect(values[1]).assertEqual(Enum6.Green);
      expect(values[1].valueOf() instanceof double).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum6.Green.valueOf());
      expect(Enum6[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum6).assertTrue();
      expect(values[2]).assertEqual(Enum6.Blue);
      expect(values[2].valueOf() instanceof double).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum6.Blue.valueOf());
      expect(Enum6[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum6).assertTrue();
      expect(values[3]).assertEqual(Enum6.First);
      expect(values[3].valueOf() instanceof double).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum6.First.valueOf());
      expect(Enum6[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum6).assertTrue();
      expect(values[4]).assertEqual(Enum6.Second);
      expect(values[4].valueOf() instanceof double).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum6.Second.valueOf());
      expect(Enum6[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum6).assertTrue();
      expect(values[5]).assertEqual(Enum6.Third);
      expect(values[5].valueOf() instanceof double).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum6.Third.valueOf());
      expect(Enum6[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum6).assertTrue();
      expect(values[6]).assertEqual(Enum6.One);
      expect(values[6].valueOf() instanceof double).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum6.One.valueOf());
      expect(Enum6[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum6).assertTrue();
      expect(values[7]).assertEqual(Enum6.one);
      expect(values[7].valueOf() instanceof double).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum6.one.valueOf());
      expect(Enum6[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum6).assertTrue();
      expect(values[8]).assertEqual(Enum6.oNe);
      expect(values[8].valueOf() instanceof double).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum6.oNe.valueOf());
      expect(Enum6[values[8]]).assertEqual("oNe");

      expect(testNS.runTest149()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0151
     * @tc.desc      Checking for enum with explicit float type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum5.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum5).assertTrue();
      expect(values[0]).assertEqual(Enum5.Red);
      expect(values[0].valueOf() instanceof float).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum5.Red.valueOf());
      expect(Enum5[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum5).assertTrue();
      expect(values[1]).assertEqual(Enum5.Green);
      expect(values[1].valueOf() instanceof float).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum5.Green.valueOf());
      expect(Enum5[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum5).assertTrue();
      expect(values[2]).assertEqual(Enum5.Blue);
      expect(values[2].valueOf() instanceof float).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum5.Blue.valueOf());
      expect(Enum5[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum5).assertTrue();
      expect(values[3]).assertEqual(Enum5.First);
      expect(values[3].valueOf() instanceof float).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum5.First.valueOf());
      expect(Enum5[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum5).assertTrue();
      expect(values[4]).assertEqual(Enum5.Second);
      expect(values[4].valueOf() instanceof float).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum5.Second.valueOf());
      expect(Enum5[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum5).assertTrue();
      expect(values[5]).assertEqual(Enum5.Third);
      expect(values[5].valueOf() instanceof float).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum5.Third.valueOf());
      expect(Enum5[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum5).assertTrue();
      expect(values[6]).assertEqual(Enum5.One);
      expect(values[6].valueOf() instanceof float).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum5.One.valueOf());
      expect(Enum5[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum5).assertTrue();
      expect(values[7]).assertEqual(Enum5.one);
      expect(values[7].valueOf() instanceof float).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum5.one.valueOf());
      expect(Enum5[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum5).assertTrue();
      expect(values[8]).assertEqual(Enum5.oNe);
      expect(values[8].valueOf() instanceof float).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum5.oNe.valueOf());
      expect(Enum5[values[8]]).assertEqual("oNe");

      expect(testNS.runTest150()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0152
     * @tc.desc      Checking for enum with explicit float type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum5.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum5).assertTrue();
      expect(values[0]).assertEqual(Enum5.Red);
      expect(values[0].valueOf() instanceof float).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum5.Red.valueOf());
      expect(Enum5[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum5).assertTrue();
      expect(values[1]).assertEqual(Enum5.Green);
      expect(values[1].valueOf() instanceof float).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum5.Green.valueOf());
      expect(Enum5[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum5).assertTrue();
      expect(values[2]).assertEqual(Enum5.Blue);
      expect(values[2].valueOf() instanceof float).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum5.Blue.valueOf());
      expect(Enum5[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum5).assertTrue();
      expect(values[3]).assertEqual(Enum5.First);
      expect(values[3].valueOf() instanceof float).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum5.First.valueOf());
      expect(Enum5[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum5).assertTrue();
      expect(values[4]).assertEqual(Enum5.Second);
      expect(values[4].valueOf() instanceof float).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum5.Second.valueOf());
      expect(Enum5[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum5).assertTrue();
      expect(values[5]).assertEqual(Enum5.Third);
      expect(values[5].valueOf() instanceof float).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum5.Third.valueOf());
      expect(Enum5[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum5).assertTrue();
      expect(values[6]).assertEqual(Enum5.One);
      expect(values[6].valueOf() instanceof float).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum5.One.valueOf());
      expect(Enum5[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum5).assertTrue();
      expect(values[7]).assertEqual(Enum5.one);
      expect(values[7].valueOf() instanceof float).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum5.one.valueOf());
      expect(Enum5[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum5).assertTrue();
      expect(values[8]).assertEqual(Enum5.oNe);
      expect(values[8].valueOf() instanceof float).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum5.oNe.valueOf());
      expect(Enum5[values[8]]).assertEqual("oNe");

      expect(testNS.runTest151()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_12.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0153
     * @tc.desc      Checking for enum with explicit string type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum7.values();
      expect(values.length).assertEqual(7);

      expect(values[0] instanceof Enum7).assertTrue();
      expect(values[0]).assertEqual(Enum7.Red);
      expect(values[0].valueOf() instanceof String).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum7.Red.valueOf());
      expect(Enum7[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum7).assertTrue();
      expect(values[1]).assertEqual(Enum7.Green);
      expect(values[1].valueOf() instanceof String).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum7.Green.valueOf());
      expect(Enum7[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum7).assertTrue();
      expect(values[2]).assertEqual(Enum7.Blue);
      expect(values[2].valueOf() instanceof String).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum7.Blue.valueOf());
      expect(Enum7[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum7).assertTrue();
      expect(values[3]).assertEqual(Enum7.Complex);
      expect(values[3].valueOf() instanceof String).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum7.Complex.valueOf());
      expect(Enum7[values[3]]).assertEqual("Complex");

      expect(values[4] instanceof Enum7).assertTrue();
      expect(values[4]).assertEqual(Enum7.One);
      expect(values[4].valueOf() instanceof String).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum7.One.valueOf());
      expect(Enum7[values[4]]).assertEqual("One");

      expect(values[5] instanceof Enum7).assertTrue();
      expect(values[5]).assertEqual(Enum7.one);
      expect(values[5].valueOf() instanceof String).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum7.one.valueOf());
      expect(Enum7[values[5]]).assertEqual("one");

      expect(values[6] instanceof Enum7).assertTrue();
      expect(values[6]).assertEqual(Enum7.oNe);
      expect(values[6].valueOf() instanceof String).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum7.oNe.valueOf());
      expect(Enum7[values[6]]).assertEqual("oNe");

      expect(testNS.runTest152()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_values_13.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0154
     * @tc.desc      Checking for enum with explicit string type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum7.values();
      expect(values.length).assertEqual(7);

      expect(values[0] instanceof Enum7).assertTrue();
      expect(values[0]).assertEqual(Enum7.Red);
      expect(values[0].valueOf() instanceof String).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum7.Red.valueOf());
      expect(Enum7[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum7).assertTrue();
      expect(values[1]).assertEqual(Enum7.Green);
      expect(values[1].valueOf() instanceof String).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum7.Green.valueOf());
      expect(Enum7[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum7).assertTrue();
      expect(values[2]).assertEqual(Enum7.Blue);
      expect(values[2].valueOf() instanceof String).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum7.Blue.valueOf());
      expect(Enum7[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum7).assertTrue();
      expect(values[3]).assertEqual(Enum7.Complex);
      expect(values[3].valueOf() instanceof String).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum7.Complex.valueOf());
      expect(Enum7[values[3]]).assertEqual("Complex");

      expect(values[4] instanceof Enum7).assertTrue();
      expect(values[4]).assertEqual(Enum7.One);
      expect(values[4].valueOf() instanceof String).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum7.One.valueOf());
      expect(Enum7[values[4]]).assertEqual("One");

      expect(values[5] instanceof Enum7).assertTrue();
      expect(values[5]).assertEqual(Enum7.one);
      expect(values[5].valueOf() instanceof String).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum7.one.valueOf());
      expect(Enum7[values[5]]).assertEqual("one");

      expect(values[6] instanceof Enum7).assertTrue();
      expect(values[6]).assertEqual(Enum7.oNe);
      expect(values[6].valueOf() instanceof String).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum7.oNe.valueOf());
      expect(Enum7[values[6]]).assertEqual("oNe");

      expect(testNS.runTest153()).assertTrue();
    });
  })
}