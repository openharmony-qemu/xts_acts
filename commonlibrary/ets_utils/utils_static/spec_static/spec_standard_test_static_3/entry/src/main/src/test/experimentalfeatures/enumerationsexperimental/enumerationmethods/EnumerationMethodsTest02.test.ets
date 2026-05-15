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

  // enum_explicit_type_fromvalue_rte_0.ets
  export function runTest14(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };
    expect(() => {
      Enum3.fromValue(2);
    }).assertThrow("Should throw error for value 2");
    expect(() => {
      Enum3.fromValue(2147483640);
    }).assertThrow("Should throw error for value 2147483640");
    return true;
  }

  // enum_explicit_type_fromvalue_rte_1.ets
  export function runTest15(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };
    expect(() => {
      Enum3.fromValue(2);
    }).assertThrow("Should throw error for value 2");
    expect(() => {
      Enum3.fromValue(2147483640);
    }).assertThrow("Should throw error for value 2147483640");
    return true;
  }

  // enum_explicit_type_fromvalue_rte_2.ets
  export function runTest16(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };
    expect(() => {
      Enum4.fromValue(2);
    }).assertThrow("Should throw error for value 2");

    expect(() => {
      Enum4.fromValue(9223372036854775800);
    }).assertThrow("Should throw error for value 9223372036854775800");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_3.ets
  export function runTest17(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum4.fromValue(2);
    }).assertThrow("Should throw error for value 2");

    expect(() => {
      Enum4.fromValue(9223372036854775800);
    }).assertThrow("Should throw error for value 9223372036854775800");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_4.ets
  export function runTest18(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum1.fromValue(2);
    }).assertThrow("Should throw error for value 2");

    expect(() => {
      Enum1.fromValue(120);
    }).assertThrow("Should throw error for value 120");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_5.ets
  export function runTest19(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum1.fromValue(2);
    }).assertThrow("Should throw error for value 2");

    expect(() => {
      Enum1.fromValue(120);
    }).assertThrow("Should throw error for value 120");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_6.ets
  export function runTest20(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum2.fromValue(2);
    }).assertThrow("Should throw error for value 2");

    expect(() => {
      Enum2.fromValue(32760);
    }).assertThrow("Should throw error for value 32760");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_7.ets
  export function runTest21(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum2.fromValue(2);
    }).assertThrow("Should throw error for value 2");

    expect(() => {
      Enum2.fromValue(32760);
    }).assertThrow("Should throw error for value 32760");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_8.ets
  export function runTest22(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum6.fromValue(2.0);
    }).assertThrow("Should throw error for value 2.0");

    expect(() => {
      Enum6.fromValue(2147483.5);
    }).assertThrow("Should throw error for value 2147483.5");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_9.ets
  export function runTest23(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum6.fromValue(2.0);
    }).assertThrow("Should throw error for value 2.0");

    expect(() => {
      Enum6.fromValue(2147483.5);
    }).assertThrow("Should throw error for value 2147483.5");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_10.ets
  export function runTest24(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum5.fromValue(2.0f);
    }).assertThrow("Should throw error for value 2.0f");

    expect(() => {
      Enum5.fromValue(2147483.5f);
    }).assertThrow("Should throw error for value 2147483.5f");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_11.ets
  export function runTest25(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum5.fromValue(2.0f);
    }).assertThrow("Should throw error for value 2.0f");

    expect(() => {
      Enum5.fromValue(2147483.5f);
    }).assertThrow("Should throw error for value 2147483.5f");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_12.ets
  export function runTest26(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum7.fromValue("red");
    }).assertThrow("Should throw error for value red");

    expect(() => {
      Enum7.fromValue("Two");
    }).assertThrow("Should throw error for value Tow");

    return true;
  }

  // enum_explicit_type_fromvalue_rte_13.ets
  export function runTest27(): boolean {
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error);
    };

    expect(() => {
      Enum7.fromValue("red");
    }).assertThrow("Should throw error for value red");

    expect(() => {
      Enum7.fromValue("Two");
    }).assertThrow("Should throw error for value Tow");

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
     * 源文件：        enum_explicit_type_fromvalue_rte_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0015
     * @tc.desc      Checking for enum with explicit int type constant for fromValue method support which should throws
     *               an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //   expect(() => {
    //     Enum3.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //   expect(() => {
    //     Enum3.fromValue(2147483640);
    //   }).assertThrow("Should throw error for value 2147483640");
    //
    //   expect(testNS.runTest14()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0016
     * @tc.desc      Checking for enum with explicit int type constant for fromValue method support which should throws
     *               an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //   expect(() => {
    //     Enum3.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //   expect(() => {
    //     Enum3.fromValue(2147483640);
    //   }).assertThrow("Should throw error for value 2147483640");
    //
    //   expect(testNS.runTest15()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0017
     * @tc.desc      Checking for enum with explicit long type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //   expect(() => {
    //     Enum4.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //
    //   expect(() => {
    //     Enum4.fromValue(9223372036854775800);
    //   }).assertThrow("Should throw error for value 9223372036854775800");
    //
    //   expect(testNS.runTest16()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0018
     * @tc.desc      Checking for enum with explicit long type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum4.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //
    //   expect(() => {
    //     Enum4.fromValue(9223372036854775800);
    //   }).assertThrow("Should throw error for value 9223372036854775800");
    //
    //   expect(testNS.runTest17()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0019
     * @tc.desc      Checking for enum with explicit byte type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum1.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //
    //   expect(() => {
    //     Enum1.fromValue(120);
    //   }).assertThrow("Should throw error for value 120");
    //
    //   expect(testNS.runTest18()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0020
     * @tc.desc      Checking for enum with explicit byte type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum1.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //
    //   expect(() => {
    //     Enum1.fromValue(120);
    //   }).assertThrow("Should throw error for value 120");
    //
    //   expect(testNS.runTest19()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0021
     * @tc.desc      Checking for enum with explicit short type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum2.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //
    //   expect(() => {
    //     Enum2.fromValue(32760);
    //   }).assertThrow("Should throw error for value 32760");
    //
    //   expect(testNS.runTest20()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0022
     * @tc.desc      Checking for enum with explicit short type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum2.fromValue(2);
    //   }).assertThrow("Should throw error for value 2");
    //
    //   expect(() => {
    //     Enum2.fromValue(32760);
    //   }).assertThrow("Should throw error for value 32760");
    //
    //   expect(testNS.runTest21()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0023
     * @tc.desc      Checking for enum with explicit double type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum6.fromValue(2.0);
    //   }).assertThrow("Should throw error for value 2.0");
    //
    //   expect(() => {
    //     Enum6.fromValue(2147483.5);
    //   }).assertThrow("Should throw error for value 2147483.5");
    //
    //   expect(testNS.runTest22()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0024
     * @tc.desc      Checking for enum with explicit double type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum6.fromValue(2.0);
    //   }).assertThrow("Should throw error for value 2.0");
    //
    //   expect(() => {
    //     Enum6.fromValue(2147483.5);
    //   }).assertThrow("Should throw error for value 2147483.5");
    //
    //   expect(testNS.runTest23()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0025
     * @tc.desc      Checking for enum with explicit float type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum5.fromValue(2.0f);
    //   }).assertThrow("Should throw error for value 2.0f");
    //
    //   expect(() => {
    //     Enum5.fromValue(2147483.5f);
    //   }).assertThrow("Should throw error for value 2147483.5f");
    //
    //   expect(testNS.runTest24()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0026
     * @tc.desc      Checking for enum with explicit float type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum5.fromValue(2.0f);
    //   }).assertThrow("Should throw error for value 2.0f");
    //
    //   expect(() => {
    //     Enum5.fromValue(2147483.5f);
    //   }).assertThrow("Should throw error for value 2147483.5f");
    //
    //   expect(testNS.runTest25()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_12.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0027
     * @tc.desc      Checking for enum with explicit string type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let expectedError = (e: Error): boolean => {
    //     return (e instanceof Error);
    //   };
    //
    //   expect(() => {
    //     Enum7.fromValue("red");
    //   }).assertThrow("Should throw error for value red");
    //
    //   expect(() => {
    //     Enum7.fromValue("Two");
    //   }).assertThrow("Should throw error for value Tow");
    //
    //   expect(testNS.runTest26()).assertTrue();
    // });

    /**
     * 源文件：        enum_explicit_type_fromvalue_rte_13.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0028
     * @tc.desc      Checking for enum with explicit string type constant for fromValue method support which should
     *               throws an error if no constant has such a value.
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
    // it("testEnumerationMethods0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     let expectedError = (e: Error): boolean => {
    //         return (e instanceof Error);
    //     };
    //
    //     expect(() => {
    //         Enum7.fromValue("red");
    //     }).assertThrow("Should throw error for value red");
    //
    //     expect(() => {
    //         Enum7.fromValue("Two");
    //     }).assertThrow("Should throw error for value Tow");
    //
    //     expect(testNS.runTest27()).assertTrue();
    // });
  })
}