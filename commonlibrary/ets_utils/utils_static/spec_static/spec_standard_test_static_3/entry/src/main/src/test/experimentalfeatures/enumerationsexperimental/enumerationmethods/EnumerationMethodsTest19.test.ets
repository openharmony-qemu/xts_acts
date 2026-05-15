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

  // enum_implicit_type_values_0.ets
  export function runTest214(): boolean {
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

  // enum_implicit_type_values_1.ets
  export function runTest215(): boolean {
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
    expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
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

  // enum_implicit_type_values_2.ets
  export function runTest216(): boolean {
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

  // enum_implicit_type_values_3.ets
  export function runTest217(): boolean {
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

  // enum_implicit_type_values_4.ets
  export function runTest218(): boolean {
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

  // enum_implicit_type_values_5.ets
  export function runTest219(): boolean {
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
     * 源文件：        enum_implicit_type_values_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0215
     * @tc.desc      Checking for enum with implicit int type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest214()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_values_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0216
     * @tc.desc      Checking for enum with implicit int type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
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


      expect(testNS.runTest215()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_values_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0217
     * @tc.desc      Checking for enum with implicit long type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest216()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_values_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0218
     * @tc.desc      Checking for enum with implicit long type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest217()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_values_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0219
     * @tc.desc      Checking for enum with implicit string type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest218()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_values_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0220
     * @tc.desc      Checking for enum with implicit string type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest219()).assertTrue();
    });
  })
}