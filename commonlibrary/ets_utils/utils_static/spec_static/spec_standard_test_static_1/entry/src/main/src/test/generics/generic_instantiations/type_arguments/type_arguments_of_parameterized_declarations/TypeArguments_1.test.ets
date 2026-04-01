/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level,
  expect
} from "../../../../../../../hypium";


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// 文档1的类型定义
interface I001 {}

class X001 implements I001 {}

enum Color001 { Red, Green, Blue }

// 文档2的类型定义
interface I002 {}

class X002 implements I002 {}

enum Color002 { Red, Green, Blue }

class AWithConstraint002<T extends X002> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

// 文档3的类型定义
interface I003 {}

class X003 implements I003 {}

enum Color003 { Red, Green, Blue }

// 文档4的类型定义
interface I004 {}

class X004 implements I004 {}

enum Color004 { Red, Green, Blue }

// 文档5的类型定义
interface I005 {}

class X005 implements I005 {}

enum Color005 { Red, Green, Blue }

class AWithObjectConstraint005<T extends Object|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

// 文档6的类型定义
interface I006 {}

class X006 implements I006 {}

enum Color006 { Red, Green, Blue }

// 文档7的类型定义
interface I007 {}

class X007 implements I007 {}

enum Color007 { Red, Green, Blue }

class AWithObjectConstraint007<T extends Object> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

// 文档8的类型定义
interface I008 {}

class X008 implements I008 {}

enum Color008 { Red, Green, Blue }

// 文档9的类型定义
interface I009 {}

class X009 implements I009 {}

enum Color009 { Red, Green, Blue }

// 文档10的类型定义
interface I010 {}

class X010 implements I010 {}

enum Color010 { Red, Green, Blue }

// 文档11的类型定义
interface I011 {}

class X011 implements I011 {}

enum Color011 { Red, Green, Blue }

// 文档12的类型定义
interface I012 {}

class X012 implements I012 {}

enum Color012 { Red, Green, Blue }

class AWithConstraint012<T extends X012[]|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

// 文档13的类型定义
interface I013 {}

class X013 implements I013 {}

enum Color013 { Red, Green, Blue }

// 文档14的类型定义
interface I014 {}

class X014 implements I014 {}

enum Color014 { Red, Green, Blue }

// 文档15的类型定义
interface I015 {}

class X015 implements I015 {}

enum Color015 { Red, Green, Blue }

// 文档16的类型定义
interface I016 {}

class X016 implements I016 {}

enum Color016 { Red, Green, Blue }

class AWithConstraint016<T extends Color016[]|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

// 文档17的类型定义
interface I017 {}

class X017 implements I017 {}

enum Color017 { Red, Green, Blue }

// 文档18的类型定义
interface I018 {}

class X018 implements I018 {}

enum Color018 { Red, Green, Blue }

type B018 = X018

// 文档19的类型定义
interface I019 {}

class X019 implements I019 {}

enum Color019 { Red, Green, Blue }

type B019 = X019

// 文档20的类型定义
interface I020 {}

class X020 implements I020 {}

enum Color020 { Red, Green, Blue }

type B020 = X020

// 文档21的类型定义
interface I021 {}

class X021 implements I021 {}

enum Color021 { Red, Green, Blue }

type C021 = A<X021>

// 文档22的类型定义
interface I022 {}

class X022 implements I022 {}

enum Color022 { Red, Green, Blue }

type D022 = X022[]

// 文档23的类型定义
interface I023 {}

class X023 implements I023 {}

enum Color023 { Red, Green, Blue }

type E023 = A<X023>[]

// 文档24的类型定义
interface I024 {}

class X024 implements I024 {}

enum Color024 { Red, Green, Blue }

class AWithObjectConstraint024<T extends Object|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

type F024 = AWithObjectConstraint024<X024|null>[]

// 文档25的类型定义
interface I025 {}

class X025 implements I025 {}

enum Color025 { Red, Green, Blue }

type G025 = A<X025[]> []

// 文档26的类型定义
interface I026 {}

