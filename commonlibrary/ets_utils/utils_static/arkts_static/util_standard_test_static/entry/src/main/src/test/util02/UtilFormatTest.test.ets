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

interface St2 { x: int; }
interface Inner2 { city: string; }
interface Outer2 { name: string; inner: Inner2; }
interface Pp { id: int; }
interface NameStr { name: string; }
interface NameAge { name: string; age: int; }
interface AddressBox { city: string; }
interface Person { name: string; address: AddressBox; }
interface NameCount { name: string; count: int; }
interface VBox { v: int; }

export default function utilFormatTest(): void {
  describe("UtilFormatTest", (): void => {
    const jObj: Record<string, int | string> = { "name": "John", "age": 20 };
    const jArr: Array<string | int> = ["a", 1];
    const emptyRec: Record<string, int> = {};
    const jPipe: Record<string, int> = { "k": 1 };
    const jUndef: Record<string, string | undefined> = { "a": undefined };
    const jNaN: Record<string, double> = { "n": Number.NaN };
    const jInf: Record<string, double> = { "inf": Number.POSITIVE_INFINITY };
    const jNeg0: Record<string, double> = { "z": -0.0 };
    const jArrNaN: double[] = [Number.NaN];
    const jArrNeg0: double[] = [-0.0];
    const jNestedArr: Array<int[]> = [[1, 2], [3, 4]];

    const runs: (() => string)[] = [
      (): string => util.format("Hello world"),
      (): string => util.format("%s"),
      (): string => util.format("value: %s", "ok"),
      (): string => util.format("%s-%s", "a", "b"),
      (): string => util.format("%s.%s.%s", "x", "y", "z"),
      (): string => util.format("%s|%s|%s|%s|%s|%s", "1", "2", "3", "4", "5", "6"),
      (): string => util.format("%"),
      (): string => util.format("%s", "hello"),
      (): string => util.format("%s", -0.0),
      (): string => util.format("%s", "<script>alert(1)</script>"),
      (): string => util.format("%i", 100.5),
      (): string => util.format("%i", "123"),
      (): string => util.format("%i", "-45"),
      (): string => util.format("%d", 10.5),
      (): string => util.format("%f", 3.141592653),
      (): string => util.format("%f", 2.5),
      (): string => util.format("%j", jObj),
      (): string => util.format("%j", "hi"),
      (): string => util.format("%j", jArr),
      (): string => util.format("%s %d %i %f", "a", 5, 7.7, 1.25),
      (): string => util.format("hello"),
      (): string => util.format(""),
      (): string => util.format("%s%s%s%s%s", "a", "b", "c", "d", "e"),
      (): string => util.format("你好 %s", "世界"),
      (): string => util.format("emoji:%s", "😀"),
      (): string => util.format("line1\nline2"),
      (): string => util.format("<script>%s</script>", "x"),
      (): string => util.format("a%b"),
      (): string => util.format("%s-%d-%i-%f", "a", 10, 10.9, 1.5),
      (): string => util.format("数量：%d 个", 5),
      (): string => util.format("%s", 42),
      (): string => util.format("%s", true),
      (): string => util.format("%s", false),
      (): string => util.format("%s", 123456.789),
      (): string => util.format("[%s]", ""),
      (): string => util.format("The number is %d", 10.5),
      (): string => util.format("%d", "99"),
      (): string => util.format("The number is %i", 100.5),
      (): string => util.format("The value of pi is %f", 3.141592653),
      (): string => util.format("%%"),
      (): string => util.format("%s", "a\nb"),
      (): string => util.format("%s", 1e-7),
      (): string => util.format("%s", Number.MIN_VALUE),
      (): string => util.format("%s", Number.MAX_VALUE),
      (): string => util.format("%s", 0.1 + 0.2),
      (): string => util.format("%d", 9007199254740991),
      (): string => util.format("%d", "9007199254740993"),
      (): string => util.format("%i", -2.7),
      (): string => util.format("%d", "  42"),
      (): string => util.format("%i", "12.9"),
      (): string => util.format("%i", "+42"),
      (): string => util.format("%O"),
      (): string => util.format("%s %d", "x"),
      (): string => util.format("%s,%s,%s", "x", "x", "x"),
      (): string => util.format("%i %i", 7, 7),
      (): string => util.format("%j", jUndef),
      (): string => util.format("%j", jNaN),
      (): string => util.format("%j", jInf),
      (): string => util.format("%j", jNeg0),
      (): string => util.format("%j", jArrNaN),
      (): string => util.format("%j", jArrNeg0),
      (): string => util.format("%j", true),
      (): string => util.format("%j", jNestedArr),
      (): string => util.format("%j|%j", jPipe, jPipe),
      (): string => util.format("%j", emptyRec),
      (): string => util.format("%s", "😀"),
      (): string => util.format("%s", "  x  "),
      (): string => util.format("%s", -0.5),
      (): string => util.format("%i", 0.9999999),
      (): string => util.format("%i", 2147483647.9),
      (): string => util.format("%i", -2147483648.9),
      (): string => util.format("%d", 2147483647.9),
      (): string => util.format("%d", -1.5),
      (): string => util.format("start-%d-end", 3),
      (): string => util.format("%s%s", "A", "B"),
      (): string => util.format("%i-%f", 6.6, 1.25),
      (): string => util.format("%j-%i", { "n": 4 } as Record<string, int>, 2.9),
      (): string => util.format("%s%s%s%s%s%s%s%s", "1", "2", "3", "4", "5", "6", "7", "8"),
      (): string => util.format("%d%%%s", 5, "x"),
      (): string => util.format("%s-%d-%i", "a", 2, 3.9)
    ];
    const expected: string[] = [
      "Hello world", "%s", "value: ok", "a-b", "x.y.z", "1|2|3|4|5|6",
      "%", "hello", "0", "<script>alert(1)</script>", "100", "123", "-45",
      "10.5", "3.141592653", "2.5", '{"name":"John","age":20}', '"hi"', '["a",1]',
      "a 5 7 1.25", "hello", "", "abcde", "你好 世界", "emoji:😀", "line1\nline2",
      "<script>x</script>", "a%b", "a-10-10-1.5", "数量：5 个", "42", "true", "false",
      "123456.789", "[]", "The number is 10.5", "99", "The number is 100",
      "The value of pi is 3.141592653", "%", "a\nb", "1e-7", "5e-324",
      "1.7976931348623157e+308", "0.30000000000000004", "9007199254740991",
      "9007199254740992", "-2", "42", "12", "42", "%O", "x %d", "x,x,x", "7 7",
      "{}", '{"n":null}', '{"inf":null}', '{"z":0}', "[null]", "[0]", "true",
      "[[1,2],[3,4]]", '{"k":1}|{"k":1}', "{}", "😀", "  x  ", "-0.5", "0",
      "2147483647", "-2147483648", "2147483647.9", "-1.5", "start-3-end", "AB",
      "6-1.25", '{"n":4}-2', "12345678", "5%x", "a-2-3"
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0100
     * @tc.name testUtilFormatTest001
     * @tc.desc Verify util.format exact output slice 1 (rows 0-9)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 10; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0200
     * @tc.name testUtilFormatTest002
     * @tc.desc Verify util.format exact output slice 2 (rows 10-19)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 10; i < 20; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0300
     * @tc.name testUtilFormatTest003
     * @tc.desc Verify util.format exact output slice 3 (rows 20-29)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 20; i < 30; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0400
     * @tc.name testUtilFormatTest004
     * @tc.desc Verify util.format exact output slice 4 (rows 30-39)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 30; i < 40; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0500
     * @tc.name testUtilFormatTest005
     * @tc.desc Verify util.format exact output slice 5 (rows 40-49)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 40; i < 50; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0600
     * @tc.name testUtilFormatTest006
     * @tc.desc Verify util.format exact output slice 6 (rows 50-59)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 50; i < 60; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0700
     * @tc.name testUtilFormatTest007
     * @tc.desc Verify util.format exact output slice 7 (rows 60-69)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 60; i < 70; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0800
     * @tc.name testUtilFormatTest008
     * @tc.desc Verify util.format exact output slice 8 (rows 70-79)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 70; i < 80; i++) {
        expect(runs[i]()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_0900
     * @tc.name testUtilFormatTest009
     * @tc.desc Verify util.format return type is string for several inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof util.format("hi")).assertEqual("string");
      expect(typeof util.format("")).assertEqual("string");
      expect(typeof util.format("%s", "x")).assertEqual("string");
      expect(typeof util.format("y".repeat(5000))).assertEqual("string");
      expect(typeof util.format("%d", 1)).assertEqual("string");
      expect(typeof util.format("%j", { "a": 1 } as Record<string, int>)).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1000
     * @tc.name testUtilFormatTest010
     * @tc.desc Verify util.format consumes/produces non-placeholder output for bigint and unparseable %i/%o/%O args
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(util.format("%s", 10n) !== "%s").assertTrue();
      expect(util.format("%i", "") !== "%i").assertTrue();
      expect(util.format("%i", "0x10") !== "%i").assertTrue();
      expect(util.format("%o", 10n) !== "%o").assertTrue();
      expect(util.format("%O", 10n) !== "%O").assertTrue();
      let consumed: boolean = false;
      try {
        let result: string = util.format("%j", 10n);
        consumed = result !== "%j";
      } catch (e) {
        consumed = true;
      }
      expect(consumed).assertTrue();
      const fr: string = "%s!";
      expect(util.format(fr, "hi") !== fr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1100
     * @tc.name testUtilFormatTest011
     * @tc.desc Verify %j on a cyclic structure throws StackOverflowError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cyc: Object[] = [1];
      cyc.push(cyc);
      let threw: boolean = false;
      try {
        util.format("%j", cyc);
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual("std.core.StackOverflowError");
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1200
     * @tc.name testUtilFormatTest012
     * @tc.desc Verify util.format return type and length properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lf: string = "y".repeat(5000);
      expect(typeof util.format(lf)).assertEqual("string");
      expect(util.format("hello").length).assertEqual(5);
      const jl: Record<string, int> = { "a": 1, "b": 2 };
      expect(util.format("%j", jl).length).assertEqual(JSON.stringify(jl).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1300
     * @tc.name testUtilFormatTest013
     * @tc.desc Verify %o/%O/%c substring behaviors
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p3: NameStr = { name: "John" };
      expect(util.format("%o", p3).includes("__proto__")).assertFalse();
      const p4: NameStr = { name: "John" };
      expect(util.format("%O", p4).includes("name")).assertTrue();
      const p5: NameAge = { name: "John", age: 20 };
      expect(util.format("%o", p5)).assertEqual(util.format("%O", p5));
      const oarr: int[] = [1, 2, 3];
      expect(util.format("%o", oarr).includes("2")).assertTrue();
      const p6: Person = { name: "John", address: { city: "NY" } };
      expect(util.format("%O", p6).includes("NY")).assertTrue();
      expect(util.format("%c%s", "red", "hello").includes("hello")).assertTrue();
      const pp: Pp = { id: 2 };
      expect(util.format("%o|%O", pp, pp).includes("id")).assertTrue();
      const po: Record<string, int> = { "k": 1 };
      expect(util.format("%s%d%i%f%j%o%O%c", "a", 1, 2.9, 3.5, po, po, po, "red").includes('{"k":1}')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1400
     * @tc.name testUtilFormatTest014
     * @tc.desc Verify util.format does not mutate inputs part 1 (template, int, string, boolean, Map size)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fs: string = "wrap %s";
      util.format(fs, "v");
      expect(fs).assertEqual("wrap %s");

      let iv: int = 7;
      util.format("%d", iv);
      expect(iv).assertEqual(7);

      const sv: string = "payload";
      util.format("%s", sv);
      expect(sv).assertEqual("payload");

      let bv: boolean = true;
      util.format("%s", bv);
      expect(bv).assertTrue();

      const mm: Map<string, int> = new Map<string, int>();
      mm.set("a", 1);
      const sz: int = mm.size;
      util.format("%s", mm);
      expect(mm.size).assertEqual(sz);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1500
     * @tc.name testUtilFormatTest015
     * @tc.desc Verify util.format does not mutate inputs part 2 (array, object field, Date, RegExp, nested, array element, object name)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sa: int[] = [4, 5];
      const len: int = sa.length;
      util.format("%O", sa);
      expect(sa.length).assertEqual(len);
      expect(sa[0]).assertEqual(4);

      const st2: St2 = { x: 5 };
      util.format("%o", st2);
      expect(st2.x).assertEqual(5);

      const dt: Date = new Date(1000);
      const t: number = dt.getTime();
      util.format("%s", dt);
      expect(dt.getTime()).assertEqual(t);

      const re: RegExp = new RegExp("ab+c");
      const src: string = re.source;
      util.format("%s", re);
      expect(re.source).assertEqual(src);

      const ou: Outer2 = { name: "a", inner: { city: "b" } };
      util.format("%j", ou);
      expect(ou.inner.city).assertEqual("b");

      const ia: int[] = [1, 2, 3];
      const b0: int = ia[0];
      util.format("%s", ia);
      expect(ia[0]).assertEqual(b0);

      const p8: NameStr = { name: "John" };
      util.format("%O", p8);
      expect(p8.name).assertEqual("John");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1600
     * @tc.name testUtilFormatTest016
     * @tc.desc Verify util.format is deterministic for repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(util.format("%s-%d", "k", 3)).assertEqual(util.format("%s-%d", "k", 3));
      const jo: Record<string, int> = { "a": 1 };
      expect(util.format("%j", jo)).assertEqual(util.format("%j", jo));
      expect(util.format("%i", 7.9)).assertEqual(util.format("%i", 7.9));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1700
     * @tc.name testUtilFormatTest017
     * @tc.desc Verify %j/%s snapshots are independent of later mutation but later calls reflect mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sn: NameCount = { name: "a", count: 1 };
      const snap1: string = util.format("%j", sn);
      sn.count = 9;
      expect(snap1).assertEqual('{"name":"a","count":1}');

      const mo: VBox = { v: 1 };
      util.format("%j", mo);
      mo.v = 9;
      expect(util.format("%j", mo).includes("9")).assertTrue();

      const ar: int[] = [1];
      util.format("%s", ar);
      ar.push(2);
      expect(util.format("%s", ar)).assertEqual("1,2");

      const sarr: int[] = [1, 2];
      const snap2: string = util.format("%s", sarr);
      sarr.push(3);
      expect(snap2).assertEqual("1,2");

      const mp2: Map<string, int> = new Map<string, int>();
      mp2.set("a", 1);
      util.format("%s", mp2);
      mp2.set("b", 2);
      expect(util.format("%s", mp2).includes("b")).assertTrue();

      let ss: string = "old";
      util.format("%s", ss);
      ss = "new";
      expect(util.format("%s", ss)).assertEqual("new");

      let nv: int = 1;
      util.format("%d", nv);
      nv = 12;
      expect(util.format("%d", nv)).assertEqual("12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1800
     * @tc.name testUtilFormatTest018
     * @tc.desc Verify nested util.format calls compose correctly part 1 (rows 0-9)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: (() => string)[] = [
        (): string => util.format(util.format("inner")),
        (): string => util.format("[%s]", util.format("%s", "x")),
        (): string => util.format("%s", util.format("%s", util.format("%s", "d"))),
        (): string => util.format("json=%s", util.format("%j", { "a": 1 } as Record<string, int>)),
        (): string => util.format("%i", util.format("%f", "3.7")),
        (): string => util.format("[%s]", util.format("")),
        (): string => util.format(util.format("%%")),
        (): string => util.format("%s", util.format("%s", "abc".repeat(50))),
        (): string => util.format("pre-%s-post", util.format("%s", "mid")),
        (): string => util.format("%j", util.format("%s", "txt"))
      ];
      const expectedNested: string[] = [
        "inner", "[x]", "d", 'json={"a":1}', "3", "[]", "%", "abc".repeat(50),
        "pre-mid-post", '"txt"'
      ];
      for (let i = 0; i < nested.length; i++) {
        expect(nested[i]()).assertEqual(expectedNested[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_1900
     * @tc.name testUtilFormatTest019
     * @tc.desc Verify nested util.format calls compose correctly part 2 (rows 10-12 plus template composition)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested2: (() => string)[] = [
        (): string => util.format("%d", util.format("%d", 8)),
        (): string => util.format("%f", util.format("%f", 2.25)),
        (): string => util.format("%j", [util.format("%d", 3)] as Array<string>)
      ];
      const expectedNested2: string[] = ["8", "2.25", '["3"]'];
      for (let i = 0; i < nested2.length; i++) {
        expect(nested2[i]()).assertEqual(expectedNested2[i]);
      }
      const ftpl: string = util.format("A%s", "%d");
      expect(util.format(ftpl, 5)).assertEqual("A5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_2000
     * @tc.name testUtilFormatTest020
     * @tc.desc Verify util.format in loops accumulates correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc: string = "";
      for (let i = 1; i <= 5; i++) {
        acc = acc + util.format("%d", i);
      }
      expect(acc).assertEqual("12345");

      const resBox: string[] = [];
      for (let n = 1; n <= 3; n++) {
        resBox.push(util.format("n=%d", n));
      }
      expect(resBox[0]).assertEqual("n=1");

      const tmpl: string = "%d-%d";
      let out: string = "";
      for (let p = 1; p <= 3; p++) {
        out = out + util.format(tmpl, p, p + 1);
      }
      expect(out).assertEqual("1-22-33-4");

      let res: string = "";
      for (let q = 1; q <= 2; q++) {
        if (q === 1) {
          res = res + util.format("%s", "x");
        } else {
          res = res + util.format("%i", q);
        }
      }
      expect(res).assertEqual("x2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_FORMAT_2100
     * @tc.name testUtilFormatTest021
     * @tc.desc Verify specifier comparisons (%d vs %i, %i vs %f, %s vs %d, %s vs %f, %i vs %f, %d vs %i bigint, %f vs %d)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilFormatTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(util.format("%d", 10.5) !== util.format("%i", 10.5)).assertTrue();
      expect(util.format("%i", 9.9) !== util.format("%f", 9.9)).assertTrue();
      expect(util.format("%s", true) !== util.format("%d", true)).assertTrue();
      expect(util.format("%s", 3.5)).assertEqual(util.format("%f", 3.5));
      expect(util.format("%i", "4.75") !== util.format("%f", "4.75")).assertTrue();
      expect(util.format("%d", 999n)).assertEqual(util.format("%i", 999n));
      expect(util.format("%f", 17)).assertEqual(util.format("%d", 17));
    });

  });
}
