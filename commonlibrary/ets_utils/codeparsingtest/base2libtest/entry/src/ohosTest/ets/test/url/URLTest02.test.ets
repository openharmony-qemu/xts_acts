import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { uri, url } from '@kit.ArkTS';

const URL = url.URL

export default function URL02Test() {
  describe('URL02Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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

    // =============== searchParams ======================
    /**
     * @tc.number SUB_URL_TEST02_0100
     * @tc.name testURL02Chapter0001
     * @tc.desc Test URL.searchParams parses query string with ASCII, special chars, escapes, emojis
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ascii: string =
        "!\"#$%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const escapes: string = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\x41\\123";
      const emojis: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const url =
        URL.parseURL(`https://example.com/?ascii=${encodeURIComponent(ascii)}&escapes=${encodeURIComponent(escapes)}&emojis=${encodeURIComponent(emojis)}`);
      const params: url.URLParams = url.params;
      expect(params.get("ascii")).assertEqual(ascii);
      expect(params.get("escapes")).assertEqual(escapes);
      expect(params.get("emojis")).assertEqual(emojis);
    });

    /**
     * @tc.number SUB_URL_TEST02_0200
     * @tc.name testURL02Chapter0002
     * @tc.desc Test URL.searchParams parses numeric boundary values as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: [string, string][] = [
        ["int8_min", "-128"],
        ["int8_max", "127"],
        ["int8_under", "-129"],
        ["int8_over", "128"],
        ["uint8_min", "0"],
        ["uint8_max", "255"],
        ["uint8_under", "-1"],
        ["uint8_over", "256"],
        ["int16_min", "-32768"],
        ["int16_max", "32767"],
        ["int16_under", "-32769"],
        ["int16_over", "32768"],
        ["uint16_min", "0"],
        ["uint16_max", "65535"],
        ["uint16_under", "-1"],
        ["uint16_over", "65536"],
        ["int32_min", "-2147483648"],
        ["int32_max", "2147483647"],
        ["int32_under", "-2147483649"],
        ["int32_over", "2147483648"],
        ["uint32_min", "0"],
        ["uint32_max", "4294967295"],
        ["uint32_under", "-1"],
        ["uint32_over", "4294967296"],
        ["float32_min", "-3.4028234663852886e38"],
        ["float32_max", "3.4028234663852886e38"],
        ["float32_under", "-3.5e38"],
        ["float32_over", "3.5e38"],
        ["float64_min", "-1.7976931348623157e308"],
        ["float64_max", "1.7976931348623157e308"],
        ["float64_under", "-1.8e308"],
        ["float64_over", "1.8e308"],
        ["bigint64_min", "-9223372036854775808"],
        ["bigint64_max", "9223372036854775807"],
        ["bigint64_under", "-9223372036854775809"],
        ["bigint64_over", "9223372036854775808"],
        ["biguint64_min", "0"],
        ["biguint64_max", "18446744073709551615"],
        ["biguint64_over", "18446744073709551616"]
      ];
      const query: string = pairs.map((pair: [string, string]): string => {
        const k: string = pair[0];
        const v: string = pair[1];
        return `${encodeURIComponent(k)}=${encodeURIComponent(v)}`;
      }).join("&");
      const url = URL.parseURL(`https://example.com/?${query}`);
      const params: url.URLParams = url.params;
      for (const pair of pairs) {
        const k: string = pair[0];
        const v: string = pair[1];
        expect(params.get(k)).assertEqual(v);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_0300
     * @tc.name testURL02Chapter0003
     * @tc.desc Test URL.searchParams parses special number strings (Infinity, NaN, -0, scientific)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: [string, string][] = [
        ["inf", "Infinity"],
        ["neginf", "-Infinity"],
        ["nan", "NaN"],
        ["zero", "0"],
        ["negzero", "-0"],
        ["sci1", "1e3"],
        ["sci2", "2.5e-2"],
        ["max_value", "1.7976931348623157e+308"],
        ["min_value", "5e-324"],
        ["epsilon", "2.220446049250313e-16"],
        ["max_safe", "9007199254740991"]
      ];
      const query: string = pairs.map((pair: [string, string]): string => {
        const k: string = pair[0];
        const v: string = pair[1];
        return `${k}=${encodeURIComponent(v)}`;
      }).join("&");
      const url = URL.parseURL(`https://example.com/?${query}`);
      const params: url.URLParams = url.params;
      for (const pair of pairs) {
        const k: string = pair[0];
        const v: string = pair[1];
        expect(params.get(k)).assertEqual(v);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_0400
     * @tc.name testURL02Chapter0004
     * @tc.desc Test URL.searchParams handles invalid Unicode (lone surrogates) without crashing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidEncoded: string = "%ED%B0%84%ED%A0%BD%ED%BF%B4";
      const url = URL.parseURL(`https://example.com/?invalid=${invalidEncoded}`);
      const params: url.URLParams = url.params;
      const decodedValue: string | null = params.get("invalid");

      expect(decodedValue !== null).assertTrue();
    });

    /**
     * @tc.number SUB_URL_TEST02_0500
     * @tc.name testURL02Chapter0005
     * @tc.desc Test URL.searchParams allows modification via append/set and reflects in URL.search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1");
      const params: url.URLParams = url.params;
      params.append("b", "2");
      expect(url.search).assertEqual("?a=1&b=2");
      params.set("a", "10");
      expect(url.search).assertEqual("?a=10&b=2");
      params.delete("b");
      expect(url.search).assertEqual("?a=10");
    });

    /**
     * @tc.number SUB_URL_TEST02_0600
     * @tc.name testURL02Chapter0006
     * @tc.desc Test URL.searchParams.getAll returns multiple values for same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?key=1&key=2&key=3");
      const params: url.URLParams = url.params;
      const result: string[] = params.getAll("key");

      expect(result.length).assertEqual(3);

      expect(result[0]).assertEqual("1");
      expect(result[1]).assertEqual("2");
      expect(result[2]).assertEqual("3");

      expect(result.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_URL_TEST02_0700
     * @tc.name testURL02Chapter0007
     * @tc.desc Test URL.searchParams.forEach iterates all entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?x=1&y=2&x=3");
      const params: url.URLParams = url.params;
      const entries: [string, string][] = [];
      params.forEach((value: string, key: string): void => {
        entries.push([key, value]);
      });

      expect(entries.length).assertEqual(3);

      expect(entries[0][0]).assertEqual("x");
      expect(entries[0][1]).assertEqual("1");

      expect(entries[1][0]).assertEqual("y");
      expect(entries[1][1]).assertEqual("2");

      expect(entries[2][0]).assertEqual("x");
      expect(entries[2][1]).assertEqual("3");
    });
    /**
     * @tc.number SUB_URL_TEST02_0800
     * @tc.name testURL02Chapter0008
     * @tc.desc Test URL.searchParams handles escape sequences correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const escapes: string = "\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\x41\\123";
      const encoded: string = encodeURIComponent(escapes);
      const url = URL.parseURL(`https://example.com/?escapes=${encoded}`);
      const params: url.URLParams = url.params;
      expect(params.get("escapes")).assertEqual(escapes);
    });

    /**
     * @tc.number SUB_URL_TEST02_0900
     * @tc.name testURL02Chapter0009
     * @tc.desc Test URL.searchParams handles emojis and Unicode characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojis: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const encoded: string = encodeURIComponent(emojis);
      const url = URL.parseURL(`https://example.com/?emojis=${encoded}`);
      const params: url.URLParams = url.params;
      expect(params.get("emojis")).assertEqual(emojis);
    });

    /**
     * @tc.number SUB_URL_TEST02_1000
     * @tc.name testURL02Chapter0010
     * @tc.desc Test URL.searchParams handles very long string values (treeString)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longValue: string = "a".repeat(100000);
      const encoded: string = encodeURIComponent(longValue);
      const url = URL.parseURL(`https://example.com/?long=${encoded}`);
      const params: url.URLParams = url.params;
      expect(params.get("long")).assertEqual(longValue);
    });

    /**
     * @tc.number SUB_URL_TEST02_1100
     * @tc.name testURL02Chapter0011
     * @tc.desc Test URL.searchParams handles substring values (sliceString)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = "{k1:value1,k2:value2}";
      const sliced: string = original.substring(0, original.length - 2);
      const encoded: string = encodeURIComponent(sliced);
      const url = URL.parseURL(`https://example.com/?sliced=${encoded}`);
      const params: url.URLParams = url.params;
      expect(params.get("sliced")).assertEqual(sliced);
    });

    /**
     * @tc.number SUB_URL_TEST02_1200
     * @tc.name testURL02Chapter0012
     * @tc.desc Test URL.searchParams handles JSON stringified object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      interface TestObject {
        a: number;
        b: string;
        c: number[];
      }

      const obj: TestObject = { a: 1, b: "test", c: [1, 2, 3] };
      const jsonStr: string = JSON.stringify(obj);
      const encoded: string = encodeURIComponent(jsonStr);
      const url = URL.parseURL(`https://example.com/?obj=${encoded}`);
      const params: url.URLParams = url.params;
      expect(params.get("obj")).assertEqual(jsonStr);
    });

    /**
     * @tc.number SUB_URL_TEST02_1300
     * @tc.name testURL02Chapter0013
     * @tc.desc Test URL.searchParams handles array string representation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrStr: string = "[72,101,108,108,111]";
      const encoded: string = encodeURIComponent(arrStr);
      const url = URL.parseURL(`https://example.com/?arr=${encoded}`);
      const params: url.URLParams = url.params;
      expect(params.get("arr")).assertEqual(arrStr);
    });

    /**
     * @tc.number SUB_URL_TEST02_1400
     * @tc.name testURL02Chapter0014
     * @tc.desc Test URL.searchParams handles numeric strings in various formats (hex, octal, scientific, bigint)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url =
        URL.parseURL("https://example.com/?hex=0x0102&octal=0o123&binary=0b1010&sci=1e3&decimal=123.456&bigint=12345678901234567890");
      const params: url.URLParams = url.params;
      expect(params.get("hex")).assertEqual("0x0102");
      expect(params.get("octal")).assertEqual("0o123");
      expect(params.get("binary")).assertEqual("0b1010");
      expect(params.get("sci")).assertEqual("1e3");
      expect(params.get("decimal")).assertEqual("123.456");
      expect(params.get("bigint")).assertEqual("12345678901234567890");
    });

    /**
     * @tc.number SUB_URL_TEST02_1500
     * @tc.name testURL02Chapter0015
     * @tc.desc Test URL.searchParams handles boolean-related strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?true=true&false=false&zero=0&empty=&null=null&undefined=undefined");
      const params: url.URLParams = url.params;
      expect(params.get("true")).assertEqual("true");
      expect(params.get("false")).assertEqual("false");
      expect(params.get("zero")).assertEqual("0");
      expect(params.get("empty")).assertEqual("");
      expect(params.get("null")).assertEqual("null");
      expect(params.get("undefined")).assertEqual("undefined");
    });

    /**
     * @tc.number SUB_URL_TEST02_1600
     * @tc.name testURL02Chapter0016
     * @tc.desc Test URL.searchParams.has method with various keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1&%21%40%23=%24%25%5E");
      const params: url.URLParams = url.params;
      expect(params.has("a")).assertTrue();
      expect(params.get("!@#")).assertEqual("$%^");
      expect(params.has("!@#")).assertTrue();
      expect(params.has("b")).assertFalse();
      expect(params.has("")).assertFalse();
    });

    /**
     * @tc.number SUB_URL_TEST02_1700
     * @tc.name testURL02Chapter0017
     * @tc.desc Test URL.searchParams.keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1&b=2&c=3");
      const params: url.URLParams = url.params;
      const keys: string[] = [];
      for (const k of params.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("a");
      expect(keys[1]).assertEqual("b");
      expect(keys[2]).assertEqual("c");
      expect(keys.toString()).assertEqual("a,b,c");
    });

    /**
     * @tc.number SUB_URL_TEST02_1800
     * @tc.name testURL02Chapter0018
     * @tc.desc Test URL.searchParams.values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1&b=2&c=3");
      const params: url.URLParams = url.params;
      const values: string[] = [];
      for (const v of params.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual("1");
      expect(values[1]).assertEqual("2");
      expect(values[2]).assertEqual("3");
      expect(values.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_URL_TEST02_1900
     * @tc.name testURL02Chapter0019
     * @tc.desc Test URL.searchParams.entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1&b=2&c=3");
      const params: url.URLParams = url.params;
      const entries: [string, string][] = [];
      for (const e of params.entries()) {
        entries.push(e);
      }
      expect(entries.length).assertEqual(3);

      const entry0: [string, string] = entries[0];
      expect(entry0[0]).assertEqual("a");
      expect(entry0[1]).assertEqual("1");

      const entry1: [string, string] = entries[1];
      expect(entry1[0]).assertEqual("b");
      expect(entry1[1]).assertEqual("2");

      const entry2: [string, string] = entries[2];
      expect(entry2[0]).assertEqual("c");
      expect(entry2[1]).assertEqual("3");

      const entriesStr: string = entries.map((entry: [string, string]): string => {
        return entry[0] + "," + entry[1];
      }).join(",");
      expect(entriesStr).assertEqual("a,1,b,2,c,3");
    });

    /**
     * @tc.number SUB_URL_TEST02_2000
     * @tc.name testURL02Chapter0020
     * @tc.desc Test URL.searchParams.sort method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?c=3&a=1&b=2");
      const params: url.URLParams = url.params;
      params.sort();
      expect(url.search).assertEqual("?a=1&b=2&c=3");
    });

    /**
     * @tc.number SUB_URL_TEST02_2100
     * @tc.name testURL02Chapter0021
     * @tc.desc Test URL.searchParams.toString method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1&b=2&c=3");
      const params: url.URLParams = url.params;
      expect(params.toString()).assertEqual("a=1&b=2&c=3");
    });

    /**
     * @tc.number SUB_URL_TEST02_2200
     * @tc.name testURL02Chapter0022
     * @tc.desc Test URL.searchParams.forEach method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1&b=2&c=3");
      const params: url.URLParams = url.params;
      const entries: [string, string][] = [];
      params.forEach((value: string, key: string): void => {
        entries.push([key, value]);
      });
      expect(entries.length).assertEqual(3);

      const entry0: [string, string] = entries[0];
      expect(entry0[0]).assertEqual("a");
      expect(entry0[1]).assertEqual("1");

      const entry1: [string, string] = entries[1];
      expect(entry1[0]).assertEqual("b");
      expect(entry1[1]).assertEqual("2");

      const entry2: [string, string] = entries[2];
      expect(entry2[0]).assertEqual("c");
      expect(entry2[1]).assertEqual("3");

      const entriesStr: string = entries.map((entry: [string, string]): string => {
        return entry[0] + "," + entry[1];
      }).join(",");
      expect(entriesStr).assertEqual("a,1,b,2,c,3");
    });

    /**
     * @tc.number SUB_URL_TEST02_2300
     * @tc.name testURL02Chapter0023
     * @tc.desc Test URL.searchParams.append adds multiple values for same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/");
      const params: url.URLParams = url.params;
      params.append("key", "value1");
      params.append("key", "value2");
      params.append("key", "value3");
      expect(url.search).assertEqual("?key=value1&key=value2&key=value3");

      const values: string[] = params.getAll("key");
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual("value1");
      expect(values[1]).assertEqual("value2");
      expect(values[2]).assertEqual("value3");
      expect(values.toString()).assertEqual("value1,value2,value3");
    });

    /**
     * @tc.number SUB_URL_TEST02_2400
     * @tc.name testURL02Chapter0024
     * @tc.desc Test URL.searchParams.set updates existing key and removes others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?key=1&key=2&other=3");
      const params: url.URLParams = url.params;
      params.set("key", "10");
      expect(url.search).assertEqual("?key=10&other=3");

      const values: string[] = params.getAll("key");
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual("10");
      expect(values.toString()).assertEqual("10");
    });

    /**
     * @tc.number SUB_URL_TEST02_2500
     * @tc.name testURL02Chapter0025
     * @tc.desc Test URL.searchParams.delete removes key and updates URL.search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com/?a=1&b=2&c=3");
      const params: url.URLParams = url.params;
      params.delete("b");
      expect(url.search).assertEqual("?a=1&c=3");
      expect(params.has("b")).assertFalse();
    });
    /**
     * @tc.number SUB_URL_TEST02_2600
     * @tc.name testURL02Chapter0026
     * @tc.desc Test URLSearchParams with invalid Unicode surrogates does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidUnicode: string = "\\udc04\\ud83d\\udff4";
      const encoded: string = encodeURIComponent(invalidUnicode);
      const url = URL.parseURL(`https://example.com/?invalid=${encoded}`);
      const params: url.URLParams = url.params;
      const result: string | null = params.get("invalid");
      expect(result !== null).assertTrue();
    });

    // =============== params ======================
    /**
     * @tc.number SUB_URL_TEST02_2700
     * @tc.name testURL02Chapter0027
     * @tc.desc Test URL.params getter returns URLParams object for a simple query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const urlObj = URL.parseURL("https://example.com/?foo=bar&baz=qux");
      const params: url.URLParams = urlObj.params;
      expect(params.get("foo")).assertEqual("bar");
      expect(params.get("baz")).assertEqual("qux");
    });

    /**
     * @tc.number SUB_URL_TEST02_2800
     * @tc.name testURL02Chapter0028
     * @tc.desc Test URL.params handles query with numeric boundary values as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: [string, string][] = [
        ["int8_min", "-128"],
        ["int8_max", "127"],
        ["int8_under", "-129"],
        ["int8_over", "128"],
        ["uint8_min", "0"],
        ["uint8_max", "255"],
        ["uint8_under", "-1"],
        ["uint8_over", "256"],
        ["int16_min", "-32768"],
        ["int16_max", "32767"],
        ["int16_under", "-32769"],
        ["int16_over", "32768"],
        ["uint16_min", "0"],
        ["uint16_max", "65535"],
        ["uint16_under", "-1"],
        ["uint16_over", "65536"],
        ["int32_min", "-2147483648"],
        ["int32_max", "2147483647"],
        ["int32_under", "-2147483649"],
        ["int32_over", "2147483648"],
        ["uint32_min", "0"],
        ["uint32_max", "4294967295"],
        ["uint32_under", "-1"],
        ["uint32_over", "4294967296"],
        ["float32_min", "-3.4028234663852886e38"],
        ["float32_max", "3.4028234663852886e38"],
        ["float32_under", "-3.5e38"],
        ["float32_over", "3.5e38"],
        ["float64_min", "-1.7976931348623157e308"],
        ["float64_max", "1.7976931348623157e308"],
        ["float64_under", "-1.8e308"],
        ["float64_over", "1.8e308"],
        ["bigint64_min", "-9223372036854775808"],
        ["bigint64_max", "9223372036854775807"],
        ["bigint64_under", "-9223372036854775809"],
        ["bigint64_over", "9223372036854775808"],
        ["biguint64_min", "0"],
        ["biguint64_max", "18446744073709551615"],
        ["biguint64_over", "18446744073709551616"]
      ];
      const queryParts: string[] = [];
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        queryParts.push(`${encodeURIComponent(key)}=${encodeURIComponent(value)}`);
      }
      const urlObj = URL.parseURL(`https://example.com/?${queryParts.join("&")}`);
      const params: url.URLParams = urlObj.params;
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        expect(params.get(key)).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_2900
     * @tc.name testURL02Chapter0029
     * @tc.desc Test URL.params handles special numeric strings (Infinity, NaN, -0, scientific)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: [string, string][] = [
        ["inf", "Infinity"],
        ["neginf", "-Infinity"],
        ["nan", "NaN"],
        ["zero", "0"],
        ["negzero", "-0"],
        ["sci1", "1e3"],
        ["sci2", "2.5e-2"],
        ["max_value", "1.7976931348623157e+308"],
        ["min_value", "5e-324"],
        ["epsilon", "2.220446049250313e-16"],
        ["max_safe", "9007199254740991"]
      ];
      const queryParts: string[] = [];
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        queryParts.push(`${key}=${encodeURIComponent(value)}`);
      }
      const urlObj = URL.parseURL(`https://example.com/?${queryParts.join("&")}`);
      const params: url.URLParams = urlObj.params;
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        expect(params.get(key)).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_3000
     * @tc.name testURL02Chapter0030
     * @tc.desc Test URL.params handles ASCII, escapes, emojis, and special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ascii: string =
        "!\"#$%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const escapes: string = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\x41\\123";
      const emojis: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const pairs: [string, string][] = [
        ["ascii", ascii],
        ["escapes", escapes],
        ["emojis", emojis],
        ["special", "!@#$%^&*()_+{}:\"<>?|"],
        ["quote", "\"'"],
        ["backslash", "\\"],
        ["question", "?"]
      ];
      const queryParts: string[] = [];
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        queryParts.push(`${encodeURIComponent(key)}=${encodeURIComponent(value)}`);
      }
      const urlObj = URL.parseURL(`https://example.com/?${queryParts.join("&")}`);
      const params: url.URLParams = urlObj.params;
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        expect(params.get(key)).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_3100
     * @tc.name testURL02Chapter0031
     * @tc.desc Test URL.params handles null, undefined, empty string as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: [string, string][] = [
        ["null_str", "null"],
        ["undefined_str", "undefined"],
        ["empty", ""],
        ["blank", ""]
      ];
      const queryParts: string[] = [];
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        queryParts.push(`${encodeURIComponent(key)}=${encodeURIComponent(value)}`);
      }
      const urlObj = URL.parseURL(`https://example.com/?${queryParts.join("&")}`);
      const params: url.URLParams = urlObj.params;
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        expect(params.get(key)).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_3200
     * @tc.name testURL02Chapter0032
     * @tc.desc Test URL.params handles multiple values for same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const urlObj = URL.parseURL("https://example.com/?key=1&key=2&key=3");
      const params: url.URLParams = urlObj.params;
      const values: string[] = params.getAll("key");
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual("1");
      expect(values[1]).assertEqual("2");
      expect(values[2]).assertEqual("3");
    });

    /**
     * @tc.number SUB_URL_TEST02_3300
     * @tc.name testURL02Chapter0033
     * @tc.desc Test URL.params is live to changes in URL.search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const urlObj = URL.parseURL("https://example.com/");
      const params: url.URLParams = urlObj.params;
      urlObj.search = "?a=b&c=d";
      expect(params.get("a")).assertEqual("b");
      expect(params.get("c")).assertEqual("d");
      params.append("e", "f");
      expect(urlObj.search).assertEqual("?a=b&c=d&e=f");
    });

    /**
     * @tc.number SUB_URL_TEST02_3400
     * @tc.name testURL02Chapter0034
     * @tc.desc Test URL.params handles invalid percent-encoded sequences without crashing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidEncoded: string = "%ED%B0%84%ED%A0%BD%ED%BF%B4";
      const urlObj = URL.parseURL(`https://example.com/?invalid=${invalidEncoded}`);

      let params: url.URLParams | null = null;
      let caughtError: Error | null = null;

      try {
        params = urlObj.params;
      } catch (e) {
        caughtError = e as Error;
      }
      expect(caughtError === null).assertTrue();
      expect(params !== null).assertTrue();

      if (params) {
        const value: string | null = params.get("invalid");
        expect(value !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_3500
     * @tc.name testURL02Chapter0035
     * @tc.desc Test URL.params handles invalid unicode characters (lone surrogates) without crashing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const encodedHigh = "%ED%A0%80";
      const encodedLow = "%ED%B0%80";
      const encodedMixed = "%ED%A0%80%ED%A0%80";

      const baseUrl = "https://example.com/?";
      const highParam = "high=" + encodedHigh;
      const lowParam = "low=" + encodedLow;
      const mixedParam = "mixed=" + encodedMixed;

      const urlString = baseUrl + highParam + "&" + lowParam + "&" + mixedParam;

      let urlObj: ESObject | null = null;
      let caughtError: Error | null = null;

      try {
        urlObj = URL.parseURL(urlString);
      } catch (e) {
        caughtError = e as Error;
      }

      expect(caughtError === null).assertTrue();
      expect(urlObj !== null).assertTrue();

      if (urlObj) {
        const params: ESObject = urlObj.params;

        expect(params.has("high")).assertTrue();
        expect(params.has("low")).assertTrue();
        expect(params.has("mixed")).assertTrue();
        const highValue: string | null = params.get("high");
        const lowValue: string | null = params.get("low");
        const mixedValue: string | null = params.get("mixed");
        expect(highValue !== null).assertTrue();
        expect(lowValue !== null).assertTrue();
        expect(mixedValue !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_3600
     * @tc.name testURL02Chapter0036
     * @tc.desc Test URL.params handles a huge string value (approx 1MB) without performance degradation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: number = 1024 * 1024;
      const hugeString: string = "a".repeat(size);
      const urlObj = URL.parseURL(`https://example.com/?huge=${encodeURIComponent(hugeString)}`);
      const params: url.URLParams = urlObj.params;
      const retrieved: string | null = params.get("huge");
      expect(retrieved).assertEqual(hugeString);
    });

    /**
     * @tc.number SUB_URL_TEST02_3700
     * @tc.name testURL02Chapter0037
     * @tc.desc Test URL.params handles numeric strings in hexadecimal, binary and octal formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: [string, string][] = [
        ["hex", "0x1A3"],
        ["bin", "0b1010"],
        ["oct", "0o755"]
      ];
      const queryParts: string[] = [];
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const value: string = pairs[i][1];
        queryParts.push(`${key}=${encodeURIComponent(value)}`);
      }
      const urlObj = URL.parseURL(`https://example.com/?${queryParts.join("&")}`);
      const params: url.URLParams = urlObj.params;
      for (let i: number = 0; i < pairs.length; i++) {
        const key: string = pairs[i][0];
        const expected: string = pairs[i][1];
        const actual: string | null = params.get(key);
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_3800
     * @tc.name testURL02Chapter0038
     * @tc.desc Test URL.params handles boolean strings "true" and "false"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const urlObj = URL.parseURL("https://example.com/?flag=true&enabled=false");
      const params: url.URLParams = urlObj.params;
      expect(params.get("flag")).assertEqual("true");
      expect(params.get("enabled")).assertEqual("false");
    });

    /**
     * @tc.number SUB_URL_TEST02_3900
     * @tc.name testURL02Chapter0039
     * @tc.desc Test URL.params handles an array string representation (e.g., "[1,2,3]")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrStr: string = "[1,2,3]";
      const urlObj = URL.parseURL(`https://example.com/?arr=${encodeURIComponent(arrStr)}`);
      const params: url.URLParams = urlObj.params;
      expect(params.get("arr")).assertEqual(arrStr);
    });

    /**
     * @tc.number SUB_URL_TEST02_4000
     * @tc.name testURL02Chapter0040
     * @tc.desc Test URL.params handles an object string representation (e.g., "{a:1}")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objStr: string = "{a:1}";
      const urlObj = URL.parseURL(`https://example.com/?obj=${encodeURIComponent(objStr)}`);
      const params: url.URLParams = urlObj.params;
      expect(params.get("obj")).assertEqual(objStr);
    });

    /**
     * @tc.number SUB_URL_TEST02_4100
     * @tc.name testURL02Chapter0041
     * @tc.desc Test URL.params created from Record<string, string> where values are explicitly converted from non‑string types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const record: Record<string, string> = {};
      const num: number = 123;
      const bool: boolean = true;
      const nullVal: null = null;
      const undefVal: undefined = undefined;

      record["num"] = num.toString();
      record["bool"] = String(bool);
      record["nullVal"] = String(nullVal);
      record["undefVal"] = String(undefVal);

      const paramsObj: url.URLParams = new url.URLParams(record);
      const urlObj = URL.parseURL(`https://example.com/?${paramsObj.toString()}`);
      const params: url.URLParams = urlObj.params;
      expect(params.get("num")).assertEqual("123");
      expect(params.get("bool")).assertEqual("true");
      expect(params.get("nullVal")).assertEqual("null");
      expect(params.get("undefVal")).assertEqual("undefined");
    });

    /**
     * @tc.number SUB_URL_TEST02_4200
     * @tc.name testURL02Chapter0042
     * @tc.desc Test URL.params created from string[][] containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: [string, string][] = [
        ["special", "!@#$%^&*()_+{}:\"<>?|"],
        ["equals", "a=b=c"],
        ["amp", "x&y"],
        ["space", "hello world"]
      ];
      const paramsObj: url.URLParams = new url.URLParams(pairs);
      const urlObj = URL.parseURL(`https://example.com/?${paramsObj.toString()}`);
      const params: url.URLParams = urlObj.params;
      expect(params.get("special")).assertEqual(pairs[0][1]);
      expect(params.get("equals")).assertEqual(pairs[1][1]);
      expect(params.get("amp")).assertEqual(pairs[2][1]);
      expect(params.get("space")).assertEqual(pairs[3][1]);
    });

    // =============== username ======================

    /**
     * @tc.number SUB_URL_TEST02_4300
     * @tc.name testURL02Chapter0043
     * @tc.desc Test URL.username getter and setter with normal string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com");
      url.username = "john";
      expect(url.username).assertEqual("john");
      expect(url.href).assertEqual("https://john@example.com/");
    });

    /**
     * @tc.number SUB_URL_TEST02_4400
     * @tc.name testURL02Chapter0044
     * @tc.desc Test URL.username with various numeric and boolean string representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numericTestValues: string[] = [
        "123",
        "0",
        "-456",
        "3.14159",
        "true",
        "false",
        "null",
        "undefined",
        "NaN",
        "Infinity",
        "-Infinity",
        "1e6",
        "0xFF",
        "0b1010"
      ];
      for (let idx: number = 0; idx < numericTestValues.length; idx++) {
        const testValue: string = numericTestValues[idx];
        const urlInstance = URL.parseURL("https://example.com/path");
        urlInstance.username = testValue;
        expect(urlInstance.username).assertEqual(testValue);

        const parsedInstance = URL.parseURL(urlInstance.toString());
        expect(parsedInstance.username).assertEqual(testValue);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_4500
     * @tc.name testURL02Chapter0045
     * @tc.desc Test URL.username with numeric strings and boolean strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://example.com");
      const numericStrings: string[] = ["123", "0", "-1", "3.14", "true", "false"];
      for (let i: number = 0; i < numericStrings.length; i++) {
        const val: string = numericStrings[i];
        url.username = val;
        expect(url.username).assertEqual(val);
      }
    });

    /**
     * @tc.number SUB_URL_TEST02_4600
     * @tc.name testURL02Chapter0046
     * @tc.desc Test URL.username with very long string (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longUsername: string = "a".repeat(1000);
      const url = URL.parseURL("https://example.com");
      url.username = longUsername;
      expect(url.username).assertEqual(longUsername);
      expect(url.href).assertEqual(`https://${encodeURIComponent(longUsername)}@example.com/`);
    });

    /**
     * @tc.number SUB_URL_TEST02_4700
     * @tc.name testURL02Chapter0047
     * @tc.desc Test URL.username with very long string (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longUsername: string = "a".repeat(1000);
      const url = URL.parseURL("https://example.com");
      url.username = longUsername;
      expect(url.username).assertEqual(longUsername);
      expect(url.href).assertEqual(`https://${encodeURIComponent(longUsername)}@example.com/`);
    });

    /**
     * @tc.number SUB_URL_TEST02_4800
     * @tc.name testURL02Chapter0048
     * @tc.desc Test URL.username clearing username (empty string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testURL02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = URL.parseURL("https://john@example.com/");
      expect(url.username).assertEqual("john");
      url.username = "";
      expect(url.username).assertEqual("");
      expect(url.href).assertEqual("https://example.com/");
    });
  });
}