class X026 implements I026 {}

enum Color026 { Red, Green, Blue }

type H026 = X026[]

// 文档27的类型定义
interface I027 {}

class X027 implements I027 {}

enum Color027 { Red, Green, Blue }

// 文档28的类型定义
interface I028 {}

class X028 implements I028 {}

enum Color028 { Red, Green, Blue }

// 文档29的类型定义
interface I029 {}

class X029 implements I029 {}

enum Color029 { Red, Green, Blue }

class AWithObjectConstraint029<T extends Object|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

type B029 = AWithObjectConstraint029<X029|null>[]

// 文档30的类型定义
interface I030 {}

class X030 implements I030 {}

enum Color030 { Red, Green, Blue }

// 通用泛型类定义
class A<T> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

interface I031 {}
class X031 implements I031 {}
enum Color031 { Red, Green, Blue }

interface I032 {}
class X032 implements I032 {}
enum Color032 { Red, Green, Blue }

interface I033 {}
class X033 implements I033 {}
enum Color033 { Red, Green, Blue }

interface I034 {}
class X034 implements I034 {}
enum Color034 { Red, Green, Blue }

interface I035 {}
class X035 implements I035 {}
enum Color035 { Red, Green, Blue }

interface I036 {}
class X036 implements I036 {}
enum Color036 { Red, Green, Blue }

interface I037 {}
class X037 implements I037 {}
enum Color037 { Red, Green, Blue }

interface I038 {}
class X038 implements I038 {}
enum Color038 { Red, Green, Blue }

interface I039 {}
class X039 implements I039 {}
enum Color039 { Red, Green, Blue }

interface I040 {}
class X040 implements I040 {}
enum Color040 { Red, Green, Blue }

interface I041 {}
class X041 implements I041 {}
enum Color041 { Red, Green, Blue }

interface I042 {}
class X042 implements I042 {}
enum Color042 { Red, Green, Blue }

interface I043 {}
class X043 implements I043 {}
enum Color043 { Red, Green, Blue }

interface I044 {}
class X044 implements I044 {}
enum Color044 { Red, Green, Blue }

interface I045 {}
class X045 implements I045 {}
enum Color045 { Red, Green, Blue }

interface I046 {}
class X046 implements I046 {}
enum Color046 { Red, Green, Blue }

interface I047 {}
class X047 implements I047 {}
enum Color047 { Red, Green, Blue }

interface I048 {}
class X048 implements I048 {}
enum Color048 { Red, Green, Blue }

interface I049 {}
class X049 implements I049 {}
enum Color049 { Red, Green, Blue }

interface I050 {}
class X050 implements I050 {}
enum Color050 { Red, Green, Blue }
class Keys050 { key: number = 0 }
class KeyHolder050<T extends keyof Keys050> {}

// 构造函数文档的类型定义
interface I051 {}
class X051 implements I051 {}
class Y051 extends X051 {}

interface I052 {}
class X052 implements I052 {}
class Y052 extends X052 {}

interface I053 {}
class X053 implements I053 {}
class Y053 extends X053 {}

interface I054 {}
class X054 implements I054 {}
class Y054 extends X054 {}

interface I055 {}
class X055 implements I055 {}
class Y055 extends X055 {}

interface I056 {}
class X056 implements I056 {}
class Y056 extends X056 {}

interface I057 {}
class X057 implements I057 {}
class Y057 extends X057 {}

interface I058 {}
class X058 implements I058 {}
class Y058 extends X058 {}

interface I059 {}
class X059 implements I059 {}
class Y059 extends X059 {}

interface I060 {}
class X060 implements I060 {}
class Y060 extends X060 {}


// 有约束的泛型类
class AWithConstraint<T extends Object> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

class AWithObjectConstraint<T extends Object|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

class AWithExtendedConstraint<T extends X055> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

class AWithExtendedNullConstraint<T extends X056|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

class AWithObjectNullConstraint<T extends Object|null> {
  private t: T

  public constructor(t: T) {
    this.t = t
  }
}

