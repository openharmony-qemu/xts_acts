/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import LightWeightMap from "@ohos.util.LightWeightMap";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { test005, test023, test027, test036, test037, test038, test039, test040, test048, test051, test053, test054 } from './LightWeightMapResource';
export default function LightWeightMapTest() {
describe("LightWeightMapTest",  ()=> {

  /**
   * @tc.name   testSet002
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0100
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(1, "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    let res = lightWeightMap.hasValue("A");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(true);
  });
            
  /**
   * @tc.name   testSet003
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0200
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set("a", "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<string, string>();
    lightWeightMap.set("a", "A");
    let res = lightWeightMap.hasValue("A");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey("a");
    expect(res1).assertEqual(true);
  });
            
  /**
   * @tc.name   testSet004
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0300
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set("a", "A").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, number[]>();
    let a = [1, 2, 3, 4];
    lightWeightMap.set(1, a);
    let res = lightWeightMap.hasValue(a);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(true);
  });
            
  /**
   * @tc.name   testSet005
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0400
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSet005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    expect(test005()).assertTrue();
  });
            
  /**
   * @tc.name   testGet006
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0500
   * @tc.desc   Get the corresponding value through the key. For example: lightWeightMap.get(4).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.get(4);
    expect(res).assertEqual("D");
  });
            
  /**
   * @tc.name   testLength007
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0600
   * @tc.desc   Get the number of key value pairs in the lightWeightMap instance. For example: lightWeightMap.length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testLength007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.length;
    expect(res).assertEqual(5);
  });
            
  /**
   * @tc.name   testHasAll008
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0700
   * @tc.desc   Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHasAll008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<string, string>();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap<string, string>();
    lightWeightMap1.set("a", "A");
    lightWeightMap1.set("d", "D");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(true);
  });
            
  /**
   * @tc.name   testHasKey009
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0800
   * @tc.desc   Determine whether the LightWeightMap contains the specified key. For example: lightWeightMap.hasKey("a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHasKey009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<string | number, string>();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let res = lightWeightMap.hasKey("a");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(false);
  });
              
  /**
   * @tc.name   testHasValue010
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_0900
   * @tc.desc   Determine whether the LightWeightMap contains the specified value.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testHasValue010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<string, string | number>();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let res = lightWeightMap.hasValue("A");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasValue(1);
    expect(res1).assertEqual(false);
  });
              
  /**
   * @tc.name   testIncreaseCapacityTo011
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1000
   * @tc.desc   Expand the LightWeightMap instance capacity to the specified value.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testIncreaseCapacityTo011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<string, string>();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    lightWeightMap.increaseCapacityTo(3);
    let length = lightWeightMap.length;
    expect(length).assertEqual(5);
  });
              
  /**
   * @tc.name   testEntries012
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1100
   * @tc.desc   Get all key value pairs collection in lightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testEntries012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.entries();
    expect(JSON.stringify(res.next().value)).assertEqual('[1,"A"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[2,"B"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[3,"C"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[4,"D"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[5,"E"]');
  });
              
  /**
   * @tc.name   testEntries013
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1200
   * @tc.desc   Get all key value pairs collection in lightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testEntries013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    let res = lightWeightMap.entries();
    expect(undefined).assertEqual(res.next().value);
  });
              
  /**
   * @tc.name   testGetIndexOfKey013
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1300
   * @tc.desc   Find the index of the key value pair according to the corresponding key.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetIndexOfKey013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getIndexOfKey(2);
    expect(res).assertEqual(1);
  });
              
  /**
   * @tc.name   testGetIndexOfKey014
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1400
   * @tc.desc   Find the index of the key value pair according to the corresponding key.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetIndexOfKey014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getIndexOfKey(6);
    expect(res).assertEqual(-1);
  });
              
  /**
   * @tc.name   testGetIndexOfValue014
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1500
   * @tc.desc   Find the index of the key value pair according to the corresponding value.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetIndexOfValue014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    lightWeightMap.setValueAt(4, "F");
    let res = lightWeightMap.getIndexOfValue("F");
    expect(res).assertEqual(4);
  });
              
    /**
     * @tc.name   testGetIndexOfValue015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1600
     * @tc.desc   Find the index of the key value pair according to the corresponding value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetIndexOfValue015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "A");
      lightWeightMap.set(2, "B");
      lightWeightMap.set(3, "C");
      lightWeightMap.set(4, "D");
      lightWeightMap.set(5, "E");
      let res = lightWeightMap.getIndexOfValue("G");
      expect(res).assertEqual(-1);
    });
              
  /**
   * @tc.name   testIsEmpty015
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1700
   * @tc.desc   Determine whether the LightWeightMap instance is empty. For example: lightWeightMap.isEmpty().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testIsEmpty015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    let res1 = lightWeightMap.isEmpty();
    expect(res1).assertEqual(true);
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res2 = lightWeightMap.isEmpty();
    expect(res2).assertEqual(false);
  });
              
  /**
   * @tc.name   testGetKeyAt016
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1800
   * @tc.desc   Find the key of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testGetKeyAt016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getKeyAt(1);
    expect(res).assertEqual(2);
  });
              
  /**
   * @tc.name   testKeys017
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_1900
   * @tc.desc   Get a collection of all the keys in the LightWeightMap. For example: lightWeightMap.keys().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testKeys017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.keys();
    expect(res.next().value).assertEqual(1);
    expect(res.next().value).assertEqual(2);
    expect(res.next().value).assertEqual(3);
    expect(res.next().value).assertEqual(4);
    expect(res.next().value).assertEqual(5);
  });
              
  /**
   * @tc.name   testSetAll018
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2000
   * @tc.desc   Copy key value pairs from one LightWeightMap to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testSetAll018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let lightWeightMap1 = new LightWeightMap<number, string>();
    lightWeightMap1.set(6, "A");
    lightWeightMap1.set(7, "B");
    lightWeightMap.setAll(lightWeightMap1);
    for (let i = 1; i < 8; i++) {
      expect(lightWeightMap.hasKey(i)).assertEqual(true);
    }
  });
              
  /**
   * @tc.name   testRemove019
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2100
   * @tc.desc   Delete key value pairs according to key. For example: lightWeightMap.remove(3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemove019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.remove(3);
    expect(res).assertEqual("C");
    let res1 = lightWeightMap.hasValue("C");
    expect(res1).assertEqual(false);
  });
              
  /**
   * @tc.name   testRemoveAt020
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2200
   * @tc.desc   Delete key value pairs according to index. For example: lightWeightMap.removeAt(1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveAt020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.removeAt(1);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasValue("A");
    expect(res1).assertEqual(true);
    let res2 = lightWeightMap.hasValue("B");
    expect(res2).assertEqual(false);
    let res3 = lightWeightMap.removeAt(10);
    expect(res3).assertEqual(false);
  });
              
  /**
   * @tc.name   testClear021
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2300
   * @tc.desc   Clear all key value pairs in LightWeightMap. For example: lightWeightMap.clear().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testClear021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    lightWeightMap.clear();
    let res = lightWeightMap.length;
    expect(res).assertEqual(0);
    let isEmpty = lightWeightMap.isEmpty();
    expect(isEmpty).assertEqual(true);
  });
              
  /**
   * @tc.name   testSetValueAt022
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2400
   * @tc.desc   Modify the value of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetValueAt022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    lightWeightMap.setValueAt(0, "a");
    let res = lightWeightMap.get(1);
    expect(res).assertEqual("a");
  });
              
  /**
   * @tc.name   testForEach023
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2500
   * @tc.desc   Traverse all key value pairs in the LightWeightMap instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testForEach023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test023()).assertTrue();
  });
              
  /**
   * @tc.name   testToString024
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2600
   * @tc.desc   Use "," to splice the elements in the LightWeightMap instance into a string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    let res = lightWeightMap.toString();
    expect(res).assertEqual("1:A,2:B,3:C");
  });
                
  /**
   * @tc.name   testValues025
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2700
   * @tc.desc   Get a collection of all the values in the LightWeightMap. For example: lightWeightMap.values().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testValues025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.values();
    expect(res.next().value).assertEqual("A");
    expect(res.next().value).assertEqual("B");
    expect(res.next().value).assertEqual("C");
    expect(res.next().value).assertEqual("D");
    expect(res.next().value).assertEqual("E");
  });
                
  /**
   * @tc.name   testGetValueAt026
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2800
   * @tc.desc   Get the value of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetValueAt026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getValueAt(1);
    expect(res).assertEqual("B");
  });
                
  /**
   * @tc.name   testIterator027
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_2900
   * @tc.desc   Iterate over all key value pairs in the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIterator027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test027()).assertTrue();
  });
                
  /**
   * @tc.name   testSet028
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3000
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(1, null).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, Object>();
    lightWeightMap.set(1, null);
    let res = lightWeightMap.hasValue(null);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(true);
  });
                
  /**
   * @tc.name   testSet029
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3100
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(null, null).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<Object, Object>();
    lightWeightMap.set(null, null);
    let res = lightWeightMap.hasValue(null);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(null);
    expect(res1).assertEqual(true);
  });
                
  /**
   * @tc.name   testSet030
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3200
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(true, false).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<boolean, boolean>();
    lightWeightMap.set(true, false);
    let res = lightWeightMap.hasValue(false);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(true);
    expect(res1).assertEqual(true);
  });
                
  /**
   * @tc.name   testSet031
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3300
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(1.23, 321).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    lightWeightMap.set(1.23, 321);
    let res = lightWeightMap.hasValue(321);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1.23);
    expect(res1).assertEqual(true);
  });
                
  /**
   * @tc.name   testHasAll032
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3400
   * @tc.desc   Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasAll032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<string, string>();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap<string, string>();
    lightWeightMap1.set("a1", "A1");
    lightWeightMap1.set("d1", "D1");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(false);
  });
                  
  /**
   * @tc.name   testHasAll033
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3500
   * @tc.desc   Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasAll033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<string, string>();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap<string, string>();
    lightWeightMap1.set("a", "A1");
    lightWeightMap1.set("d", "D1");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(false);
  });
                  
  /**
   * @tc.name   testRemove034
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3600
   * @tc.desc   Delete key value pairs according to key. For example: lightWeightMap.remove(3).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemove034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    let res = lightWeightMap.remove(3);
    expect(res).assertEqual(undefined);
  });
                  
  /**
   * @tc.name   testRemoveAt035
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3700
   * @tc.desc   Delete key value pairs according to index. For example: lightWeightMap.removeAt(1).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveAt035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    let res = lightWeightMap.removeAt(1);
    expect(res).assertEqual(false);
  });
                  
  /**
   * @tc.name   testIncreaseCapacityTo036
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3800
   * @tc.desc   Expand the LightWeightMap instance capacity to the specified value.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncreaseCapacityTo036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test036()).assertTrue();
  });
                  
  /**
   * @tc.name   testIncreaseCapacityTo037
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_3900
   * @tc.desc   Expand the LightWeightMap instance capacity to the specified value.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncreaseCapacityTo037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test037()).assertTrue();
  });
                  
  /**
   * @tc.name   testRemoveAt038
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4000
   * @tc.desc   Delete key value pairs according to index. For example: lightWeightMap.removeAt("a").
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testRemoveAt038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test038()).assertTrue();
  });
                  
  /**
   * @tc.name   testGetValueAt039
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4100
   * @tc.desc   Get the value of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetValueAt039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test039()).assertTrue();
  });
                  
  /**
   * @tc.name   testGetKeyAt040
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4200
   * @tc.desc   Find the key of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetKeyAt040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test040()).assertTrue();
  });
                  
  /**
   * @tc.name   testHasAll041
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4300
   * @tc.desc   Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasAll041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    let lightWeightMap1 = new LightWeightMap<number, number>();
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(true);
  });
                  
  /**
   * @tc.name   testSet042
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4400
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    for (let i = 0; i < 100; i++) {
      lightWeightMap.set(i, "A");
    }
    let res = lightWeightMap.get(99);
    expect(res).assertEqual("A");
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(100);
  });
                  
  /**
   * @tc.name   testSet043
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4500
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    for (let i = 0; i < 100; i++) {
      lightWeightMap.set(1, i);
    }
    let res = lightWeightMap.get(1);
    expect(res).assertEqual(99);
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(1);
  });
                  
  /**
   * @tc.name   testSet044
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4600
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    for (let i = 0; i < 100; i++) {
      lightWeightMap.set(i, i);
    }
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(100);
    for (let index = 0; index < 100; index++) {
      let resKey = lightWeightMap.hasKey(index);
      expect(resKey).assertEqual(true);
      let resValue = lightWeightMap.hasValue(index);
      expect(resValue).assertEqual(true);
    }
  });
                  
  /**
   * @tc.name   testSet045
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4700
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, number>();
    for (let i = 0; i < 500; i++) {
      lightWeightMap.set(i, i);
    }
    for (let i = -1; i > -501; i--) {
      lightWeightMap.set(i, i);
    }
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(1000);
    for (let index = 0; index < 500; index++) {
      let resKey = lightWeightMap.hasKey(index);
      expect(resKey).assertEqual(true);
      let resValue = lightWeightMap.hasValue(index);
      expect(resValue).assertEqual(true);
    }
    for (let i = -1; i > -501; i--) {
      let resKey = lightWeightMap.hasKey(i);
      expect(resKey).assertEqual(true);
      let resValue = lightWeightMap.hasValue(i);
      expect(resValue).assertEqual(true);
    }
  });
                  
  /**
   * @tc.name   testSet046
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4800
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<boolean, number>();
    lightWeightMap.set(true, 0.001);
    let res = lightWeightMap.hasValue(0.001);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(true);
    expect(res1).assertEqual(true);
  });
                  
  /**
   * @tc.name   testSet047
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_4900
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number[], number>();
    let a = [1, 2, 3, 4];
    lightWeightMap.set(a, 1);
    let res = lightWeightMap.hasValue(1);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(a);
    expect(res1).assertEqual(true);
  });
                  
  /**
   * @tc.name   testSet048
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5000
   * @tc.desc   Add a pair of key value pairs to the LightWeightMap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSet048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test048()).assertTrue();
  });
                  
  /**
   * @tc.name   testGet049
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5100
   * @tc.desc   Get the corresponding value through the key. For example: lightWeightMap.get(10).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGet049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.get(10);
    expect(res).assertEqual(undefined);
  });
                  
  /**
   * @tc.name   testHasAll050
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5200
   * @tc.desc   Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasAll050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<string, string>();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap<string, string>();
    lightWeightMap1.set("a", "A");
    lightWeightMap1.set("d", "D1");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.name   testHasAll051
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5300
   * @tc.desc   Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testHasAll051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test051()).assertTrue();
  });

  /**
   * @tc.name   testGetKeyAt052
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5400
   * @tc.desc   Find the key of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetKeyAt052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    try {
      let res = lightWeightMap.getKeyAt(6);
      expect().assertFail();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
    }
  });

  /**
   * @tc.name   testSetAll053
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5500
   * @tc.desc   Copy key value pairs from one LightWeightMap to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetAll053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test053()).assertTrue();
  });

  /**
   * @tc.name   testSetValueAt054
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5600
   * @tc.desc   Modify the value of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetValueAt054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    expect(test054()).assertTrue();
  });

  /**
   * @tc.name   testSetValueAt055
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5700
   * @tc.desc   Modify the value of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSetValueAt055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    try {
      lightWeightMap.setValueAt(3, "a");
      expect().assertFail();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 1. Received value is: 3`);
    }
  });

  /**
   * @tc.name   testGetValueAt056
   * @tc.number SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAPFP_5800
   * @tc.desc   Get the value of the key value pair according to the corresponding index.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testGetValueAt056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let lightWeightMap = new LightWeightMap<number, string>();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    try {
      lightWeightMap.getValueAt(6);
      expect().assertFail();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
    }
  });
});
}
