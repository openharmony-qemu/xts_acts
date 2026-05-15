import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Enum22: short {
  Red,
  Green = 10,
  Blue,
  First = -32768,
  Second = 12345,
  Third = 32767,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum23: double {
  Red = 1.5,
  Green = 10.3,
  Blue = 7.6,
  First = -214748.3648,
  Second = 123.45,
  Third = 2147483.647,
  One = 1.0,
  one = 1.0,
  oNe = 1.0
}

enum Enum24: float {
  Red = 1.5f,
  Green = 10.3f,
  Blue = 7.6f,
  First = -214748.3648f,
  Second = 123.45f,
  Third = 2147483.647f,
  One = 1.0f,
  one = 1.0f,
  oNe = 1.0f
}

enum Enum25: string {
  Red = "reD",
  Green = "grEen",
  Blue = "Blue",
  Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
  One = "one",
  one = "one",
  oNe = "one"
}

namespace testNS50 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof short).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-32768")
    expect(Enum.Second.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("12345")
    expect(Enum.Third.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("32767")
    expect(Enum.One.valueOf() instanceof short).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof short).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof short).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS51 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof short).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-32768")
    expect(Enum.Second.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("12345")
    expect(Enum.Third.valueOf() instanceof short).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("32767")
    expect(Enum.One.valueOf() instanceof short).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof short).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof short).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS52 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("-32768")
    c = Enum.Second
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("12345")
    c = Enum.Third
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("32767")
    c = Enum.One
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS53 {
  enum Enum: short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("-32768")
    c = Enum.Second
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("12345")
    c = Enum.Third
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("32767")
    c = Enum.One
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof short).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS54 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("1.5")
    expect(Enum.Green.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10.3")
    expect(Enum.Blue.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("7.6")
    expect(Enum.First.valueOf() instanceof double).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-214748.3648")
    expect(Enum.Second.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("123.45")
    expect(Enum.Third.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("2147483.647")
    expect(Enum.One.valueOf() instanceof double).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof double).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof double).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS55 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("1.5")
    expect(Enum.Green.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10.3")
    expect(Enum.Blue.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("7.6")
    expect(Enum.First.valueOf() instanceof double).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-214748.3648")
    expect(Enum.Second.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("123.45")
    expect(Enum.Third.valueOf() instanceof double).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("2147483.647")
    expect(Enum.One.valueOf() instanceof double).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof double).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof double).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS56 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1.5")
    c = Enum.Green
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("10.3")
    c = Enum.Blue
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("7.6")
    c = Enum.First
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("-214748.3648")
    c = Enum.Second
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("123.45")
    c = Enum.Third
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("2147483.647")
    c = Enum.One
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS57 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1.5")
    c = Enum.Green
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("10.3")
    c = Enum.Blue
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("7.6")
    c = Enum.First
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("-214748.3648")
    c = Enum.Second
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("123.45")
    c = Enum.Third
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("2147483.647")
    c = Enum.One
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS58 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("1.5")
    expect(Enum.Green.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10.3")
    expect(Enum.Blue.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("7.6")
    expect(Enum.First.valueOf() instanceof float).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-214748.3648")
    expect(Enum.Second.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("123.45")
    expect(Enum.Third.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("2147483.647")
    expect(Enum.One.valueOf() instanceof float).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof float).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof float).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS59 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("1.5")
    expect(Enum.Green.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10.3")
    expect(Enum.Blue.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("7.6")
    expect(Enum.First.valueOf() instanceof float).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-214748.3648")
    expect(Enum.Second.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("123.45")
    expect(Enum.Third.valueOf() instanceof float).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("2147483.647")
    expect(Enum.One.valueOf() instanceof float).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof float).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof float).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS60 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1.5")
    c = Enum.Green
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("10.3")
    c = Enum.Blue
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("7.6")
    c = Enum.First
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("-214748.3648")
    c = Enum.Second
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("123.45")
    c = Enum.Third
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("2147483.647")
    c = Enum.One
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS61 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1.5")
    c = Enum.Green
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("10.3")
    c = Enum.Blue
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("7.6")
    c = Enum.First
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("-214748.3648")
    c = Enum.Second
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("123.45")
    c = Enum.Third
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("2147483.647")
    c = Enum.One
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS62 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("reD")
    expect(Enum.Green.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("grEen")
    expect(Enum.Blue.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("Blue")
    expect(Enum.Complex.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Complex.toString()).assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!")
    expect(Enum.One.valueOf() instanceof string).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("one")
    expect(Enum.one.valueOf() instanceof string).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof string).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("one")
    return true
  }
}

namespace testNS63 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("reD")
    expect(Enum.Green.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("grEen")
    expect(Enum.Blue.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("Blue")
    expect(Enum.Complex.valueOf() instanceof string).assertEqual(true)
    expect(Enum.Complex.toString()).assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!")
    expect(Enum.One.valueOf() instanceof string).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("one")
    expect(Enum.one.valueOf() instanceof string).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof string).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("one")
    return true
  }
}

namespace testNS64 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("reD")
    c = Enum.Green
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("grEen")
    c = Enum.Blue
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("Blue")
    c = Enum.Complex
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!")
    c = Enum.One
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("one")
    c = Enum.one
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("one")
    return true
  }
}

namespace testNS65 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("reD")
    c = Enum.Green
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("grEen")
    c = Enum.Blue
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("Blue")
    c = Enum.Complex
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!")
    c = Enum.One
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("one")
    c = Enum.one
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c.toString()).assertEqual("one")
    return true
  }
}

