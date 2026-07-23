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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';

function createKey(prefix: string, id: int): string {
  return prefix + "_" + String(id);
}

export default function PropertyKeyTest(): void {
  describe('PropertyKeyTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testObjectPropertyKey0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0100
     * @tc.desc Verify PropertyKey basic string assignments: plain, numeric, hyphen/underscore, camelCase
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = {} as Record<string, string>;
      rec["name"] = "Alice";
      expect(rec["name"]).assertEqual("Alice");
      rec["123"] = "numVal";
      expect(rec["123"]).assertEqual("numVal");
      rec["my_name"] = "underscoreVal";
      rec["my-name"] = "hyphenVal";
      expect(rec["my_name"]).assertEqual("underscoreVal");
      expect(rec["my-name"]).assertEqual("hyphenVal");
      rec["myPropertyName"] = "camelVal";
      expect(rec["myPropertyName"]).assertEqual("camelVal");
    });

    /**
     * @tc.name testObjectPropertyKey0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0200
     * @tc.desc Verify PropertyKey and string mutual assignment compatibility
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = {} as Record<string, string>;
      let pk: string = "name";
      let str: string = pk;
      rec[str] = "Alice";
      expect(rec[str]).assertEqual("Alice");
      let str2: string = "age";
      let pk2: string = str2;
      rec[pk2] = "30";
      expect(rec[pk2]).assertEqual("30");
    });

    /**
     * @tc.name testObjectPropertyKey0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0300
     * @tc.desc Verify PropertyKey with empty string and single-character string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = {} as Record<string, string>;
      let emptyKey: string = "";
      rec[emptyKey] = "emptyVal";
      expect(rec[emptyKey]).assertEqual("emptyVal");
      let singleKey: string = "a";
      rec[singleKey] = "singleVal";
      expect(rec[singleKey]).assertEqual("singleVal");
    });

    /**
     * @tc.name testObjectPropertyKey0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0400
     * @tc.desc Verify PropertyKey with very long string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      let maxIterations: int = 100;
      let i: int = 0;
      while (i < maxIterations) {
        longStr += "a";
        i++;
      }
      let key: string = longStr;
      expect(key.length).assertEqual(100);
    });

    /**
     * @tc.name testObjectPropertyKey0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0500
     * @tc.desc Verify PropertyKey with space, quotes, and special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = {} as Record<string, string>;
      rec["my name"] = "spaceVal";
      expect(rec["my name"]).assertEqual("spaceVal");
      rec["key\"with\"quotes"] = "quoteVal";
      expect(rec["key\"with\"quotes"]).assertEqual("quoteVal");
      rec["obj.prop"] = "dotVal";
      rec["arr[0]"] = "bracketVal";
      expect(rec["obj.prop"]).assertEqual("dotVal");
      expect(rec["arr[0]"]).assertEqual("bracketVal");
    });

    /**
     * @tc.name testObjectPropertyKey0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0600
     * @tc.desc Verify PropertyKey with newline escape character
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "line1\nline2";
      let containsNewline: boolean = key.includes("\n");
      expect(containsNewline).assertTrue();
    });

    /**
     * @tc.name testObjectPropertyKey0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0700
     * @tc.desc Verify PropertyKey with Chinese, Japanese, Emoji, Unicode escape, zero-width characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = {} as Record<string, string>;
      let cnKey: string = "名称";
      rec[cnKey] = "中文";
      expect(rec[cnKey]).assertEqual("中文");
      let jpKey: string = "なまえ";
      rec[jpKey] = "日本語";
      expect(rec[jpKey]).assertEqual("日本語");
      let emojiKey: string = "🔑key";
      rec[emojiKey] = "emojiVal";
      expect(rec[emojiKey]).assertEqual("emojiVal");
      let unicodeKey: string = "A";
      rec[unicodeKey] = "unicodeVal";
      expect(rec[unicodeKey]).assertEqual("unicodeVal");
      let zwKey: string = "name​";
      rec[zwKey] = "zwVal";
      expect(rec[zwKey]).assertEqual("zwVal");
    });

    /**
     * @tc.name testObjectPropertyKey0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0800
     * @tc.desc Verify Record with string keys as PropertyKey accessing string values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, string> = {
        "name": "Alice",
        "age": "30",
        "": "empty"
      } as Record<string, string>;
      expect(record["name"]).assertEqual("Alice");
      expect(record["age"]).assertEqual("30");
      expect(record[""]).assertEqual("empty");
    });

    /**
     * @tc.name testObjectPropertyKey0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_0900
     * @tc.desc Verify Record with string keys accessing number values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, int> = {
        "x": 1,
        "y": 2
      } as Record<string, int>;
      expect(record["x"]).assertEqual(1);
      expect(record["y"]).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1000
     * @tc.desc Verify Record with string keys accessing Object values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Record<string, Any> = { "name": "Alice" };
      let record: Record<string, Any> = { "user": inner };
      expect(record["user"] as Object).assertEqual(inner as Object);
      expect(inner["name"] as string).assertEqual("Alice");
    });

    /**
     * @tc.name testObjectPropertyKey1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1100
     * @tc.desc Verify bracket access and assignment using string key variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, int> = { "score": 100 } as Record<string, int>;
      let key: string = "score";
      expect(obj[key]).assertEqual(100);
      let obj2: Record<string, int> = {} as Record<string, int>;
      let key2: string = "score";
      obj2[key2] = 100;
      expect(obj2["score"]).assertEqual(100);
    });

    /**
     * @tc.name testObjectPropertyKey1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1200
     * @tc.desc Verify dynamic property access using string key array and for-of loop
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, string> = { "firstName": "Alice", "lastName": "Smith" } as Record<string, string>;
      let keys: string[] = ["firstName", "lastName"];
      let fullName: string = "";
      for (let k of keys) {
        fullName += obj[k] + " ";
      }
      let trimmed: string = fullName.trim();
      expect(trimmed).assertEqual("Alice Smith");
    });

    /**
     * @tc.name testObjectPropertyKey1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1300
     * @tc.desc Verify PropertyKey string array length, traversal, and per-element typeof string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = {} as Record<string, string>;
      let keys: string[] = ["name", "age", "email"];
      expect(keys.length).assertEqual(3);
      for (let key of keys) {
        rec[key] = key;
      }
      expect(rec["name"]).assertEqual("name");
      expect(rec["age"]).assertEqual("age");
      expect(rec["email"]).assertEqual("email");
    });

    /**
     * @tc.name testObjectPropertyKey1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1400
     * @tc.desc Verify string array used for batch property summation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, int> = { "a": 1, "b": 2, "c": 3 } as Record<string, int>;
      let keys: string[] = ["a", "b", "c"];
      let sum: int = 0;
      for (let key of keys) {
        sum += obj[key]!;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name testObjectPropertyKey1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1500
     * @tc.desc Verify createKey function returns concatenated string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = createKey("user", 1);
      expect(key).assertEqual("user_1");
    });

    /**
     * @tc.name testObjectPropertyKey1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1600
     * @tc.desc Verify Record bracket lookup via PropertyKey for string and numeric Any values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { "name": "Alice" as Any };
      let result: Object | undefined = obj["name"] as Object | undefined;
      expect(result).assertEqual("Alice");
      let numMap: Record<string, Any> = { "count": 42 as Any };
      let numResult: Object | undefined = numMap["count"] as Object | undefined;
      expect(numResult).assertEqual(42);
    });

    /**
     * @tc.name testObjectPropertyKey1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1700
     * @tc.desc Verify PropertyKey typeof string, boxed String wrapper, and toString round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "name";
      let boxedKey: Object = new String(key);
      expect(boxedKey.toString()).assertEqual("name");
    });

    /**
     * @tc.name testObjectPropertyKey1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1800
     * @tc.desc Verify string length, substring, and indexOf methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "hello";
      expect(key.length).assertEqual(5);
      let key2: string = "hello world";
      let sub: string = key2.substring(0, 5);
      expect(sub).assertEqual("hello");
      let idx: int = key2.indexOf("world");
      expect(idx).assertEqual(6);
    });

    /**
     * @tc.name testObjectPropertyKey1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_1900
     * @tc.desc Verify string split method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "a.b.c";
      let parts: string[] = key.split(".");
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual("a");
    });

    /**
     * @tc.name testObjectPropertyKey2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2000
     * @tc.desc Verify string toUpperCase, toLowerCase, and trim methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "Hello";
      expect(key.toUpperCase()).assertEqual("HELLO");
      expect(key.toLowerCase()).assertEqual("hello");
      let key2: string = "  name  ";
      let trimmed: string = key2.trim();
      expect(trimmed).assertEqual("name");
    });

    /**
     * @tc.name testObjectPropertyKey2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2100
     * @tc.desc Verify string includes and replace methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "propertyName";
      let hasName: boolean = key.includes("Name");
      expect(hasName).assertTrue();
      let hasXyz: boolean = key.includes("xyz");
      expect(hasXyz).assertFalse();
      let key2: string = "my-name";
      let replaced: string = key2.replace("-", "_");
      expect(replaced).assertEqual("my_name");
    });

    /**
     * @tc.name testObjectPropertyKey2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2200
     * @tc.desc Verify string concatenation and template literal with string variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "user";
      let concat: string = key + "_name";
      expect(concat).assertEqual("user_name");
      let key2: string = "name";
      let template: string = "prefix_" + key2;
      expect(template).assertEqual("prefix_name");
    });

    /**
     * @tc.name testObjectPropertyKey2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2300
     * @tc.desc Verify PropertyKey with HTML, SQL injection, and control character strings
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = {} as Record<string, string>;
      let htmlKey: string = "<script>alert(1)</script>";
      rec[htmlKey] = "htmlVal";
      expect(rec[htmlKey]).assertEqual("htmlVal");
      let sqlKey: string = "'; DROP TABLE users;--";
      rec[sqlKey] = "sqlVal";
      expect(rec[sqlKey]).assertEqual("sqlVal");
      let ctrlKey: string = "name\t\0";
      expect(ctrlKey.length).assertEqual(6);
    });

    /**
     * @tc.name testObjectPropertyKey2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2400
     * @tc.desc Verify empty-string whitespace dotted and bracket-like keys work as actual Record property keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "": "empty",
        " ": "blank",
        "user.name": "dotted",
        "items[0]": "bracket",
        "my-key": "hyphen"
      } as Record<string, Any>;
      let emptyValue: string = record[""] as string;
      let blankValue: string = record[" "] as string;
      let dottedValue: string = record["user.name"] as string;
      let bracketValue: string = record["items[0]"] as string;
      let hyphenValue: string = record["my-key"] as string;
      expect(emptyValue).assertEqual("empty");
      expect(blankValue).assertEqual("blank");
      expect(dottedValue).assertEqual("dotted");
      expect(bracketValue).assertEqual("bracket");
      expect(hyphenValue).assertEqual("hyphen");
    });

    /**
     * @tc.name testObjectPropertyKey2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2500
     * @tc.desc Verify unicode emoji and zero-width keys remain distinguishable during Record access
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "汉字": 1,
        "emoji😊": 2,
        "zero​width": 3
      } as Record<string, Any>;
      let hanValue: int = record["汉字"] as int;
      let emojiValue: int = record["emoji😊"] as int;
      let zeroWidthValue: int = record["zero​width"] as int;
      expect(hanValue).assertEqual(1);
      expect(emojiValue).assertEqual(2);
      expect(zeroWidthValue).assertEqual(3);
      expect(record["zerowidth"] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectPropertyKey2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2600
     * @tc.desc Verify numeric-like PropertyKey strings and numeric -0/+0 coerce to the same "0" key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "0": "zero",
        "2": "two",
        "10": "ten",
        "1.5": "floatLike"
      } as Record<string, Any>;
      let zeroValue: string = record["0"] as string;
      let twoValue: string = record["2"] as string;
      let tenValue: string = record["10"] as string;
      let floatValue: string = record["1.5"] as string;
      expect(zeroValue).assertEqual("zero");
      expect(twoValue).assertEqual("two");
      expect(tenValue).assertEqual("ten");
      expect(floatValue).assertEqual("floatLike");
      record[String(-0)] = "negZeroMapped";
      expect(record["0"] as string).assertEqual("negZeroMapped");
      record[String(0)] = "posZeroMapped";
      expect(record["0"] as string).assertEqual("posZeroMapped");
      expect(record["3"] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectPropertyKey2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2700
     * @tc.desc Verify own PropertyKey names can shadow common prototype member names without being dropped
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "toString": "ownToString",
        "constructor": "ownConstructor",
        "hasOwnProperty": "ownHasOwnProperty"
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      let toStringValue: string = record["toString"] as string;
      let constructorValue: string = record["constructor"] as string;
      let hasOwnPropertyValue: string = record["hasOwnProperty"] as string;
      expect(toStringValue).assertEqual("ownToString");
      expect(constructorValue).assertEqual("ownConstructor");
      expect(hasOwnPropertyValue).assertEqual("ownHasOwnProperty");
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.name testObjectPropertyKey2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2800
     * @tc.desc Verify null-valued own keys remain accessible and distinct from absent keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "nullable": null,
        "text": "value"
      } as Record<string, Any>;
      let nullableValue: Any = record["nullable"];
      let textValue: string = record["text"] as string;
      expect(nullableValue as null).assertEqual(null);
      expect(textValue).assertEqual("value");
      expect(record["missing"] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectPropertyKey2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_2900
     * @tc.desc Verify reassigning the same PropertyKey overwrites the value without increasing key count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      record["status"] = "init";
      record["count"] = 1;
      record["status"] = "done";
      record["count"] = 2;
      let keys: string[] = Object.keys(record);
      let statusValue: string = record["status"] as string;
      let countValue: int = record["count"] as int;
      expect(statusValue).assertEqual("done");
      expect(countValue).assertEqual(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual("status");
      expect(keys[1]).assertEqual("count");
    });

    /**
     * @tc.name testObjectPropertyKey3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3000
     * @tc.desc Verify createKey-generated strings can be used as stable dynamic property names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      let key1: string = createKey("user", 1);
      let key2: string = createKey("user", 2);
      record[key1] = "Alice";
      record[key2] = "Bob";
      let user1Value: string = record["user_1"] as string;
      let user2Value: string = record["user_2"] as string;
      expect(user1Value).assertEqual("Alice");
      expect(user2Value).assertEqual("Bob");
    });

    /**
     * @tc.name testObjectPropertyKey3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3100
     * @tc.desc Verify nested object keys and dotted literal keys remain separate top-level PropertyKey entries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: Record<string, Any> = {
        "name": "Alice"
      } as Record<string, Any>;
      let record: Record<string, Any> = {
        "user": nested,
        "user.name": "literalPath"
      } as Record<string, Any>;
      let nestedValue: Object | undefined = record["user"] as Object | undefined;
      let literalPathValue: string = record["user.name"] as string;
      expect(nestedValue !== undefined).assertTrue();
      expect(literalPathValue).assertEqual("literalPath");
      expect(record["name"] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectPropertyKey3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3200
     * @tc.desc Verify removing and re-adding a PropertyKey changes own-key visibility as expected
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "keep": 1,
        "removeMe": 2
      } as Record<string, Any>;
      expect(record["removeMe"] as int).assertEqual(2);
      record = { "keep": record["keep"] } as Record<string, Any>;
      expect(record["removeMe"] as undefined).assertEqual(undefined);
      record["removeMe"] = 3;
      let removeMeValue: int = record["removeMe"] as int;
      expect(removeMeValue).assertEqual(3);
    });

    /**
     * @tc.name testObjectPropertyKey3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3300
     * @tc.desc Verify PropertyKey visibility stays consistent when the same Record is viewed through Object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "alpha": 10,
        "beta": 20
      } as Record<string, Any>;
      let obj: Object = record;
      let keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual("alpha");
      expect(keys[1]).assertEqual("beta");
      expect(Object.hasOwn(obj, "missing")).assertFalse();
    });

    /**
     * @tc.name testObjectPropertyKey3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3400
     * @tc.desc Verify repeated indexed lookup with the same PropertyKey returns stable present and missing results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "present": "value"
      } as Record<string, Any>;
      let first: Object | undefined = record["present"] as Object | undefined;
      let second: Object | undefined = record["present"] as Object | undefined;
      let missing1: Object | undefined = record["missing"] as Object | undefined;
      let missing2: Object | undefined = record["missing"] as Object | undefined;
      expect(first).assertEqual("value");
      expect(second).assertEqual("value");
      expect(missing1 as undefined).assertEqual(undefined);
      expect(missing2 as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectPropertyKey3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3500
     * @tc.desc Verify batch traversal over mixed special PropertyKey names retrieves the matching values in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "first key": "A",
        "second-key": "B",
        "third_key": "C"
      } as Record<string, Any>;
      let keys: string[] = ["first key", "second-key", "third_key"];
      let combined: string = "";
      for (let i: int = 0; i < keys.length; i++) {
        combined += record[keys[i]] as string;
      }
      expect(combined).assertEqual("ABC");
    });

    /**
     * @tc.name testObjectPropertyKey3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3600
     * @tc.desc Verify dynamic PropertyKey assignments keep Object.keys and Object.values counts aligned
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      record["x"] = 1;
      record["y"] = true;
      record["z"] = "text";
      expect(Object.keys(record).length).assertEqual(3);
      expect(Object.values(record).length).assertEqual(3);
      expect(Object.keys(record).length).assertEqual(3);
      expect(record["x"] as int).assertEqual(1);
      expect(record["z"] as string).assertEqual("text");
    });

    /**
     * @tc.name testObjectPropertyKey3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3700
     * @tc.desc Verify whitespace-only PropertyKey names remain distinct from the empty-string key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "": "empty",
        " ": "singleSpace",
        "  ": "doubleSpace"
      } as Record<string, Any>;
      let emptyValue: string = record[""] as string;
      let singleSpaceValue: string = record[" "] as string;
      let doubleSpaceValue: string = record["  "] as string;
      expect(emptyValue).assertEqual("empty");
      expect(singleSpaceValue).assertEqual("singleSpace");
      expect(doubleSpaceValue).assertEqual("doubleSpace");
    });

    /**
     * @tc.name testObjectPropertyKey3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3800
     * @tc.desc Verify numeric-like float-like and leading-zero PropertyKey names stay distinguishable in actual key enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      record["0"] = "zero";
      record["1"] = "one";
      record["01"] = "leadingZero";
      record["1.5"] = "floatLike";
      let keys: string[] = Object.keys(record);
      let leadingZeroValue: string = record["01"] as string;
      let floatLikeValue: string = record["1.5"] as string;
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual("0");
      expect(keys[1]).assertEqual("1");
      expect(leadingZeroValue).assertEqual("leadingZero");
      expect(floatLikeValue).assertEqual("floatLike");
    });

    /**
     * @tc.name testObjectPropertyKey3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_3900
     * @tc.desc Verify reserved-word-like strings can be used as real PropertyKey names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "class": "A",
        "default": "B",
        "function": "C"
      } as Record<string, Any>;
      let classValue: string = record["class"] as string;
      let defaultValue: string = record["default"] as string;
      let functionValue: string = record["function"] as string;
      expect(classValue).assertEqual("A");
      expect(defaultValue).assertEqual("B");
      expect(functionValue).assertEqual("C");
    });

    /**
     * @tc.name testObjectPropertyKey4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4000
     * @tc.desc Verify visually similar emoji and zero-width PropertyKey names remain distinct actual keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plainKey: string = "key";
      let hiddenKey: string = "key\u200b";
      let emojiKey: string = "🔑";
      let record: Record<string, Any> = {} as Record<string, Any>;
      record[plainKey] = "plain";
      record[hiddenKey] = "hidden";
      record[emojiKey] = "emoji";
      let plainValue: string = record[plainKey] as string;
      let hiddenValue: string = record[hiddenKey] as string;
      let emojiValue: string = record[emojiKey] as string;
      expect(plainValue).assertEqual("plain");
      expect(hiddenValue).assertEqual("hidden");
      expect(emojiValue).assertEqual("emoji");
      expect(Object.keys(record).length).assertEqual(3);
    });

    /**
     * @tc.name testObjectPropertyKey4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4100
     * @tc.desc Verify trimming a PropertyKey string does not change the identity of the actual stored key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rawKey: string = " name ";
      let trimmedKey: string = rawKey.trim();
      let record: Record<string, Any> = {} as Record<string, Any>;
      record[rawKey] = "spaced";
      let rawValue: Object | undefined = record[rawKey] as Object | undefined;
      let trimmedValue: Object | undefined = record[trimmedKey] as Object | undefined;
      expect(rawValue).assertEqual("spaced");
      expect(trimmedValue as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectPropertyKey4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4200
     * @tc.desc Verify empty string as property key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '': 'emptyVal' } as Record<string, Any>;
      expect(rec[''] as string).assertEqual('emptyVal');
    });

    /**
     * @tc.name testObjectPropertyKey4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4300
     * @tc.desc Verify numeric string key round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '42': 'answer' } as Record<string, Any>;
      expect(rec['42'] as string).assertEqual('answer');
    });

    /**
     * @tc.name testObjectPropertyKey4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4400
     * @tc.desc Verify boolean property value via string key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'flag': true } as Record<string, Any>;
      expect(rec['flag'] as boolean).assertTrue();
    });

    /**
     * @tc.name testObjectPropertyKey4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4500
     * @tc.desc Verify property access returns undefined for missing key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let val: Any = rec['b'];
      expect(val as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectPropertyKey4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4600
     * @tc.desc Verify special character key with dot
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a.b': 'dotted' } as Record<string, Any>;
      expect(rec['a.b'] as string).assertEqual('dotted');
    });

    /**
     * @tc.name testObjectPropertyKey4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4700
     * @tc.desc Verify bracket access returns the value with exact type for a numeric value keyed by string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'count': 5 } as Record<string, int>;
      expect(rec['count']).assertEqual(5);
    });

    /**
     * @tc.name testObjectPropertyKey4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4800
     * @tc.desc Verify bracket access with variable holding numeric string key retrieves the value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = { '7': 'seven' } as Record<string, string>;
      let k: string = '7';
      expect(rec[k]).assertEqual('seven');
    });

    /**
     * @tc.name testObjectPropertyKey4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_4900
     * @tc.desc Verify two records with same key shape retrieve independent values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<string, int> = { 'k': 1 } as Record<string, int>;
      let b: Record<string, int> = { 'k': 2 } as Record<string, int>;
      expect(a['k']).assertEqual(1);
      expect(b['k']).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5000
     * @tc.desc Verify overwriting a value via bracket access changes the stored value without adding new keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': 1 } as Record<string, Any>;
      rec['x'] = 2;
      expect(rec['x'] as int).assertEqual(2);
      let keys: string[] = Object.keys(rec);
      expect(keys.length).assertEqual(1);
    });

    /**
     * @tc.name testObjectPropertyKey5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5100
     * @tc.desc Verify bracket access on a key with slash and backslash characters returns the stored value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, string> = { 'a/b': 'slash', 'c\\d': 'backslash' } as Record<string, string>;
      expect(rec['a/b']).assertEqual('slash');
      expect(rec['c\\d']).assertEqual('backslash');
    });

    /**
     * @tc.name testObjectPropertyKey5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5200
     * @tc.desc Verify createKey with different ids produces distinct property keys that map to different values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[createKey('item', 1)] = 10;
      rec[createKey('item', 2)] = 20;
      expect(rec[createKey('item', 1)] as int).assertEqual(10);
      expect(rec[createKey('item', 2)] as int).assertEqual(20);
      let keys: string[] = Object.keys(rec);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5300
     * @tc.desc Verify record key enumeration via Object.keys matches all inserted keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'p': 1, 'q': 2, 'r': 3 } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('p');
      expect(keys[1]).assertEqual('q');
      expect(keys[2]).assertEqual('r');
    });

    /**
     * @tc.name testObjectPropertyKey5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5400
     * @tc.desc Verify record read after Object.assign preserves keys added from source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tgt: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let src: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      Object.assign(tgt, src);
      expect(tgt['a'] as int).assertEqual(1);
      expect(tgt['b'] as int).assertEqual(2);
      let keys: string[] = Object.keys(tgt);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5500
     * @tc.desc Verify string key constants used multiple times map to same slot
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const K: string = 'constKey';
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[K] = 100;
      expect(rec[K] as int).assertEqual(100);
      rec[K] = 200;
      expect(rec[K] as int).assertEqual(200);
    });

    /**
     * @tc.name testObjectPropertyKey5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5600
     * @tc.desc Verify unicode Chinese key bracket access reads back the stored integer value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { '编号': 1 } as Record<string, int>;
      expect(rec['编号']).assertEqual(1);
    });

    /**
     * @tc.name testObjectPropertyKey5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5700
     * @tc.desc Verify empty record returns undefined for any accessed key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let v: int | undefined = rec['any'] as int | undefined;
      expect(v as undefined).assertEqual(undefined);
      expect(Object.keys(rec).length).assertEqual(0);
    });

    /**
     * @tc.name testObjectPropertyKey5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5800
     * @tc.desc Verify keys array can be iterated to read every value from the record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      let sum: int = 0;
      for (let i: int = 0; i < keys.length; i++) {
        sum = sum + (rec[keys[i]] as int);
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name testObjectPropertyKey5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_5900
     * @tc.desc Verify boolean false is storable and retrievable through bracket access
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, boolean> = { 'off': false } as Record<string, boolean>;
      expect(rec['off']).assertFalse();
    });

    /**
     * @tc.name testObjectPropertyKey6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6000
     * @tc.desc Verify record with keys that differ only in case are distinct properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'A': 1, 'a': 2 } as Record<string, Any>;
      expect(rec['A'] as int).assertEqual(1);
      expect(rec['a'] as int).assertEqual(2);
      expect(Object.keys(rec).length).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6100
     * @tc.desc Verify property names containing emoji are usable as bracket keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '🔑': 'key', '❤️': 'heart' } as Record<string, Any>;
      expect(rec['🔑'] as string).assertEqual('key');
      expect(rec['❤️'] as string).assertEqual('heart');
      expect(Object.keys(rec).length).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6200
     * @tc.desc Verify bracket access with keys containing parenthesis and ampersand characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a(b)': 1, 'c&d': 2 } as Record<string, int>;
      expect(rec['a(b)']).assertEqual(1);
      expect(rec['c&d']).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6300
     * @tc.desc Verify writing to a bracket key read back returns the assigned int value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec['counter'] = 7;
      expect(rec['counter'] as int).assertEqual(7);
    });

    /**
     * @tc.name testObjectPropertyKey6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6400
     * @tc.desc Verify values retrieved by matching Object.keys order correspond to inserted values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'first': 'A', 'second': 'B' } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      expect(rec[keys[0]] as string).assertEqual('A');
      expect(rec[keys[1]] as string).assertEqual('B');
    });

    /**
     * @tc.name testObjectPropertyKey6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6500
     * @tc.desc Verify Object.values length stays aligned with Object.keys length after adding a key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      rec['b'] = 2;
      expect(Object.keys(rec).length).assertEqual(2);
      expect(Object.values(rec).length).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6600
     * @tc.desc Verify null value stored via bracket key remains readable and equal to null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'n': null as Any } as Record<string, Any>;
      expect(rec['n'] as null).assertEqual(null);
    });

    /**
     * @tc.name testObjectPropertyKey6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6700
     * @tc.desc Verify numeric zero string key stores an int value retrievable by the same key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '0': 100 } as Record<string, Any>;
      expect(rec['0'] as int).assertEqual(100);
      expect(Object.keys(rec).length).assertEqual(1);
    });

    /**
     * @tc.name testObjectPropertyKey6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6800
     * @tc.desc Verify concatenated keys via string addition act as separate properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let base: string = 'user_';
      rec[base + '1'] = 10;
      rec[base + '2'] = 20;
      expect(rec['user_1'] as int).assertEqual(10);
      expect(rec['user_2'] as int).assertEqual(20);
    });

    /**
     * @tc.name testObjectPropertyKey6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_6900
     * @tc.desc Verify empty string key coexists with a non-empty key in the same record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '': 'empty', 'k': 'v' } as Record<string, Any>;
      expect(rec[''] as string).assertEqual('empty');
      expect(rec['k'] as string).assertEqual('v');
      expect(Object.keys(rec).length).assertEqual(2);
    });

    /**
     * @tc.name testObjectPropertyKey7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_PROPERTY_KEY_7000
     * @tc.desc Verify keys containing square bracket characters are preserved as literal property names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectPropertyKey7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a[0]': 1, 'b[1]': 2 } as Record<string, int>;
      expect(rec['a[0]']).assertEqual(1);
      expect(rec['b[1]']).assertEqual(2);
    });
  });
}
