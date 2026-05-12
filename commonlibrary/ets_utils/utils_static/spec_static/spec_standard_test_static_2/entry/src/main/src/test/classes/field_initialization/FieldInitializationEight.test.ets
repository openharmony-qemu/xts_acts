/*
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
} from "../../../../../hypium";


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

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

class A_F802 {
    static field: Any
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

class A_F817 {
    static field: Any = 4
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

class Base_F832 {
    static field: Any = 4
  }
  class A_F832 extends Base_F832 {
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

class Base_F847 {
    static field: Any = 4
  }
  class B_F847 extends Base_F847 {
  }
  class A_F847 extends B_F847 {
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

class A_F859 {
    static field: Any
    foo(a: Any): void {
      A_F859.field = a
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

class A_F871 {
    static field: Any
    foo: (a: Any) => void = (a: Any): void => {
      A_F871.field = a
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

class A_F886 {
    static field: Any = 4
    foo(a: Any): void {
      A_F886.field = a
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

export default function FieldInitializationTestEight(): void {
  describe("FieldInitializationTestEight", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0793
     * @tc.name      testFieldInit0793
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0793", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0794
     * @tc.name      testFieldInit0794
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0794", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0795
     * @tc.name      testFieldInit0795
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0795", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0796
     * @tc.name      testFieldInit0796
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0796", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0797
     * @tc.name      testFieldInit0797
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0797", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0798
     * @tc.name      testFieldInit0798
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0798", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0799
     * @tc.name      testFieldInit0799
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0799", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0800
     * @tc.name      testFieldInit0800
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F800.field instanceof Object | undefined).assertTrue()
      expect(A_F800.field).assertEqual(undefined)
          A_F800.field = 5
      expect(A_F800.field instanceof Object | undefined).assertTrue()
      expect(A_F800.field).assertEqual(5)
          A_F800.field = undefined
      expect(A_F800.field instanceof Object | undefined).assertTrue()
      expect(A_F800.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0801
     * @tc.name      testFieldInit0801
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0801", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F801.field instanceof Object | undefined | null).assertTrue()
      expect(A_F801.field).assertEqual(undefined)
          A_F801.field = 5
      expect(A_F801.field instanceof Object | undefined | null).assertTrue()
      expect(A_F801.field).assertEqual(5)
          A_F801.field = undefined
      expect(A_F801.field instanceof Object | undefined | null).assertTrue()
      expect(A_F801.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0802
     * @tc.name      testFieldInit0802
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0802", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F802.field instanceof Any).assertTrue()
      expect(A_F802.field).assertEqual(undefined)
          A_F802.field = 5
      expect(A_F802.field instanceof Any).assertTrue()
      expect(A_F802.field).assertEqual(5)
          A_F802.field = undefined
      expect(A_F802.field instanceof Any).assertTrue()
      expect(A_F802.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0803
     * @tc.name      testFieldInit0803
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0803", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0804
     * @tc.name      testFieldInit0804
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0804", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0805
     * @tc.name      testFieldInit0805
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0805", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0806
     * @tc.name      testFieldInit0806
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0806", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0807
     * @tc.name      testFieldInit0807
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0807", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0808
     * @tc.name      testFieldInit0808
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0808", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0809
     * @tc.name      testFieldInit0809
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0809", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0810
     * @tc.name      testFieldInit0810
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0810", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0811
     * @tc.name      testFieldInit0811
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0811", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0812
     * @tc.name      testFieldInit0812
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0812", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0813
     * @tc.name      testFieldInit0813
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0813", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0814
     * @tc.name      testFieldInit0814
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0814", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0815
     * @tc.name      testFieldInit0815
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0815", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F815.field instanceof Object | undefined).assertTrue()
      expect(A_F815.field).assertEqual(undefined)
          A_F815.field = 5
      expect(A_F815.field instanceof Object | undefined).assertTrue()
      expect(A_F815.field).assertEqual(5)
          A_F815.field = undefined
      expect(A_F815.field instanceof Object | undefined).assertTrue()
      expect(A_F815.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0816
     * @tc.name      testFieldInit0816
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0816", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F816.field instanceof Object | undefined | null).assertTrue()
      expect(A_F816.field).assertEqual(4)
          A_F816.field = 5
      expect(A_F816.field instanceof Object | undefined | null).assertTrue()
      expect(A_F816.field).assertEqual(5)
          A_F816.field = 4
      expect(A_F816.field instanceof Object | undefined | null).assertTrue()
      expect(A_F816.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0817
     * @tc.name      testFieldInit0817
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0817", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F817.field instanceof Any).assertTrue()
      expect(A_F817.field).assertEqual(4)
          A_F817.field = 5
      expect(A_F817.field instanceof Any).assertTrue()
      expect(A_F817.field).assertEqual(5)
          A_F817.field = 4
      expect(A_F817.field instanceof Any).assertTrue()
      expect(A_F817.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0818
     * @tc.name      testFieldInit0818
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0818", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0819
     * @tc.name      testFieldInit0819
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0819", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0820
     * @tc.name      testFieldInit0820
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0820", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0821
     * @tc.name      testFieldInit0821
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0821", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0822
     * @tc.name      testFieldInit0822
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0822", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0823
     * @tc.name      testFieldInit0823
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0823", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0824
     * @tc.name      testFieldInit0824
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0824", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0825
     * @tc.name      testFieldInit0825
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0825", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0826
     * @tc.name      testFieldInit0826
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0826", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0827
     * @tc.name      testFieldInit0827
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0827", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0828
     * @tc.name      testFieldInit0828
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0828", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0829
     * @tc.name      testFieldInit0829
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0829", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0830
     * @tc.name      testFieldInit0830
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0830", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F830.field instanceof Object | undefined).assertTrue()
      expect(Base_F830.field).assertEqual(undefined)
          Base_F830.field = 5
      expect(Base_F830.field instanceof Object | undefined).assertTrue()
      expect(Base_F830.field).assertEqual(5)
          Base_F830.field = undefined
      expect(Base_F830.field instanceof Object | undefined).assertTrue()
      expect(Base_F830.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0831
     * @tc.name      testFieldInit0831
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0831", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F831.field instanceof Object | undefined | null).assertTrue()
      expect(Base_F831.field).assertEqual(4)
          Base_F831.field = 5
      expect(Base_F831.field instanceof Object | undefined | null).assertTrue()
      expect(Base_F831.field).assertEqual(5)
          Base_F831.field = 4
      expect(Base_F831.field instanceof Object | undefined | null).assertTrue()
      expect(Base_F831.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0832
     * @tc.name      testFieldInit0832
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0832", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F832.field instanceof Any).assertTrue()
      expect(Base_F832.field).assertEqual(4)
          Base_F832.field = 5
      expect(Base_F832.field instanceof Any).assertTrue()
      expect(Base_F832.field).assertEqual(5)
          Base_F832.field = 4
      expect(Base_F832.field instanceof Any).assertTrue()
      expect(Base_F832.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0833
     * @tc.name      testFieldInit0833
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0833", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0834
     * @tc.name      testFieldInit0834
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0834", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0835
     * @tc.name      testFieldInit0835
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0835", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0836
     * @tc.name      testFieldInit0836
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0836", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0837
     * @tc.name      testFieldInit0837
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0837", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0838
     * @tc.name      testFieldInit0838
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0838", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0839
     * @tc.name      testFieldInit0839
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0839", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0840
     * @tc.name      testFieldInit0840
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0840", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0841
     * @tc.name      testFieldInit0841
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0841", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0842
     * @tc.name      testFieldInit0842
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0842", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0843
     * @tc.name      testFieldInit0843
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0843", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0844
     * @tc.name      testFieldInit0844
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0844", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0845
     * @tc.name      testFieldInit0845
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0845", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F845.field instanceof Object | undefined).assertTrue()
      expect(Base_F845.field).assertEqual(undefined)
          Base_F845.field = 5
      expect(Base_F845.field instanceof Object | undefined).assertTrue()
      expect(Base_F845.field).assertEqual(5)
          Base_F845.field = undefined
      expect(Base_F845.field instanceof Object | undefined).assertTrue()
      expect(Base_F845.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0846
     * @tc.name      testFieldInit0846
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0846", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F846.field instanceof Object | undefined | null).assertTrue()
      expect(Base_F846.field).assertEqual(4)
          Base_F846.field = 5
      expect(Base_F846.field instanceof Object | undefined | null).assertTrue()
      expect(Base_F846.field).assertEqual(5)
          Base_F846.field = 4
      expect(Base_F846.field instanceof Object | undefined | null).assertTrue()
      expect(Base_F846.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0847
     * @tc.name      testFieldInit0847
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0847", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Base_F847.field instanceof Any).assertTrue()
      expect(Base_F847.field).assertEqual(4)
          Base_F847.field = 5
      expect(Base_F847.field instanceof Any).assertTrue()
      expect(Base_F847.field).assertEqual(5)
          Base_F847.field = 4
      expect(Base_F847.field instanceof Any).assertTrue()
      expect(Base_F847.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0848
     * @tc.name      testFieldInit0848
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0848", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0849
     * @tc.name      testFieldInit0849
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0849", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0850
     * @tc.name      testFieldInit0850
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0850", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0851
     * @tc.name      testFieldInit0851
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0851", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0852
     * @tc.name      testFieldInit0852
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0852", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0853
     * @tc.name      testFieldInit0853
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0853", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0854
     * @tc.name      testFieldInit0854
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0854", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0855
     * @tc.name      testFieldInit0855
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0855", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0856
     * @tc.name      testFieldInit0856
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0856", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0857
     * @tc.name      testFieldInit0857
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0857", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F857.field instanceof Object | undefined).assertTrue()
      expect(A_F857.field).assertEqual(undefined)
          let a: A_F857 = new A_F857()
      a.foo(5)
      expect(A_F857.field instanceof Object | undefined).assertTrue()
      expect(A_F857.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F857.field instanceof Object | undefined).assertTrue()
      expect(A_F857.field).assertEqual(undefined)
    })
