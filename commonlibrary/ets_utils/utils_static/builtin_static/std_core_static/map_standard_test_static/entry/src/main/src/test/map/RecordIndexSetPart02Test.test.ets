'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface ObjVal {
  id: number;
  name: string;
}

export default function recordIndexSetPart02TestTest(): void {
  describe('RecordIndexSetPart02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0100
     * @tc.name recordIndexSetPart02Test001
     * @tc.desc Verify 2 (key,value) $_set Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('alpha', 100);
      expect(record.has('alpha')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0200
     * @tc.name recordIndexSetPart02Test002
     * @tc.desc Verify 2 $_set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('alpha', 1);
      record.$_set('alpha', 2);
      expect(record.$_get('alpha')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0300
     * @tc.name recordIndexSetPart02Test003
     * @tc.desc Verify key 32767 value int $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(32767, 888);
      expect(record.$_get(32767)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0400
     * @tc.name recordIndexSetPart02Test004
     * @tc.desc Verify key string value double.NaN $_set $_get NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('nan_val', Number.NaN);
      let r: number | undefined = record.$_get('nan_val');
      expect(isNaN(r!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0500
     * @tc.name recordIndexSetPart02Test005
     * @tc.desc Verify key string value Number.NEGATIVE_INFINITY $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('neg_inf', Number.NEGATIVE_INFINITY);
      let r: number | undefined = record.$_get('neg_inf');
      expect(r).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0600
     * @tc.name recordIndexSetPart02Test006
     * @tc.desc Verify $_set Map<string,int> key map typeof 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('type_check', 42);
      expect(record.$_get('type_check')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0700
     * @tc.name recordIndexSetPart02Test007
     * @tc.desc Verify $_set Map<int,string> key map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(100, 'val');
      expect(record.$_get(100)).assertEqual('val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0800
     * @tc.name recordIndexSetPart02Test008
     * @tc.desc Verify $_set (-2147483647 - 1) key map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483648, 'identity');
      expect(record.$_get(-2147483648)).assertEqual('identity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_0900
     * @tc.name recordIndexSetPart02Test009
     * @tc.desc Verify $_set key map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 1);
      expect(record.$_get('k')).assertEqual(1);
      record.$_set('k', 999);
      expect(record.$_get('k')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1000
     * @tc.name recordIndexSetPart02Test010
     * @tc.desc Verify $_set (-2147483647 - 1) key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(-2147483648, 1);
      record.$_set(-2147483648, 999);
      let r: int | undefined = record.$_get(-2147483648);
      expect(r).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1100
     * @tc.name recordIndexSetPart02Test011
     * @tc.desc Verify $_set 32767 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('pos', 32767);
      let r: int | undefined = record.$_get('pos');
      expect(r).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1200
     * @tc.name recordIndexSetPart02Test012
     * @tc.desc Verify $_set key int $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 's';
      for (let i: int = 0; i < 9999; i++) {
        longKey = longKey + 'y';
      }
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(longKey, 777);
      let r: int | undefined = record.$_get(longKey);
      expect(r).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1300
     * @tc.name recordIndexSetPart02Test013
     * @tc.desc Verify $_set key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 't';
      for (let i: int = 0; i < 9999; i++) {
        longKey = longKey + 'z';
      }
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(longKey, 100);
      record.$_set(longKey, 200);
      let r: int | undefined = record.$_get(longKey);
      expect(r).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1400
     * @tc.name recordIndexSetPart02Test014
     * @tc.desc Verify $_set object value $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, ObjVal> = new Record<string, ObjVal>();
      let obj: ObjVal = { id: 42, name: 'answer' } as ObjVal;
      record.$_set('ref_obj', obj);
      let r: ObjVal | undefined = record.$_get('ref_obj');
      expect(r).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1500
     * @tc.name recordIndexSetPart02Test015
     * @tc.desc Verify $_set object value $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, ObjVal> = new Record<string, ObjVal>();
      let oldObj: ObjVal = { id: 1, name: 'old' } as ObjVal;
      let newObj: ObjVal = { id: 2, name: 'new' } as ObjVal;
      record.$_set('obj_key', oldObj);
      record.$_set('obj_key', newObj);
      let r: ObjVal | undefined = record.$_get('obj_key');
      expect(r).assertEqual(newObj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1600
     * @tc.name recordIndexSetPart02Test016
     * @tc.desc Verify $_set key Map<string,int> size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      expect(record.size).assertEqual(0);
      record.$_set('first', 10);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1700
     * @tc.name recordIndexSetPart02Test017
     * @tc.desc Verify $_set key Map<string,int>( 2 key) size 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      expect(record.size).assertEqual(2);
      record.$_set('c', 3);
      expect(record.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1800
     * @tc.name recordIndexSetPart02Test018
     * @tc.desc Verify $_set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('existing', 5);
      let sz: int = record.size;
      record.$_set('existing', 99);
      expect(record.size).assertEqual(sz);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_1900
     * @tc.name recordIndexSetPart02Test019
     * @tc.desc Verify $_set (-2147483647 - 1) key Map<int,string> size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483648, 'minkey');
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2000
     * @tc.name recordIndexSetPart02Test020
     * @tc.desc Verify $_set (-2147483647 - 1) key key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483648, 'old');
      let szBefore: int = record.size;
      record.$_set(-2147483648, 'new');
      expect(record.size).assertEqual(szBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2100
     * @tc.name recordIndexSetPart02Test021
     * @tc.desc Verify $_set 32767 key Map<int,int> size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(1, 10);
      record.$_set(2, 20);
      let szBefore: int = record.size;
      record.$_set(32767, 30);
      expect(record.size).assertEqual(szBefore + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2200
     * @tc.name recordIndexSetPart02Test022
     * @tc.desc Verify $_set key Map size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'L';
      for (let i: int = 0; i < 9999; i++) {
        longKey = longKey + 'o';
      }
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(longKey, 1);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2300
     * @tc.name recordIndexSetPart02Test023
     * @tc.desc Verify $_set bucketsCount=0 Map key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      expect(record.size).assertEqual(0);
      record.$_set('bucket0_key', 42);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2400
     * @tc.name recordIndexSetPart02Test024
     * @tc.desc Verify 3 $_set key size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('x', 1);
      record.$_set('y', 2);
      record.$_set('z', 3);
      expect(record.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2500
     * @tc.name recordIndexSetPart02Test025
     * @tc.desc Verify $_set object value size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, ObjVal> = new Record<string, ObjVal>();
      let o: ObjVal = { id: 1, name: 'a' } as ObjVal;
      record.$_set('obj_entry', o);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2600
     * @tc.name recordIndexSetPart02Test026
     * @tc.desc Verify $_set 5 key Map key size 5 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      for (let i: int = 0; i < 5; i++) {
        record.$_set(i, i * 10);
      }
      let szBefore: int = record.size;
      record.$_set(9999, 99990);
      expect(record.size).assertEqual(szBefore + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2700
     * @tc.name recordIndexSetPart02Test027
     * @tc.desc Verify $_set key key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('original', 100);
      record.$_set('new_key', 200);
      expect(record.$_get('original')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2800
     * @tc.name recordIndexSetPart02Test028
     * @tc.desc Verify $_set key key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('keep', 50);
      record.$_set('change', 10);
      record.$_set('change', 20);
      expect(record.$_get('keep')).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_2900
     * @tc.name recordIndexSetPart02Test029
     * @tc.desc Verify $_set key key has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('alpha', 1);
      let hadBefore: boolean = record.has('alpha');
      record.$_set('beta', 2);
      expect(record.has('alpha')).assertEqual(hadBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3000
     * @tc.name recordIndexSetPart02Test030
     * @tc.desc Verify $_set key has key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('target', 1);
      record.$_set('target', 2);
      expect(record.has('target')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3100
     * @tc.name recordIndexSetPart02Test031
     * @tc.desc Verify $_set (-2147483647 - 1) key int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(0, 'zero');
      record.$_set(100, 'hundred');
      record.$_set(-2147483648, 'min_int');
      expect(record.$_get(0)).assertEqual('zero');
      expect(record.$_get(100)).assertEqual('hundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3200
     * @tc.name recordIndexSetPart02Test032
     * @tc.desc Verify $_set (-2147483647 - 1) key int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483648, 'old_min');
      record.$_set(1, 'one');
      record.$_set(-2147483648, 'new_min');
      expect(record.$_get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3300
     * @tc.name recordIndexSetPart02Test033
     * @tc.desc Verify $_set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'A';
      for (let i: int = 0; i < 9999; i++) {
        longKey = longKey + 'a';
      }
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('short', 10);
      record.$_set(longKey, 20);
      expect(record.$_get('short')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3400
     * @tc.name recordIndexSetPart02Test034
     * @tc.desc Verify $_set NaN value key number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('normal', 42.5);
      record.$_set('nan_key', Number.NaN);
      let r: number | undefined = record.$_get('normal');
      expect(r).assertEqual(42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3500
     * @tc.name recordIndexSetPart02Test035
     * @tc.desc Verify $_set key values key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('originalA', 111);
      record.$_set('originalB', 222);
      record.$_set('new_entry', 333);
      let foundA: boolean = false;
      let foundB: boolean = false;
      let vit: IterableIterator<int> = record.values();
      let vitem: IteratorResult<int> = vit.next();
      while (!vitem.done) {
        if (vitem.value! === 111) {
          foundA = true;
        }
        if (vitem.value! === 222) {
          foundB = true;
        }
        vitem = vit.next();
      }
      expect(foundA).assertTrue();
      expect(foundB).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3600
     * @tc.name recordIndexSetPart02Test036
     * @tc.desc Verify $_set bucketsCount=0 Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('x1', 11);
      record.$_set('x2', 22);
      record.$_set('x3', 33);
      expect(record.$_get('x1')).assertEqual(11);
      expect(record.$_get('x2')).assertEqual(22);
      expect(record.$_get('x3')).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3700
     * @tc.name recordIndexSetPart02Test037
     * @tc.desc Verify $_set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      record.$_set('c', 3);
      let szBefore: int = record.size;
      record.$_set('b', 22);
      expect(record.size).assertEqual(szBefore);
      expect(record.$_get('a')).assertEqual(1);
      expect(record.$_get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3800
     * @tc.name recordIndexSetPart02Test038
     * @tc.desc Verify $_set map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('first', 1);
      record.$_set('second', 2);
      expect(record.$_get('first')).assertEqual(1);
      expect(record.$_get('second')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_3900
     * @tc.name recordIndexSetPart02Test039
     * @tc.desc Verify $_set map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(1, 10);
      record.$_set(2, 20);
      record.$_set(3, 30);
      expect(record.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4000
     * @tc.name recordIndexSetPart02Test040
     * @tc.desc Verify $_set $_get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('immediate', 77);
      expect(record.$_get('immediate')).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4100
     * @tc.name recordIndexSetPart02Test041
     * @tc.desc Verify $_set delete key delete size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('to_delete', 100);
      expect(record.delete('to_delete')).assertTrue();
      expect(record.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4200
     * @tc.name recordIndexSetPart02Test042
     * @tc.desc Verify $_set forEach callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('foreach_test', 123);
      let found: boolean = false;
      record.forEach((value: int, key: string): void => {
        if (key === 'foreach_test' && value === 123) {
          found = true;
        }
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4300
     * @tc.name recordIndexSetPart02Test043
     * @tc.desc Verify $_set forEach callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('iter_key', 10);
      record.$_set('iter_key', 20);
      let foundNewValue: boolean = false;
      record.forEach((value: int, key: string): void => {
        if (key === 'iter_key' && value === 20) {
          foundNewValue = true;
        }
      });
      expect(foundNewValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4400
     * @tc.name recordIndexSetPart02Test044
     * @tc.desc Verify $_set clear clear size 0 has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('will_clear', 888);
      record.clear();
      expect(record.size).assertEqual(0);
      expect(record.has('will_clear')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4500
     * @tc.name recordIndexSetPart02Test045
     * @tc.desc Verify $_set entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('e1', 1);
      record.$_set('e2', 2);
      let count: int = 0;
      let it: IterableIterator<[string, int]> = record.entries();
      let item: IteratorResult<[string, int]> = it.next();
      while (!item.done) {
        count++;
        item = it.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4600
     * @tc.name recordIndexSetPart02Test046
     * @tc.desc Verify $_set keys key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('my_key', 42);
      let foundKey: boolean = false;
      let kit: IterableIterator<string> = record.keys();
      let kitem: IteratorResult<string> = kit.next();
      while (!kitem.done) {
        if (kitem.value! === 'my_key') {
          foundKey = true;
        }
        kitem = kit.next();
      }
      expect(foundKey).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4700
     * @tc.name recordIndexSetPart02Test047
     * @tc.desc Verify $_set 2147483647 key size 1 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(2147483647, 'max_int');
      expect(record.size).assertEqual(1);
      expect(record.$_get(2147483647)).assertEqual('max_int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4800
     * @tc.name recordIndexSetPart02Test048
     * @tc.desc Verify $_set (-2147483647 - 1) key size 1 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483648, 'min_int');
      expect(record.size).assertEqual(1);
      expect(record.$_get(-2147483648)).assertEqual('min_int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_4900
     * @tc.name recordIndexSetPart02Test049
     * @tc.desc Verify $_set 0 key int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(0, 999);
      expect(record.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5000
     * @tc.name recordIndexSetPart02Test050
     * @tc.desc Verify $_set -1 key string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(-1, 77);
      expect(record.$_get(-1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5100
     * @tc.name recordIndexSetPart02Test051
     * @tc.desc Verify $_set 1 key int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(1, 42);
      expect(record.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5200
     * @tc.name recordIndexSetPart02Test052
     * @tc.desc Verify $_set 2147483647 value $_get 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('max_val', 2147483647);
      expect(record.$_get('max_val')).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5300
     * @tc.name recordIndexSetPart02Test053
     * @tc.desc Verify $_set (-2147483647 - 1) value $_get (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('min_val', -2147483648);
      expect(record.$_get('min_val')).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5400
     * @tc.name recordIndexSetPart02Test054
     * @tc.desc Verify $_set 0 value $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('zero_val', 0);
      expect(record.$_get('zero_val')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5500
     * @tc.name recordIndexSetPart02Test055
     * @tc.desc Verify $_set long.MAX value Map<long,string> $_get long.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, long> = new Record<string, long>();
      const LONG_MAX: long = 9223372036854775807;
      record.$_set('lmax', LONG_MAX);
      let r: long | undefined = record.$_get('lmax');
      expect(r).assertEqual(LONG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5600
     * @tc.name recordIndexSetPart02Test056
     * @tc.desc Verify $_set long.MIN value $_get long.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, long> = new Record<string, long>();
      const LONG_MIN: long = -9223372036854775807 - 1;
      record.$_set('lmin', LONG_MIN);
      let r: long | undefined = record.$_get('lmin');
      expect(r).assertEqual(LONG_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5700
     * @tc.name recordIndexSetPart02Test057
     * @tc.desc Verify $_set double.MAX_VALUE value Map<string,double> $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('dmax', Number.MAX_VALUE as double);
      let r: double | undefined = record.$_get('dmax');
      expect(r).assertEqual(Number.MAX_VALUE as double);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5800
     * @tc.name recordIndexSetPart02Test058
     * @tc.desc Verify Map<int, boolean> $_set true $_get true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, boolean> = new Record<int, boolean>();
      record.$_set(1, true);
      let r: boolean | undefined = record.$_get(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_5900
     * @tc.name recordIndexSetPart02Test059
     * @tc.desc Verify Map<int, boolean> $_set false $_get false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, boolean> = new Record<int, boolean>();
      record.$_set(2, false);
      let r: boolean | undefined = record.$_get(2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6000
     * @tc.name recordIndexSetPart02Test060
     * @tc.desc Verify Map<double, string> $_set double key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, string> = new Record<double, string>();
      let key: double = 3.14159 as double;
      record.$_set(key, 'pi_str');
      let r: string | undefined = record.$_get(key);
      expect(r).assertEqual('pi_str');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6100
     * @tc.name recordIndexSetPart02Test061
     * @tc.desc Verify Map<number, number> $_set number key number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, number> = new Record<number, number>();
      record.$_set(2.718 as number, 1.414 as number);
      let r: number | undefined = record.$_get(2.718 as number);
      expect(r).assertEqual(1.414 as number);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6200
     * @tc.name recordIndexSetPart02Test062
     * @tc.desc Verify Map<string, Date> $_set Date value $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d: Date = new Date(1680000000000);
      record.$_set('date_key', d);
      let r: Date | undefined = record.$_get('date_key');
      expect(r).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6300
     * @tc.name recordIndexSetPart02Test063
     * @tc.desc Verify Map<string, Date> $_set Date $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d1: Date = new Date(1000000000000);
      let d2: Date = new Date(2000000000000);
      record.$_set('date_ref', d1);
      record.$_set('date_ref', d2);
      let r: Date | undefined = record.$_get('date_ref');
      expect(r).assertEqual(d2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6400
     * @tc.name recordIndexSetPart02Test064
     * @tc.desc Verify Map<string, Error> $_set Error value $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Error> = new Record<string, Error>();
      let err: Error = new Error('test error');
      record.$_set('err_key', err);
      let r: Error | undefined = record.$_get('err_key');
      expect(r).assertEqual(err);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6500
     * @tc.name recordIndexSetPart02Test065
     * @tc.desc Verify Map<string, RegExp> $_set RegExp value $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, RegExp> = new Record<string, RegExp>();
      let re: RegExp = new RegExp('pattern', 'g');
      record.$_set('regex_key', re);
      let r: RegExp | undefined = record.$_get('regex_key');
      expect(r).assertEqual(re);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6600
     * @tc.name recordIndexSetPart02Test066
     * @tc.desc Verify Map<string, Array<int>> $_set Array<int> value $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Array<int>> = new Record<string, Array<int>>();
      let arr: Array<int> = [1, 2, 3];
      record.$_set('arr_key', arr);
      let r: Array<int> | undefined = record.$_get('arr_key');
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6700
     * @tc.name recordIndexSetPart02Test067
     * @tc.desc Verify Map<string, Map<string, int>> $_set Map value $_get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Map<string, int>> = new Record<string, Map<string, int>>();
      const inner: Map<string, int> = new Map<string, int>();
      inner.set('a', 1);
      record.$_set('nested_map', inner);
      const r: Map<string, int> | undefined = record.$_get('nested_map');
      expect(r).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6800
     * @tc.name recordIndexSetPart02Test068
     * @tc.desc Verify Map<string, Set<int>> $_set Set<int> value $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Set<int>> = new Record<string, Set<int>>();
      let s: Set<int> = new Set<int>();
      s.add(100);
      record.$_set('set_key', s);
      let r: Set<int> | undefined = record.$_get('set_key');
      expect(r).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART02_6900
     * @tc.name recordIndexSetPart02Test069
     * @tc.desc Verify Map<number, string> $_set number key $_get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(1.5 as number, 'old');
      record.$_set(1.5 as number, 'new');
      let r: string | undefined = record.$_get(1.5 as number);
      expect(r).assertEqual('new');
    });
  });
}
