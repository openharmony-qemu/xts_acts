'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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


class MyClass {
  public name: string = "test";
}

class CustomLocalized {
  public label: string = "data";
  public toLocaleString(locales?: string, options?: Object): String {
    return "custom:" + this.label;
  }
}

class EmptyLocaleClass {
  public toLocaleString(locales?: string, options?: Object): String {
    return "";
  }
}

class LongLocaleClass {
  public toLocaleString(locales?: string, options?: Object): String {
    let longStr: string = "";
    let maxIterations: int = 1000;
    let count: int = 0;
    while (count < maxIterations) {
      longStr += "a";
      count++;
    }
    return longStr;
  }
}

class ParentClass {
  public toLocaleString(locales?: string, options?: Object): String {
    return "parent_localized";
  }
}

class ChildClass extends ParentClass {
  public toLocaleString(locales?: string, options?: Object): String {
    let parentResult: String = super.toLocaleString(locales, options);
    return "child_" + parentResult;
  }
}

class BaseClass {
  public toLocaleString(locales?: string, options?: Object): String {
    return "base";
  }
}

class DerivedClass extends BaseClass {
  public toLocaleString(locales?: string, options?: Object): String {
    return "derived";
  }
}

class ToLocaleCustomObj {
  name: string = "ArkTS";
  version: int = 20;
}

class ToStringOnlyClass {
  public toString(): String {
    return "custom_to_string_only";
  }
}

class ToStringParent {
  public toString(): String {
    return "parent_to_string";
  }
}

class ToStringChild extends ToStringParent {
}

class LocaleArrayItem {
  public label: string;

  public constructor(label: string) {
    this.label = label;
  }

  public toLocaleString(locales?: string, options?: Object): String {
    return "item:" + this.label;
  }
}

class LocalePrefixClass {
  public toLocaleString(locales?: string, options?: Object): String {
    let tag: string = "default";
    if (locales !== undefined && locales !== "") {
      tag = locales;
    }
    return "loc:" + tag;
  }
}

class StaticLocaleClass {
  public toLocaleString(locales?: string, options?: Object): String {
    return "fixed";
  }
}