// 函数类型定义
type foo_type031 = () => void
type foo_type032 = () => void
type foo_type033 = () => void
type foo_type034 = () => void
type foo_type035 = () => void
type foo_type036 = () => void
type foo_type037 = () => void
type foo_type038 = () => void
type foo_type039 = () => void
type foo_type040 = () => void
type foo_type041 = () => void
type foo_type042 = () => void
type foo_type043 = () => void
type foo_type044 = () => void
type foo_type045 = () => void
type foo_type046 = () => void
type foo_type047 = () => void
type foo_type048 = () => void
type foo_type049 = () => void
type foo_type050 = () => void
type foo_type051 = (p: foo_type036) => void

interface I061 {}
class X061 implements I061 {}
enum Color061 { Red, Green, Blue }

interface I062 {}
class X062 implements I062 {}
enum Color062 { Red, Green, Blue }

interface I063 {}
class X063 implements I063 {}
enum Color063 { Red, Green, Blue }

interface I064 {}
class X064 implements I064 {}
enum Color064 { Red, Green, Blue }

interface I065 {}
class X065 implements I065 {}
enum Color065 { Red, Green, Blue }

interface I066 {}
class X066 implements I066 {}
enum Color066 { Red, Green, Blue }

interface I067 {}
class X067 implements I067 {}
enum Color067 { Red, Green, Blue }

interface I068 {}
class X068 implements I068 {}
enum Color068 { Red, Green, Blue }

interface I069 {}
class X069 implements I069 {}
enum Color069 { Red, Green, Blue }

interface I070 {}
class X070 implements I070 {}
enum Color070 { Red, Green, Blue }

interface I071 {}
class X071 implements I071 {}
enum Color071 { Red, Green, Blue }

interface I072 {}
class X072 implements I072 {}
enum Color072 { Red, Green, Blue }

interface I073 {}
class X073 implements I073 {}
enum Color073 { Red, Green, Blue }

interface I074 {}
class X074 implements I074 {}
enum Color074 { Red, Green, Blue }

interface I075 {}
class X075 implements I075 {}
enum Color075 { Red, Green, Blue }

interface I076 {}
class X076 implements I076 {}
enum Color076 { Red, Green, Blue }

interface I077 {}
class X077 implements I077 {}
enum Color077 { Red, Green, Blue }

interface I078 {}
class X078 implements I078 {}
enum Color078 { Red, Green, Blue }

interface I079 {}
class X079 implements I079 {}
enum Color079 { Red, Green, Blue }

interface I080 {}
class X080 implements I080 {}
enum Color080 { Red, Green, Blue }

interface I081 {}
class X081 implements I081 {}
enum Color081 { Red, Green, Blue }

interface I082 {}
class X082 implements I082 {}
enum Color082 { Red, Green, Blue }

interface I083 {}
class X083 implements I083 {}
enum Color083 { Red, Green, Blue }

interface I084 {}
class X084 implements I084 {}
enum Color084 { Red, Green, Blue }

interface I085 {}
class X085 implements I085 {}
enum Color085 { Red, Green, Blue }

interface I086 {}
class X086 implements I086 {}
enum Color086 { Red, Green, Blue }

interface I087 {}
class X087 implements I087 {}
enum Color087 { Red, Green, Blue }

interface I088 {}
class X088 implements I088 {}
enum Color088 { Red, Green, Blue }

interface I089 {}
class X089 implements I089 {}
enum Color089 { Red, Green, Blue }

interface I090 {}
class X090 implements I090 {}
enum Color090 { Red, Green, Blue }

// 文档61-70的特殊类型定义
class Keys061 {
  key1: int = 0;
  key2: string = "";
}
class KeyHolder061<T extends keyof Keys061> {
  public value: T
  constructor(value: T) {
    this.value = value
  }
}

class A061<T> {
  private t: T
  constructor(t: T) {
    this.t = t
  }
}

