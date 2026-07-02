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
} from '../../../../../hypium/index';


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  public run(): int {
    return 5;
  }

  public stop(): int {
    return 0;
  }
}

class Rectangle {
  protected height: int = 0;
  protected width: int = 0;

  public constructor (h: int, w: int) {
    this.height = h;
    this.width = w;
  }

  public draw(): boolean {
    return true;
  }
}

class FilledRectangle extends Rectangle {
  color: String = "";

  constructor (h: int, w: int, c: String) {
    super(h, w);
    this.color = c;
  }

  override draw(): boolean {
    return super.draw();
  }
}

class Shape {
  public constructor () {}

  public draw(): boolean {
    return true;
  }
}

class Rectangle1 extends Shape {
  protected height: int = 0;
  protected width: int = 0;

  public constructor (h: int, w: int) {
    this.height = h;
    this.width = w;
  }
}

final class FilledRectangle1 extends Rectangle1 {
  color: String = "";

  constructor (h: int, w: int, c: String) {
    super(h, w);
    this.color = c;
  }

  override draw(): boolean {
    return super.draw();
  }
}

class A1 {
  meth(a: string[] = ['a'], b: double[] = [1.0]): string {
    return '' + a[0] + b[0]
  }
}

class A2 {
  meth(a: string[], b: double[]): string {
    return '' + a[0] + b[0]
  }
}

class B extends A2 {
  meth(a: string[] = ['a'], b: double[] = [1.0]): string {
    return super.meth(a, b)
  }
}

type TL = (() => void) | undefined

class RestOptionalLambdasInMethod {

  static foo(k1: string, k2: string, k3: string, ...lambdas: TL[]): boolean {
    return lambdas[1] == undefined
  }
  foo(k1: string, k2: string, k3: string, ...lambdas: TL[]): boolean {
    return lambdas[1] == undefined
  }
}

type TA = RestOptionalLambdasInMethod

type TL1 = () => void

class TwoOptionalLambdasInMethod {

  foo(k1: string, k2: string, k3: string, lambdaOne?: TL1, lambdaTwo?: TL1): boolean {
    return lambdaTwo == undefined
  }
}

class TwoOptionalLambdasInMethod1 {

  static foo(k1: string, k2: string, k3: string, lambdaOne?: TL1, lambdaTwo?: TL1): boolean {
    return lambdaTwo == undefined
  }
}

type TA1 = TwoOptionalLambdasInMethod1

export default function MethodsDeclarationsTest():void {
  describe('MethodsDeclarationsTest', () => {
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
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0100
     * @tc.name      testMethodsDeclarations0001
     * @tc.desc      Method call by his name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A = new A();
      expect(instance.run()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0200
     * @tc.name      testMethodsDeclarations0002
     * @tc.desc      Super method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: FilledRectangle = new FilledRectangle(5, 5, "color");
      expect( instance.draw()).assertEqual(true );
    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0300
     * @tc.name      testMethodsDeclarations0003
     * @tc.desc      Super method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: FilledRectangle1 = new FilledRectangle1(5, 5, "color");
      expect( instance.draw()).assertEqual(true );
    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0400
     * @tc.name      testMethodsDeclarations0004
     * @tc.desc      The first form contains an expression that specifies a default value. It is called a parameter
     * with default value. The value of the parameter is set to the default value if the argument corresponding to that
     * parameter is omitted in a function or method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1
      expect(a.meth(['x'], [42.0])).assertEqual('x42')
      expect(a.meth(['x'])).assertEqual('x1')
      expect(a.meth()).assertEqual('a1')
      expect(a.meth(['x'], undefined)).assertEqual('x1')
      expect(a.meth(undefined, [42.0])).assertEqual('a42')
      expect(a.meth(undefined, undefined)).assertEqual('a1')
    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0500
     * @tc.name      testMethodsDeclarations0005
     * @tc.desc      The first form contains an expression that specifies a default value. It is called a parameter
     * with default value. The value of the parameter is set to the default value if the argument corresponding to that
     * parameter is omitted in a function or method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B
      expect(b.meth(['x'], [42.0])).assertEqual('x42')
      expect(b.meth(['x'])).assertEqual('x1')
      expect(b.meth()).assertEqual('a1')
      expect(b.meth(['x'], undefined)).assertEqual('x1')
      expect(b.meth(undefined, [42.0])).assertEqual('a42')
      expect(b.meth(undefined, undefined)).assertEqual('a1')


    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0600
     * @tc.name      testMethodsDeclarations0006
     * @tc.desc      Super method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean | undefined
      let test: TA = new TA
      expect(test.foo('', '', '', ((): boolean | undefined => flag)() ? undefined : () => {}, undefined, undefined,
        () => {})).assertTrue();
      expect(TA.foo('', '', '', ((): boolean | undefined => flag)() ? undefined : () => {}, undefined, undefined,
        () => {})).assertTrue();
    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0700
     * @tc.name      testMethodsDeclarations0007
     * @tc.desc      Super method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean | undefined
      const test: TwoOptionalLambdasInMethod = new TwoOptionalLambdasInMethod();
      expect(test.foo('', '', '', flag ? undefined : () => {}, undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0800
     * @tc.name      testMethodsDeclarations0008
     * @tc.desc      Conditional expression compile bug
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean | undefined
      expect(TA1.foo('', '', '', flag ? undefined : () => {}, undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_METHODS_DECLARATIONS_TEST_0900
     * @tc.name      testMethodsDeclarations0009
     * @tc.desc      Conditional expression compile bug
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodsDeclarations0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean | undefined
      expect(TA1.foo('', '', '',  ((): boolean | undefined => flag)() ? undefined : () => {}, undefined)).assertTrue();
    });
  })
}
