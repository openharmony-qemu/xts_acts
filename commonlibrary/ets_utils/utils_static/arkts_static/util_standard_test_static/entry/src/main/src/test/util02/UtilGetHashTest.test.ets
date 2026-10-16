'use static';

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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "../../../../hypium/index";
import util from "@ohos.util";
import Utils from "../Util.test";

interface HStr { name: string; }
interface HByte { b: byte; }
interface HInt { v: int; }
interface HDouble { v: double; }
interface HBig { big: bigint; }
interface HExtraNull { name: string; extra: string | null; }
interface HExtraUndef { name: string; extra: string | undefined; }
interface HBoolStr { flag: boolean; label: string; }
interface NField { v: int; }
interface HNestField { o: NField; }
interface HId { id: int; }
interface HNameAge { name: string; age: int; }

class HInner { v: int = 3; }
class HOuter { o: HInner = new HInner(); }
class HTags { tags: string[] = ["a", "b"]; }
class HCont {
  m: Map<string, int> = new Map<string, int>();
  s: Set<int> = new Set<int>();
}
class HSelf {
  tag: string = "loop";
  self: HSelf | null = null;
}
class HKlass { x: int = 3; y: string = "k"; }
class HNum { v: int = 1; }

class RecordData { tag: string = ""; }

export default function utilGetHashTest(): void {
  describe("UtilGetHashTest", (): void => {
    let detObjs: Object[] = [];
    detObjs.push({ name: "你好世界" } as HStr);
    detObjs.push({ name: "y".repeat(2048) } as HStr);
    detObjs.push({ big: 9223372036854775807n } as HBig);
    detObjs.push({ b: 127 } as HByte);
    detObjs.push({ v: 2147483647 } as HInt);
    detObjs.push({ v: -2147483648 } as HInt);
    detObjs.push({ v: Number.POSITIVE_INFINITY } as HDouble);
    detObjs.push({ v: Number.NEGATIVE_INFINITY } as HDouble);
    detObjs.push({ v: -0 } as HDouble);
    detObjs.push({ v: Number.MIN_VALUE } as HDouble);
    detObjs.push({ name: "x", extra: null } as HExtraNull);
    detObjs.push({ name: "x", extra: undefined } as HExtraUndef);
    detObjs.push({ flag: false, label: "hi" } as HBoolStr);
    detObjs.push(new HOuter());
    detObjs.push(new HTags());
    let cont: HCont = new HCont();
    cont.m.set("k", 1);
    cont.s.add(2);
    detObjs.push(cont);
    let self: HSelf = new HSelf();
    self.self = self;
    detObjs.push(self);
    detObjs.push(new Uint8Array(0));
    detObjs.push(new Uint8Array([255, 255, 255, 255]));

    let mapAb: Map<string, int> = new Map<string, int>();
    mapAb.set("k", 1);
    mapAb.set("j", 2);
    let mapAx: Map<string, int> = new Map<string, int>();
    mapAx.set("x", 1);
    let mapBx: Map<string, int> = new Map<string, int>();
    mapBx.set("x", 1);
    let setA2: Set<int> = new Set<int>();
    setA2.add(2);
    let setB5: Set<int> = new Set<int>();
    setB5.add(5);
    let numA: HNum = new HNum();
    numA.v = 1;
    let numB: HNum = new HNum();
    numB.v = 2;
    let diffA: Object[] = [
      new Date(86400000), new Date(0), new RegExp("mn*p", "g"), new RegExp("ab+c", "g"),
      { name: "equal" } as HStr, new Uint8Array([8, 9, 10]), new Uint8Array([3, 3, 3]),
      new Uint8Array([4, 5, 6]), { v: 2.5 } as HDouble, [1, 2, 3],
      [1, 2, 4], ["x", "y"], { "n": 1 } as Record<string, int>, { "x": 1 } as Record<string, int>,
      { "x": 1, "y": 2 } as Record<string, int>, mapAb, mapAx, setA2, setB5,
      new Int32Array([4, 5, 6]), numA, numB
    ];
    let diffB: Object[] = [
      new Date(86400000), new Date(1), new RegExp("mn*p", "g"), new RegExp("ab+c", "g"),
      { name: "equal" } as HStr, new Uint8Array([8, 9, 10]), new Uint8Array([3, 3, 4]),
      new Uint8Array([4, 5, 6]), { v: 2.5 } as HDouble, [1, 2, 3],
      [1, 2, 4], ["x", "z"], { "n": 2 } as Record<string, int>, { "y": 1 } as Record<string, int>,
      { "x": 1, "y": 2 } as Record<string, int>, mapAx, mapBx, setB5, setA2,
      new Int32Array([4, 5, 7]), numB, new HNum()
    ];

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0100
     * @tc.name testUtilGetHashTest001
     * @tc.desc Verify getHash throws BusinessError for null and undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nil: RecordData | null = null;
      try {
        util.getHash(nil);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let und: RecordData | undefined = undefined;
      try {
        util.getHash(und);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0200
     * @tc.name testUtilGetHashTest002
     * @tc.desc Verify getHash returns a long for various value-type objects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        { id: 5 } as HId,
        { name: "Jack", age: 20 } as HNameAge,
        { flag: true, label: "hi" } as HBoolStr
      ];
      for (let i = 0; i < objs.length; i++) {
        let h = util.getHash(objs[i]);
        expect(typeof h).assertEqual("long");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0300
     * @tc.name testUtilGetHashTest003
     * @tc.desc Verify getHash is deterministic for the same object part 1 (rows 0-9)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 10; i++) {
        expect(util.getHash(detObjs[i])).assertEqual(util.getHash(detObjs[i]));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0400
     * @tc.name testUtilGetHashTest004
     * @tc.desc Verify getHash is deterministic for the same object part 2 (rows 10-18)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 10; i < detObjs.length; i++) {
        expect(util.getHash(detObjs[i])).assertEqual(util.getHash(detObjs[i]));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0500
     * @tc.name testUtilGetHashTest005
     * @tc.desc Verify getHash is stable across in-place field/element mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: HInt = { v: 1 };
      let v1h1 = util.getHash(v1);
      v1.v = 99;
      expect(v1h1).assertEqual(util.getHash(v1));
      let v2: HStr = { name: "before" };
      let v2h1 = util.getHash(v2);
      v2.name = "after";
      expect(v2h1).assertEqual(util.getHash(v2));
      let arr1: int[] = [1, 2];
      let arr1h1 = util.getHash(arr1);
      arr1.push(3);
      expect(arr1h1).assertEqual(util.getHash(arr1));
      let arr2: int[] = [7, 8, 9];
      let arr2h1 = util.getHash(arr2);
      arr2.splice(0, arr2.length);
      expect(arr2h1).assertEqual(util.getHash(arr2));
      let m: Map<string, int> = new Map<string, int>();
      m.set("a", 1);
      let mh1 = util.getHash(m);
      m.set("b", 2);
      expect(mh1).assertEqual(util.getHash(m));
      let s: Set<int> = new Set<int>();
      s.add(1);
      let sh1 = util.getHash(s);
      s.add(2);
      expect(sh1).assertEqual(util.getHash(s));
      let u8: Uint8Array = new Uint8Array([1, 2, 3]);
      let u8h1 = util.getHash(u8);
      u8.$_set(0, 9);
      expect(u8h1).assertEqual(util.getHash(u8));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0600
     * @tc.name testUtilGetHashTest006
     * @tc.desc Verify the same object referenced via alias/array-ref/map-ref hashes equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: HStr = { name: "alias" };
      let alias: HStr = obj;
      expect(util.getHash(obj)).assertEqual(util.getHash(alias));
      let obj2: HStr = { name: "stored" };
      let arr: HStr[] = [obj2];
      expect(util.getHash(obj2)).assertEqual(util.getHash(arr[0]));
      let obj3: HStr = { name: "mapped" };
      let m: Map<string, HStr> = new Map<string, HStr>();
      m.set("o", obj3);
      expect(util.getHash(obj3)).assertEqual(util.getHash(m.get("o")));
      let a: HStr = { tag: "first" } as HStr;
      expect(util.getHash(a)).assertEqual(util.getHash(a));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0700
     * @tc.name testUtilGetHashTest007
     * @tc.desc Verify distinct objects yield different hashes part 1 (pairs 0-9)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 10; i++) {
        let distinct: boolean = util.getHash(diffA[i]) !== util.getHash(diffB[i]);
        expect(distinct).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0800
     * @tc.name testUtilGetHashTest008
     * @tc.desc Verify distinct objects yield different hashes part 2 (pairs 10-19)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 10; i < 20; i++) {
        let distinct: boolean = util.getHash(diffA[i]) !== util.getHash(diffB[i]);
        expect(distinct).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_0900
     * @tc.name testUtilGetHashTest009
     * @tc.desc Verify distinct objects yield different hashes part 3 (pairs 20-21)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 20; i < diffA.length; i++) {
        let distinct: boolean = util.getHash(diffA[i]) !== util.getHash(diffB[i]);
        expect(distinct).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_1000
     * @tc.name testUtilGetHashTest010
     * @tc.desc Verify getHash yields a non-zero hash for empty containers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      expect(util.getHash(arr) !== 0).assertTrue();
      let m: Map<string, int> = new Map<string, int>();
      expect(util.getHash(m) !== 0).assertTrue();
      let s: Set<int> = new Set<int>();
      expect(util.getHash(s) !== 0).assertTrue();
      let rec: Record<string, int> = {};
      expect(util.getHash(rec) !== 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_1100
     * @tc.name testUtilGetHashTest011
     * @tc.desc Verify getHash is deterministic for large collections
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = {};
      for (let i = 0; i < 1000; i++) {
        rec["k" + i] = i;
      }
      expect(util.getHash(rec)).assertEqual(util.getHash(rec));
      let bigArr: int[] = [];
      for (let i = 0; i < 2000; i++) {
        bigArr.push(i);
      }
      expect(util.getHash(bigArr)).assertEqual(util.getHash(bigArr));
      let bigSet: Set<int> = new Set<int>();
      for (let i = 0; i < 2000; i++) {
        bigSet.add(i);
      }
      expect(util.getHash(bigSet)).assertEqual(util.getHash(bigSet));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_1200
     * @tc.name testUtilGetHashTest012
     * @tc.desc Verify getHash does not mutate primitive/object fields
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: HStr = { name: "Jack" } as HStr;
      util.getHash(p);
      expect((p as HStr).name).assertEqual("Jack");
      let k: HKlass = new HKlass();
      util.getHash(k);
      expect(k.x).assertEqual(3);
      expect(k.y).assertEqual("k");
      let lbl: HStr = { name: "keep" } as HStr;
      util.getHash(lbl);
      expect(lbl.name).assertEqual("keep");
      let flag: HBoolStr = { flag: false, label: "x" };
      util.getHash(flag);
      expect(flag.flag).assertFalse();
      let ratio: HDouble = { v: 2.5 };
      util.getHash(ratio);
      expect(ratio.v).assertEqual(2.5);
      let nest: HNestField = { o: { v: 11 } };
      util.getHash(nest);
      expect(nest.o.v).assertEqual(11);
      let re: RegExp = new RegExp("a*b", "i");
      util.getHash(re);
      expect(re.source).assertEqual("a*b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_1300
     * @tc.name testUtilGetHashTest013
     * @tc.desc Verify getHash does not mutate containers part 1 (array elements/length, Map size/entry)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [7, 8, 9];
      util.getHash(arr);
      expect(arr[0]).assertEqual(7);
      expect(arr[2]).assertEqual(9);
      let arrLen: int[] = [1, 2, 3, 4];
      util.getHash(arrLen);
      expect(arrLen.length).assertEqual(4);
      let negArr: int[] = [5, 0, -5];
      util.getHash(negArr);
      expect(negArr[0]).assertEqual(5);
      expect(negArr[2]).assertEqual(-5);
      let m: Map<string, int> = new Map<string, int>();
      m.set("a", 1);
      m.set("b", 2);
      util.getHash(m);
      expect(m.size).assertEqual(2);
      let mv: Map<string, int> = new Map<string, int>();
      mv.set("k", 42);
      util.getHash(mv);
      expect(mv.get("k") as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GET_HASH_1400
     * @tc.name testUtilGetHashTest014
     * @tc.desc Verify getHash does not mutate containers part 2 (Set size/has, Date, Uint8Array, empty Record)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGetHashTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      util.getHash(s);
      expect(s.size).assertEqual(2);
      let ss: Set<string> = new Set<string>();
      ss.add("z");
      util.getHash(ss);
      expect(ss.has("z")).assertTrue();
      let d: Date = new Date(86400000);
      util.getHash(d);
      expect(d.getTime()).assertEqual(86400000);
      let u8: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      util.getHash(u8);
      expect(u8.byteLength).assertEqual(4);
      expect(u8.$_get(0)).assertEqual(1);
      expect(u8.$_get(2)).assertEqual(3);
      let emptyRec: Record<string, int> = {};
      util.getHash(emptyRec);
      let keys: string[] = Object.keys(emptyRec);
      expect(keys.length).assertEqual(0);
    });

  });
}