// 函数类型定义
type FuncType062 = () => void
type FuncType064 = () => void
type FuncType065 = () => void
type FuncType066 = () => void
type FuncType067 = () => void
type FuncType068 = () => void
type FuncType069 = () => void
type FuncType070 = () => void
type FuncType071 = () => void
type FuncType072 = () => void
type FuncType073 = () => void
type FuncType074 = () => void
type FuncType075 = () => void
type FuncType076 = () => void
type FuncType077 = () => void
type FuncType078 = () => void
type FuncType079 = () => void
type FuncType080 = () => void
type FuncType081 = () => void
type FuncType082 = () => void
type FuncType083 = () => void
type FuncType084 = () => void
type FuncType085 = () => void
type FuncType086 = () => void
type FuncType087 = () => void
type FuncType088 = () => void
type FuncType089 = () => void
type FuncType090 = () => void


interface I0091 {}
class X0091 implements I0091 {}
final class Y0091 extends X0091 {}
type B0091 = Y0091[]

interface I0092 {}
class X0092 implements I0092 {}
final class Y0092 extends X0092 {}
type B0092 = Y0092[]

interface I0093 {}
class X0093 implements I0093 {}
final class Y0093 extends X0093 {}

interface I0094 {}
class X0094 implements I0094 {}
final class Y0094 extends X0094 {}

interface I0095 {}
class X0095 implements I0095 {}
final class Y0095 extends X0095 {}

interface I0096 {}
class X0096 implements I0096 {}
final class Y0096 extends X0096 {}

interface I0097 {}
class X0097 implements I0097 {}
final class Y0097 extends X0097 {}

interface I0098 {}
class X0098 implements I0098 {}
final class Y0098 extends X0098 {}

interface I0099 {}
class X0099 implements I0099 {}
final class Y0099 extends X0099 {}

interface I0100 {}
class X0100 implements I0100 {}
final class Y0100 extends X0100 {}

interface I0101 {}
class X0101 implements I0101 {}
final class Y0101 extends X0101 {}

interface I0102 {}
class X0102 implements I0102 {}
final class Y0102 extends X0102 {}

interface I0103 {}
class X0103 implements I0103 {}
final class Y0103 extends X0103 {}

interface I0104 {}
class X0104 implements I0104 {}
final class Y0104 extends X0104 {}

interface I0105 {}
class X0105 implements I0105 {}
final class Y0105 extends X0105 {}

interface I0106 {}
class X0106 implements I0106 {}
final class Y0106 extends X0106 {}

interface I0107 {}
class X0107 implements I0107 {}
final class Y0107 extends X0107 {}

interface I0108 {}
class X0108 implements I0108 {}
final class Y0108 extends X0108 {}

interface I0109 {}
class X0109 implements I0109 {}
final class Y0109 extends X0109 {}

interface I0110 {}
class X0110 implements I0110 {}
final class Y0110 extends X0110 {}
type B0110 = Y0110[]

interface I0111 {}
class X0111 implements I0111 {}
final class Y0111 extends X0111 {}

interface I0112 {}
class X0112 implements I0112 {}
final class Y0112 extends X0112 {}

interface I0113 {}
class X0113 implements I0113 {}
final class Y0113 extends X0113 {}

interface I0114 {}
class X0114 implements I0114 {}
final class Y0114 extends X0114 {}

interface I0115 {}
class X0115 implements I0115 {}
final class Y0115 extends X0115 {}

interface I0116 {}
class X0116 implements I0116 {}
final class Y0116 extends X0116 {}

interface I0117 {}
class X0117 implements I0117 {}
final class Y0117 extends X0117 {}
enum Color0117 { Red, Green, Blue }

interface I0118 {}
class X0118 implements I0118 {}
final class Y0118 extends X0118 {}

interface I0119 {}
class X0119 implements I0119 {}
final class Y0119 extends X0119 {}
type B0119 = Y0119[]

interface I0120 {}
class X0120 implements I0120 {}
final class Y0120 extends X0120 {}

// 枚举定义
enum Color { Red, Green, Blue }

// 泛型类定义
class A1<V, T> {
  private v: V
  private t: T
  public constructor(v: V, t: T) {
    this.v = v
    this.t = t
  }
}


