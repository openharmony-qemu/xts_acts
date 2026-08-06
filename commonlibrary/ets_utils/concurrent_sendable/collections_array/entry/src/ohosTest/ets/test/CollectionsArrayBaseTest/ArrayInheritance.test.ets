/*
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';

@Sendable
class MyArray<T extends lang.ISendable | null> extends collections.Array<T> {
  constructor() {
    super();
  }

  forEach(callbackFn: (value: T, index: number, array: collections.Array<T>) => void): void {
    super.forEach(callbackFn);
  }

  customMethod(): string {
    return 'custom';
  }

  getDoubleLength(): number {
    return this.length * 2;
  }
}

export default function suite() {
  describe('ArrayInheritanceTests', () => {
    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0100
     * @tc.name testArrayInheritance0001
     * @tc.desc Verify that subclass inherits Array correctly with instanceof check.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0001';
      console.info(`${caseName}, test start`);

      let myArr: MyArray<number> = new MyArray<number>();
      expect(myArr instanceof collections.Array).assertTrue();
      expect(myArr instanceof MyArray).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0200
     * @tc.name testArrayInheritance0002
     * @tc.desc Verify that subclass overrides forEach correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0002';
      console.info(`${caseName}, test start`);

      let myArr: MyArray<number> = new MyArray<number>();
      myArr.push(1);
      myArr.push(2);
      myArr.push(3);

      let c: number = 0;
      myArr.forEach((): void => {
        c = c + 1;
      });
      expect(c).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0300
     * @tc.name testArrayInheritance0003
     * @tc.desc Verify that subclass can add custom methods.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0003';
      console.info(`${caseName}, test start`);

      let myArr: MyArray<number> = new MyArray<number>();
      expect(myArr.customMethod()).assertEqual('custom');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0400
     * @tc.name testArrayInheritance0004
     * @tc.desc Verify that subclass instance is instanceof collections.Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0004';
      console.info(`${caseName}, test start`);

      let myArr: MyArray<string> = new MyArray<string>();
      expect(myArr instanceof collections.Array).assertTrue();
      expect(myArr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0500
     * @tc.name testArrayInheritance0005
     * @tc.desc Verify polymorphism: parent reference to subclass instance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0005';
      console.info(`${caseName}, test start`);

      let myArr: MyArray<number> = new MyArray<number>();
      myArr.push(1);
      myArr.push(2);
      myArr.push(3);

      // 多态：父类引用指向子类实例
      let polyArr: collections.Array<number> = myArr;
      polyArr.push(4);
      expect(polyArr.length).assertEqual(4);
      expect(polyArr[3]).assertEqual(4);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0600
     * @tc.name testArrayInheritance0006
     * @tc.desc Verify that subclass constructor calls super() correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0006';
      console.info(`${caseName}, test start`);

      let myArr: MyArray<number> = new MyArray<number>();
      expect(myArr.length).assertEqual(0);

      myArr.push(10);
      myArr.push(20);
      expect(myArr.length).assertEqual(2);
      expect(myArr[0]).assertEqual(10);
      expect(myArr[1]).assertEqual(20);
      expect(myArr.getDoubleLength()).assertEqual(4);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0700
     * @tc.name testArrayInheritance0007
     * @tc.desc Verify generic inheritance with string type.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0007';
      console.info(`${caseName}, test start`);

      let strArr: MyArray<string> = new MyArray<string>();
      expect(strArr.length).assertEqual(0);

      strArr.push('hello');
      strArr.push('world');
      expect(strArr.length).assertEqual(2);
      expect(strArr[0]).assertEqual('hello');
      expect(strArr[1]).assertEqual('world');
      expect(strArr.includes('hello')).assertTrue();
      expect(strArr.at(0)).assertEqual('hello');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INHERITANCE_0800
     * @tc.name testArrayInheritance0008
     * @tc.desc Verify generic inheritance with boolean type.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayInheritance0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayInheritance0008';
      console.info(`${caseName}, test start`);

      let boolArr: MyArray<boolean> = new MyArray<boolean>();
      expect(boolArr.length).assertEqual(0);

      boolArr.push(true);
      boolArr.push(false);
      expect(boolArr.length).assertEqual(2);
      expect(boolArr[0]).assertEqual(true);
      expect(boolArr[1]).assertEqual(false);
      expect(boolArr.includes(false)).assertTrue();
      expect(boolArr.at(1)).assertEqual(false);

      console.info(`${caseName}, test end`);
    });
  });
}