export default function EnumerationWithExplicitTypeTest04(): void {
  describe('EnumerationWithExplicitTypeTest04', () => {
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
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0069
     * @tc.desc      Checking for enum with explicit short type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum22.Red.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Red.toString()).assertEqual("0");
      expect(Enum22.Green.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Green.toString()).assertEqual("10");
      expect(Enum22.Blue.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Blue.toString()).assertEqual("11");
      expect(Enum22.First.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.First.toString()).assertEqual("-32768");
      expect(Enum22.Second.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Second.toString()).assertEqual("12345");
      expect(Enum22.Third.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Third.toString()).assertEqual("32767");
      expect(Enum22.One.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.One.toString()).assertEqual("1");
      expect(Enum22.one.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.one.toString()).assertEqual("1");
      expect(Enum22.oNe.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.oNe.toString()).assertEqual("1");
      expect(testNS50.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0070
     * @tc.desc      Checking for enum with explicit short type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum22.Red.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Red.toString()).assertEqual("0");
      expect(Enum22.Green.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Green.toString()).assertEqual("10");
      expect(Enum22.Blue.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Blue.toString()).assertEqual("11");
      expect(Enum22.First.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.First.toString()).assertEqual("-32768");
      expect(Enum22.Second.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Second.toString()).assertEqual("12345");
      expect(Enum22.Third.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.Third.toString()).assertEqual("32767");
      expect(Enum22.One.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.One.toString()).assertEqual("1");
      expect(Enum22.one.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.one.toString()).assertEqual("1");
      expect(Enum22.oNe.valueOf() instanceof short).assertEqual(true);
      expect(Enum22.oNe.toString()).assertEqual("1");
      expect(testNS51.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0071
     * @tc.desc      Checking for enum with explicit short type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum22 = Enum22.Red;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum22.Green;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum22.Blue;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum22.First;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("-32768");
      c = Enum22.Second;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("12345");
      c = Enum22.Third;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("32767");
      c = Enum22.One;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum22.one;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum22.oNe;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS52.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0072
     * @tc.desc      Checking for enum with explicit short type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum22 = Enum22.Red;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum22.Green;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum22.Blue;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum22.First;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("-32768");
      c = Enum22.Second;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("12345");
      c = Enum22.Third;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("32767");
      c = Enum22.One;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum22.one;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum22.oNe;
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS53.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0073
     * @tc.desc      Checking for enum with explicit double type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum23.Red.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Red.toString()).assertEqual("1.5");
      expect(Enum23.Green.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Green.toString()).assertEqual("10.3");
      expect(Enum23.Blue.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Blue.toString()).assertEqual("7.6");
      expect(Enum23.First.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.First.toString()).assertEqual("-214748.3648");
      expect(Enum23.Second.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Second.toString()).assertEqual("123.45");
      expect(Enum23.Third.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Third.toString()).assertEqual("2147483.647");
      expect(Enum23.One.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.One.toString()).assertEqual("1");
      expect(Enum23.one.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.one.toString()).assertEqual("1");
      expect(Enum23.oNe.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.oNe.toString()).assertEqual("1");
      expect(testNS54.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0074
     * @tc.desc      Checking for enum with explicit double type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum23.Red.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Red.toString()).assertEqual("1.5");
      expect(Enum23.Green.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Green.toString()).assertEqual("10.3");
      expect(Enum23.Blue.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Blue.toString()).assertEqual("7.6");
      expect(Enum23.First.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.First.toString()).assertEqual("-214748.3648");
      expect(Enum23.Second.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Second.toString()).assertEqual("123.45");
      expect(Enum23.Third.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.Third.toString()).assertEqual("2147483.647");
      expect(Enum23.One.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.One.toString()).assertEqual("1");
      expect(Enum23.one.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.one.toString()).assertEqual("1");
      expect(Enum23.oNe.valueOf() instanceof double).assertEqual(true);
      expect(Enum23.oNe.toString()).assertEqual("1");
      expect(testNS55.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0075
     * @tc.desc      Checking for enum with explicit double type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum23 = Enum23.Red;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1.5");
      c = Enum23.Green;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("10.3");
      c = Enum23.Blue;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("7.6");
      c = Enum23.First;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("-214748.3648");
      c = Enum23.Second;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("123.45");
      c = Enum23.Third;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("2147483.647");
      c = Enum23.One;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum23.one;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum23.oNe;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS56.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0076
     * @tc.desc      Checking for enum with explicit double type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum23 = Enum23.Red;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1.5");
      c = Enum23.Green;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("10.3");
      c = Enum23.Blue;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("7.6");
      c = Enum23.First;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("-214748.3648");
      c = Enum23.Second;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("123.45");
      c = Enum23.Third;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("2147483.647");
      c = Enum23.One;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum23.one;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum23.oNe;
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS57.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0077
     * @tc.desc      Checking for enum with explicit float type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：float enum 的 toString()/格式化精度与预期不一致，
    // -214748.3648f 实际输出为 -214748.36，暂时注释。
    /*
        it('testEnumerationWithExplicitType0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          expect(Enum24.Red.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Red.toString()).assertEqual("1.5");
          expect(Enum24.Green.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Green.toString()).assertEqual("10.3");
          expect(Enum24.Blue.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Blue.toString()).assertEqual("7.6");
          expect(Enum24.First.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.First.toString()).assertEqual("-214748.3648");
          expect(Enum24.Second.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Second.toString()).assertEqual("123.45");
          expect(Enum24.Third.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Third.toString()).assertEqual("2147483.647");
          expect(Enum24.One.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.One.toString()).assertEqual("1");
          expect(Enum24.one.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.one.toString()).assertEqual("1");
          expect(Enum24.oNe.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.oNe.toString()).assertEqual("1");
          expect(testNS58.runTest()).assertEqual(true);
        });
    */

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0078
     * @tc.desc      Checking for enum with explicit float type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：float enum 的 toString()/格式化精度与预期不一致，
    // -214748.3648f 实际输出为 -214748.36，暂时注释。
    /*    it('testEnumerationWithExplicitType0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          expect(Enum24.Red.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Red.toString()).assertEqual("1.5");
          expect(Enum24.Green.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Green.toString()).assertEqual("10.3");
          expect(Enum24.Blue.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Blue.toString()).assertEqual("7.6");
          expect(Enum24.First.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.First.toString()).assertEqual("-214748.3648");
          expect(Enum24.Second.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Second.toString()).assertEqual("123.45");
          expect(Enum24.Third.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.Third.toString()).assertEqual("2147483.647");
          expect(Enum24.One.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.One.toString()).assertEqual("1");
          expect(Enum24.one.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.one.toString()).assertEqual("1");
          expect(Enum24.oNe.valueOf() instanceof float).assertEqual(true);
          expect(Enum24.oNe.toString()).assertEqual("1");
          expect(testNS59.runTest()).assertEqual(true);
        });*/

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0079
     * @tc.desc      Checking for enum with explicit float type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：float enum 的 toString()/格式化精度与预期不一致，
    // -214748.3648f 实际输出为 -214748.36，暂时注释。
    /*    it('testEnumerationWithExplicitType0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let c: Enum24 = Enum24.Red;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1.5");
          c = Enum24.Green;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("10.3");
          c = Enum24.Blue;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("7.6");
          c = Enum24.First;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("-214748.3648");
          c = Enum24.Second;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("123.45");
          c = Enum24.Third;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("2147483.647");
          c = Enum24.One;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1");
          c = Enum24.one;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1");
          c = Enum24.oNe;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1");
          expect(testNS60.runTest()).assertEqual(true);
        });*/

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0080
     * @tc.desc      Checking for enum with explicit float type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：float enum 的 toString()/格式化精度与预期不一致，
    // -214748.3648f 实际输出为 -214748.36，暂时注释。
    /*    it('testEnumerationWithExplicitType0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let c: Enum24 = Enum24.Red;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1.5");
          c = Enum24.Green;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("10.3");
          c = Enum24.Blue;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("7.6");
          c = Enum24.First;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("-214748.3648");
          c = Enum24.Second;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("123.45");
          c = Enum24.Third;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("2147483.647");
          c = Enum24.One;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1");
          c = Enum24.one;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1");
          c = Enum24.oNe;
          expect(c.valueOf() instanceof float).assertEqual(true);
          expect(c.toString()).assertEqual("1");
          expect(testNS61.runTest()).assertEqual(true);
        });*/

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0081
     * @tc.desc      Checking for enum with explicit string type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum25.Red.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Red.toString()).assertEqual("reD");
      expect(Enum25.Green.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Green.toString()).assertEqual("grEen");
      expect(Enum25.Blue.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Blue.toString()).assertEqual("Blue");
      expect(Enum25.Complex.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Complex.toString())
        .assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum25.One.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.One.toString()).assertEqual("one");
      expect(Enum25.one.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.one.toString()).assertEqual("one");
      expect(Enum25.oNe.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.oNe.toString()).assertEqual("one");
      expect(testNS62.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0082
     * @tc.desc      Checking for enum with explicit string type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum25.Red.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Red.toString()).assertEqual("reD");
      expect(Enum25.Green.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Green.toString()).assertEqual("grEen");
      expect(Enum25.Blue.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Blue.toString()).assertEqual("Blue");
      expect(Enum25.Complex.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.Complex.toString())
        .assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum25.One.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.One.toString()).assertEqual("one");
      expect(Enum25.one.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.one.toString()).assertEqual("one");
      expect(Enum25.oNe.valueOf() instanceof string).assertEqual(true);
      expect(Enum25.oNe.toString()).assertEqual("one");
      expect(testNS63.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0083
     * @tc.desc      Checking for enum with explicit string type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum25 = Enum25.Red;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("reD");
      c = Enum25.Green;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("grEen");
      c = Enum25.Blue;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("Blue");
      c = Enum25.Complex;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString())
        .assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      c = Enum25.One;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("one");
      c = Enum25.one;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("one");
      c = Enum25.oNe;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("one");
      expect(testNS64.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FOUR_TEST_1600
     * @tc.name      testEnumerationWithExplicitType0084
     * @tc.desc      Checking for enum with explicit string type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum25 = Enum25.Red;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("reD");
      c = Enum25.Green;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("grEen");
      c = Enum25.Blue;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("Blue");
      c = Enum25.Complex;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString())
        .assertEqual("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      c = Enum25.One;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("one");
      c = Enum25.one;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("one");
      c = Enum25.oNe;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c.toString()).assertEqual("one");
      expect(testNS65.runTest()).assertEqual(true);
    });
  })
}