// 泛型函数
function foo<T>(a: T, b: T): T {
  return a
}

function fooWithConstraint<T extends Object>(a: T, b: T): T {
  return a
}

function fooWithObjectNullConstraint<T extends Object | null>(a: T, b: T): T {
  return a
}

function fooWithObjectConstraint<T extends Object>(a: T, b: T): T {
  return a
}

// 泛型B类
class B<V, T> {
  private v: V
  private t: T
  public constructor(v: V, t: T) {
    this.v = v
    this.t = t
  }
}


interface I0121 {}
class X0121 implements I0121 {}
final class Y0121 extends X0121 {}

interface I0122 {}
class X0122 implements I0122 {}
final class Y0122 extends X0122 {}

interface I0123 {}
class X0123 implements I0123 {}
final class Y0123 extends X0123 {}

interface I0124 {}
class X0124 implements I0124 {}
final class Y0124 extends X0124 {}

interface I0125 {}
class X0125 implements I0125 {}
final class Y0125 extends X0125 {}

interface I0126 {}
class X0126 implements I0126 {}
final class Y0126 extends X0126 {}

interface I0127 {}
class X0127 implements I0127 {}
final class Y0127 extends X0127 {}

interface I0128 {}
class X0128 implements I0128 {}
final class Y0128 extends X0128 {}

interface I0129 {}
class X0129 implements I0129 {}
final class Y0129 extends X0129 {}

interface I0130 {}
class X0130 implements I0130 {}
final class Y0130 extends X0130 {}

interface I0131 {}
class X0131 implements I0131 {}
final class Y0131 extends X0131 {}

interface I0132 {}
class X0132 implements I0132 {}
final class Y0132 extends X0132 {}

interface I0133 {}
class X0133 implements I0133 {}
final class Y0133 extends X0133 {}

interface I0134 {}
class X0134 implements I0134 {}
final class Y0134 extends X0134 {}

interface I0135 {}
class X0135 implements I0135 {}
final class Y0135 extends X0135 {}

interface I0136 {}
class X0136 implements I0136 {}
final class Y0136 extends X0136 {}
type B0136 = Y0136[]

interface I0137 {}
class X0137 implements I0137 {}
final class Y0137 extends X0137 {}

interface I0138 {}
class X0138 implements I0138 {}
final class Y0138 extends X0138 {}

interface I0139 {}
class X0139 implements I0139 {}
final class Y0139 extends X0139 {}

interface I0140 {}
class X0140 implements I0140 {}
final class Y0140 extends X0140 {}

interface I0141 {}
class X0141 implements I0141 {}
final class Y0141 extends X0141 {}

interface I0142 {}
class X0142 implements I0142 {}
final class Y0142 extends X0142 {}

interface I0143 {}
class X0143 implements I0143 {}
final class Y0143 extends X0143 {}

interface I0144 {}
class X0144 implements I0144 {}
final class Y0144 extends X0144 {}

interface I0145 {}
class X0145 implements I0145 {}
final class Y0145 extends X0145 {}

interface I0146 {}
class X0146 implements I0146 {}
final class Y0146 extends X0146 {}

interface I0147 {}
class X0147 implements I0147 {}
final class Y0147 extends X0147 {}

interface I0148 {}
class X0148 implements I0148 {}
final class Y0148 extends X0148 {}

interface I0149 {}
class X0149 implements I0149 {}
final class Y0149 extends X0149 {}

interface I0150 {}
class X0150 implements I0150 {}
final class Y0150 extends X0150 {}
class A2<V, T> {
  private v: V
  private t: T
  public constructor(v: V, t: T) {
    this.v = v
    this.t = t
  }
}

