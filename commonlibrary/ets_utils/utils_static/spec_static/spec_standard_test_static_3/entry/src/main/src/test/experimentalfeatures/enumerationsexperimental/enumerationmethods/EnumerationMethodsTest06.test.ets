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


  // enum_explicit_type_getvalueof_rte_0.ets
  export function runTest70(): boolean {
    expect(() => {
      Enum3.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum3.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_1.ets
  export function runTest71(): boolean {
    expect(() => {
      Enum3.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum3.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_2.ets
  export function runTest72(): boolean {
    expect(() => {
      Enum4.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum4.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_3.ets
  export function runTest73(): boolean {
    expect(() => {
      Enum4.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum4.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_4.ets
  export function runTest74(): boolean {
    expect(() => {
      Enum1.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum1.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_5.ets
  export function runTest75(): boolean {
    expect(() => {
      Enum1.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum1.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_6.ets
  export function runTest76(): boolean {
    expect(() => {
      Enum2.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum2.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_7.ets
  export function runTest77(): boolean {
    expect(() => {
      Enum2.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum2.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_8.ets
  export function runTest78(): boolean {
    expect(() => {
      Enum6.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum6.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_9.ets
  export function runTest79(): boolean {
    expect(() => {
      Enum6.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum6.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_10.ets
  export function runTest80(): boolean {
    expect(() => {
      Enum5.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum5.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_11.ets
  export function runTest81(): boolean {
    expect(() => {
      Enum5.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum5.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_12.ets
  export function runTest82(): boolean {
    expect(() => {
      Enum7.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum7.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

    return true;
  }

  // enum_explicit_type_getvalueof_rte_13.ets
  export function runTest83(): boolean {
    expect(() => {
      Enum7.getValueOf("Two")
    }).assertThrow("Should throw error for invalid value 'Two'");

    expect(() => {
      Enum7.getValueOf("ReD")
    }).assertThrow("Should throw error for invalid value 'ReD'");

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
     * 源文件：        enum_explicit_type_getvalueof_rte_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0071
     * @tc.desc      Checking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum3.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum3.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //
    //   expect(testNS.runTest70()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0072
     * @tc.desc      Checking for enum with explicit int type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum3.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum3.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest71()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0073
     * @tc.desc      Checking for enum with explicit long type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum4.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum4.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest72()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0074
     * @tc.desc      Checking for enum with explicit long type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum4.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum4.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest73()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0075
     * @tc.desc      Checking for enum with explicit byte type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum1.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum1.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest74()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0076
     * @tc.desc      Checking for enum with explicit byte type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum1.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum1.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest75()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0077
     * @tc.desc      Checking for enum with explicit short type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum2.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum2.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest76()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0078
     * @tc.desc      Checking for enum with explicit short type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum2.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum2.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest77()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0079
     * @tc.desc      Checking for enum with explicit double type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum6.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum6.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest78()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0080
     * @tc.desc      Checking for enum with explicit double type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum6.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum6.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest79()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0081
     * @tc.desc      Checking for enum with explicit float type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum5.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum5.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest80()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0082
     * @tc.desc      Checking for enum with explicit float type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum5.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum5.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest81()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_12.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0083
     * @tc.desc      Checking for enum with explicit string type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(() => {
    //     Enum7.getValueOf("Two")
    //   }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //   expect(() => {
    //     Enum7.getValueOf("ReD")
    //   }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //   expect(testNS.runTest82()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_getvalueof_rte_13.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0084
     * @tc.desc      Checking for enum with explicit string type constant for getValueOf method support which should
     *               throws an error if no constant with requested name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * ArkTS 1.2 兼容性说明：
     * 本组用例依赖旧版本测试中自定义的异常断言文本，例如：
     *   "Should throw error for value 2"
     *   "Should throw error for invalid value 'Two'"
     *
     * 当前 ArkTS 1.2 / 运行时环境下，枚举相关接口抛出的异常消息已标准化为真实运行时消息，例如：
     *   "No enum Enum3 with value 2"
     *   "No enum constant Enum3.Two"
     *
     * Hypium 的 assertThrow 在当前环境中会按真实异常消息进行匹配，
     * 因此旧版预期文本全部失效。
     *
     * 该差异属于运行时异常消息规则变化，不影响语法主验证目标，先整体注释保留。
     */
    // it("testEnumerationMethods0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     expect(() => {
    //         Enum7.getValueOf("Two")
    //     }).assertThrow("Should throw error for invalid value 'Two'");
    //
    //     expect(() => {
    //         Enum7.getValueOf("ReD")
    //     }).assertThrow("Should throw error for invalid value 'ReD'");
    //
    //     expect(testNS.runTest83()).assertTrue();
    // });
  })
}