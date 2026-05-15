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

  // enum_implicit_type_getvalueof_0.ets
  export function runTest178(): boolean {
    expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
    expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
    expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
    expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
    expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

    expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
    expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
    expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

    expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
    expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
    expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
    expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_implicit_type_getvalueof_1.ets
  export function runTest179(): boolean {
    expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
    expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
    expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
    expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
    expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

    expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
    expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
    expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

    expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
    expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
    expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
    expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_implicit_type_getvalueof_2.ets
  export function runTest180(): boolean {
    expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
    expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
    expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
    expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
    expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
    expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
    expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
    expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
    expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
    expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_implicit_type_getvalueof_3.ets
  export function runTest181(): boolean {
    expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
    expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
    expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
    expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
    expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
    expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
    expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
    expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
    expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
    expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_implicit_type_getvalueof_4.ets
  export function runTest182(): boolean {
    expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
    expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

    expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
    expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

    expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
    expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

    expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
    expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
    expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
    expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
    expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");

    return true;
  }

  // enum_implicit_type_getvalueof_5.ets
  export function runTest183(): boolean {
    expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
    expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

    expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
    expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

    expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
    expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

    expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
    expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
    expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
    expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
    expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");

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
     * 源文件：        enum_implicit_type_getvalueof_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0179
     * @tc.desc      Checking for enum with implicit int type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
      expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
      expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
      expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
      expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

      expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
      expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
      expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

      expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
      expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
      expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
      expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest178()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getvalueof_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0180
     * @tc.desc      Checking for enum with implicit int type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
      expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
      expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
      expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
      expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

      expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
      expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
      expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

      expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
      expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
      expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
      expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest179()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getvalueof_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0181
     * @tc.desc      Checking for enum with implicit long type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
      expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
      expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
      expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
      expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
      expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
      expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
      expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
      expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
      expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest180()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getvalueof_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0182
     * @tc.desc      Checking for enum with implicit long type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
      expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
      expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
      expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
      expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
      expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
      expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
      expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
      expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
      expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest181()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getvalueof_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0183
     * @tc.desc      Checking for enum with implicit string type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
      expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

      expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
      expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

      expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
      expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

      expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
      expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
      expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
      expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
      expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");


      expect(testNS.runTest182()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getvalueof_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0184
     * @tc.desc      Checking for enum with implicit string type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
      expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

      expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
      expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

      expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
      expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

      expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
      expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
      expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
      expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
      expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");

      expect(testNS.runTest183()).assertTrue();
    });
  })
}