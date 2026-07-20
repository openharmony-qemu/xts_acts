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

class MyKeyClass {
  id: number = 0;
}

export default function mapClearPart01TestTest(): void {
  describe('MapClearPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0100
     * @tc.name mapClearPart01Test001
     * @tc.desc Verify clear() 0, Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0200
     * @tc.name mapClearPart01Test002
     * @tc.desc Verify clear() 0, Map no-op size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0300
     * @tc.name mapClearPart01Test003
     * @tc.desc Verify clear clear Map<string,int>, clear 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.clear();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0400
     * @tc.name mapClearPart01Test004
     * @tc.desc Verify clear entries=null Map<string,int>, no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(null);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0500
     * @tc.name mapClearPart01Test005
     * @tc.desc Verify clear entries= Map<string,int>, no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [];
      const map: Map<string, int> = new Map<string, int>(entries);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0600
     * @tc.name mapClearPart01Test006
     * @tc.desc Verify clear Map<int,string> 1 int, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0700
     * @tc.name mapClearPart01Test007
     * @tc.desc Verify clear Map<number,boolean> 1, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, boolean> = new Map<number, boolean>();
      map.set(3.14, true);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0800
     * @tc.name mapClearPart01Test008
     * @tc.desc Verify clear Map<boolean,int> 1, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(false, 42);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_0900
     * @tc.name mapClearPart01Test009
     * @tc.desc Verify clear Map<string,int> 1, get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('only', 99);
      map.clear();
      let v: int | undefined = map.get('only');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1000
     * @tc.name mapClearPart01Test010
     * @tc.desc Verify clear Map<string,int> 3, size has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('x', 10);
      map.set('y', 20);
      map.set('z', 30);
      map.clear();
      expect(map.size).assertEqual(0);
      expect(map.has('x')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1100
     * @tc.name mapClearPart01Test011
     * @tc.desc Verify clear Map<string,int> 10, key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('k0', 0);
      map.set('k1', 1);
      map.set('k2', 2);
      map.set('k3', 3);
      map.set('k4', 4);
      map.set('k5', 5);
      map.set('k6', 6);
      map.set('k7', 7);
      map.set('k8', 8);
      map.set('k9', 9);
      map.clear();
      expect(map.size).assertEqual(0);
      expect(map.has('k5')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1200
     * @tc.name mapClearPart01Test012
     * @tc.desc Verify clear Map<int,string> 5 int, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(10, 'a');
      map.set(20, 'b');
      map.set(30, 'c');
      map.set(40, 'd');
      map.set(50, 'e');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1300
     * @tc.name mapClearPart01Test013
     * @tc.desc Verify clear Map<number,int> 4, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>();
      map.set(1.1, 100);
      map.set(2.2, 200);
      map.set(3.3, 300);
      map.set(4.4, 400);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1400
     * @tc.name mapClearPart01Test014
     * @tc.desc Verify clear string key Map, clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['dup', 1], ['dup', 2], ['other', 3]]);
      map.clear();
      expect(map.size).assertEqual(0);
      expect(map.has('dup')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1500
     * @tc.name mapClearPart01Test015
     * @tc.desc Verify clear int key Map, clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[7, 'first'], [7, 'second'], [8, 'third']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1600
     * @tc.name mapClearPart01Test016
     * @tc.desc Verify clear set Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1).set('b', 2).set('c', 3);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1700
     * @tc.name mapClearPart01Test017
     * @tc.desc Verify clear set key Map, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      map.set('key', 999);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1800
     * @tc.name mapClearPart01Test018
     * @tc.desc Verify clear set delete key Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      map.delete('b');
      map.clear();
      expect(map.size).assertEqual(0);
      expect(map.has('a')).assertFalse();
      expect(map.has('c')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_1900
     * @tc.name mapClearPart01Test019
     * @tc.desc Verify clear set key Map, key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('only', 1);
      map.set('only', 2);
      map.set('only', 3);
      map.clear();
      expect(map.size).assertEqual(0);
      expect(map.has('only')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2000
     * @tc.name mapClearPart01Test020
     * @tc.desc Verify clear key Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 42);
      map.set('b', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2100
     * @tc.name mapClearPart01Test021
     * @tc.desc Verify clear key emoji Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('😀', 1);
      map.set('normal', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2200
     * @tc.name mapClearPart01Test022
     * @tc.desc Verify clear key Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 99);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2300
     * @tc.name mapClearPart01Test023
     * @tc.desc Verify clear key Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i: number = 0; i < 1000; i++) {
        longKey = longKey + 'x';
      }
      const map: Map<string, int> = new Map<string, int>();
      map.set(longKey, 1);
      map.set('short', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2400
     * @tc.name mapClearPart01Test024
     * @tc.desc Verify clear key XSS Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('<script>alert(1)</script>', 1);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2500
     * @tc.name mapClearPart01Test025
     * @tc.desc Verify clear K=string Map<string,string>, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('ka', 'va');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2600
     * @tc.name mapClearPart01Test026
     * @tc.desc Verify clear K=number Map<number,string>, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(3.14, 'pi');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2700
     * @tc.name mapClearPart01Test027
     * @tc.desc Verify clear K=boolean Map<boolean,string>, 2 size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2800
     * @tc.name mapClearPart01Test028
     * @tc.desc Verify clear K=long Map<long,string>, long size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(100), 'big');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_2900
     * @tc.name mapClearPart01Test029
     * @tc.desc Verify clear K=double Map<double,string>, double size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(2.71828, 'e');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3000
     * @tc.name mapClearPart01Test030
     * @tc.desc Verify clear K=byte Map<byte,string>, byte size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(7 as byte, 'seven');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3100
     * @tc.name mapClearPart01Test031
     * @tc.desc Verify clear K=short Map<short,string>, short size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(100 as short, 'hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3200
     * @tc.name mapClearPart01Test032
     * @tc.desc Verify clear K=float Map<float,string>, float size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(1.5 as float, 'f');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3300
     * @tc.name mapClearPart01Test033
     * @tc.desc Verify clear K=char Map<char,string>, char size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, string> = new Map<char, string>();
      map.set(c'A', 'A');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3400
     * @tc.name mapClearPart01Test034
     * @tc.desc Verify clear K=bigint Map<bigint,string>, bigint size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>();
      map.set(123456789n, 'big');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3500
     * @tc.name mapClearPart01Test035
     * @tc.desc Verify clear K=Date Map<Date,int>, equals size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d1: Date = new Date(1000);
      let d2: Date = new Date(1000);
      map.set(d1, 1);
      map.set(d2, 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3600
     * @tc.name mapClearPart01Test036
     * @tc.desc Verify clear K=RegExp Map<RegExp,int>, RegExp size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, int> = new Map<RegExp, int>();
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'g');
      map.set(r1, 1);
      map.set(r2, 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3700
     * @tc.name mapClearPart01Test037
     * @tc.desc Verify clear K=class Map<MyKeyClass,int>, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<MyKeyClass, int> = new Map<MyKeyClass, int>();
      let obj: MyKeyClass = new MyKeyClass();
      obj.id = 10;
      map.set(obj, 100);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3800
     * @tc.name mapClearPart01Test038
     * @tc.desc Verify clear K null Map, null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 1);
      map.set('a', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_3900
     * @tc.name mapClearPart01Test039
     * @tc.desc Verify clear K undefined Map, undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | undefined, int> = new Map<string | undefined, int>();
      map.set(undefined, 1);
      map.set('a', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4000
     * @tc.name mapClearPart01Test040
     * @tc.desc Verify clear V=string Map<int,string>, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'hello');
      map.set(2, 'world');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4100
     * @tc.name mapClearPart01Test041
     * @tc.desc Verify clear V=int Map<int,int>, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(1, 100);
      map.set(2, 200);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4200
     * @tc.name mapClearPart01Test042
     * @tc.desc Verify clear V=number Map<int,number>, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, number> = new Map<int, number>();
      map.set(1, 3.14);
      map.set(2, 2.71);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4300
     * @tc.name mapClearPart01Test043
     * @tc.desc Verify clear V=boolean Map<int,boolean>, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, boolean> = new Map<int, boolean>();
      map.set(1, true);
      map.set(2, false);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4400
     * @tc.name mapClearPart01Test044
     * @tc.desc Verify clear V=long Map<int,long>, long size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, long> = new Map<int, long>();
      map.set(1, 9999999999);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4500
     * @tc.name mapClearPart01Test045
     * @tc.desc Verify clear V=double Map<int,double>, double size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, double> = new Map<int, double>();
      map.set(1, 1.7976931348623157e308);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4600
     * @tc.name mapClearPart01Test046
     * @tc.desc Verify clear V=byte Map<int,byte>, byte size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, byte> = new Map<int, byte>();
      map.set(1, 127 as byte);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4700
     * @tc.name mapClearPart01Test047
     * @tc.desc Verify clear V=short Map<int,short>, short size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, short> = new Map<int, short>();
      map.set(1, 32767 as short);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4800
     * @tc.name mapClearPart01Test048
     * @tc.desc Verify clear V=float Map<int,float>, float size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, float> = new Map<int, float>();
      map.set(1, 1.5 as float);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_4900
     * @tc.name mapClearPart01Test049
     * @tc.desc Verify clear V=char Map<int,char>, char size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, char> = new Map<int, char>();
      map.set(1, c'B');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5000
     * @tc.name mapClearPart01Test050
     * @tc.desc Verify clear V=bigint Map<int,bigint>, bigint size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, bigint> = new Map<int, bigint>();
      map.set(1, 9999999999999n);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5100
     * @tc.name mapClearPart01Test051
     * @tc.desc Verify clear V=Date Map<string,Date>, Date size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Date> = new Map<string, Date>();
      map.set('a', new Date(0));
      map.set('b', new Date(86400000));
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5200
     * @tc.name mapClearPart01Test052
     * @tc.desc Verify clear V=RegExp Map<string,RegExp>, RegExp size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, RegExp> = new Map<string, RegExp>();
      map.set('a', new RegExp('test', 'i'));
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5300
     * @tc.name mapClearPart01Test053
     * @tc.desc Verify clear V=Error Map<string,Error>, Error size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Error> = new Map<string, Error>();
      map.set('a', new Error('msg'));
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5400
     * @tc.name mapClearPart01Test054
     * @tc.desc Verify clear V=Array Map<string,int >, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int[]> = new Map<string, int[]>();
      let arr: int[] = [1, 2, 3];
      map.set('a', arr);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5500
     * @tc.name mapClearPart01Test055
     * @tc.desc Verify clear V=Map Map<string,Map<string,int>>, Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Map<string, int>> = new Map<string, Map<string, int>>();
      const inner: Map<string, int> = new Map<string, int>();
      inner.set('x', 10);
      map.set('outer', inner);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5600
     * @tc.name mapClearPart01Test056
     * @tc.desc Verify clear V null Map<int,int|null>, null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int | null> = new Map<int, int | null>();
      map.set(1, null);
      map.set(2, 100);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5700
     * @tc.name mapClearPart01Test057
     * @tc.desc Verify clear V undefined Map<int,int|undefined>, undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int | undefined> = new Map<int, int | undefined>();
      map.set(1, undefined);
      map.set(2, 200);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5800
     * @tc.name mapClearPart01Test058
     * @tc.desc Verify clear K=2147483647 Map, int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'max');
      map.set(0, 'zero');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_5900
     * @tc.name mapClearPart01Test059
     * @tc.desc Verify clear K=(-2147483647 - 1) Map, int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-2147483648, 'min');
      map.set(1, 'one');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6000
     * @tc.name mapClearPart01Test060
     * @tc.desc Verify clear K=NaN Map<number,string>, NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NaN, 'nan');
      map.set(1.0, 'one');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6100
     * @tc.name mapClearPart01Test061
     * @tc.desc Verify clear K=Infinity Map<number,string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.POSITIVE_INFINITY, 'inf');
      map.set(2.0, 'two');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6200
     * @tc.name mapClearPart01Test062
     * @tc.desc Verify clear K=-Infinity Map<number,string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NEGATIVE_INFINITY, 'ninf');
      map.set(3.0, 'three');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6300
     * @tc.name mapClearPart01Test063
     * @tc.desc Verify clear K=-0.0 Map<number,string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(-0.0, 'negzero');
      map.set(0.0, 'poszero');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6400
     * @tc.name mapClearPart01Test064
     * @tc.desc Verify clear K=byte.MAX(127) Map<byte,string>, byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(127 as byte, 'bmax');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6500
     * @tc.name mapClearPart01Test065
     * @tc.desc Verify clear K=byte.MIN(-128) Map<byte,string>, byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(-128 as byte, 'bmin');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6600
     * @tc.name mapClearPart01Test066
     * @tc.desc Verify clear V=NaN Map<string,number>, NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('a', Number.NaN);
      map.set('b', 1.0);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6700
     * @tc.name mapClearPart01Test067
     * @tc.desc Verify clear V=Infinity Map<string,number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('a', Number.POSITIVE_INFINITY);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6800
     * @tc.name mapClearPart01Test068
     * @tc.desc Verify clear V=-Infinity Map<string,number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('a', Number.NEGATIVE_INFINITY);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_6900
     * @tc.name mapClearPart01Test069
     * @tc.desc Verify clear V=-0.0 Map<string,number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('a', -0.0);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7000
     * @tc.name mapClearPart01Test070
     * @tc.desc Verify clear Map, done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        map.set(i, i);
      }
      map.clear();
      expect(map.size).assertEqual(0);
      let iter: IterableIterator<int> = map.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7100
     * @tc.name mapClearPart01Test071
     * @tc.desc Verify clear boolean Map 2, size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 1);
      map.set(false, 2);
      map.set(true, 3);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7200
     * @tc.name mapClearPart01Test072
     * @tc.desc Verify clear set Map, size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      map.set('c', 3);
      expect(map.size).assertEqual(1);
      expect(map.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7300
     * @tc.name mapClearPart01Test073
     * @tc.desc Verify clear set key, key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      map.clear();
      map.set('key', 2);
      expect(map.size).assertEqual(1);
      expect(map.get('key')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7400
     * @tc.name mapClearPart01Test074
     * @tc.desc Verify clear set/delete/clear Map, clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.clear();
      map.set('b', 2);
      map.delete('b');
      map.set('c', 3);
      map.set('d', 4);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7500
     * @tc.name mapClearPart01Test075
     * @tc.desc Verify clear 2147483647 (-2147483647 - 1) Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'max');
      map.set(-2147483648, 'min');
      map.clear();
      expect(map.size).assertEqual(0);
      expect(map.has(2147483647)).assertFalse();
      expect(map.has(-2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7600
     * @tc.name mapClearPart01Test076
     * @tc.desc Verify clear K +0.0 -0.0 Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(0.0, 'pos_zero');
      map.set(-0.0, 'neg_zero');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7700
     * @tc.name mapClearPart01Test077
     * @tc.desc Verify clear K NaN Infinity Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NaN, 'nan');
      map.set(Number.POSITIVE_INFINITY, 'inf');
      map.set(Number.NEGATIVE_INFINITY, 'ninf');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7800
     * @tc.name mapClearPart01Test078
     * @tc.desc Verify clear long Map, long.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(9223372036854775807, 1);
      map.set(Int.toLong(0), 0);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_7900
     * @tc.name mapClearPart01Test079
     * @tc.desc Verify clear long Map, long.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set((-9223372036854775807 - 1), 1);
      map.set(Int.toLong(1), 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_8000
     * @tc.name mapClearPart01Test080
     * @tc.desc Verify clear short Map, short.MAX(32767)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(32767 as short, 'smax');
      map.set(0 as short, 'zero');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART01_TEST_8100
     * @tc.name mapClearPart01Test081
     * @tc.desc Verify clear short Map, short.MIN(-32768)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapClearPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(-32768 as short, 'smin');
      map.set(1 as short, 'one');
      map.clear();
      expect(map.size).assertEqual(0);
    });

  });
}
