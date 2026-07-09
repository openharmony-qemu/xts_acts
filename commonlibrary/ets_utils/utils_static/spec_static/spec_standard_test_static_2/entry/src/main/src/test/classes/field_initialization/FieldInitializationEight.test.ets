'use static';
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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from '../../Util.test.ets'


class A_F793 {
    static field: byte
  }

class A_F794 {
    static field: short
  }

class A_F795 {
    static field: double
  }

class A_F796 {
    static field: number
  }

class A_F797 {
    static field: float
  }

class A_F798 {
    static field: char
  }

class A_F799 {
    static field: boolean
  }

class A_F800 {
    static field: Object | undefined
  }

class A_F801 {
    static field: Object | undefined | null
  }

class A_F803 {
    static field: long = 4
  }

class A_F804 {
    static field: int = 4
  }

class A_F805 {
    static field: byte = 4
  }

class A_F806 {
    static field: short = 4
  }

class A_F807 {
    static field: double = 4
  }

class A_F808 {
    static field: number = 4
  }

class A_F809 {
    static field: float = 4.5f
  }

class A_F810 {
    static field: bigint = 4n
  }

class A_F811 {
    static field: string = "abc"
  }

class A_F812 {
    static field: char = c'a'
  }

class A_F813 {
    static field: boolean = false
  }

class A_F814 {
    static field: Object = 4
  }

class A_F815 {
    static field: Object | undefined = undefined
  }

class A_F816 {
    static field: Object | undefined | null = 4
  }

class Base_F818 {
    static field: long = 4
  }
  class A_F818 extends Base_F818 {
  }

class Base_F819 {
    static field: int = 4
  }
  class A_F819 extends Base_F819 {
  }

class Base_F820 {
    static field: byte = 4
  }
  class A_F820 extends Base_F820 {
  }

class Base_F821 {
    static field: short = 4
  }
  class A_F821 extends Base_F821 {
  }

class Base_F822 {
    static field: double = 4
  }
  class A_F822 extends Base_F822 {
  }

class Base_F823 {
    static field: number = 4
  }
  class A_F823 extends Base_F823 {
  }

class Base_F824 {
    static field: float = 4.5f
  }
  class A_F824 extends Base_F824 {
  }

class Base_F825 {
    static field: bigint = 4n
  }
  class A_F825 extends Base_F825 {
  }

class Base_F826 {
    static field: string = "abc"
  }
  class A_F826 extends Base_F826 {
  }

class Base_F827 {
    static field: char = c'a'
  }
  class A_F827 extends Base_F827 {
  }

class Base_F828 {
    static field: boolean = false
  }
  class A_F828 extends Base_F828 {
  }

class Base_F829 {
    static field: Object = 4
  }
  class A_F829 extends Base_F829 {
  }

class Base_F830 {
    static field: Object | undefined = undefined
  }
  class A_F830 extends Base_F830 {
  }

class Base_F831 {
    static field: Object | undefined | null = 4
  }
  class A_F831 extends Base_F831 {
  }

class Base_F833 {
    static field: long = 4
  }
  class B_F833 extends Base_F833 {
  }
  class A_F833 extends B_F833 {
  }

class Base_F834 {
    static field: int = 4
  }
  class B_F834 extends Base_F834 {
  }
  class A_F834 extends B_F834 {
  }

class Base_F835 {
    static field: byte = 4
  }
  class B_F835 extends Base_F835 {
  }
  class A_F835 extends B_F835 {
  }

class Base_F836 {
    static field: short = 4
  }
  class B_F836 extends Base_F836 {
  }
  class A_F836 extends B_F836 {
  }

class Base_F837 {
    static field: double = 4
  }
  class B_F837 extends Base_F837 {
  }
  class A_F837 extends B_F837 {
  }

class Base_F838 {
    static field: number = 4
  }
  class B_F838 extends Base_F838 {
  }
  class A_F838 extends B_F838 {
  }

class Base_F839 {
    static field: float = 4.5f
  }
  class B_F839 extends Base_F839 {
  }
  class A_F839 extends B_F839 {
  }

class Base_F840 {
    static field: bigint = 4n
  }
  class B_F840 extends Base_F840 {
  }
  class A_F840 extends B_F840 {
  }

class Base_F841 {
    static field: string = "abc"
  }
  class B_F841 extends Base_F841 {
  }
  class A_F841 extends B_F841 {
  }

class Base_F842 {
    static field: char = c'a'
  }
  class B_F842 extends Base_F842 {
  }
  class A_F842 extends B_F842 {
  }

class Base_F843 {
    static field: boolean = false
  }
  class B_F843 extends Base_F843 {
  }
  class A_F843 extends B_F843 {
  }

class Base_F844 {
    static field: Object = 4
  }
  class B_F844 extends Base_F844 {
  }
  class A_F844 extends B_F844 {
  }

class Base_F845 {
    static field: Object | undefined = undefined
  }
  class B_F845 extends Base_F845 {
  }
  class A_F845 extends B_F845 {
  }

class Base_F846 {
    static field: Object | undefined | null = 4
  }
  class B_F846 extends Base_F846 {
  }
  class A_F846 extends B_F846 {
  }

class A_F848 {
    static field: long
    foo(a: long): void {
      A_F848.field = a
    }
  }

class A_F849 {
    static field: int
    foo(a: int): void {
      A_F849.field = a
    }
  }

class A_F850 {
    static field: byte
    foo(a: byte): void {
      A_F850.field = a
    }
  }

class A_F851 {
    static field: short
    foo(a: short): void {
      A_F851.field = a
    }
  }

class A_F852 {
    static field: double
    foo(a: double): void {
      A_F852.field = a
    }
  }

class A_F853 {
    static field: number
    foo(a: number): void {
      A_F853.field = a
    }
  }

class A_F854 {
    static field: float
    foo(a: float): void {
      A_F854.field = a
    }
  }

class A_F855 {
    static field: char
    foo(a: char): void {
      A_F855.field = a
    }
  }

class A_F856 {
    static field: boolean
    foo(a: boolean): void {
      A_F856.field = a
    }
  }

class A_F857 {
    static field: Object | undefined
    foo(a: Object | undefined): void {
      A_F857.field = a
    }
  }

