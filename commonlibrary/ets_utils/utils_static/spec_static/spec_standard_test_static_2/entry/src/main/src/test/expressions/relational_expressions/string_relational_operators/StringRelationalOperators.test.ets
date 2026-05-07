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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
let str1000 = "5H0lJ03LOnqZk4UnvHppXNcDZdEqKbjUN9YezEl44zQq2ZgBiiVkA29vWRmJvyDH7GJYB0NoTwKaDWYdsn2LvrHX2SGeR78gOylELEQ6yCn4BKAYanynLVt1UMIUArUv1C0247TAWI0vXQSEp0TNHWvPrCBkRAP0fTTPHwybLmPE5KzUw9Am9P7IPMeItfY5qnNePPq60yLS7PEIldwQiktR1LP32gdyqDG8aUxh6LYlFtxwipAHcIFrVuRsh3QCHS1eE8F8NLGSVWHPcGVU1PKmzi9ODHk5DwaiZMRxZR21tpNDm9wP4iGYncb2wlYckoJZi9YY2HdysfUm2WajQ1USIRJBxhp2WVBDLgnJt9Mx8lV0En3FBI4xKNXUEgPKQM5XujCaB1vnxgDng07mwTfpKj3xlBiFGBq3SlK0Ah5R6OmXvL1BW2eT32o2w0dWo4E53G76BIxcVq42qZqkLhOtm0Wn5pLBw7jffc4AWPxxUgPcWmXG4Pi1VdEPIvyQBI3GEpffYVGrh41GdAf7lYGEF5Rflk3qREhOGwKn53v3HRZhHeLt3WxGl4f8914cBT3vAKgmPpwx68F6c4NQrOWSEBEpaowOTG13EgzPuYlWwLmjKAXqD0kiCIExLxZ18m2oUzsAqG29PVJT8gVcprjNREXecPajXqlKHroM9haKAkxbMitJB09kJiUSagrvmKEgKlKgxcfwK1UB4sAXWUMz0ir0NUbNxWrdr1Ez69v2qGkgF8eS6Ro1igfSJAs1nG6ZFEVc7Lfq81KVW4X6zPH77Z5FudgRwIvBmaVqrxudeKxgNJL6EHtDeEQVOrjekOjlZwu80tqUphqWpFj0JzVufPOuNUiLejVUwDEefgsa0rCSu3yVCsjupPHzfhHgOc4N76syNvTMlRLalmpAnuhaaVh8O2vYrGb2ZcsbsQkSk0ANTYbybE7qhagL8O1sIImgjmq8J0EUuRWb8s9mWYVhmcNx3wCRIS87cNYV"
let str1001 = "5H0lJ03LOnqZk4UnvHppXNcDZdEqKbjUN9YezEl44zQq2ZgBiiVkA29vWRmJvyDH7GJYB0NoTwKaDWYdsn2LvrHX2SGeR78gOylELEQ6yCn4BKAYanynLVt1UMIUArUv1C0247TAWI0vXQSEp0TNHWvPrCBkRAP0fTTPHwybLmPE5KzUw9Am9P7IPMeItfY5qnNePPq60yLS7PEIldwQiktR1LP32gdyqDG8aUxh6LYlFtxwipAHcIFrVuRsh3QCHS1eE8F8NLGSVWHPcGVU1PKmzi9ODHk5DwaiZMRxZR21tpNDm9wP4iGYncb2wlYckoJZi9YY2HdysfUm2WajQ1USIRJBxhp2WVBDLgnJt9Mx8lV0En3FBI4xKNXUEgPKQM5XujCaB1vnxgDng07mwTfpKj3xlBiFGBq3SlK0Ah5R6OmXvL1BW2eT32o2w0dWo4E53G76BIxcVq42qZqkLhOtm0Wn5pLBw7jffc4AWPxxUgPcWmXG4Pi1VdEPIvyQBI3GEpffYVGrh41GdAf7lYGEF5Rflk3qREhOGwKn53v3HRZhHeLt3WxGl4f8914cBT3vAKgmPpwx68F6c4NQrOWSEBEpaowOTG13EgzPuYlWwLmjKAXqD0kiCIExLxZ18m2oUzsAqG29PVJT8gVcprjNREXecPajXqlKHroM9haKAkxbMitJB09kJiUSagrvmKEgKlKgxcfwK1UB4sAXWUMz0ir0NUbNxWrdr1Ez69v2qGkgF8eS6Ro1igfSJAs1nG6ZFEVc7Lfq81KVW4X6zPH77Z5FudgRwIvBmaVqrxudeKxgNJL6EHtDeEQVOrjekOjlZwu80tqUphqWpFj0JzVufPOuNUiLejVUwDEefgsa0rCSu3yVCsjupPHzfhHgOc4N76syNvTMlRLalmpAnuhaaVh8O2vYrGb2ZcsbsQkSk0ANTYbybE7qhagL8O1sIImgjmq8J0EUuRWb8s9mWYVhmcNx3wCRIS87cNYV1"

