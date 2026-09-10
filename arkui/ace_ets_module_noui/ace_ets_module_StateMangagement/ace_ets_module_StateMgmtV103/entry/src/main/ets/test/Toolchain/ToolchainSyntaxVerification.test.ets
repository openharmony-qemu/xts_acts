/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe,  beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';

//   1. 属性简写 (Property Shorthand)
interface Person {
  name: string
  age: number
}

//   3. 方法简写 (Method Shorthand)
class MathUtils {
  a:number;
  b:number;

  constructor(a: number, b: number) {
    this.a = a;
    this.b = b;
  }

  multiply(): number {
    const c = this.a * this.b;
    console.log(`c:${c}=a:${this.a}*b:${this.b} `)
    return c;
  }
}

//  4. 箭头函数 (Arrow Functions)
class Params {
  public double: number = 0;
  public add: number = 0;
  public getTimestamp: string = '';
}
function arrowFunction(){
  const double = (n: number): number => n * 2
  const add = (a: number, b: number): number => a + b
  const getTimestamp = (): string => '2026-08-20'

  const result: Params = {'double':double(5),'add':add(3, 4),'getTimestamp':getTimestamp()}
  return result
}

// 6. 展开运算符 (Spread)
class Params1 {
  public firstArr: number[] = [0,0];
  public secondArr: number[] = [0,0];
  public merged1: number[] = [0,0];
  public merged2: number[] = [0,0];

}
function arrayMerge() {
  const firstArr: number[] = [1, 2];
  console.log(`origin a: ${firstArr}`);
  const secondArr: number[] = [3, 4];
  console.log(`origin b: ${secondArr}`);
  const merged1: number[] = [...firstArr, ...secondArr];
  console.log(`merged1: ${merged1}`);
  const merged2: number[] = [...firstArr, 3];
  console.log(`merged2: ${merged2}`);

  const result: Params1 = {'firstArr':firstArr,'secondArr':secondArr,'merged1':merged1,'merged2':merged2}
  return result;
}

//   7. 可选链 (Optional Chaining)
class MyClass {
  name: string = "test";
  greet() {
    console.log(this.name);
  }
}

//   9. 默认参数
function fn(a = 10, b = 20) {
  console.log(`a:${a}`)
  return a+b
}

export default function ToolchainSyntaxVerification() {
  describe('ToolchainSyntaxVerification', () => {
    beforeEach(async (done: Function) => {
      console.info("ToolchainSyntaxVerification beforeEach start");
      done();
    });
    afterEach(async () => {
      console.info("ToolchainSyntaxVerification after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0100
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0100
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0100
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0100] START');
      try {
        const name: string = 'test'
        const age: number = 20

        const obj: Person = { name: name, age: age }
        const obj1: Person = { name, age}
        expect(obj.name).assertEqual('test');
        expect(obj.age).assertEqual(20);
        expect(obj1.name).assertEqual('test');
        expect(obj1.age).assertEqual(20);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0100 error:" + err);
      }

      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0100] END');
      done()
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0200
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0200
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0200
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0200] START');
      try {
        const multiplyAB = new MathUtils(2,3)
        expect(multiplyAB.multiply()).assertEqual(6);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0200 error:" + err);
      }
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0200] END');
      done()
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0300
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0300
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0300
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0300] START');
      try {
        expect(arrowFunction().double).assertEqual(10);
        expect(arrowFunction().add).assertEqual(7);
        expect(arrowFunction().getTimestamp).assertEqual('2026-08-20');
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0300 error:" + err);
      }
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0300] END');
      done()
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0400
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0400
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0400
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0400] START');
      try {
        const obj: MyClass | null = new MyClass();
        expect(obj?.name).assertEqual('test');
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0400 error:" + err);
      }
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0400] END');
      done()
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0500
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0500
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0500
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0500] START');
      try {
        const foo: string | null | undefined = 'Hello';
        const val = foo ?? 'default';
        expect(val).assertEqual('Hello');
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0500 error:" + err);
      }
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0500] END');
      done()
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0600
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0600
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0600
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0600] START');
      try {
        expect(fn(1)).assertEqual(21);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0600 error:" + err);
      }
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0600] END');
      done()
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0700
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0700
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0700
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0700] START');
      try {
        let message: string = 'Hello World';
        expect(message).assertEqual('Hello World');
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0700 error:" + err);
      }
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0700] END');
      done()
    });

    /**
     * @tc.name   SUB_ARKUI_TOOLCHAIN_WRITING_0800
     * @tc.number SUB_ARKUI_TOOLCHAIN_WRITING_0800
     * @tc.desc   SUB_ARKUI_TOOLCHAIN_WRITING_0800
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TOOLCHAIN_WRITING_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0800] START');
      try {
        expect(arrayMerge().firstArr.toString()).assertEqual('1,2');
        expect(arrayMerge().secondArr.toString()).assertEqual('3,4');
        expect(arrayMerge().merged1.toString()).assertEqual('1,2,3,4');
        expect(arrayMerge().merged2.toString()).assertEqual('1,2,3');
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("SUB_ARKUI_TOOLCHAIN_WRITING_0800 error:" + err);
      }
      console.info('[SUB_ARKUI_TOOLCHAIN_WRITING_0800] END');
      done()
    });
  })
}
