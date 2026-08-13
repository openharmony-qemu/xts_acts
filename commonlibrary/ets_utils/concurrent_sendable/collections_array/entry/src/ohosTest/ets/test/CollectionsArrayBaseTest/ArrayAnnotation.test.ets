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

// ArrayAnnotation.test.ets object、Function 纯非 Sendable，编译器直接拦截注释1个用例

import { describe, it, beforeEach, TestType, Size, Level, expect } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';
import { ArkTSUtils } from '@kit.ArkTS';
import {
  getAllTestValues,
  TestValueItem,
  SendableClassBasic,
  ObjectWrapper,
  ArrayWrapper
} from './test_data/TestDataFactory';
import { TestHelper } from './test_utils/TestHelper';

export default function suite() {
  describe('ArrayAnnotationTests', () => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0100
     * @tc.name testArrayAnnotation0001
     * @tc.desc Verify that collections.Array is decorated with Sendable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let isSendable: boolean = ArkTSUtils.isSendable(arr);
      expect(isSendable).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0200
     * @tc.name testArrayAnnotation0002
     * @tc.desc Verify that collections.Array can be used after import.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr !== undefined).assertTrue();
      expect(arr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0300
     * @tc.name testArrayAnnotation0003
     * @tc.desc Verify that generic type parameter must be Sendable compatible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(ArkTSUtils.isSendable(arr)).assertTrue();

      let strArr: collections.Array<string> = new collections.Array<string>('test');
      expect(ArkTSUtils.isSendable(strArr)).assertTrue();

      let boolArr: collections.Array<boolean> = new collections.Array<boolean>(true);
      expect(ArkTSUtils.isSendable(boolArr)).assertTrue();

      let sendableObjArr: collections.Array<SendableClassBasic> = new collections.Array<SendableClassBasic>();
      expect(sendableObjArr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0400
     * @tc.name testArrayAnnotation0004
     * @tc.desc Verify that collections.Array reference can be assigned to another
     *               variable and access the same underlying data.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0004';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr2: collections.Array<number> = arr;
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(2);
      expect(arr2[2]).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0500
     * @tc.name testArrayAnnotation0005
     * @tc.desc Verify that isSendable returns true for collections.Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0005';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      expect(ArkTSUtils.isSendable(arr)).assertTrue();
      let emptyArr: collections.Array<number> = new collections.Array<number>();
      expect(ArkTSUtils.isSendable(emptyArr)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0600
     * @tc.name testArrayAnnotation0006
     * @tc.desc Verify that Array can store Sendable type instances.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0006';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<SendableClassBasic> = new collections.Array<SendableClassBasic>();
      expect(arr.length).assertEqual(0);
      expect(new collections.Array<ObjectWrapper>().length).assertEqual(0);
      expect(new collections.Array<ArrayWrapper>().length).assertEqual(0);
      TestHelper.assertNotNull(new collections.Array<SendableClassBasic>(new SendableClassBasic())[0],
        'sendable_class_basic');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0700
     * @tc.name testArrayAnnotation0007
     * @tc.desc Verify that Array can store all test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0007';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
      let pushedCount: number = 0;
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null) {
          arr.push(item.value);
          pushedCount++;
        }
      }
      expect(arr.length > 0).assertTrue();
      expect(arr.length).assertEqual(pushedCount);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0800
     * @tc.name testArrayAnnotation0008
     * @tc.desc Verify that Array containing all test values is Sendable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0008';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null) {
          arr.push(item.value);
        }
      }
      expect(ArkTSUtils.isSendable(arr)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_ANNO_0900
     * @tc.name testArrayAnnotation0009
     * @tc.desc Verify that null and undefined values in Array are handled correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayAnnotation0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayAnnotation0009';
      console.info(`${caseName}, test start`);

      // 使用联合类型 ISendable | null | undefined

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>();


      arr.push(null);

      arr.push(undefined);

      arr.push(new SendableClassBasic());

      expect(arr.length).assertEqual(3);

      expect(arr[0]).assertEqual(null);

      expect(arr[1]).assertEqual(undefined);

      expect(arr[2] instanceof SendableClassBasic).assertTrue();
      expect(ArkTSUtils.isSendable(arr)).assertTrue();

      console.info(`${caseName}, test end`);
    });

}
