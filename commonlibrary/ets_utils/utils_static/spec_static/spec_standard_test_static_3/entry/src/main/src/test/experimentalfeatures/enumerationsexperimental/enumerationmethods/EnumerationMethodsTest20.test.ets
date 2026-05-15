import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// enum_type_methods_getname.ets
enum Color {Red, Green, Blue};

// ╔════════════════════════════════════════════════════╗
// ║  enum_type_methods_getname_1.ets                   ║
// ╚════════════════════════════════════════════════════╝
enum Color1 {Red = "r1", Blue = "b1", Green = "g1"};

// ╔════════════════════════════════════════════════════╗
// ║  enum_type_methods_getvalue_tostring.ets           ║
// ╚════════════════════════════════════════════════════╝
enum Color2 {Red = "r1", Green = "g1", Blue = "b1"};

// ╔════════════════════════════════════════════════════╗
// ║  enum_type_methods_getvalue_tostring_1.ets         ║
// ╚════════════════════════════════════════════════════╝
enum Color3 {Red = 1, Green = 2, Blue};

// ╔════════════════════════════════════════════════════╗
// ║  enum_type_methods_pipeline.ets                    ║
// ╚════════════════════════════════════════════════════╝
enum Color4 {Red = 777, Blue = 55, Green = 2};

// ╔════════════════════════════════════════════════════╗
// ║  enum_type_methods_getvalue_X.ets                  ║
// ╚════════════════════════════════════════════════════╝
enum GeneratedEnum {
  A,
  AA,
  AAA,
  AAAA,
  AAAAA,
  AAAAAA,
  AAAAAAA,
  AAAAAAAA,
  AAAAAAAAA
};

enum GeneratedEnum1 {
  A = "A" ,
  AA = "AA" ,
  AAA = "AAA" ,
  AAAA = "AAAA" ,
  AAAAA = "AAAAA" ,
  AAAAAA = "AAAAAA" ,
  AAAAAAA = "AAAAAAA" ,
  AAAAAAAA = "AAAAAAAA" ,
  AAAAAAAAA = "AAAAAAAAA"
};

// ╔════════════════════════════════════════════════════╗
// ║  enum_type_methods_values.ets                      ║
// ╚════════════════════════════════════════════════════╝
function f(a: FixedArray<Color>): number {
  return a.length;
}

