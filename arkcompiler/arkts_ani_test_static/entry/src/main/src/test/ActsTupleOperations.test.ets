/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function tupleOperationsTest() {

  describe("ActsTupleOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0001
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0100
     * @tc.desc   tuple value get itemboolean normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0001 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0001 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0001 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0002
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0200
     * @tc.desc   tuple value get itemboolean env is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0002 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_02();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0002 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0002 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0003
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0300
     * @tc.desc   tuple value get itemboolean tuple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0003 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_03();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0003 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0003 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0004
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0400
     * @tc.desc   tuple value index out of range is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0004 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_04();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0004 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0004 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0005
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0500
     * @tc.desc   tuple value index out of range is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0005 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_05();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0005 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0005 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0006
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0600
     * @tc.desc   tuple value index out of range is maxnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0006 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_06();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0006 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0006 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0007
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0700
     * @tc.desc   tuple value get composite scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0007 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_07();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0007 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0007 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0008
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0800
     * @tc.desc   tuple value get itemboolean null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0008 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_08();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0008 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0008 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0009
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_0900
     * @tc.desc   tuple value get itemboolean repeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0009 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_09();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0009 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0009 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Boolean_0010
     * @tc.number TUPLEVALUE_GETITEM_BOOLEAN_1000
     * @tc.desc   tuple value get itemboolean empty tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Boolean_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Boolean_0010 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Boolean_10();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Boolean_0010 done');
        done();
        console.log('test_TupleValue_GetItem_Boolean_0010 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0001
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0100
     * @tc.desc   tuple value get itemchar normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0001 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0001 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0001 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0002
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0200
     * @tc.desc   tuple value get itemchar env is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0002 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_02();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0002 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0002 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0003
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0300
     * @tc.desc   tuple value get itemchar reference tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0003 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_03();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0003 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0003 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0004
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0400
     * @tc.desc   tuple value get itemchar tuple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0004 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_04();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0004 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0004 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0005
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0500
     * @tc.desc   tuple value index out of range is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0005 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_05();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0005 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0005 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0006
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0600
     * @tc.desc   tuple value index out of range is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0006 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_06();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0006 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0006 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0007
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0700
     * @tc.desc   tuple value index out of range is maxnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0007 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_07();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0007 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0007 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0008
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0800
     * @tc.desc   tuple value get composite scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0008 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_08();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0008 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0008 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0009
     * @tc.number TUPLEVALUE_GETITEM_CHAR_0900
     * @tc.desc   tuple value get itemchar null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0009 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_09();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0009 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0009 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0010
     * @tc.number TUPLEVALUE_GETITEM_CHAR_1000
     * @tc.desc   tuple value get itemchar repeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0010 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_10();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0010 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0010 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Char_0011
     * @tc.number TUPLEVALUE_GETITEM_CHAR_1100
     * @tc.desc   tuple value get itemchar empty tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Char_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Char_0011 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Char_11();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Char_0011 done');
        done();
        console.log('test_TupleValue_GetItem_Char_0011 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0001
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0100
     * @tc.desc   tuple value get itembyte normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0001 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0001 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0001 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0002
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0200
     * @tc.desc   tuple value get itembyte env is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0002 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_02();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0002 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0002 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0003
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0300
     * @tc.desc   tuple value get itembyte tuple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0003 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_03();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0003 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0003 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0004
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0400
     * @tc.desc   tuple value index out of range is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0004 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_04();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0004 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0004 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0005
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0500
     * @tc.desc   tuple value index out of range is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0005 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_05();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0005 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0005 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0006
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0600
     * @tc.desc   tuple value index out of range is maxnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0006 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_06();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0006 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0006 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0007
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0700
     * @tc.desc   tuple value get composite scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0007 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_07();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0007 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0007 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0008
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0800
     * @tc.desc   tuple value get itembyte null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0008 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_08();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0008 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0008 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Byte_0009
     * @tc.number TUPLEVALUE_GETITEM_BYTE_0900
     * @tc.desc   tuple value get itembyte repeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Byte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Byte_0009 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Byte_09();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Byte_0009 done');
        done();
        console.log('test_TupleValue_GetItem_Byte_0009 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0001
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0100
     * @tc.desc   tuple value getitem short normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0001 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0001 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0001 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0002
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0200
     * @tc.desc   tuple value getitem short env is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0002 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_02();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0002 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0002 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0003
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0300
     * @tc.desc   tuple value getitem short tuple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0003 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_03();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0003 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0003 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0004
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0400
     * @tc.desc   tuple value index out of range is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0004 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_04();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0004 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0004 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0005
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0500
     * @tc.desc   tuple value index out of range is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0005 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_05();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0005 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0005 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0006
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0600
     * @tc.desc   tuple value index out of range is maxnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0006 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_06();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0006 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0006 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0007
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0700
     * @tc.desc   tuple value get composite scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0007 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_07();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0007 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0007 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0008
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0800
     * @tc.desc   tuple value getitem short null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0008 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_08();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0008 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0008 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Short_0009
     * @tc.number TUPLEVALUE_GETITEM_SHORT_0900
     * @tc.desc   tuple value getitem short repeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Short_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Short_0009 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Short_09();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Short_0009 done');
        done();
        console.log('test_TupleValue_GetItem_Short_0009 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0001
     * @tc.number TUPLEVALUE_GETITEM_INT_0100
     * @tc.desc   tuple value getitem int normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0001 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0001 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0002
     * @tc.number TUPLEVALUE_GETITEM_INT_0200
     * @tc.desc   tuple value getitem int env is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0002 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_02();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0002 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0002 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0003
     * @tc.number TUPLEVALUE_GETITEM_INT_0300
     * @tc.desc   tuple value getitem int tuple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0003 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_03();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0003 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0003 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0004
     * @tc.number TUPLEVALUE_GETITEM_INT_0400
     * @tc.desc   tuple value index out of range is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0004 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_04();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0004 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0004 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0005
     * @tc.number TUPLEVALUE_GETITEM_INT_0500
     * @tc.desc   tuple value index out of range is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0005 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_05();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0005 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0005 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0006
     * @tc.number TUPLEVALUE_GETITEM_INT_0600
     * @tc.desc   tuple value index out of range is maxnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0006 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_06();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0006 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0006 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0007
     * @tc.number TUPLEVALUE_GETITEM_INT_0700
     * @tc.desc   tuple value get composite scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0007 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_07();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0007 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0007 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0008
     * @tc.number TUPLEVALUE_GETITEM_INT_0800
     * @tc.desc   tuple value getitem int null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0008 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_08();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0008 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0008 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Int_0009
     * @tc.number TUPLEVALUE_GETITEM_INT_0900
     * @tc.desc   tuple value getitem int repeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Int_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Int_0009 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Int_09();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Int_0009 done');
        done();
        console.log('test_TupleValue_GetItem_Int_0009 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0001
     * @tc.number TUPLEVALUE_GETITEM_LONG_0100
     * @tc.desc   tuple value getitem long normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0001 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0001 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0001 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0002
     * @tc.number TUPLEVALUE_GETITEM_LONG_0200
     * @tc.desc   tuple value getitem long env is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0002 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_02();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0002 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0002 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0003
     * @tc.number TUPLEVALUE_GETITEM_LONG_0300
     * @tc.desc   tuple value getitem long tuple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0003 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_03();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0003 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0003 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0004
     * @tc.number TUPLEVALUE_GETITEM_LONG_0400
     * @tc.desc   tuple value index out of range is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0004 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_04();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0004 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0004 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0005
     * @tc.number TUPLEVALUE_GETITEM_LONG_0500
     * @tc.desc   tuple value index out of range is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0005 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_05();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0005 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0005 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0006
     * @tc.number TUPLEVALUE_GETITEM_LONG_0600
     * @tc.desc   tuple value index out of range is maxnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0006 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_06();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0006 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0006 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0007
     * @tc.number TUPLEVALUE_GETITEM_LONG_0700
     * @tc.desc   tuple value get composite scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0007 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_07();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0007 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0007 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0008
     * @tc.number TUPLEVALUE_GETITEM_LONG_0800
     * @tc.desc   tuple value getitem long null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0008 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_08();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0008 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0008 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Long_0009
     * @tc.number TUPLEVALUE_GETITEM_LONG_0900
     * @tc.desc   tuple value getitem long repeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Long_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Long_0009 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Long_09();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Long_0009 done');
        done();
        console.log('test_TupleValue_GetItem_Long_0009 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Float_0001
     * @tc.number TUPLEVALUE_GETITEM_FLOAT_0100
     * @tc.desc   tuple value getitem float normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Float_0001 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Float();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Float_0001 done');
        done();
        console.log('test_TupleValue_GetItem_Float_0001 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Float_0002
     * @tc.number TUPLEVALUE_GETITEM_FLOAT_0200
     * @tc.desc   tuple value getitem float env is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Float_0002 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Float_02();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Float_0002 done');
        done();
        console.log('test_TupleValue_GetItem_Float_0002 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Float_0003
     * @tc.number TUPLEVALUE_GETITEM_FLOAT_0300
     * @tc.desc   tuple value getitem float tuple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Float_0003 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Float_03();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Float_0003 done');
        done();
        console.log('test_TupleValue_GetItem_Float_0003 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Float_0004
     * @tc.number TUPLEVALUE_GETITEM_FLOAT_0400
     * @tc.desc   tuple value index out of range is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Float_0004 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Float_04();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Float_0004 done');
        done();
        console.log('test_TupleValue_GetItem_Float_0004 end');
      });

    /**
     * @tc.name   test_TupleValue_GetItem_Float_0005
     * @tc.number TUPLEVALUE_GETITEM_FLOAT_0500
     * @tc.desc   tuple value index out of range is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_TupleValue_GetItem_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TupleValue_GetItem_Float_0005 start');
        let cls = new Foo();
        let result = cls.test_TupleValue_GetItem_Float_05();
        expect(result).assertTrue();
        console.log('test_TupleValue_GetItem_Float_0005 done');
        done();
        console.log('test_TupleValue_GetItem_Float_0005 end');
      });
  })
}