class A_F858 {
    static field: Object | undefined | null
    foo(a: Object | undefined | null): void {
      A_F858.field = a
    }
  }

class A_F860 {
    static field: long
    foo: (a: long) => void = (a: long): void => {
      A_F860.field = a
    }
  }

class A_F861 {
    static field: int
    foo: (a: int) => void = (a: int): void => {
      A_F861.field = a
    }
  }

class A_F862 {
    static field: byte
    foo: (a: byte) => void = (a: byte): void => {
      A_F862.field = a
    }
  }

class A_F863 {
    static field: short
    foo: (a: short) => void = (a: short): void => {
      A_F863.field = a
    }
  }

class A_F864 {
    static field: double
    foo: (a: double) => void = (a: double): void => {
      A_F864.field = a
    }
  }

class A_F865 {
    static field: number
    foo: (a: number) => void = (a: number): void => {
      A_F865.field = a
    }
  }

class A_F866 {
    static field: float
    foo: (a: float) => void = (a: float): void => {
      A_F866.field = a
    }
  }

class A_F867 {
    static field: char
    foo: (a: char) => void = (a: char): void => {
      A_F867.field = a
    }
  }

class A_F868 {
    static field: boolean
    foo: (a: boolean) => void = (a: boolean): void => {
      A_F868.field = a
    }
  }

class A_F869 {
    static field: Object | undefined
    foo: (a: Object | undefined) => void = (a: Object | undefined): void => {
      A_F869.field = a
    }
  }

class A_F870 {
    static field: Object | undefined | null
    foo: (a: Object | undefined | null) => void = (a: Object | undefined | null): void => {
      A_F870.field = a
    }
  }

class A_F872 {
    static field: long = 4
    foo(a: long): void {
      A_F872.field = a
    }
  }

class A_F873 {
    static field: int = 4
    foo(a: int): void {
      A_F873.field = a
    }
  }

class A_F874 {
    static field: byte = 4
    foo(a: byte): void {
      A_F874.field = a
    }
  }

class A_F875 {
    static field: short = 4
    foo(a: short): void {
      A_F875.field = a
    }
  }

class A_F876 {
    static field: double = 4
    foo(a: double): void {
      A_F876.field = a
    }
  }

class A_F877 {
    static field: number = 4
    foo(a: number): void {
      A_F877.field = a
    }
  }

class A_F878 {
    static field: float = 4.5f
    foo(a: float): void {
      A_F878.field = a
    }
  }

class A_F879 {
    static field: bigint = 4n
    foo(a: bigint): void {
      A_F879.field = a
    }
  }

class A_F880 {
    static field: string = "abc"
    foo(a: string): void {
      A_F880.field = a
    }
  }

class A_F881 {
    static field: char = c'a'
    foo(a: char): void {
      A_F881.field = a
    }
  }

class A_F882 {
    static field: boolean = false
    foo(a: boolean): void {
      A_F882.field = a
    }
  }

class A_F883 {
    static field: Object = 4
    foo(a: Object): void {
      A_F883.field = a
    }
  }

class A_F884 {
    static field: Object | undefined = undefined
    foo(a: Object | undefined): void {
      A_F884.field = a
    }
  }

class A_F885 {
    static field: Object | undefined | null = 4
    foo(a: Object | undefined | null): void {
      A_F885.field = a
    }
  }

class A_F887 {
    static field: long = 4
    foo: (a: long) => void = (a: long): void => {
      A_F887.field = a
    }
  }

class A_F888 {
    static field: int = 4
    foo: (a: int) => void = (a: int): void => {
      A_F888.field = a
    }
  }

class A_F889 {
    static field: byte = 4
    foo: (a: byte) => void = (a: byte): void => {
      A_F889.field = a
    }
  }

class A_F890 {
    static field: short = 4
    foo: (a: short) => void = (a: short): void => {
      A_F890.field = a
    }
  }

class A_F891 {
    static field: double = 4
    foo: (a: double) => void = (a: double): void => {
      A_F891.field = a
    }
  }

