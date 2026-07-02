'use static';
/*
* Copyright (c) 2021-2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let res3 = ""

let res4 = ""
// empty nullable string
let s: string|null = ""

let res5 = ""
// empty nullable string
let s1: string|undefined = ""

let res6 = ""
// array of primitives (char)
let arr3: char[] = [c'1', c'2', c'3']

let res7 = ""
// array of primitives (long)
let arr4: long[] = [Long.MIN_VALUE, 0 as long, Long.MAX_VALUE]

let res8 = ""

let res9 = ""

let res10 = ""
enum Color { Red, Green, Blue }
// array of enums
const arr5: Color[] = [Color.Green, Color.Red]

let res11 = ""

let res12 = ""
// array of boxed numeric (Long) with implicit unboxing
let arr6: Long[] = [new Long(10 as long), new Long(12 as long), new Long(33 as long)]

let res13 = ""

let res14 = ""

let res15 = ""
// array of boxed numeric (Float) with unboxing and widening conversion
let arr7: Float[] = [new Float(4.0), new Float(-2.0), new Float()]

let res16 = ""
let NUM = 42.0
let STR = "Hello!"

let res17 = ""
let NUM1 = 42.0
interface I {
  getN(): number
}
interface J {
  getS(): string
}
class A implements I {
  getN(): number {
    return NUM1
  }
}
class B implements J {
  getS(): string {
    return STR
  }
}

let res18 = ""

let res19 = ""
type U=number|boolean

let res20 = ""
// array of arrays
let arr8: int[][] = [[1,2,3], [4,5,6], [7,8,9]]

let res21 = ""
// array of strings
let arr9: string[] = ["ABC", "DEF", "GHJ"]

let res23 = ""

let res24 = ""
function foo1<T extends String>(s: T): T[] {
  return [s, s, s];
}

let res25 = ""
// array of tuples
let arr10: [number, Color][] = [[42.0, Color.Red], [43.0, Color.Blue]]

let res26 = ""
type T=[number, boolean]
// array of tuples with type alias
let arr11: T[] = [[42.0, true], [43.0, false]]

export default function ForOfTypeAnnotationTest():void{
  describe('ForOfTypeAnnotationTest', () => {
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
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_0400
     * @tc.name      testForOfTypeAnnotation0004
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res3 = ""
      // empty string
      for (let v: string of "")
      {
        res3 += v
      }
      expect(res3).assertEqual("")

    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_0500
     * @tc.name      testForOfTypeAnnotation0005
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res4 = ""
      for (let v: string of s!)
      {
        res4 += v
      }
      expect(res4).assertEqual("")
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_0600
     * @tc.name      testForOfTypeAnnotation0006
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res5 = ""
      for (const v:string of s1!)
      {
        res5 += v;
      }
      expect(res5).assertEqual("");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_0700
     * @tc.name      testForOfTypeAnnotation0007
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res6 = ""
      for (let v: char of arr3)
      {
        res6 += v;
      }
      expect(res6).assertEqual("123");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_0800
     * @tc.name      testForOfTypeAnnotation0008
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res7 = ""
      let sum: long = 0
      for (let v: long of arr4)
      {
        sum += v
      }
      expect(sum).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_0900
     * @tc.name      testForOfTypeAnnotation0009
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res8 = ""
      const v: int = 0;
      for (let v: int of[1, 2, 3,4])
      {
        res8 += v
      }
      expect(res8).assertEqual("1234");
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1000
     * @tc.name      testForOfTypeAnnotation0010
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res9 = ""
      let v: boolean = true;
      for (const v:boolean of[true, false, false])
      {
        res9 += v
      }
      expect(res9).assertEqual("truefalsefalse");
   

      expect(v).assertTrue();
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1100
     * @tc.name      testForOfTypeAnnotation0011
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res10 = ""
      for (let v: Color of arr5)
      {
        res10 += v
      }
      expect(res10).assertEqual("10");
    });


    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1200
     * @tc.name      testForOfTypeAnnotation0012
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res11 = ""
      for (const ch: char of[new Char(c'1'),new Char(c'2'),new Char(c'3'),new Char(c'4')])
      {
        res11 += ch
      }
      expect(res11).assertEqual("1234");
    })

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1300
     * @tc.name      testForOfTypeAnnotation0013
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res12 = ""
      for (let i:long of arr6)
      {
        res12 += i
      }
      expect(res12).assertEqual("101233");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1400
     * @tc.name      testForOfTypeAnnotation0014
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res13 = ""
      for (const v: Int of[9, 8, 7, 6, 5])
      {
        res13 += v
      }
      expect(res13).assertEqual("98765");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1500
     * @tc.name      testForOfTypeAnnotation0015
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res14 = ""
      for (const v:Boolean of[false, true, true, false])
      {
        res14 += v
      }
      expect(res14).assertEqual("falsetruetruefalse");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1600
     * @tc.name      testForOfTypeAnnotation0016
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res15 = ""
      let sum: double = 0.0
      for (let v:double of arr7)
      {
        sum += v
      }
      expect(sum).assertEqual(2.0);
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1700
     * @tc.name      testForOfTypeAnnotation0017
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res16 = ""
      let ok = true
      let arr: Object[] = [new B(), new A()]
      for (let v: Object of arr)
      {
        if (v instanceof I) {
          ok = ok && (v as I).getN() === NUM;
        } else if (v instanceof J) {
          ok = ok && (v as J).getS() === STR;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1800
     * @tc.name      testForOfTypeAnnotation0018
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res17 = ""
      let arr: A[] = [new A(), new A()]
      let ok = true
      for (let v: I of arr)
      {
        res17 += v.getN()
      }
      expect(res17).assertEqual("4242");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_1900
     * @tc.name      testForOfTypeAnnotation0019
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res18 = ""
      let arr: (number | boolean)[] = [true, false, 1.0, 2.0]
      for (const v:(number | boolean) of arr)
      {
        if (v instanceof Number) {
          res18 += v as Number
        }
        if (v instanceof Boolean) {
          res18 += v as Boolean
        }
      }
      expect(res18).assertEqual("truefalse12");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_2000
     * @tc.name      testForOfTypeAnnotation0020
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res19 = ""
      let arr: U[] = [true, 1.0, false, 2.0]
      for (const v: U of arr)
      {
        if (v instanceof Number) {
          res19 += v as Number
        }
        if (v instanceof Boolean) {
          res19 += v as Boolean
        }
      }
      expect(res19).assertEqual("true1false2");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_2100
     * @tc.name      testForOfTypeAnnotation0021
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res20 = ""
      for (const v: int[] of arr8)
      {
        res20 += ' '
        for (const q: int of v)
        {
          res20 += q
        }
      }
      expect(res20).assertEqual(" 123 456 789");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_2200
     * @tc.name      testForOfTypeAnnotation0022
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res21 = ""
      for (let v: string of arr9)
      {
        for (let q: string of v)
        {
          res21 += q + " "
        }
      }
      expect(res21).assertEqual("A B C D E F G H J ");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_2500
     * @tc.name      testForOfTypeAnnotation0025
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res24 = ""
      for (let v: string of foo1<String>("AZ"))
      {
        res24 += "-"
        for (let q: string of v)
        {
          res24 += q
        }
      }
      expect(res24).assertEqual("-AZ-AZ-AZ");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_2600
     * @tc.name      testForOfTypeAnnotation0026
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res25 = ""
      for (const v: [number, Color] of arr10)
      {
        res25 += v[0]
        res25 += v[1]
      }
      expect(res25).assertEqual("420432");
    });

    /**
     * @tc.number    SUB_FOR_OF_TYPES_ANNOTATIONTEST_2700
     * @tc.name      testForOfTypeAnnotation0027
     * @tc.desc      An explicit type annotation is allowed for a for variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testForOfTypeAnnotation0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res26 = ""
      for (const v: T of arr11)
      {
        res26 += v[0]
        res26 += v[1]
      }
      expect(res26).assertEqual("42true43false");
    });
  })
}