export default function StringRelationalTest() {
  describe("StringRelationalTest", () => {
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
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0100
    * @tc.name      testStringRelationalOperators0001
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((str1000 >= str1000)).assertTrue()
      expect((str1000 >= str1001)).assertFalse()
      expect((str1000 <= str1001)).assertTrue()
      expect((str1000 < str1001)).assertTrue()
      expect((str1000 > str1001)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0200
    * @tc.name      testStringRelationalOperators0002
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = ""
      let z: String = new String("")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0300
    * @tc.name      testStringRelationalOperators0003
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = " "
      let y: string = ""
      let z: String = new String("")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0400
    * @tc.name      testStringRelationalOperators0004
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = "\n"
      let z: String = new String("\n")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0500
    * @tc.name      testStringRelationalOperators0005
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\r"
      let y: string = ""
      let z: String = new String("")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0600
    * @tc.name      testStringRelationalOperators0006
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "'aa"
      let y: string = "'aa"
      let z: String = new String("'aa")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0700
    * @tc.name      testStringRelationalOperators0007
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "aa"
      let y: string = "aaa"
      let z: String = new String("aaa")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0800
    * @tc.name      testStringRelationalOperators0008
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "ac"
      let y: string = "dc"
      let z: String = new String("dc")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_0900
    * @tc.name      testStringRelationalOperators0009
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAB"
      let y: string = "AAAAAAA"
      let z: String = new String("AAAAAAA")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1000
    * @tc.name      testStringRelationalOperators0010
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAA"
      let y: string = "aaaaaa"
      let z: String = new String("aaaaaa")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1100
    * @tc.name      testStringRelationalOperators0011
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "~"
      let y: string = "~A"
      let z: String = new String("~A")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1200
    * @tc.name      testStringRelationalOperators0012
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "alea iacta est"
      let y: string = "alea iacta est"
      let z: String = new String("alea iacta est")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1300
    * @tc.name      testStringRelationalOperators0013
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "987654321"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1400
    * @tc.name      testStringRelationalOperators0014
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "0987654321"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1500
    * @tc.name      testStringRelationalOperators0015
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.><\\,"
      let y: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.><\\, "
      let z: String = new String("!@#$%^&*()_+-=`~\"\\|[]{}/?.><\\, ")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1600
    * @tc.name      testStringRelationalOperators0016
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1700
    * @tc.name      testStringRelationalOperators0017
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x007\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x007\x00")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1800
    * @tc.name      testStringRelationalOperators0018
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D800}"
      let y: string = "\u{D800}"
      let z: String = new String("\u{D800}")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_1900
    * @tc.name      testStringRelationalOperators0019
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D800}"
      let y: string = "\u{D801}"
      let z: String = new String("\u{D801}")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2000
    * @tc.name      testStringRelationalOperators0020
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC00}"
      let y: string = "\u{DC00}"
      let z: String = new String("\u{DC00}")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2100
    * @tc.name      testStringRelationalOperators0021
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC00}"
      let y: string = "\u{DC01}"
      let z: String = new String("\u{DC01}")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2200
    * @tc.name      testStringRelationalOperators0022
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFF}"
      let z: String = new String("\u{DBFF}\u{DFFF}")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2300
    * @tc.name      testStringRelationalOperators0023
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFA}"
      let y: string = "\u{DBFF}\u{DFFF}"
      let z: String = new String("\u{DBFF}\u{DFFF}")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2400
    * @tc.name      testStringRelationalOperators0024
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A122}"
      let z: String = new String("\u{A122}")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2500
    * @tc.name      testStringRelationalOperators0025
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A124}"
      let z: String = new String("\u{A124}")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2600
    * @tc.name      testStringRelationalOperators0026
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000069}"
      let y: string = "\u{00000068}"
      let z: String = new String("\u{00000068}")
      expect((x < y)).assertFalse()
      expect((x < z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2700
    * @tc.name      testStringRelationalOperators0027
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000068}"
      let y: string = "\u{00000069}"
      let z: String = new String("\u{00000069}")
      expect((x < y)).assertTrue()
      expect((x < z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2800
    * @tc.name      testStringRelationalOperators0028
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = ""
      let z: String = new String("")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_2900
    * @tc.name      testStringRelationalOperators0029
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = " "
      let y: string = ""
      let z: String = new String("")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3000
    * @tc.name      testStringRelationalOperators0030
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = "\n"
      let z: String = new String("\n")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3100
    * @tc.name      testStringRelationalOperators0031
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\r"
      let y: string = ""
      let z: String = new String("")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3200
    * @tc.name      testStringRelationalOperators0032
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "'aa"
      let y: string = "'aa"
      let z: String = new String("'aa")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3300
    * @tc.name      testStringRelationalOperators0033
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "aa"
      let y: string = "aaa"
      let z: String = new String("aaa")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3400
    * @tc.name      testStringRelationalOperators0034
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "ac"
      let y: string = "dc"
      let z: String = new String("dc")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3500
    * @tc.name      testStringRelationalOperators0035
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAB"
      let y: string = "AAAAAAA"
      let z: String = new String("AAAAAAA")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3600
    * @tc.name      testStringRelationalOperators0036
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAA"
      let y: string = "aaaaaa"
      let z: String = new String("aaaaaa")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3700
    * @tc.name      testStringRelationalOperators0037
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "~"
      let y: string = "~"
      let z: String = new String("~")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3800
    * @tc.name      testStringRelationalOperators0038
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "alea iacta est"
      let y: string = "alea iacta est"
      let z: String = new String("alea iacta est")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_3900
    * @tc.name      testStringRelationalOperators0039
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "987654321"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4000
    * @tc.name      testStringRelationalOperators0040
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "0987654321"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4100
    * @tc.name      testStringRelationalOperators0041
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\"
      let y: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\"
      let z: String = new String("!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4200
    * @tc.name      testStringRelationalOperators0042
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4300
    * @tc.name      testStringRelationalOperators0043
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x007\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4400
    * @tc.name      testStringRelationalOperators0044
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D800}"
      let y: string = "\u{D800}"
      let z: String = new String("\u{D800}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4500
    * @tc.name      testStringRelationalOperators0045
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D801}"
      let y: string = "\u{D800}"
      let z: String = new String("\u{D800}")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4600
    * @tc.name      testStringRelationalOperators0046
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D800}"
      let y: string = "\u{D801}"
      let z: String = new String("\u{D801}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4700
    * @tc.name      testStringRelationalOperators0047
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC00}"
      let y: string = "\u{DC00}"
      let z: String = new String("\u{DC00}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4800
    * @tc.name      testStringRelationalOperators0048
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC01}"
      let y: string = "\u{DC00}"
      let z: String = new String("\u{DC00}")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_4900
    * @tc.name      testStringRelationalOperators0049
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC00}"
      let y: string = "\u{DC01}"
      let z: String = new String("\u{DC01}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5000
    * @tc.name      testStringRelationalOperators0050
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFF}"
      let z: String = new String("\u{DBFF}\u{DFFF}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5100
    * @tc.name      testStringRelationalOperators0051
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFA}"
      let z: String = new String("\u{DBFF}\u{DFFA}")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5200
    * @tc.name      testStringRelationalOperators0052
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFA}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFF}"
      let z: String = new String("\u{DBFF}\u{DFFF}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5300
    * @tc.name      testStringRelationalOperators0053
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A123}"
      let z: String = new String("\u{A123}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5400
    * @tc.name      testStringRelationalOperators0054
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A122}"
      let z: String = new String("\u{A122}")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5500
    * @tc.name      testStringRelationalOperators0055
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A122}"
      let y: string = "\u{A123}"
      let z: String = new String("\u{A123}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5600
    * @tc.name      testStringRelationalOperators0056
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000068}"
      let y: string = "\u{00000068}"
      let z: String = new String("\u{00000068}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5700
    * @tc.name      testStringRelationalOperators0057
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000069}"
      let y: string = "\u{00000068}"
      let z: String = new String("\u{00000068}")
      expect((x <= y)).assertFalse()
      expect((x <= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5800
    * @tc.name      testStringRelationalOperators0058
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000068}"
      let y: string = "\u{00000069}"
      let z: String = new String("\u{00000069}")
      expect((x <= y)).assertTrue()
      expect((x <= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_5900
    * @tc.name      testStringRelationalOperators0059
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = ""
      let z: String = new String("")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6000
    * @tc.name      testStringRelationalOperators0060
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = " "
      let y: string = ""
      let z: String = new String("")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6100
    * @tc.name      testStringRelationalOperators0061
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = "\n"
      let z: String = new String("\n")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6200
    * @tc.name      testStringRelationalOperators0062
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\r"
      let y: string = ""
      let z: String = new String("")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6300
    * @tc.name      testStringRelationalOperators0063
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "'aa"
      let y: string = "'aa"
      let z: String = new String("'aa")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6400
    * @tc.name      testStringRelationalOperators0064
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "aa"
      let y: string = "aaa"
      let z: String = new String("aaa")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6500
    * @tc.name      testStringRelationalOperators0065
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "ac"
      let y: string = "dc"
      let z: String = new String("dc")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6600
    * @tc.name      testStringRelationalOperators0066
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAB"
      let y: string = "AAAAAAA"
      let z: String = new String("AAAAAAA")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6700
    * @tc.name      testStringRelationalOperators0067
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAA"
      let y: string = "aaaaaa"
      let z: String = new String("aaaaaa")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6800
    * @tc.name      testStringRelationalOperators0068
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "~"
      let y: string = "~"
      let z: String = new String("~")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_6900
    * @tc.name      testStringRelationalOperators0069
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "alea iacta est"
      let y: string = "alea iacta est"
      let z: String = new String("alea iacta est")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7000
    * @tc.name      testStringRelationalOperators0070
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "987654321"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7100
    * @tc.name      testStringRelationalOperators0071
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "0987654321"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7200
    * @tc.name      testStringRelationalOperators0072
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\"
      let y: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\"
      let z: String = new String("!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7300
    * @tc.name      testStringRelationalOperators0073
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7400
    * @tc.name      testStringRelationalOperators0074
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x007\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7500
    * @tc.name      testStringRelationalOperators0075
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D800}"
      let y: string = "\u{D800}"
      let z: String = new String("\u{D800}")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7600
    * @tc.name      testStringRelationalOperators0076
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D801}"
      let y: string = "\u{D800}"
      let z: String = new String("\u{D800}")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7700
    * @tc.name      testStringRelationalOperators0077
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC00}"
      let y: string = "\u{DC00}"
      let z: String = new String("\u{DC00}")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7800
    * @tc.name      testStringRelationalOperators0078
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC01}"
      let y: string = "\u{DC00}"
      let z: String = new String("\u{DC00}")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_7900
    * @tc.name      testStringRelationalOperators0079
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFF}"
      let z: String = new String("\u{DBFF}\u{DFFF}")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8000
    * @tc.name      testStringRelationalOperators0080
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFA}"
      let z: String = new String("\u{DBFF}\u{DFFA}")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8100
    * @tc.name      testStringRelationalOperators0081
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A122}"
      let z: String = new String("\u{A122}")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8200
    * @tc.name      testStringRelationalOperators0082
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A123}"
      let z: String = new String("\u{A123}")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8300
    * @tc.name      testStringRelationalOperators0083
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let y: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let z: String = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((x > y)).assertFalse()
      expect((x > z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8400
    * @tc.name      testStringRelationalOperators0084
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006d}\u{0000006f}"
      let y: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let z: String = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((x > y)).assertTrue()
      expect((x > z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8500
    * @tc.name      testStringRelationalOperators0085
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = ""
      let z: String = new String("")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8600
    * @tc.name      testStringRelationalOperators0086
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = " "
      let y: string = ""
      let z: String = new String("")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8700
    * @tc.name      testStringRelationalOperators0087
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = ""
      let y: string = "\n"
      let z: String = new String("\n")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8800
    * @tc.name      testStringRelationalOperators0088
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\r"
      let y: string = ""
      let z: String = new String("")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_8900
    * @tc.name      testStringRelationalOperators0089
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "'aa"
      let y: string = "'aa"
      let z: String = new String("'aa")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9000
    * @tc.name      testStringRelationalOperators0090
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "aa"
      let y: string = "aaa"
      let z: String = new String("aaa")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9100
    * @tc.name      testStringRelationalOperators0091
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "ac"
      let y: string = "dc"
      let z: String = new String("dc")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9200
    * @tc.name      testStringRelationalOperators0092
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAB"
      let y: string = "AAAAAAA"
      let z: String = new String("AAAAAAA")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9300
    * @tc.name      testStringRelationalOperators0093
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "AAAAAA"
      let y: string = "aaaaaa"
      let z: String = new String("aaaaaa")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9400
    * @tc.name      testStringRelationalOperators0094
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "~"
      let y: string = "~"
      let z: String = new String("~")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9500
    * @tc.name      testStringRelationalOperators0095
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "alea iacta est"
      let y: string = "alea iacta est"
      let z: String = new String("alea iacta est")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9600
    * @tc.name      testStringRelationalOperators0096
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "987654321"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9700
    * @tc.name      testStringRelationalOperators0097
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "9876543210"
      let y: string = "987654321"
      let z: String = new String("987654321")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9800
    * @tc.name      testStringRelationalOperators0098
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\"
      let y: string = "!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\"
      let z: String = new String("!@#$%^&*()_+-=`~\"\\|[]{}/?.>,<\\")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_9900
    * @tc.name      testStringRelationalOperators0099
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10000
    * @tc.name      testStringRelationalOperators0100
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\xff\xfe\xac 1\x003\x00,\x005\x007\x00"
      let y: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let z: String = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10100
    * @tc.name      testStringRelationalOperators0101
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D800}"
      let y: string = "\u{D800}"
      let z: String = new String("\u{D800}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10200
    * @tc.name      testStringRelationalOperators0102
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D801}"
      let y: string = "\u{D800}"
      let z: String = new String("\u{D800}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10300
    * @tc.name      testStringRelationalOperators0103
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{D800}"
      let y: string = "\u{D801}"
      let z: String = new String("\u{D801}")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10400
    * @tc.name      testStringRelationalOperators0104
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC00}"
      let y: string = "\u{DC00}"
      let z: String = new String("\u{DC00}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10500
    * @tc.name      testStringRelationalOperators0105
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC01}"
      let y: string = "\u{DC00}"
      let z: String = new String("\u{DC00}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10600
    * @tc.name      testStringRelationalOperators0106
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DC00}"
      let y: string = "\u{DC01}"
      let z: String = new String("\u{DC01}")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10700
    * @tc.name      testStringRelationalOperators0107
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFF}"
      let z: String = new String("\u{DBFF}\u{DFFF}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10800
    * @tc.name      testStringRelationalOperators0108
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFF}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFA}"
      let z: String = new String("\u{DBFF}\u{DFFA}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_10900
    * @tc.name      testStringRelationalOperators0109
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{DBFA}\u{DFFF}"
      let y: string = "\u{DBFF}\u{DFFF}"
      let z: String = new String("\u{DBFF}\u{DFFF}")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_11000
    * @tc.name      testStringRelationalOperators0110
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A122}"
      let z: String = new String("\u{A122}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_11100
    * @tc.name      testStringRelationalOperators0111
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A123}"
      let y: string = "\u{A123}"
      let z: String = new String("\u{A123}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_11200
    * @tc.name      testStringRelationalOperators0112
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{A122}"
      let y: string = "\u{A123}"
      let z: String = new String("\u{A123}")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_11300
    * @tc.name      testStringRelationalOperators0113
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let y: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let z: String = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_11400
    * @tc.name      testStringRelationalOperators0114
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006d}\u{0000006f}"
      let y: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let z: String = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((x >= y)).assertTrue()
      expect((x >= z)).assertTrue()
    })
    /**
    * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_11500
    * @tc.name      testStringRelationalOperators0115
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testStringRelationalOperators0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: string = "\u{00000067}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let y: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let z: String = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((x >= y)).assertFalse()
      expect((x >= z)).assertFalse()
    })
  })
}