export default function FieldInitializationEightTest(): void {
  describe("FieldInitializationEightTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_FIELD_INIT_EIGHT_0100
     * @tc.name      testFieldInitEight0001
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F793.field instanceof byte).assertTrue()
      expect(A_F793.field).assertEqual(0)
          A_F793.field = 5
      expect(A_F793.field instanceof byte).assertTrue()
      expect(A_F793.field).assertEqual(5)
          A_F793.field = 0
      expect(A_F793.field instanceof byte).assertTrue()
      expect(A_F793.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0200
     * @tc.name      testFieldInitEight0002
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F794.field instanceof short).assertTrue()
      expect(A_F794.field).assertEqual(0)
          A_F794.field = 5
      expect(A_F794.field instanceof short).assertTrue()
      expect(A_F794.field).assertEqual(5)
          A_F794.field = 0
      expect(A_F794.field instanceof short).assertTrue()
      expect(A_F794.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0300
     * @tc.name      testFieldInitEight0003
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F795.field instanceof double).assertTrue()
      expect(A_F795.field).assertEqual(0)
          A_F795.field = 7.3
      expect(A_F795.field instanceof double).assertTrue()
      expect(A_F795.field).assertEqual(7.3)
          A_F795.field = 0
      expect(A_F795.field instanceof double).assertTrue()
      expect(A_F795.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0400
     * @tc.name      testFieldInitEight0004
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F796.field instanceof number).assertTrue()
      expect(A_F796.field).assertEqual(0)
          A_F796.field = 5
      expect(A_F796.field instanceof number).assertTrue()
      expect(A_F796.field).assertEqual(5)
          A_F796.field = 0
      expect(A_F796.field instanceof number).assertTrue()
      expect(A_F796.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0500
     * @tc.name      testFieldInitEight0005
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F797.field instanceof float).assertTrue()
      expect(A_F797.field).assertEqual(0.0f)
          A_F797.field = 7.3f
      expect(A_F797.field instanceof float).assertTrue()
      expect(A_F797.field).assertEqual(7.3f)
          A_F797.field = 0.0f
      expect(A_F797.field instanceof float).assertTrue()
      expect(A_F797.field).assertEqual(0.0f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0600
     * @tc.name      testFieldInitEight0006
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F798.field instanceof char).assertTrue()
      expect(A_F798.field).assertEqual(c'\u0000')
          A_F798.field = c'a'
      expect(A_F798.field instanceof char).assertTrue()
      expect(A_F798.field).assertEqual(c'a')
          A_F798.field = c'\u0000'
      expect(A_F798.field instanceof char).assertTrue()
      expect(A_F798.field).assertEqual(c'\u0000')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0700
     * @tc.name      testFieldInitEight0007
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F799.field instanceof boolean).assertTrue()
      expect(A_F799.field).assertEqual(false)
          A_F799.field = true
      expect(A_F799.field instanceof boolean).assertTrue()
      expect(A_F799.field).assertEqual(true)
          A_F799.field = false
      expect(A_F799.field instanceof boolean).assertTrue()
      expect(A_F799.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0800
     * @tc.name      testFieldInitEight0008
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F800.field instanceof Object).assertFalse()
      expect(A_F800.field).assertEqual(undefined)
          A_F800.field = 5
      expect(A_F800.field instanceof Object).assertTrue()
      expect(A_F800.field).assertEqual(5)
          A_F800.field = undefined
      expect(A_F800.field instanceof Object).assertFalse()
      expect(A_F800.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_0900
     * @tc.name      testFieldInitEight0009
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F801.field instanceof Object).assertFalse()
      expect(A_F801.field).assertEqual(undefined)
          A_F801.field = 5
      expect(A_F801.field instanceof Object).assertTrue()
      expect(A_F801.field).assertEqual(5)
          A_F801.field = undefined
      expect(A_F801.field instanceof Object).assertFalse()
      expect(A_F801.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1000
     * @tc.name      testFieldInitEight0010
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F803.field instanceof long).assertTrue()
      expect(A_F803.field).assertEqual(4)
          A_F803.field = 5
      expect(A_F803.field instanceof long).assertTrue()
      expect(A_F803.field).assertEqual(5)
          A_F803.field = 4
      expect(A_F803.field instanceof long).assertTrue()
      expect(A_F803.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1100
     * @tc.name      testFieldInitEight0011
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F804.field instanceof int).assertTrue()
      expect(A_F804.field).assertEqual(4)
          A_F804.field = 5
      expect(A_F804.field instanceof int).assertTrue()
      expect(A_F804.field).assertEqual(5)
          A_F804.field = 4
      expect(A_F804.field instanceof int).assertTrue()
      expect(A_F804.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1200
     * @tc.name      testFieldInitEight0012
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F805.field instanceof byte).assertTrue()
      expect(A_F805.field).assertEqual(4)
          A_F805.field = 5
      expect(A_F805.field instanceof byte).assertTrue()
      expect(A_F805.field).assertEqual(5)
          A_F805.field = 4
      expect(A_F805.field instanceof byte).assertTrue()
      expect(A_F805.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1300
     * @tc.name      testFieldInitEight0013
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F806.field instanceof short).assertTrue()
      expect(A_F806.field).assertEqual(4)
          A_F806.field = 5
      expect(A_F806.field instanceof short).assertTrue()
      expect(A_F806.field).assertEqual(5)
          A_F806.field = 4
      expect(A_F806.field instanceof short).assertTrue()
      expect(A_F806.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1400
     * @tc.name      testFieldInitEight0014
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F807.field instanceof double).assertTrue()
      expect(A_F807.field).assertEqual(4)
          A_F807.field = 7.3
      expect(A_F807.field instanceof double).assertTrue()
      expect(A_F807.field).assertEqual(7.3)
          A_F807.field = 4
      expect(A_F807.field instanceof double).assertTrue()
      expect(A_F807.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1500
     * @tc.name      testFieldInitEight0015
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F808.field instanceof number).assertTrue()
      expect(A_F808.field).assertEqual(4)
          A_F808.field = 5
      expect(A_F808.field instanceof number).assertTrue()
      expect(A_F808.field).assertEqual(5)
          A_F808.field = 4
      expect(A_F808.field instanceof number).assertTrue()
      expect(A_F808.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1600
     * @tc.name      testFieldInitEight0016
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F809.field instanceof float).assertTrue()
      expect(A_F809.field).assertEqual(4.5f)
          A_F809.field = 7.3f
      expect(A_F809.field instanceof float).assertTrue()
      expect(A_F809.field).assertEqual(7.3f)
          A_F809.field = 4.5f
      expect(A_F809.field instanceof float).assertTrue()
      expect(A_F809.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1700
     * @tc.name      testFieldInitEight0017
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F810.field instanceof bigint).assertTrue()
      expect(A_F810.field).assertEqual(4n)
          A_F810.field = 5n
      expect(A_F810.field instanceof bigint).assertTrue()
      expect(A_F810.field).assertEqual(5n)
          A_F810.field = 4n
      expect(A_F810.field instanceof bigint).assertTrue()
      expect(A_F810.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1800
     * @tc.name      testFieldInitEight0018
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F811.field instanceof string).assertTrue()
      expect(A_F811.field).assertEqual("abc")
          A_F811.field = "efg"
      expect(A_F811.field instanceof string).assertTrue()
      expect(A_F811.field).assertEqual("efg")
          A_F811.field = "abc"
      expect(A_F811.field instanceof string).assertTrue()
      expect(A_F811.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_1900
     * @tc.name      testFieldInitEight0019
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F812.field instanceof char).assertTrue()
      expect(A_F812.field).assertEqual(c'a')
          A_F812.field = c'b'
      expect(A_F812.field instanceof char).assertTrue()
      expect(A_F812.field).assertEqual(c'b')
          A_F812.field = c'a'
      expect(A_F812.field instanceof char).assertTrue()
      expect(A_F812.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2000
     * @tc.name      testFieldInitEight0020
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F813.field instanceof boolean).assertTrue()
      expect(A_F813.field).assertEqual(false)
          A_F813.field = true
      expect(A_F813.field instanceof boolean).assertTrue()
      expect(A_F813.field).assertEqual(true)
          A_F813.field = false
      expect(A_F813.field instanceof boolean).assertTrue()
      expect(A_F813.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2100
     * @tc.name      testFieldInitEight0021
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F814.field instanceof Object).assertTrue()
      expect(A_F814.field).assertEqual(4)
          A_F814.field = 5
      expect(A_F814.field instanceof Object).assertTrue()
      expect(A_F814.field).assertEqual(5)
          A_F814.field = 4
      expect(A_F814.field instanceof Object).assertTrue()
      expect(A_F814.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2200
     * @tc.name      testFieldInitEight0022
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F815.field instanceof Object).assertFalse()
      expect(A_F815.field).assertEqual(undefined)
          A_F815.field = 5
      expect(A_F815.field instanceof Object).assertTrue()
      expect(A_F815.field).assertEqual(5)
          A_F815.field = undefined
      expect(A_F815.field instanceof Object).assertFalse()
      expect(A_F815.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2300
     * @tc.name      testFieldInitEight0023
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F816.field instanceof Object).assertTrue()
      expect(A_F816.field).assertEqual(4)
          A_F816.field = 5
      expect(A_F816.field instanceof Object).assertTrue()
      expect(A_F816.field).assertEqual(5)
          A_F816.field = 4
      expect(A_F816.field instanceof Object).assertTrue()
      expect(A_F816.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2400
     * @tc.name      testFieldInitEight0024
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F818.field instanceof long).assertTrue()
      expect(Base_F818.field).assertEqual(4)
          Base_F818.field = 5
      expect(Base_F818.field instanceof long).assertTrue()
      expect(Base_F818.field).assertEqual(5)
          Base_F818.field = 4
      expect(Base_F818.field instanceof long).assertTrue()
      expect(Base_F818.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2500
     * @tc.name      testFieldInitEight0025
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F819.field instanceof int).assertTrue()
      expect(Base_F819.field).assertEqual(4)
          Base_F819.field = 5
      expect(Base_F819.field instanceof int).assertTrue()
      expect(Base_F819.field).assertEqual(5)
          Base_F819.field = 4
      expect(Base_F819.field instanceof int).assertTrue()
      expect(Base_F819.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2600
     * @tc.name      testFieldInitEight0026
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F820.field instanceof byte).assertTrue()
      expect(Base_F820.field).assertEqual(4)
          Base_F820.field = 5
      expect(Base_F820.field instanceof byte).assertTrue()
      expect(Base_F820.field).assertEqual(5)
          Base_F820.field = 4
      expect(Base_F820.field instanceof byte).assertTrue()
      expect(Base_F820.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2700
     * @tc.name      testFieldInitEight0027
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F821.field instanceof short).assertTrue()
      expect(Base_F821.field).assertEqual(4)
          Base_F821.field = 5
      expect(Base_F821.field instanceof short).assertTrue()
      expect(Base_F821.field).assertEqual(5)
          Base_F821.field = 4
      expect(Base_F821.field instanceof short).assertTrue()
      expect(Base_F821.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2800
     * @tc.name      testFieldInitEight0028
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F822.field instanceof double).assertTrue()
      expect(Base_F822.field).assertEqual(4)
          Base_F822.field = 7.3
      expect(Base_F822.field instanceof double).assertTrue()
      expect(Base_F822.field).assertEqual(7.3)
          Base_F822.field = 4
      expect(Base_F822.field instanceof double).assertTrue()
      expect(Base_F822.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_2900
     * @tc.name      testFieldInitEight0029
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F823.field instanceof number).assertTrue()
      expect(Base_F823.field).assertEqual(4)
          Base_F823.field = 5
      expect(Base_F823.field instanceof number).assertTrue()
      expect(Base_F823.field).assertEqual(5)
          Base_F823.field = 4
      expect(Base_F823.field instanceof number).assertTrue()
      expect(Base_F823.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3000
     * @tc.name      testFieldInitEight0030
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F824.field instanceof float).assertTrue()
      expect(Base_F824.field).assertEqual(4.5f)
          Base_F824.field = 7.3f
      expect(Base_F824.field instanceof float).assertTrue()
      expect(Base_F824.field).assertEqual(7.3f)
          Base_F824.field = 4.5f
      expect(Base_F824.field instanceof float).assertTrue()
      expect(Base_F824.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3100
     * @tc.name      testFieldInitEight0031
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F825.field instanceof bigint).assertTrue()
      expect(Base_F825.field).assertEqual(4n)
          Base_F825.field = 5n
      expect(Base_F825.field instanceof bigint).assertTrue()
      expect(Base_F825.field).assertEqual(5n)
          Base_F825.field = 4n
      expect(Base_F825.field instanceof bigint).assertTrue()
      expect(Base_F825.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3200
     * @tc.name      testFieldInitEight0032
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F826.field instanceof string).assertTrue()
      expect(Base_F826.field).assertEqual("abc")
          Base_F826.field = "efg"
      expect(Base_F826.field instanceof string).assertTrue()
      expect(Base_F826.field).assertEqual("efg")
          Base_F826.field = "abc"
      expect(Base_F826.field instanceof string).assertTrue()
      expect(Base_F826.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3300
     * @tc.name      testFieldInitEight0033
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F827.field instanceof char).assertTrue()
      expect(Base_F827.field).assertEqual(c'a')
          Base_F827.field = c'b'
      expect(Base_F827.field instanceof char).assertTrue()
      expect(Base_F827.field).assertEqual(c'b')
          Base_F827.field = c'a'
      expect(Base_F827.field instanceof char).assertTrue()
      expect(Base_F827.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3400
     * @tc.name      testFieldInitEight0034
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F828.field instanceof boolean).assertTrue()
      expect(Base_F828.field).assertEqual(false)
          Base_F828.field = true
      expect(Base_F828.field instanceof boolean).assertTrue()
      expect(Base_F828.field).assertEqual(true)
          Base_F828.field = false
      expect(Base_F828.field instanceof boolean).assertTrue()
      expect(Base_F828.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3500
     * @tc.name      testFieldInitEight0035
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F829.field instanceof Object).assertTrue()
      expect(Base_F829.field).assertEqual(4)
          Base_F829.field = 5
      expect(Base_F829.field instanceof Object).assertTrue()
      expect(Base_F829.field).assertEqual(5)
          Base_F829.field = 4
      expect(Base_F829.field instanceof Object).assertTrue()
      expect(Base_F829.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3600
     * @tc.name      testFieldInitEight0036
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F830.field instanceof Object).assertFalse()
      expect(Base_F830.field).assertEqual(undefined)
          Base_F830.field = 5
      expect(Base_F830.field instanceof Object).assertTrue()
      expect(Base_F830.field).assertEqual(5)
          Base_F830.field = undefined
      expect(Base_F830.field instanceof Object).assertFalse()
      expect(Base_F830.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3700
     * @tc.name      testFieldInitEight0037
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F831.field instanceof Object).assertTrue()
      expect(Base_F831.field).assertEqual(4)
          Base_F831.field = 5
      expect(Base_F831.field instanceof Object).assertTrue()
      expect(Base_F831.field).assertEqual(5)
          Base_F831.field = 4
      expect(Base_F831.field instanceof Object).assertTrue()
      expect(Base_F831.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3800
     * @tc.name      testFieldInitEight0038
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F833.field instanceof long).assertTrue()
      expect(Base_F833.field).assertEqual(4)
          Base_F833.field = 5
      expect(Base_F833.field instanceof long).assertTrue()
      expect(Base_F833.field).assertEqual(5)
          Base_F833.field = 4
      expect(Base_F833.field instanceof long).assertTrue()
      expect(Base_F833.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_3900
     * @tc.name      testFieldInitEight0039
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F834.field instanceof int).assertTrue()
      expect(Base_F834.field).assertEqual(4)
          Base_F834.field = 5
      expect(Base_F834.field instanceof int).assertTrue()
      expect(Base_F834.field).assertEqual(5)
          Base_F834.field = 4
      expect(Base_F834.field instanceof int).assertTrue()
      expect(Base_F834.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4000
     * @tc.name      testFieldInitEight0040
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F835.field instanceof byte).assertTrue()
      expect(Base_F835.field).assertEqual(4)
          Base_F835.field = 5
      expect(Base_F835.field instanceof byte).assertTrue()
      expect(Base_F835.field).assertEqual(5)
          Base_F835.field = 4
      expect(Base_F835.field instanceof byte).assertTrue()
      expect(Base_F835.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4100
     * @tc.name      testFieldInitEight0041
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F836.field instanceof short).assertTrue()
      expect(Base_F836.field).assertEqual(4)
          Base_F836.field = 5
      expect(Base_F836.field instanceof short).assertTrue()
      expect(Base_F836.field).assertEqual(5)
          Base_F836.field = 4
      expect(Base_F836.field instanceof short).assertTrue()
      expect(Base_F836.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4200
     * @tc.name      testFieldInitEight0042
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F837.field instanceof double).assertTrue()
      expect(Base_F837.field).assertEqual(4)
          Base_F837.field = 7.3
      expect(Base_F837.field instanceof double).assertTrue()
      expect(Base_F837.field).assertEqual(7.3)
          Base_F837.field = 4
      expect(Base_F837.field instanceof double).assertTrue()
      expect(Base_F837.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4300
     * @tc.name      testFieldInitEight0043
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F838.field instanceof number).assertTrue()
      expect(Base_F838.field).assertEqual(4)
          Base_F838.field = 5
      expect(Base_F838.field instanceof number).assertTrue()
      expect(Base_F838.field).assertEqual(5)
          Base_F838.field = 4
      expect(Base_F838.field instanceof number).assertTrue()
      expect(Base_F838.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4400
     * @tc.name      testFieldInitEight0044
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F839.field instanceof float).assertTrue()
      expect(Base_F839.field).assertEqual(4.5f)
          Base_F839.field = 7.3f
      expect(Base_F839.field instanceof float).assertTrue()
      expect(Base_F839.field).assertEqual(7.3f)
          Base_F839.field = 4.5f
      expect(Base_F839.field instanceof float).assertTrue()
      expect(Base_F839.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4500
     * @tc.name      testFieldInitEight0045
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F840.field instanceof bigint).assertTrue()
      expect(Base_F840.field).assertEqual(4n)
          Base_F840.field = 5n
      expect(Base_F840.field instanceof bigint).assertTrue()
      expect(Base_F840.field).assertEqual(5n)
          Base_F840.field = 4n
      expect(Base_F840.field instanceof bigint).assertTrue()
      expect(Base_F840.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4600
     * @tc.name      testFieldInitEight0046
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F841.field instanceof string).assertTrue()
      expect(Base_F841.field).assertEqual("abc")
          Base_F841.field = "efg"
      expect(Base_F841.field instanceof string).assertTrue()
      expect(Base_F841.field).assertEqual("efg")
          Base_F841.field = "abc"
      expect(Base_F841.field instanceof string).assertTrue()
      expect(Base_F841.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4700
     * @tc.name      testFieldInitEight0047
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F842.field instanceof char).assertTrue()
      expect(Base_F842.field).assertEqual(c'a')
          Base_F842.field = c'b'
      expect(Base_F842.field instanceof char).assertTrue()
      expect(Base_F842.field).assertEqual(c'b')
          Base_F842.field = c'a'
      expect(Base_F842.field instanceof char).assertTrue()
      expect(Base_F842.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4800
     * @tc.name      testFieldInitEight0048
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F843.field instanceof boolean).assertTrue()
      expect(Base_F843.field).assertEqual(false)
          Base_F843.field = true
      expect(Base_F843.field instanceof boolean).assertTrue()
      expect(Base_F843.field).assertEqual(true)
          Base_F843.field = false
      expect(Base_F843.field instanceof boolean).assertTrue()
      expect(Base_F843.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_4900
     * @tc.name      testFieldInitEight0049
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F844.field instanceof Object).assertTrue()
      expect(Base_F844.field).assertEqual(4)
          Base_F844.field = 5
      expect(Base_F844.field instanceof Object).assertTrue()
      expect(Base_F844.field).assertEqual(5)
          Base_F844.field = 4
      expect(Base_F844.field instanceof Object).assertTrue()
      expect(Base_F844.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5000
     * @tc.name      testFieldInitEight0050
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F845.field instanceof Object).assertFalse()
      expect(Base_F845.field).assertEqual(undefined)
          Base_F845.field = 5
      expect(Base_F845.field instanceof Object).assertTrue()
      expect(Base_F845.field).assertEqual(5)
          Base_F845.field = undefined
      expect(Base_F845.field instanceof Object).assertFalse()
      expect(Base_F845.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5100
     * @tc.name      testFieldInitEight0051
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F846.field instanceof Object).assertTrue()
      expect(Base_F846.field).assertEqual(4)
          Base_F846.field = 5
      expect(Base_F846.field instanceof Object).assertTrue()
      expect(Base_F846.field).assertEqual(5)
          Base_F846.field = 4
      expect(Base_F846.field instanceof Object).assertTrue()
      expect(Base_F846.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5200
     * @tc.name      testFieldInitEight0052
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F848.field instanceof long).assertTrue()
      expect(A_F848.field).assertEqual(0)
          let a: A_F848 = new A_F848()
      a.foo(5)
      expect(A_F848.field instanceof long).assertTrue()
      expect(A_F848.field).assertEqual(5)
      a.foo(0)
      expect(A_F848.field instanceof long).assertTrue()
      expect(A_F848.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5300
     * @tc.name      testFieldInitEight0053
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F849.field instanceof int).assertTrue()
      expect(A_F849.field).assertEqual(0)
          let a: A_F849 = new A_F849()
      a.foo(5)
      expect(A_F849.field instanceof int).assertTrue()
      expect(A_F849.field).assertEqual(5)
      a.foo(0)
      expect(A_F849.field instanceof int).assertTrue()
      expect(A_F849.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5400
     * @tc.name      testFieldInitEight0054
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F850.field instanceof byte).assertTrue()
      expect(A_F850.field).assertEqual(0)
          let a: A_F850 = new A_F850()
      a.foo(5)
      expect(A_F850.field instanceof byte).assertTrue()
      expect(A_F850.field).assertEqual(5)
      a.foo(0)
      expect(A_F850.field instanceof byte).assertTrue()
      expect(A_F850.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5500
     * @tc.name      testFieldInitEight0055
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F851.field instanceof short).assertTrue()
      expect(A_F851.field).assertEqual(0)
          let a: A_F851 = new A_F851()
      a.foo(5)
      expect(A_F851.field instanceof short).assertTrue()
      expect(A_F851.field).assertEqual(5)
      a.foo(0)
      expect(A_F851.field instanceof short).assertTrue()
      expect(A_F851.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5600
     * @tc.name      testFieldInitEight0056
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F852.field instanceof double).assertTrue()
      expect(A_F852.field).assertEqual(0)
          let a: A_F852 = new A_F852()
      a.foo(7.3)
      expect(A_F852.field instanceof double).assertTrue()
      expect(A_F852.field).assertEqual(7.3)
      a.foo(0)
      expect(A_F852.field instanceof double).assertTrue()
      expect(A_F852.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5700
     * @tc.name      testFieldInitEight0057
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F853.field instanceof number).assertTrue()
      expect(A_F853.field).assertEqual(0)
          let a: A_F853 = new A_F853()
      a.foo(5)
      expect(A_F853.field instanceof number).assertTrue()
      expect(A_F853.field).assertEqual(5)
      a.foo(0)
      expect(A_F853.field instanceof number).assertTrue()
      expect(A_F853.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5800
     * @tc.name      testFieldInitEight0058
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F854.field instanceof float).assertTrue()
      expect(A_F854.field).assertEqual(0.0f)
          let a: A_F854 = new A_F854()
      a.foo(7.3f)
      expect(A_F854.field instanceof float).assertTrue()
      expect(A_F854.field).assertEqual(7.3f)
      a.foo(0.0f)
      expect(A_F854.field instanceof float).assertTrue()
      expect(A_F854.field).assertEqual(0.0f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_5900
     * @tc.name      testFieldInitEight0059
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F855.field instanceof char).assertTrue()
      expect(A_F855.field).assertEqual(c'\u0000')
          let a: A_F855 = new A_F855()
      a.foo(c'a')
      expect(A_F855.field instanceof char).assertTrue()
      expect(A_F855.field).assertEqual(c'a')
      a.foo(c'\u0000')
      expect(A_F855.field instanceof char).assertTrue()
      expect(A_F855.field).assertEqual(c'\u0000')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6000
     * @tc.name      testFieldInitEight0060
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F856.field instanceof boolean).assertTrue()
      expect(A_F856.field).assertEqual(false)
          let a: A_F856 = new A_F856()
      a.foo(true)
      expect(A_F856.field instanceof boolean).assertTrue()
      expect(A_F856.field).assertEqual(true)
      a.foo(false)
      expect(A_F856.field instanceof boolean).assertTrue()
      expect(A_F856.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6100
     * @tc.name      testFieldInitEight0061
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F857.field instanceof Object).assertFalse()
      expect(A_F857.field).assertEqual(undefined)
          let a: A_F857 = new A_F857()
      a.foo(5)
      expect(A_F857.field instanceof Object).assertTrue()
      expect(A_F857.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F857.field instanceof Object).assertFalse()
      expect(A_F857.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6200
     * @tc.name      testFieldInitEight0062
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F858.field instanceof Object).assertFalse()
      expect(A_F858.field).assertEqual(undefined)
          let a: A_F858 = new A_F858()
      a.foo(5)
      expect(A_F858.field instanceof Object).assertTrue()
      expect(A_F858.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F858.field instanceof Object).assertFalse()
      expect(A_F858.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6300
     * @tc.name      testFieldInitEight0063
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F860.field instanceof long).assertTrue()
      expect(A_F860.field).assertEqual(0)
          let a: A_F860 = new A_F860()
      a.foo(5)
      expect(A_F860.field instanceof long).assertTrue()
      expect(A_F860.field).assertEqual(5)
      a.foo(0)
      expect(A_F860.field instanceof long).assertTrue()
      expect(A_F860.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6400
     * @tc.name      testFieldInitEight0064
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F861.field instanceof int).assertTrue()
      expect(A_F861.field).assertEqual(0)
          let a: A_F861 = new A_F861()
      a.foo(5)
      expect(A_F861.field instanceof int).assertTrue()
      expect(A_F861.field).assertEqual(5)
      a.foo(0)
      expect(A_F861.field instanceof int).assertTrue()
      expect(A_F861.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6500
     * @tc.name      testFieldInitEight0065
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F862.field instanceof byte).assertTrue()
      expect(A_F862.field).assertEqual(0)
          let a: A_F862 = new A_F862()
      a.foo(5)
      expect(A_F862.field instanceof byte).assertTrue()
      expect(A_F862.field).assertEqual(5)
      a.foo(0)
      expect(A_F862.field instanceof byte).assertTrue()
      expect(A_F862.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6600
     * @tc.name      testFieldInitEight0066
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F863.field instanceof short).assertTrue()
      expect(A_F863.field).assertEqual(0)
          let a: A_F863 = new A_F863()
      a.foo(5)
      expect(A_F863.field instanceof short).assertTrue()
      expect(A_F863.field).assertEqual(5)
      a.foo(0)
      expect(A_F863.field instanceof short).assertTrue()
      expect(A_F863.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6700
     * @tc.name      testFieldInitEight0067
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F864.field instanceof double).assertTrue()
      expect(A_F864.field).assertEqual(0)
          let a: A_F864 = new A_F864()
      a.foo(7.3)
      expect(A_F864.field instanceof double).assertTrue()
      expect(A_F864.field).assertEqual(7.3)
      a.foo(0)
      expect(A_F864.field instanceof double).assertTrue()
      expect(A_F864.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6800
     * @tc.name      testFieldInitEight0068
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F865.field instanceof number).assertTrue()
      expect(A_F865.field).assertEqual(0)
          let a: A_F865 = new A_F865()
      a.foo(5)
      expect(A_F865.field instanceof number).assertTrue()
      expect(A_F865.field).assertEqual(5)
      a.foo(0)
      expect(A_F865.field instanceof number).assertTrue()
      expect(A_F865.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_6900
     * @tc.name      testFieldInitEight0069
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F866.field instanceof float).assertTrue()
      expect(A_F866.field).assertEqual(0.0f)
          let a: A_F866 = new A_F866()
      a.foo(7.3f)
      expect(A_F866.field instanceof float).assertTrue()
      expect(A_F866.field).assertEqual(7.3f)
      a.foo(0.0f)
      expect(A_F866.field instanceof float).assertTrue()
      expect(A_F866.field).assertEqual(0.0f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7000
     * @tc.name      testFieldInitEight0070
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F867.field instanceof char).assertTrue()
      expect(A_F867.field).assertEqual(c'\u0000')
          let a: A_F867 = new A_F867()
      a.foo(c'a')
      expect(A_F867.field instanceof char).assertTrue()
      expect(A_F867.field).assertEqual(c'a')
      a.foo(c'\u0000')
      expect(A_F867.field instanceof char).assertTrue()
      expect(A_F867.field).assertEqual(c'\u0000')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7100
     * @tc.name      testFieldInitEight0071
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F868.field instanceof boolean).assertTrue()
      expect(A_F868.field).assertEqual(false)
          let a: A_F868 = new A_F868()
      a.foo(true)
      expect(A_F868.field instanceof boolean).assertTrue()
      expect(A_F868.field).assertEqual(true)
      a.foo(false)
      expect(A_F868.field instanceof boolean).assertTrue()
      expect(A_F868.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7200
     * @tc.name      testFieldInitEight0072
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F869.field instanceof Object).assertFalse()
      expect(A_F869.field).assertEqual(undefined)
          let a: A_F869 = new A_F869()
      a.foo(5)
      expect(A_F869.field instanceof Object).assertTrue()
      expect(A_F869.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F869.field instanceof Object).assertFalse()
      expect(A_F869.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7300
     * @tc.name      testFieldInitEight0073
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F870.field instanceof Object).assertFalse()
      expect(A_F870.field).assertEqual(undefined)
          let a: A_F870 = new A_F870()
      a.foo(5)
      expect(A_F870.field instanceof Object).assertTrue()
      expect(A_F870.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F870.field instanceof Object).assertFalse()
      expect(A_F870.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7400
     * @tc.name      testFieldInitEight0074
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F872.field instanceof long).assertTrue()
      expect(A_F872.field).assertEqual(4)
          let a: A_F872 = new A_F872()
      a.foo(5)
      expect(A_F872.field instanceof long).assertTrue()
      expect(A_F872.field).assertEqual(5)
      a.foo(4)
      expect(A_F872.field instanceof long).assertTrue()
      expect(A_F872.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7500
     * @tc.name      testFieldInitEight0075
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F873.field instanceof int).assertTrue()
      expect(A_F873.field).assertEqual(4)
          let a: A_F873 = new A_F873()
      a.foo(5)
      expect(A_F873.field instanceof int).assertTrue()
      expect(A_F873.field).assertEqual(5)
      a.foo(4)
      expect(A_F873.field instanceof int).assertTrue()
      expect(A_F873.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7600
     * @tc.name      testFieldInitEight0076
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F874.field instanceof byte).assertTrue()
      expect(A_F874.field).assertEqual(4)
          let a: A_F874 = new A_F874()
      a.foo(5)
      expect(A_F874.field instanceof byte).assertTrue()
      expect(A_F874.field).assertEqual(5)
      a.foo(4)
      expect(A_F874.field instanceof byte).assertTrue()
      expect(A_F874.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7700
     * @tc.name      testFieldInitEight0077
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F875.field instanceof short).assertTrue()
      expect(A_F875.field).assertEqual(4)
          let a: A_F875 = new A_F875()
      a.foo(5)
      expect(A_F875.field instanceof short).assertTrue()
      expect(A_F875.field).assertEqual(5)
      a.foo(4)
      expect(A_F875.field instanceof short).assertTrue()
      expect(A_F875.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7800
     * @tc.name      testFieldInitEight0078
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F876.field instanceof double).assertTrue()
      expect(A_F876.field).assertEqual(4)
          let a: A_F876 = new A_F876()
      a.foo(7.3)
      expect(A_F876.field instanceof double).assertTrue()
      expect(A_F876.field).assertEqual(7.3)
      a.foo(4)
      expect(A_F876.field instanceof double).assertTrue()
      expect(A_F876.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_7900
     * @tc.name      testFieldInitEight0079
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F877.field instanceof number).assertTrue()
      expect(A_F877.field).assertEqual(4)
          let a: A_F877 = new A_F877()
      a.foo(5)
      expect(A_F877.field instanceof number).assertTrue()
      expect(A_F877.field).assertEqual(5)
      a.foo(4)
      expect(A_F877.field instanceof number).assertTrue()
      expect(A_F877.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8000
     * @tc.name      testFieldInitEight0080
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F878.field instanceof float).assertTrue()
      expect(A_F878.field).assertEqual(4.5f)
          let a: A_F878 = new A_F878()
      a.foo(7.3f)
      expect(A_F878.field instanceof float).assertTrue()
      expect(A_F878.field).assertEqual(7.3f)
      a.foo(4.5f)
      expect(A_F878.field instanceof float).assertTrue()
      expect(A_F878.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8100
     * @tc.name      testFieldInitEight0081
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F879.field instanceof bigint).assertTrue()
      expect(A_F879.field).assertEqual(4n)
          let a: A_F879 = new A_F879()
      a.foo(5n)
      expect(A_F879.field instanceof bigint).assertTrue()
      expect(A_F879.field).assertEqual(5n)
      a.foo(4n)
      expect(A_F879.field instanceof bigint).assertTrue()
      expect(A_F879.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8200
     * @tc.name      testFieldInitEight0082
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F880.field instanceof string).assertTrue()
      expect(A_F880.field).assertEqual("abc")
          let a: A_F880 = new A_F880()
      a.foo("efg")
      expect(A_F880.field instanceof string).assertTrue()
      expect(A_F880.field).assertEqual("efg")
      a.foo("abc")
      expect(A_F880.field instanceof string).assertTrue()
      expect(A_F880.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8300
     * @tc.name      testFieldInitEight0083
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F881.field instanceof char).assertTrue()
      expect(A_F881.field).assertEqual(c'a')
          let a: A_F881 = new A_F881()
      a.foo(c'b')
      expect(A_F881.field instanceof char).assertTrue()
      expect(A_F881.field).assertEqual(c'b')
      a.foo(c'a')
      expect(A_F881.field instanceof char).assertTrue()
      expect(A_F881.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8400
     * @tc.name      testFieldInitEight0084
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F882.field instanceof boolean).assertTrue()
      expect(A_F882.field).assertEqual(false)
          let a: A_F882 = new A_F882()
      a.foo(true)
      expect(A_F882.field instanceof boolean).assertTrue()
      expect(A_F882.field).assertEqual(true)
      a.foo(false)
      expect(A_F882.field instanceof boolean).assertTrue()
      expect(A_F882.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8500
     * @tc.name      testFieldInitEight0085
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F883.field instanceof Object).assertTrue()
      expect(A_F883.field).assertEqual(4)
          let a: A_F883 = new A_F883()
      a.foo(5)
      expect(A_F883.field instanceof Object).assertTrue()
      expect(A_F883.field).assertEqual(5)
      a.foo(4)
      expect(A_F883.field instanceof Object).assertTrue()
      expect(A_F883.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8600
     * @tc.name      testFieldInitEight0086
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F884.field instanceof Object).assertFalse()
      expect(A_F884.field).assertEqual(undefined)
          let a: A_F884 = new A_F884()
      a.foo(5)
      expect(A_F884.field instanceof Object).assertTrue()
      expect(A_F884.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F884.field instanceof Object).assertFalse()
      expect(A_F884.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8700
     * @tc.name      testFieldInitEight0087
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F885.field instanceof Object).assertTrue()
      expect(A_F885.field).assertEqual(4)
          let a: A_F885 = new A_F885()
      a.foo(5)
      expect(A_F885.field instanceof Object).assertTrue()
      expect(A_F885.field).assertEqual(5)
      a.foo(4)
      expect(A_F885.field instanceof Object).assertTrue()
      expect(A_F885.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8800
     * @tc.name      testFieldInitEight0088
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F887.field instanceof long).assertTrue()
      expect(A_F887.field).assertEqual(4)
          let a: A_F887 = new A_F887()
      a.foo(5)
      expect(A_F887.field instanceof long).assertTrue()
      expect(A_F887.field).assertEqual(5)
      a.foo(4)
      expect(A_F887.field instanceof long).assertTrue()
      expect(A_F887.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_8900
     * @tc.name      testFieldInitEight0089
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F888.field instanceof int).assertTrue()
      expect(A_F888.field).assertEqual(4)
          let a: A_F888 = new A_F888()
      a.foo(5)
      expect(A_F888.field instanceof int).assertTrue()
      expect(A_F888.field).assertEqual(5)
      a.foo(4)
      expect(A_F888.field instanceof int).assertTrue()
      expect(A_F888.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_9000
     * @tc.name      testFieldInitEight0090
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F889.field instanceof byte).assertTrue()
      expect(A_F889.field).assertEqual(4)
          let a: A_F889 = new A_F889()
      a.foo(5)
      expect(A_F889.field instanceof byte).assertTrue()
      expect(A_F889.field).assertEqual(5)
      a.foo(4)
      expect(A_F889.field instanceof byte).assertTrue()
      expect(A_F889.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_9100
     * @tc.name      testFieldInitEight0091
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F890.field instanceof short).assertTrue()
      expect(A_F890.field).assertEqual(4)
          let a: A_F890 = new A_F890()
      a.foo(5)
      expect(A_F890.field instanceof short).assertTrue()
      expect(A_F890.field).assertEqual(5)
      a.foo(4)
      expect(A_F890.field instanceof short).assertTrue()
      expect(A_F890.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_EIGHT_9200
     * @tc.name      testFieldInitEight0092
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEight0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F891.field instanceof double).assertTrue()
      expect(A_F891.field).assertEqual(4)
          let a: A_F891 = new A_F891()
      a.foo(7.3)
      expect(A_F891.field instanceof double).assertTrue()
      expect(A_F891.field).assertEqual(7.3)
      a.foo(4)
      expect(A_F891.field instanceof double).assertTrue()
      expect(A_F891.field).assertEqual(4)
    })
  })
}