export default function TypeArgumentsTest1() {
  describe("TypeArgumentsTest1", () => {
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
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0100
     * @tc.name      testTypeArgumentsOne0001
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1<FixedArray<X0102>|null, X0102> = new A1<FixedArray<X0102>|null, X0102>(
        [new X0102()],
        new X0102()
      );
      expect(v instanceof A1).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0200
     * @tc.name      testTypeArgumentsOne0002
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1<FixedArray<X0103>|null, X0103> = new A1<FixedArray<X0103>|null, X0103>(
        [new X0103()],
        new X0103()
      );
      expect(v instanceof A1).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0300
     * @tc.name      testTypeArgumentsOne0003
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1<undefined, undefined> = new A1<undefined, undefined>(undefined, undefined);
      expect(v instanceof A1).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0400
     * @tc.name      testTypeArgumentsOne0004
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<X0106> = new AWithConstraint<X0106>(new X0106())
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0500
     * @tc.name      testTypeArgumentsOne0005
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithObjectNullConstraint<X0107|null> = new AWithObjectNullConstraint<X0107|null>(null)
      expect(v instanceof AWithObjectNullConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0600
     * @tc.name      testTypeArgumentsOne0006
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1<X0108[], undefined> = new A1<X0108[], undefined>([new X0108()], undefined);
      expect(v instanceof A1).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0700
     * @tc.name      testTypeArgumentsOne0007
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1<X0109[][], undefined> = new A1<X0109[][], undefined>([[new X0109()]], undefined);
      expect(v instanceof A1).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0800
     * @tc.name      testTypeArgumentsOne0008
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1<[X0110, X0110], undefined> = new A1<[X0110, X0110], undefined>([new X0110(), new X0110()], undefined);
      expect(v instanceof A1).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0900
     * @tc.name      testTypeArgumentsOne0009
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1<[X0111, X0111]|null, undefined> = new A1<[X0111, X0111]|null, undefined>(null, undefined);
      expect(v instanceof A1).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1000
     * @tc.name      testTypeArgumentsOne0010
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new X0112()
      let result = foo<X0112>(v, new Y0112())
      expect(result).assertEqual(v)
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1100
     * @tc.name      testTypeArgumentsOne0011
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Y0113()
      let result = fooWithConstraint<X0113>(v, new X0113())
      expect(result).assertEqual(v)
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1200
     * @tc.name      testTypeArgumentsOne0012
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo<X0114|null>(null, new X0114())
      expect(result).assertNull()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1300
     * @tc.name      testTypeArgumentsOne0013
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = fooWithObjectNullConstraint<Y0115|null>(null, new Y0115())
      expect(result).assertNull()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1400
     * @tc.name      testTypeArgumentsOne0014
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I0116 = new X0116()
      let result = foo<I0116>(v, v)
      expect(result).assertEqual(v)
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1500
     * @tc.name      testTypeArgumentsOne0015
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I0117 = new Y0117()
      let result = fooWithObjectConstraint<I0117>(v, new Y0117())
      expect(result).assertEqual(v)
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1600
     * @tc.name      testTypeArgumentsOne0016
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Color0117[] = [Color0117.Red]
      let result = fooWithObjectConstraint<Color0117[]>(v, [Color0117.Blue])
      expect(result).assertEqual(v)
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1700
     * @tc.name      testTypeArgumentsOne0017
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new X0118()
      let result = foo<X0118>(v, new Y0118())
      expect(result).assertEqual(v)
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1800
     * @tc.name      testTypeArgumentsOne0018
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0121[], X0121> = new A2<X0121[], X0121>([new X0121()], new X0121())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1900
     * @tc.name      testTypeArgumentsOne0019
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0122[][]|null, X0122> = new A2<X0122[][]|null, X0122>(null, new X0122())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2000
     * @tc.name      testTypeArgumentsOne0020
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0123|null, X0123[]> = new A2<X0123|null, X0123[]>(new X0123(), [new X0123()])
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2100
     * @tc.name      testTypeArgumentsOne0021
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0124|null, X0124|null> = new A2<X0124|null, X0124|null>(new X0124(), new X0124())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2200
     * @tc.name      testTypeArgumentsOne0022
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0125[], X0125[]> = new A2<X0125[], X0125[]>([new X0125(), new X0125()], [new X0125()])
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2300
     * @tc.name      testTypeArgumentsOne0023
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<FixedArray<X0126 | null>, undefined> = new A2<FixedArray<X0126 | null>, undefined>(
        [null, new X0126()],
        undefined
      );
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2400
     * @tc.name      testTypeArgumentsOne0024
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0127, X0127> = new A2<X0127, X0127>(new X0127(), new X0127())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2500
     * @tc.name      testTypeArgumentsOne0025
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<X0128> = new AWithConstraint<X0128>(new X0128())
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2600
     * @tc.name      testTypeArgumentsOne0026
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<X0129> = new AWithConstraint<X0129>(new X0129())
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2700
     * @tc.name      testTypeArgumentsOne0027
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithObjectNullConstraint<X0130|null> = new AWithObjectNullConstraint<X0130|null>(null)
      expect(v instanceof AWithObjectNullConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2800
     * @tc.name      testTypeArgumentsOne0028
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<undefined, undefined> = new A2<undefined, undefined>(undefined, undefined)
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2900
     * @tc.name      testTypeArgumentsOne0029
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0133[], X0133|null> = new A2<X0133[], X0133|null>([new X0133()], new X0133())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3000
     * @tc.name      testTypeArgumentsOne0030
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<FixedArray<X0134>, FixedArray<X0134|null>> = new A2<FixedArray<X0134>, FixedArray<X0134|null>>([new X0134()], [new X0134(), null])
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3100
     * @tc.name      testTypeArgumentsOne0031
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0135|null, X0135|null> = new A2<X0135|null, X0135|null>(null, null)
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3200
     * @tc.name      testTypeArgumentsOne0032
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B<Y0136, B0136> = new B<Y0136, B0136>(new Y0136(), [new Y0136()])
      expect(v instanceof B).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3300
     * @tc.name      testTypeArgumentsOne0033
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B<[X0137, X0137], X0137> = new B<[X0137, X0137], X0137>([new X0137(), new X0137()], new X0137())
      expect(v instanceof B).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3400
     * @tc.name      testTypeArgumentsOne0034
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0138, X0138> = new A2<X0138, X0138>(new X0138(), new X0138())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3500
     * @tc.name      testTypeArgumentsOne0035
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0139[], X0139> = new A2<X0139[], X0139>([new X0139()], new X0139())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3600
     * @tc.name      testTypeArgumentsOne0036
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0140|null, X0140> = new A2<X0140|null, X0140>(new X0140(), new X0140())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3700
     * @tc.name      testTypeArgumentsOne0037
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0141, X0141|null> = new A2<X0141, X0141|null>(new X0141(), null)
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3800
     * @tc.name      testTypeArgumentsOne0038
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<FixedArray<X0142>, X0142> = new A2<FixedArray<X0142>, X0142>([new X0142()], new X0142())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3900
     * @tc.name      testTypeArgumentsOne0039
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0143|null, FixedArray<X0143>> = new A2<X0143|null, FixedArray<X0143>>(new X0143(), [new X0143()])
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4000
     * @tc.name      testTypeArgumentsOne0040
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0144, X0144[]|null> = new A2<X0144, X0144[]|null>(new X0144(), null)
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4100
     * @tc.name      testTypeArgumentsOne0041
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0145[][], X0145> = new A2<X0145[][], X0145>([[new X0145()]], new X0145())
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4200
     * @tc.name      testTypeArgumentsOne0042
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<X0146[]|null, X0146[][]> = new A2<X0146[]|null, X0146[][]>(null, [[new X0146()]])
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4300
     * @tc.name      testTypeArgumentsOne0043
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<FixedArray<X0147|null>, FixedArray<X0147|null>> = new A2<FixedArray<X0147|null>, FixedArray<X0147|null>>([null, new X0147()], [new X0147(), null])
      expect(v instanceof A2).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4400
     * @tc.name      testTypeArgumentsOne0044
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A2<[X0148, X0148], [X0148, X0148]|null> = new A2<[X0148, X0148], [X0148, X0148]|null>([new X0148(), new X0148()], null)
      expect(v instanceof A2).assertTrue()
    })
  })
}