export default function ObjectToLocaleStringTest(): void {
  describe('ObjectToLocaleStringTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testObjectToLocaleString001
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0001
     * @tc.desc Verify toLocaleString method with no arguments for default behavior returning valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result: String = obj.toLocaleString();
      expect(result).assertEqual(obj.toString());
    });

    /**
     * @tc.name testObjectToLocaleString002
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0002
     * @tc.desc Verify toLocaleString method with both locales and options arguments for valid string return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let options: Record<string, Any> = {} as Record<string, Any>;
      let result: String = obj.toLocaleString("en-US", options);
      expect(result).assertEqual(obj.toString());
    });

    /**
     * @tc.name testObjectToLocaleString003
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0003
     * @tc.desc Verify toLocaleString method with en-US locale returns same value as toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let expected: String = obj.toString();
      let result: String = obj.toLocaleString("en-US");
      expect(result).assertEqual(expected);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToLocaleString004
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0004
     * @tc.desc Verify toLocaleString method with zh-CN locale returns same value as toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let expected: String = obj.toString();
      let result: String = obj.toLocaleString("zh-CN");
      expect(result).assertEqual(expected);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToLocaleString005
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0005
     * @tc.desc Verify toLocaleString method with ja-JP locale for valid string return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result: String = obj.toLocaleString("ja-JP");
      expect(result).assertEqual(obj.toString());
    });

    /**
     * @tc.name testObjectToLocaleString006
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0006
     * @tc.desc Verify toLocaleString method with string array locales for fallback mechanism returning toString value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let locales: string[] = ["zh-CN", "en-US"];
      let expected: String = obj.toString();
      let result: String = obj.toLocaleString(locales);
      expect(result).assertEqual(expected);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToLocaleString007
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0007
     * @tc.desc Verify toLocaleString method with empty string locale for boundary handling
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let emptyLocale: string = "";
      let result: String = obj.toLocaleString(emptyLocale);
      expect(result).assertEqual(obj.toString());
    });

    /**
     * @tc.name testObjectToLocaleString008
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0008
     * @tc.desc Verify toLocaleString method with BCP 47 extended language tag for compatibility
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let bcp47Tag: string = "zh-Hans-CN";
      let result: String = obj.toLocaleString(bcp47Tag);
      expect(result).assertEqual(obj.toString());
    });

    /**
     * @tc.name testObjectToLocaleString009
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0009
     * @tc.desc Verify toLocaleString method with empty options object returns toString value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let emptyOptions: Record<string, Any> = {} as Record<string, Any>;
      let expected: String = obj.toString();
      let result: String = obj.toLocaleString("en-US", emptyOptions);
      expect(result).assertEqual(expected);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToLocaleString010
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0010
     * @tc.desc Verify toLocaleString method with custom options property for valid string return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let customOptions: Record<string, Any> = {
        "localeMatcher": "best fit"
      } as Record<string, Any>;
      let result: String = obj.toLocaleString("en-US", customOptions);
      expect(result).assertEqual(obj.toString());
    });

    /**
     * @tc.name testObjectToLocaleString011
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0011
     * @tc.desc Verify toLocaleString default implementation returns exactly "[object Object]"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let expectedValue: string = "[object Object]";
      let result: String = obj.toLocaleString();
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testObjectToLocaleString012
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0012
     * @tc.desc Verify toLocaleString on Object with custom properties still returns "[object Object]"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let customObj: Object = new ToLocaleCustomObj();
      let expectedValue: string = "[object Object]";
      let result: String = customObj.toLocaleString();
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testObjectToLocaleString013
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0013
     * @tc.desc Verify toLocaleString is callable on Record<string, string> instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, string> = {
        "key1": "value1",
        "key2": "value2"
      } as Record<string, string>;
      let result: String = record.toLocaleString();
      expect(result).assertEqual("key1,value1,key2,value2");
    });

    /**
     * @tc.name testObjectToLocaleString014
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0014
     * @tc.desc Verify toLocaleString on custom class without override returns default "[object Object]"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: MyClass = new MyClass();
      let expectedValue: string = "[object Object]";
      let result: String = instance.toLocaleString();
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testObjectToLocaleString015
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0015
     * @tc.desc Verify overridden toLocaleString returns custom localized string for custom class instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: CustomLocalized = new CustomLocalized();
      let expectedValue: string = "custom:data";
      let result: String = instance.toLocaleString();
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testObjectToLocaleString016
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0016
     * @tc.desc Verify multiple calls to toLocaleString on same object return consistent results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result1: String = obj.toLocaleString();
      let result2: String = obj.toLocaleString();
      let result3: String = obj.toLocaleString();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(result3);
    });

    /**
     * @tc.name testObjectToLocaleString017
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0017
     * @tc.desc Verify toLocaleString returns valid non-empty strings for different Object instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      let result1: String = obj1.toLocaleString();
      let result2: String = obj2.toLocaleString();
      expect(result1).assertEqual("[object Object]");
      expect(result2).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToLocaleString018
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0018
     * @tc.desc Verify toLocaleString result can participate in string concatenation operations
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let suffix: string = "|suffix";
      let expectedConcat: string = "[object Object]|suffix";
      let result: String = obj.toLocaleString();
      let combined: string = result + suffix;
      let isLonger: boolean = combined.length > result.length;
      expect(combined).assertEqual(expectedConcat);
    });

    /**
     * @tc.name testObjectToLocaleString019
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0019
     * @tc.desc Verify override toLocaleString returning empty string is handled correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: EmptyLocaleClass = new EmptyLocaleClass();
      let expectedValue: string = "";
      let result: String = instance.toLocaleString();
      expect(result).assertEqual(expectedValue);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectToLocaleString020
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0020
     * @tc.desc Verify toLocaleString exists on Object prototype and is callable on instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let hasOwnMethod: boolean = obj.hasOwnProperty("toLocaleString");
      expect(hasOwnMethod).assertFalse();
      let result: String = obj.toLocaleString();
      expect(result).assertEqual(obj.toString());
    });

    /**
     * @tc.name testObjectToLocaleString021
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0021
     * @tc.desc Verify default toLocaleString does not throw any exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let caughtError: boolean = false;
      try {
        let result: String = obj.toLocaleString();
        expect(result).assertEqual(obj.toString());
      } catch (e) {
        caughtError = true;
      }
      expect(caughtError).assertFalse();
    });

    /**
     * @tc.name testObjectToLocaleString022
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0022
     * @tc.desc Verify overridden toLocaleString in subclass can call super.toLocaleString for parent implementation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: ChildClass = new ChildClass();
      let expectedValue: string = "child_parent_localized";
      let result: String = instance.toLocaleString();
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testObjectToLocaleString023
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0023
     * @tc.desc Verify toLocaleString with different locales returns consistent result for default Object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let resultEn: String = obj.toLocaleString("en-US");
      let resultZh: String = obj.toLocaleString("zh-CN");
      let resultJa: String = obj.toLocaleString("ja-JP");
      expect(resultEn).assertEqual(resultZh);
      expect(resultZh).assertEqual(resultJa);
      expect(resultEn).assertEqual(resultJa);
    });

    /**
     * @tc.name testObjectToLocaleString024
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0024
     * @tc.desc Verify default toLocaleString delegates to custom toString when only toString is overridden
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: ToStringOnlyClass = new ToStringOnlyClass();
      let result: String = instance.toLocaleString();
      expect(result).assertEqual("custom_to_string_only");
    });

    /**
     * @tc.name testObjectToLocaleString025
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0025
     * @tc.desc Verify default toLocaleString uses inherited toString implementation from parent class
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: ToStringChild = new ToStringChild();
      let result: String = instance.toLocaleString();
      expect(result).assertEqual("parent_to_string");
    });

    /**
     * @tc.name testObjectToLocaleString026
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0026
     * @tc.desc Verify empty Array toLocaleString returns empty string boundary result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArr: string[] = [];
      let result: String = emptyArr.toLocaleString();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectToLocaleString027
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0027
     * @tc.desc Verify string primitive toLocaleString returns the same string content
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "Hello ArkTS";
      let result: String = str.toLocaleString();
      expect(result).assertEqual("Hello ArkTS");
    });

    /**
     * @tc.name testObjectToLocaleString028
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0028
     * @tc.desc Verify Record with non-callable own toString still yields a non-empty toLocaleString result in the static runtime
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "toString": "notCallable"
      } as Record<string, Any>;
      let caughtError: boolean = false;
      let result: String = "";
      try {
        result = record.toLocaleString();
      } catch (e) {
        caughtError = true;
      }
      expect(caughtError).assertFalse();
      expect(result).assertEqual("toString,notCallable");
    });

    /**
     * @tc.name testObjectToLocaleString029
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0029
     * @tc.desc Verify overridden toLocaleString remains stable when locales and options arguments vary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: CustomLocalized = new CustomLocalized();
      let options: Record<string, Any> = {
        "style": "full"
      } as Record<string, Any>;
      let result1: String = instance.toLocaleString();
      let result2: String = instance.toLocaleString("en-US");
      let result3: String = instance.toLocaleString("zh-CN", options);
      expect(result1).assertEqual("custom:data");
      expect(result2).assertEqual("custom:data");
      expect(result3).assertEqual("custom:data");
    });

    /**
     * @tc.name testObjectToLocaleString030
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0030
     * @tc.desc Verify overridden toLocaleString dispatch still works when custom instance is viewed through Object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new CustomLocalized();
      let result: String = obj.toLocaleString();
      expect(result).assertEqual("custom:data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0031
     * @tc.name testObjectToLocaleString031
     * @tc.desc Verify toLocaleString on empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let result: string = rec.toLocaleString();
      expect(result).assertEqual("[object Map]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0032
     * @tc.name testObjectToLocaleString032
     * @tc.desc Verify toLocaleString returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result: string = obj.toLocaleString();
      let typeName: string = Class.of(result).getName();
      expect(typeName).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0033
     * @tc.name testObjectToLocaleString033
     * @tc.desc Verify Array with a single string element returns that element without separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["only"];
      let result: String = arr.toLocaleString();
      expect(result).assertEqual("only");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0034
     * @tc.name testObjectToLocaleString034
     * @tc.desc Verify Array of numbers joins locale-formatted numbers with comma separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let result: String = arr.toLocaleString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0035
     * @tc.name testObjectToLocaleString035
     * @tc.desc Verify Array mixing numbers and strings uses comma-separated locale conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: (string | int)[] = ["a", 1, "b"] as (string | int)[];
      let result: String = arr.toLocaleString();
      expect(result).assertEqual("a,1,b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0036
     * @tc.name testObjectToLocaleString036
     * @tc.desc Verify nested Array toLocaleString flattens one level using commas in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [["a", "b"], "c"] as Object[];
      let result: String = arr.toLocaleString();
      expect(result).assertEqual("a,b,c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0037
     * @tc.name testObjectToLocaleString037
     * @tc.desc Verify Array of class instances with custom toLocaleString yields object entries in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: LocaleArrayItem[] = [new LocaleArrayItem("A"), new LocaleArrayItem("B"), new LocaleArrayItem("C")];
      let result: String = arr.toLocaleString();
      expect(result).assertEqual("[object Object],[object Object],[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0038
     * @tc.name testObjectToLocaleString038
     * @tc.desc Verify single-element Array of custom class instance returns one object entry without separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: LocaleArrayItem[] = [new LocaleArrayItem("solo")];
      let result: String = arr.toLocaleString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0039
     * @tc.name testObjectToLocaleString039
     * @tc.desc Verify custom class Array viewed through Object type matches direct Array toLocaleString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: LocaleArrayItem[] = [new LocaleArrayItem("x"), new LocaleArrayItem("y")];
      let obj: Object = arr;
      let arrResult: String = arr.toLocaleString();
      let objResult: String = obj.toLocaleString();
      expect(arrResult).assertEqual("[object Object],[object Object]");
      expect(objResult).assertEqual(arrResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0040
     * @tc.name testObjectToLocaleString040
     * @tc.desc Verify number primitive toLocaleString returns decimal string without locale-specific formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 12345;
      let result: String = n.toLocaleString();
      expect(result).assertEqual("12,345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0041
     * @tc.name testObjectToLocaleString041
     * @tc.desc Verify boolean primitive true toLocaleString returns the literal string true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = true;
      let result: String = flag.toLocaleString();
      expect(result).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0042
     * @tc.name testObjectToLocaleString042
     * @tc.desc Verify boolean primitive false toLocaleString returns the literal string false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = false;
      let result: String = flag.toLocaleString();
      expect(result).assertEqual("false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0043
     * @tc.name testObjectToLocaleString043
     * @tc.desc Verify empty string primitive toLocaleString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: string = "";
      let result: String = empty.toLocaleString();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0044
     * @tc.name testObjectToLocaleString044
     * @tc.desc Verify non-empty string primitive toLocaleString returns the same string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "abc";
      let result: String = str.toLocaleString();
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0045
     * @tc.name testObjectToLocaleString045
     * @tc.desc Verify toLocaleString on two independent Object instances returns identical default strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      let r1: String = obj1.toLocaleString();
      let r2: String = obj2.toLocaleString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0046
     * @tc.name testObjectToLocaleString046
     * @tc.desc Verify custom toLocaleString receiving locales argument incorporates locale tag in returned string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: LocalePrefixClass = new LocalePrefixClass();
      expect(obj.toLocaleString()).assertEqual("loc:default");
      expect(obj.toLocaleString("en-US")).assertEqual("loc:en-US");
      expect(obj.toLocaleString("zh-CN")).assertEqual("loc:zh-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0047
     * @tc.name testObjectToLocaleString047
     * @tc.desc Verify custom toLocaleString returning fixed value ignores provided locales and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: StaticLocaleClass = new StaticLocaleClass();
      let options: Record<string, Any> = { "style": "long" } as Record<string, Any>;
      expect(obj.toLocaleString()).assertEqual("fixed");
      expect(obj.toLocaleString("en-US")).assertEqual("fixed");
      expect(obj.toLocaleString("zh-CN", options)).assertEqual("fixed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0048
     * @tc.name testObjectToLocaleString048
     * @tc.desc Verify child class overriding toLocaleString does not inherit parent localized prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childAsBase: BaseClass = new DerivedClass();
      let direct: DerivedClass = new DerivedClass();
      expect(childAsBase.toLocaleString()).assertEqual("derived");
      expect(direct.toLocaleString()).assertEqual("derived");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0049
     * @tc.name testObjectToLocaleString049
     * @tc.desc Verify Array with empty string element preserves the empty entry between commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["a", "", "b"];
      let result: String = arr.toLocaleString();
      expect(result).assertEqual("a,,b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0050
     * @tc.name testObjectToLocaleString050
     * @tc.desc Verify default toLocaleString invoked with string array of locales still returns object tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let locales: string[] = ["en-US", "zh-CN"];
      let result: String = obj.toLocaleString(locales);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0051
     * @tc.name testObjectToLocaleString051
     * @tc.desc Verify default toLocaleString with non-empty options object still returns object tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let options: Record<string, Any> = { "localeMatcher": "lookup" } as Record<string, Any>;
      let result: String = obj.toLocaleString("en-US", options);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0052
     * @tc.name testObjectToLocaleString052
     * @tc.desc Verify custom toLocaleString result can participate in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: CustomLocalized = new CustomLocalized();
      let result: string = obj.toLocaleString() + "|tail";
      expect(result).assertEqual("custom:data|tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0053
     * @tc.name testObjectToLocaleString053
     * @tc.desc Verify child class that only inherits parent toLocaleString returns parent localized result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ParentClass = new ParentClass();
      let result: String = obj.toLocaleString();
      expect(result).assertEqual("parent_localized");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0054
     * @tc.name testObjectToLocaleString054
     * @tc.desc Verify custom toLocaleString returning long string preserves length exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: LongLocaleClass = new LongLocaleClass();
      let result: String = obj.toLocaleString();
      expect(result.length).assertEqual(1000);
      expect((result as string)[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0055
     * @tc.name testObjectToLocaleString055
     * @tc.desc Verify repeated invocations of custom toLocaleString return identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: CustomLocalized = new CustomLocalized();
      let r1: String = obj.toLocaleString();
      let r2: String = obj.toLocaleString();
      let r3: String = obj.toLocaleString();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_LOCALE_STRING_0056
     * @tc.name testObjectToLocaleString056
     * @tc.desc Verify Array toLocaleString result containing commas can be split back to original count of string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToLocaleString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["a", "b", "c"];
      let result: string = arr.toLocaleString() as string;
      expect(result).assertEqual("a,b,c");
      let parts: string[] = result.split(",");
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual("a");
      expect(parts[2]).assertEqual("c");
    });
  });
}