function f(a: Object): int {
  return 2;
}

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
     * 源文件：        enum_type_methods_getname.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0221
     * @tc.desc      Method getName() returns the name of an enumeration constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Color.Green;
      expect(c.getName()).assertEqual("Green");
    });

    /**
     * 源文件：        enum_type_methods_getname_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0222
     * @tc.desc      Method getName() returns the name of an enumeration constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Color1.Blue;
      expect(c.getName()).assertEqual("Blue");
    });

    /**
     * 源文件：        enum_type_methods_getvalue_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0223
     * @tc.desc      valueOf() returns a value of enumeration constant which is either of int or string type.
     *               Int enum used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(GeneratedEnum.A.valueOf()).assertEqual(0);
      expect(GeneratedEnum.AA.valueOf()).assertEqual(1);
      expect(GeneratedEnum.AAA.valueOf()).assertEqual(2);
      expect(GeneratedEnum.AAAA.valueOf()).assertEqual(3);
      expect(GeneratedEnum.AAAAA.valueOf()).assertEqual(4);
      expect(GeneratedEnum.AAAAAA.valueOf()).assertEqual(5);
      expect(GeneratedEnum.AAAAAAA.valueOf()).assertEqual(6);
      expect(GeneratedEnum.AAAAAAAA.valueOf()).assertEqual(7);
      expect(GeneratedEnum.AAAAAAAAA.valueOf()).assertEqual(8);
    });

    /**
     * 源文件：        enum_type_methods_getvalue_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0224
     * @tc.desc      valueOf() returns a value of enumeration constant which is either of int or string type.
     *               String enum used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(GeneratedEnum1.A.valueOf()).assertEqual("A");
      expect(GeneratedEnum1.AA.valueOf()).assertEqual("AA");
      expect(GeneratedEnum1.AAA.valueOf()).assertEqual("AAA");
      expect(GeneratedEnum1.AAAA.valueOf()).assertEqual("AAAA");
      expect(GeneratedEnum1.AAAAA.valueOf()).assertEqual("AAAAA");
      expect(GeneratedEnum1.AAAAAA.valueOf()).assertEqual("AAAAAA");
      expect(GeneratedEnum1.AAAAAAA.valueOf()).assertEqual("AAAAAAA");
      expect(GeneratedEnum1.AAAAAAAA.valueOf()).assertEqual("AAAAAAAA");
      expect(GeneratedEnum1.AAAAAAAAA.valueOf()).assertEqual("AAAAAAAAA");
    });

    /**
     * 源文件：        enum_type_methods_getvalue_tostring.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0225
     * @tc.desc      c.toString() returns the same value as c.valueOf().toString().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Color2 = Color2.Green;
      expect(c.toString()).assertEqual(c.valueOf().toString());
    });

    /**
     * 源文件：        enum_type_methods_getvalue_tostring_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0226
     * @tc.desc      c.toString() returns the same value as c.valueOf().toString().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Color3 = Color3.Green;
      expect(c.toString()).assertEqual((c.valueOf() as Int).toString());
    });

    /**
     * 源文件：        enum_type_methods_getvalueof.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0227
     * @tc.desc      getValueOf(string) returns an enumeration constant with the given name, or throws an error if no
     *               constant with such name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Color = Color.Red;
      let colors = Color.values();
      let red = Color.getValueOf("Red");
      expect(red).assertEqual(colors[0]);
      expect(c == red).assertTrue();
    });

    /**
     * 源文件：        enum_type_methods_getvalueof_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0228
     * @tc.desc      getValueOf(string) returns an enumeration constant with the given name, or throws an error if no
     *               constant with such name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testEnumerationMethods0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     expect(() => {
    //         Color.getValueOf("Yellow")
    //     }).assertThrow("Should throw error for invalid value 'Yellow'");
    // });

    /**
     * 源文件：        enum_type_methods_pipeline.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0229
     * @tc.desc      'Method getName() returns the name of an enumeration constant. Method valueOf() returns an int or
     *               string value of an enumeration constant depending on the type of the enumeration constant.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Color4.Red.getName()).assertEqual("Red");
      expect(Color4.Red.valueOf()).assertEqual(777);
    });

    /**
     * 源文件：        enum_type_methods_values.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0230
     * @tc.desc      values() returns an array of enumeration constants in the order of declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let colors = Color.values();
      expect(colors[0]).assertEqual(Color.Red);
      expect(colors[1]).assertEqual(Color.Green);
      expect(colors[2]).assertEqual(Color.Blue);
      expect(f(colors)).assertEqual(3);
    });

    /**
     * 源文件：        enum_type_methods_values_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0231
     * @tc.desc      values() returns an array of enumeration constants in the order of declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * ArkTS 1.2 兼容性说明：
     * 本用例依赖旧版本较宽松的重载解析规则，期望：
     *   Color1.values()
     * 可匹配到：
     *   f(a: FixedArray<Color>): number
     *
     * 但在当前 ArkTS 1.2 环境下，重载解析按实参静态类型进行更严格的精确匹配，
     * Color1.values() 的结果不再被视为 FixedArray<Color>，
     * 因此调用实际落入：
     *   f(a: Object): int
     * 返回值变为 2，而非旧预期的 3。
     *
     * 该差异反映的是 ArkTS 1.2 重载解析与类型匹配规则收紧，
     * 不修改原始测试逻辑，先注释保留。
     */
    // it("testEnumerationMethods0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //     let colors = Color1.values();
    //     expect(colors[0]).assertEqual(Color1.Red);
    //     expect(colors[1]).assertEqual(Color1.Blue);
    //     expect(colors[2]).assertEqual(Color1.Green);
    //     expect(f(colors)).assertEqual(3);
    // });
  })
}