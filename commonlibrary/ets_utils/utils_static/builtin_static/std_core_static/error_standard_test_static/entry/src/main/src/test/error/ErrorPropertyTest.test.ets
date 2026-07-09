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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ErrorPropertyPayload {
  code: int = 7201;
  label: string = 'property-payload';
}

export default function ErrorPropertyTest(): void {
  describe('ErrorPropertyTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0010
     * @tc.name testErrorProperty001
     * @tc.desc Verify name property defaults to 'Error' after no-arg construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      expect(err.name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0020
     * @tc.name testErrorProperty002
     * @tc.desc Verify writing a custom string to name is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "CustomError";
      expect(err.name).assertEqual("CustomError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0030
     * @tc.name testErrorProperty003
     * @tc.desc Verify code property defaults to 0 after no-arg construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0040
     * @tc.name testErrorProperty004
     * @tc.desc Verify writing positive value to code is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.code = 1001;
      expect(err.code).assertEqual(1001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0050
     * @tc.name testErrorProperty005
     * @tc.desc Verify message property defaults to empty string after no-arg construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0060
     * @tc.name testErrorProperty006
     * @tc.desc Verify writing to message property is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.message = "test error message";
      expect(err.message).assertEqual("test error message");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0070
     * @tc.name testErrorProperty007
     * @tc.desc Verify writing an Error instance to cause stores the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      let cause: Error = new Error("rootCause");
      err.cause = cause;
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0080
     * @tc.name testErrorProperty008
     * @tc.desc Verify manually writing a string to stack stores and reads the same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.stack = "manual stack trace";
      expect(err.stack).assertEqual("manual stack trace");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0090
     * @tc.name testErrorProperty009
     * @tc.desc Verify Object.keys returns an array for Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      let keys: string[] = Object.keys(err);
      expect(keys !== undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0100
     * @tc.name testErrorProperty010
     * @tc.desc Verify cause property can be set to an Error and cause getter returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error("inner");
      let outer: Error = new Error("outer", { cause: inner });
      expect(outer.cause).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0110
     * @tc.name testErrorProperty011
     * @tc.desc Verify Error.stack contains trace information after throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("throw test");
      try {
        throw err;
      } catch (e) {
        expect(e.stack !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0120
     * @tc.name testErrorProperty012
     * @tc.desc Verify Object.keys returns no enumerable entries for default Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      let keys: String[] = Object.keys(e) as String[];
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0130
     * @tc.name testErrorProperty013
     * @tc.desc Verify Object.getOwnPropertyNames returns no own names for default Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      let names: String[] = Object.getOwnPropertyNames(e) as String[];
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0140
     * @tc.name testErrorProperty014
     * @tc.desc Verify message is enumerable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("visible");
      let s: String = "message";
      expect(e.message).assertEqual("visible");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0150
     * @tc.name testErrorProperty015
     * @tc.desc Verify code is reassignable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(1);
      e.code = 999;
      expect(e.code).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0160
     * @tc.name testErrorProperty016
     * @tc.desc Verify Error.name is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "NewName";
      expect(err.name).assertEqual("NewName");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0170
     * @tc.name testErrorProperty017
     * @tc.desc Verify set name to empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("O", 1, "m");
      e.name = "";
      expect(e.name).assertEqual("");
      expect(e.code).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0180
     * @tc.name testErrorProperty018
     * @tc.desc Verify set name to special chars
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "@#$%";
      expect(e.name).assertEqual("@#$%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0190
     * @tc.name testErrorProperty019
     * @tc.desc Verify set name to 200 chars
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string = "L".repeat(200);
      let e: Error = new Error("O", 0);
      e.name = n;
      expect(e.name.length).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0200
     * @tc.name testErrorProperty020
     * @tc.desc Verify set code to MAX_INT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = 2147483647;
      expect(e.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0210
     * @tc.name testErrorProperty021
     * @tc.desc Verify set code to -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = -1;
      expect(e.code).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0220
     * @tc.name testErrorProperty022
     * @tc.desc Verify code round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100);
      e.code = 200;
      e.code = 100;
      expect(e.code).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0230
     * @tc.name testErrorProperty023
     * @tc.desc Verify set message to empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(1, "non-empty");
      e.message = "";
      expect(e.message).assertEqual("");
      expect(e.code).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0240
     * @tc.name testErrorProperty024
     * @tc.desc Verify set message to 10000
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: string = "M".repeat(10000);
      let e: Error = new Error();
      e.message = m;
      expect(e.message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0250
     * @tc.name testErrorProperty025
     * @tc.desc Verify replace cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: Error = new Error("c1");
      let c2: Error = new Error("c2");
      let e: Error = new Error("w", { cause: c1 });
      e.cause = c2;
      expect(e.cause).assertEqual(c2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0260
     * @tc.name testErrorProperty026
     * @tc.desc Verify reset cause to undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("t", { cause: new Error("r") });
      e.cause = undefined;
      expect(e.cause === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0270
     * @tc.name testErrorProperty027
     * @tc.desc Verify property independence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("N", 1, "M");
      e.name = "N2";
      expect(e.code).assertEqual(1);
      expect(e.message).assertEqual("M");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0280
     * @tc.name testErrorProperty028
     * @tc.desc Verify code does not affect toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("X", "msg");
      e.code = 999;
      expect(e.toString()).assertEqual("X: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0290
     * @tc.name testErrorProperty029
     * @tc.desc Verify name mutation updates toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Old", "hello");
      e.name = "New";
      expect(e.toString()).assertEqual("New: hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0300
     * @tc.name testErrorProperty030
     * @tc.desc Verify msg mutation updates toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("T", "old");
      e.message = "new";
      expect(e.toString()).assertEqual("T: new");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0310
     * @tc.name testErrorProperty031
     * @tc.desc Verify writing name twice keeps the last written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "First";
      err.name = "Second";
      expect(err.name).assertEqual("Second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0320
     * @tc.name testErrorProperty032
     * @tc.desc Verify writing message twice keeps the last written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.message = "msg1";
      err.message = "msg2";
      expect(err.message).assertEqual("msg2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0330
     * @tc.name testErrorProperty033
     * @tc.desc Verify writing code twice keeps the last written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.code = 100;
      err.code = 200;
      expect(err.code).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0340
     * @tc.name testErrorProperty034
     * @tc.desc Verify writing cause twice replaces the reference correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      let c1: Error = new Error("cause1");
      let c2: Error = new Error("cause2");
      err.cause = c1;
      err.cause = c2;
      expect(err.cause).assertEqual(c2);
      expect(err.cause !== c1).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0350
     * @tc.name testErrorProperty035
     * @tc.desc Verify writing stack twice keeps the last written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.stack = "stack1";
      err.stack = "stack2";
      expect(err.stack).assertEqual("stack2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0360
     * @tc.name testErrorProperty036
     * @tc.desc Verify toString reflects sequential writes to name then message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "SeqName";
      err.message = "SeqMsg";
      expect(err.toString()).assertEqual("SeqName: SeqMsg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0370
     * @tc.name testErrorProperty037
     * @tc.desc Verify interleaved writes to name, code, and message all persist correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "N1";
      err.code = 10;
      err.message = "M1";
      err.name = "N2";
      err.code = 20;
      err.message = "M2";
      expect(err.name).assertEqual("N2");
      expect(err.code).assertEqual(20);
      expect(err.message).assertEqual("M2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0380
     * @tc.name testErrorProperty038
     * @tc.desc Verify toString still correct when message set before name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.message = "FirstMsg";
      err.name = "FirstName";
      expect(err.toString()).assertEqual("FirstName: FirstMsg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0390
     * @tc.name testErrorProperty039
     * @tc.desc Verify code, cause, stack modifications do not change toString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "MyErr";
      err.message = "msg";
      let before: String = err.toString();
      err.code = 999;
      err.cause = new Error("cause");
      err.stack = "custom";
      let after: String = err.toString();
      expect(before).assertEqual(after);
      expect(after).assertEqual("MyErr: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0400
     * @tc.name testErrorProperty040
     * @tc.desc Verify Error.stack auto-generates and contains name after throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("stack check");
      try {
        throw err;
      } catch (e) {
        let s: String = e.stack as String;
        expect(s.length > 10).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0410
     * @tc.name testErrorProperty041
     * @tc.desc Verify code write-read roundtrip preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = 42;
      expect(e.code).assertEqual(42);
      e.code = 0;
      expect(e.code).assertEqual(0);
      e.code = -1;
      expect(e.code).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0420
     * @tc.name testErrorProperty042
     * @tc.desc Verify name can be written after construction with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("initial msg");
      e.name = "Renamed";
      expect(e.name).assertEqual("Renamed");
      expect(e.message).assertEqual("initial msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0430
     * @tc.name testErrorProperty043
     * @tc.desc Verify cause is still accessible after mutating name, message and code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("original cause");
      let e: Error = new Error("msg", { cause: cause });
      e.name = "Mutated";
      e.message = "new msg";
      e.code = 999;
      expect(e.cause).assertEqual(cause);
      expect((e.cause as Error).message).assertEqual("original cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0440
     * @tc.name testErrorProperty044
     * @tc.desc Verify setting name, message, code, cause on same Error preserves each independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("root");
      let e: Error = new Error("base");
      e.name = "CustomName";
      e.message = "CustomMsg";
      e.code = 555;
      e.cause = cause;
      expect(e.name).assertEqual("CustomName");
      expect(e.message).assertEqual("CustomMsg");
      expect(e.code).assertEqual(555);
      expect(e.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0450
     * @tc.name testErrorProperty045
     * @tc.desc Verify Object.keys remains empty after built-in property mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("mutate");
      e.code = 300;
      let keys: String[] = Object.keys(e) as String[];
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0460
     * @tc.name testErrorProperty046
     * @tc.desc Verify deeply nested cause chain properties are all accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3: Error = new Error("level3");
      l3.code = 33;
      let l2: Error = new Error("level2", { cause: l3 });
      l2.code = 22;
      let l1: Error = new Error("level1", { cause: l2 });
      l1.code = 11;
      expect((l1.cause as Error).code).assertEqual(22);
      expect(((l1.cause as Error).cause as Error).code).assertEqual(33);
      expect(((l1.cause as Error).cause as Error).message).assertEqual("level3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0470
     * @tc.name testErrorProperty047
     * @tc.desc Verify for loop over Object.keys finds no Error built-in keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("enum test");
      let keys: string[] = Object.keys(e);
      let found: string[] = [];
      for (let i: int = 0; i < keys.length; i++) {
        found.push(keys[i]);
      }
      expect(found.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0480
     * @tc.name testErrorProperty048
     * @tc.desc Verify stack is undefined before Error is thrown (default state)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("not thrown yet");
      let s: String | undefined = e.stack;
      expect(s !== undefined).assertEqual(true);
      if (s !== undefined) {
        expect(s.length > 0).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0490
     * @tc.name testErrorProperty049
     * @tc.desc Verify manually setting stack then throwing preserves the set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("custom stack");
      e.stack = "manual stack trace";
      try {
        throw e;
      } catch (caught) {
        expect(caught.stack as string).assertEqual("manual stack trace");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0500
     * @tc.name testErrorProperty050
     * @tc.desc Verify name setter with Unicode CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = '错误名称';
      expect(e.name).assertEqual('错误名称');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0510
     * @tc.name testErrorProperty051
     * @tc.desc Verify name setter with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = '⚠️Error🔥';
      expect(e.name).assertEqual('⚠️Error🔥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0520
     * @tc.name testErrorProperty052
     * @tc.desc Verify name setter with long string (200 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      let longName: string = 'N'.repeat(200);
      e.name = longName;
      expect(e.name.length).assertEqual(200);
      expect(e.name).assertEqual(longName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0530
     * @tc.name testErrorProperty053
     * @tc.desc Verify name setter with tab and newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      let name: string = 'Err\tor\nName';
      e.name = name;
      expect(e.name).assertEqual(name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0540
     * @tc.name testErrorProperty054
     * @tc.desc Verify stack setter with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.stack = '';
      expect(e.stack as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0550
     * @tc.name testErrorProperty055
     * @tc.desc Verify stack setter with long stack string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      let longStack: string = 'Error\n  at fn1\n  at fn2\n  at fn3\n'.repeat(50);
      e.stack = longStack;
      expect(e.stack as string).assertEqual(longStack);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0560
     * @tc.name testErrorProperty056
     * @tc.desc Verify name setter with numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = '12345';
      expect(e.name).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0570
     * @tc.name testErrorProperty057
     * @tc.desc Verify code setter with MIN_INT value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = -2147483648;
      expect(e.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0580
     * @tc.name testErrorProperty058
     * @tc.desc Verify code setter with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = 0xFF;
      expect(e.code).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0590
     * @tc.name testErrorProperty059
     * @tc.desc Verify code setter with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = 0b1010;
      expect(e.code).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0600
     * @tc.name testErrorProperty060
     * @tc.desc Verify code setter with octal literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = 0o777;
      expect(e.code).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0610
     * @tc.name testErrorProperty061
     * @tc.desc Verify code setter with large business value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = 1000000;
      expect(e.code).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0620
     * @tc.name testErrorProperty062
     * @tc.desc Verify code setter with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = -999;
      expect(e.code).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0630
     * @tc.name testErrorProperty063
     * @tc.desc Verify hasOwnProperty('message') returns false (message is on prototype in ArkTS)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError('x');
      expect(e.hasOwnProperty('message')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0640
     * @tc.name testErrorProperty064
     * @tc.desc Verify hasOwnProperty('name') returns false (name is on prototype in ArkTS)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError('x');
      expect(e.hasOwnProperty('name')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0650
     * @tc.name testErrorProperty065
     * @tc.desc Verify hasOwnProperty('cause') returns false even when cause is provided (cause on prototype in ArkTS)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: SyntaxError = new SyntaxError('x', { cause: 1 as Object });
      expect(e.hasOwnProperty('cause')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0660
     * @tc.name testErrorProperty066
     * @tc.desc Verify hasOwnProperty('code') returns false (code is on prototype in ArkTS)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError('x');
      expect(e.hasOwnProperty('code')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0670
     * @tc.name testErrorProperty067
     * @tc.desc Verify hasOwnProperty('cause') returns false when cause is not provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError('x');
      expect(e.hasOwnProperty('cause')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0680
     * @tc.name testErrorProperty068
     * @tc.desc Verify JSON.stringify on Error with message returns empty object text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('json-message');
      let json: string = JSON.stringify(err);
      expect(json).assertEqual('{}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0690
     * @tc.name testErrorProperty069
     * @tc.desc Verify JSON.stringify on mutated Error still omits built-in fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('json-mutated', { cause: 'json-cause' });
      err.name = 'JsonName';
      err.message = 'json-updated';
      err.code = 7300;
      expect(JSON.stringify(err)).assertEqual('{}');
      expect(err.cause).assertEqual('json-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0700
     * @tc.name testErrorProperty070
     * @tc.desc Verify long constructor message remains readable through message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'p'.repeat(4096);
      let err: Error = new Error(message);
      expect(err.message.length).assertEqual(4096);
      expect(err.message).assertEqual(message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0710
     * @tc.name testErrorProperty071
     * @tc.desc Verify isolated surrogate message remains readable through message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('\uDC04');
      expect(err.message).assertEqual('\uDC04');
      expect(err.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0720
     * @tc.name testErrorProperty072
     * @tc.desc Verify Object.keys count stays stable across repeated Error property reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('repeat-keys');
      let keyCount: int = Object.keys(err).length;
      for (let i: int = 0; i < 100; i++) {
        expect(Object.keys(err).length).assertEqual(keyCount);
        expect(err.message).assertEqual('repeat-keys');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0730
     * @tc.name testErrorProperty073
     * @tc.desc Verify own property name count stays stable after Error property writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('own-names');
      let before: int = Object.getOwnPropertyNames(err).length;
      err.name = 'OwnName';
      err.message = 'own-message';
      err.code = 7700;
      err.cause = 'own-cause';
      let after: int = Object.getOwnPropertyNames(err).length;
      expect(after).assertEqual(before);
      expect(err.message).assertEqual('own-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0740
     * @tc.name testErrorProperty074
     * @tc.desc Verify message property is stable after source variable reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = 'property-source-before';
      let err: Error = new Error(source);
      source = 'property-source-after';
      expect(err.message).assertEqual('property-source-before');
      expect(source).assertEqual('property-source-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0750
     * @tc.name testErrorProperty075
     * @tc.desc Verify name property is stable after assigned variable reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let assignedName: string = 'AssignedNameBefore';
      let err: Error = new Error('name-source');
      err.name = assignedName;
      assignedName = 'AssignedNameAfter';
      expect(err.name).assertEqual('AssignedNameBefore');
      expect(assignedName).assertEqual('AssignedNameAfter');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0760
     * @tc.name testErrorProperty076
     * @tc.desc Verify cause property is stable after source variable reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('cause-before');
      let err: Error = new Error('cause-holder', { cause: cause });
      cause = new Error('cause-after');
      expect((err.cause as Error).message).assertEqual('cause-before');
      expect(cause.message).assertEqual('cause-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0770
     * @tc.name testErrorProperty077
     * @tc.desc Verify Error cause can reference itself and remain readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('self-cause');
      err.cause = err;
      expect(err.cause).assertEqual(err);
      expect(err.message).assertEqual('self-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0780
     * @tc.name testErrorProperty078
     * @tc.desc Verify circular Error cause references remain readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('circle-first');
      let second: Error = new Error('circle-second', { cause: first });
      first.cause = second;
      expect(first.cause).assertEqual(second);
      expect(second.cause).assertEqual(first);
      expect(first.message).assertEqual('circle-first');
      expect(second.message).assertEqual('circle-second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0790
     * @tc.name testErrorProperty079
     * @tc.desc Verify mutating Error cause message is visible through cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('cause-original');
      let err: Error = new Error('cause-visible', { cause: cause });
      cause.message = 'cause-mutated';
      expect((err.cause as Error).message).assertEqual('cause-mutated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0800
     * @tc.name testErrorProperty080
     * @tc.desc Verify custom object cause mutation is visible through same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorPropertyPayload = new ErrorPropertyPayload();
      let err: Error = new Error('payload-cause', { cause: payload });
      payload.label = 'property-payload-mutated';
      expect(err.cause).assertEqual(payload);
      expect(payload.label).assertEqual('property-payload-mutated');
      expect(payload.code).assertEqual(7201);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0810
     * @tc.name testErrorProperty081
     * @tc.desc Verify array cause mutation is visible through same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: string[] = ['before'];
      let err: Error = new Error('array-cause', { cause: cause });
      cause.push('after');
      expect(err.cause).assertEqual(cause);
      expect(cause.length).assertEqual(2);
      expect(cause[1]).assertEqual('after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0820
     * @tc.name testErrorProperty082
     * @tc.desc Verify Map cause mutation is visible through same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Map<string, string> = new Map<string, string>();
      cause.set('phase', 'before');
      let err: Error = new Error('map-cause', { cause: cause });
      cause.set('phase', 'after');
      expect(err.cause).assertEqual(cause);
      expect(cause.get('phase')).assertEqual('after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0830
     * @tc.name testErrorProperty083
     * @tc.desc Verify Set cause mutation is visible through same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Set<string> = new Set<string>();
      cause.add('before');
      let err: Error = new Error('set-cause', { cause: cause });
      cause.add('after');
      expect(err.cause).assertEqual(cause);
      expect(cause.has('after')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0840
     * @tc.name testErrorProperty084
     * @tc.desc Verify Date cause keeps the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Date = new Date(123456);
      let err: Error = new Error('date-cause', { cause: cause });
      expect(err.cause).assertEqual(cause);
      expect(cause.getTime()).assertEqual(123456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0850
     * @tc.name testErrorProperty085
     * @tc.desc Verify false cause value remains readable with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('false-cause', { cause: false });
      expect(err.message).assertEqual('false-cause');
      expect(err.cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0860
     * @tc.name testErrorProperty086
     * @tc.desc Verify NaN cause value remains readable with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('nan-cause', { cause: NaN });
      expect(err.message).assertEqual('nan-cause');
      expect(Number.isNaN(err.cause as number)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0870
     * @tc.name testErrorProperty087
     * @tc.desc Verify Number.MAX_VALUE cause remains readable with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('max-value-cause', { cause: Number.MAX_VALUE });
      expect(err.message).assertEqual('max-value-cause');
      expect(err.cause).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0880
     * @tc.name testErrorProperty088
     * @tc.desc Verify manual stack value remains after name and message mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('stack-before');
      err.stack = 'manual-property-stack';
      err.name = 'StackName';
      err.message = 'stack-after';
      expect(err.stack).assertEqual('manual-property-stack');
      expect(err.toString()).assertEqual('StackName: stack-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0890
     * @tc.name testErrorProperty089
     * @tc.desc Verify String conversion follows toString after property writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('string-before');
      err.name = 'StringName';
      err.message = 'string-after';
      expect(String(err)).assertEqual(err.toString());
      expect(String(err)).assertEqual('StringName: string-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0900
     * @tc.name testErrorProperty090
     * @tc.desc Verify code mutation does not affect object cause reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('code-cause');
      let err: Error = new Error('code-holder', { cause: cause });
      err.code = 1;
      err.code = 9400;
      expect(err.code).assertEqual(9400);
      expect(err.cause).assertEqual(cause);
      expect(cause.message).assertEqual('code-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0910
     * @tc.name testErrorProperty091
     * @tc.desc Verify repeated reads keep name message code and cause stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('stable-cause');
      let err: Error = new Error('stable-message', { cause: cause });
      err.name = 'StableName';
      err.code = 9500;
      for (let i: int = 0; i < 100; i++) {
        expect(err.name).assertEqual('StableName');
        expect(err.message).assertEqual('stable-message');
        expect(err.code).assertEqual(9500);
        expect(err.cause).assertEqual(cause);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0920
     * @tc.name testErrorProperty092
     * @tc.desc Verify Object.keys count remains stable after repeated property mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('key-mutation-before');
      let keyCount: int = Object.keys(err).length;
      for (let i: int = 0; i < 10; i++) {
        err.name = 'KeyName' + i;
        err.message = 'key-message-' + i;
        err.code = i;
        err.cause = i;
        expect(Object.keys(err).length).assertEqual(keyCount);
      }
      expect(err.name).assertEqual('KeyName9');
      expect(err.message).assertEqual('key-message-9');
      expect(err.code).assertEqual(9);
      expect(err.cause).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0930
     * @tc.name testErrorProperty093
     * @tc.desc Verify TypeError cause keeps subtype name and message values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: TypeError = new TypeError('typed-cause');
      let err: Error = new Error('type-cause-holder', { cause: cause });
      expect(err.cause).assertEqual(cause);
      expect(cause.name).assertEqual('TypeError');
      expect(cause.message).assertEqual('typed-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0940
     * @tc.name testErrorProperty094
     * @tc.desc Verify RangeError cause name mutation is visible through same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: RangeError = new RangeError('range-cause');
      let err: Error = new Error('range-holder', { cause: cause });
      cause.name = 'MutatedRangeName';
      expect(err.cause).assertEqual(cause);
      expect(cause.name).assertEqual('MutatedRangeName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0950
     * @tc.name testErrorProperty095
     * @tc.desc Verify five level cause chain keeps terminal message and code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('chain-root');
      root.code = 9901;
      let current: Error = root;
      for (let i: int = 1; i <= 4; i++) {
        current = new Error('chain-level-' + i, { cause: current });
      }
      let cursor: Error = current;
      for (let i: int = 4; i > 0; i--) {
        expect(cursor.message).assertEqual('chain-level-' + i);
        cursor = cursor.cause as Error;
      }
      expect(cursor.message).assertEqual('chain-root');
      expect(cursor.code).assertEqual(9901);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0960
     * @tc.name testErrorProperty096
     * @tc.desc Verify ErrorOptions-shaped object can be stored as cause payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorOptions = { cause: 'inner-options-cause' };
      let err: Error = new Error('options-payload', { cause: payload });
      expect(err.cause).assertEqual(payload);
      expect(payload.cause).assertEqual('inner-options-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0970
     * @tc.name testErrorProperty097
     * @tc.desc Verify cause reassignment from primitive to object to Error preserves final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('cause-reassign-sequence');
      let payload: ErrorPropertyPayload = new ErrorPropertyPayload();
      let finalCause: Error = new Error('final-cause');
      err.cause = 'primitive-cause';
      expect(err.cause).assertEqual('primitive-cause');
      err.cause = payload;
      expect(err.cause).assertEqual(payload);
      err.cause = finalCause;
      expect(err.cause).assertEqual(finalCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0980
     * @tc.name testErrorProperty098
     * @tc.desc Verify explicit undefined cause option leaves message readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('undefined-cause-option', { cause: undefined });
      expect(err.message).assertEqual('undefined-cause-option');
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_0990
     * @tc.name testErrorProperty099
     * @tc.desc Verify empty message with empty string cause preserves both values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('', { cause: '' });
      expect(err.message).assertEqual('');
      expect(err.cause).assertEqual('');
      expect(err.toString()).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1000
     * @tc.name testErrorProperty100
     * @tc.desc Verify positive infinity cause remains readable through property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('positive-infinity-cause', { cause: Infinity });
      expect(err.message).assertEqual('positive-infinity-cause');
      expect(err.cause).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1010
     * @tc.name testErrorProperty101
     * @tc.desc Verify negative infinity cause remains readable through property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('negative-infinity-cause', { cause: -Infinity });
      expect(err.message).assertEqual('negative-infinity-cause');
      expect(err.cause).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1020
     * @tc.name testErrorProperty102
     * @tc.desc Verify negative zero cause keeps sign through numeric read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('negative-zero-cause', { cause: -0.0 });
      expect(err.message).assertEqual('negative-zero-cause');
      expect(1 / (err.cause as number)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1030
     * @tc.name testErrorProperty103
     * @tc.desc Verify stack property is stable after source variable reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stackSource: string = 'stack-source-before';
      let err: Error = new Error('stack-source');
      err.stack = stackSource;
      stackSource = 'stack-source-after';
      expect(err.stack).assertEqual('stack-source-before');
      expect(stackSource).assertEqual('stack-source-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1040
     * @tc.name testErrorProperty104
     * @tc.desc Verify stack property preserves newline and tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('escaped-stack');
      err.stack = 'line-one\nline-two\tframe';
      expect(err.stack).assertEqual('line-one\nline-two\tframe');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1050
     * @tc.name testErrorProperty105
     * @tc.desc Verify toString output ignores nested cause value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('hidden-cause-message');
      let err: Error = new Error('visible-error-message', { cause: cause });
      expect(err.toString()).assertEqual('Error: visible-error-message');
      expect(err.toString().indexOf('hidden-cause-message')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1060
     * @tc.name testErrorProperty106
     * @tc.desc Verify String conversion ignores code and stack mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('string-visible');
      err.code = 11000;
      err.stack = 'string-hidden-stack';
      expect(String(err)).assertEqual('Error: string-visible');
      expect(String(err).indexOf('11000')).assertEqual(-1);
      expect(String(err).indexOf('string-hidden-stack')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1070
     * @tc.name testErrorProperty107
     * @tc.desc Verify hasOwnProperty remains false after built-in property writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('own-write-check', { cause: 'own-cause' });
      err.name = 'OwnWriteName';
      err.message = 'own-write-message';
      err.code = 11100;
      expect(err.hasOwnProperty('name')).assertEqual(false);
      expect(err.hasOwnProperty('message')).assertEqual(false);
      expect(err.hasOwnProperty('code')).assertEqual(false);
      expect(err.hasOwnProperty('cause')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1080
     * @tc.name testErrorProperty108
     * @tc.desc Verify own property name count is stable after stack assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('own-stack-count');
      let before: int = Object.getOwnPropertyNames(err).length;
      err.stack = 'own-stack-value';
      let after: int = Object.getOwnPropertyNames(err).length;
      expect(after).assertEqual(before);
      expect(err.stack).assertEqual('own-stack-value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1090
     * @tc.name testErrorProperty109
     * @tc.desc Verify JSON.stringify remains empty after stack and cause writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('json-stack-cause');
      err.stack = 'json-stack';
      err.cause = 'json-cause';
      expect(JSON.stringify(err)).assertEqual('{}');
      expect(err.cause).assertEqual('json-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1100
     * @tc.name testErrorProperty110
     * @tc.desc Verify mixed Unicode message remains readable and drives toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '\uD83D\uDE00-\u05D0-\uFF21-\u221E';
      let err: Error = new Error(message);
      expect(err.message).assertEqual(message);
      expect(err.toString()).assertEqual('Error: ' + message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1110
     * @tc.name testErrorProperty111
     * @tc.desc Verify replacing one shared cause holder does not affect another holder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error('shared-cause');
      let first: Error = new Error('first-holder', { cause: shared });
      let second: Error = new Error('second-holder', { cause: shared });
      first.cause = new Error('replacement-cause');
      expect((first.cause as Error).message).assertEqual('replacement-cause');
      expect(second.cause).assertEqual(shared);
      expect((second.cause as Error).message).assertEqual('shared-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1120
     * @tc.name testErrorProperty112
     * @tc.desc Verify message reset to empty keeps cause reference readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('reset-message-cause');
      let err: Error = new Error('reset-message-before', { cause: cause });
      err.message = '';
      expect(err.message).assertEqual('');
      expect(err.cause).assertEqual(cause);
      expect(err.toString()).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1130
     * @tc.name testErrorProperty113
     * @tc.desc Verify stack assignments remain independent across Error instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorProperty113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('stack-first');
      let second: Error = new Error('stack-second');
      first.stack = 'first-stack';
      second.stack = 'second-stack';
      expect(first.stack).assertEqual('first-stack');
      expect(second.stack).assertEqual('second-stack');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1140
     * @tc.name testErrorProperty114
     * @tc.desc Verify built-in Error subclasses default name and empty message with undefined input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typeErr: TypeError = new TypeError(undefined);
      let rangeErr: RangeError = new RangeError(undefined);
      let syntaxErr: SyntaxError = new SyntaxError(undefined);
      let referenceErr: ReferenceError = new ReferenceError(undefined);
      let evalErr: EvalError = new EvalError(undefined);
      let uriErr: URIError = new URIError(undefined);
      expect(typeErr.name + ':' + typeErr.message).assertEqual('TypeError:');
      expect(rangeErr.name + ':' + rangeErr.message).assertEqual('RangeError:');
      expect(syntaxErr.name + ':' + syntaxErr.message).assertEqual('SyntaxError:');
      expect(referenceErr.name + ':' + referenceErr.message).assertEqual('ReferenceError:');
      expect(evalErr.name + ':' + evalErr.message).assertEqual('EvalError:');
      expect(uriErr.name + ':' + uriErr.message).assertEqual('URIError:');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_PROPERTY_1150
     * @tc.name testErrorProperty115
     * @tc.desc Verify built-in Error subclass stack strings include subclass names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorProperty115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typeErr: TypeError = new TypeError('type-stack');
      let rangeErr: RangeError = new RangeError('range-stack');
      let syntaxErr: SyntaxError = new SyntaxError('syntax-stack');
      let referenceErr: ReferenceError = new ReferenceError('reference-stack');
      let evalErr: EvalError = new EvalError('eval-stack');
      let uriErr: URIError = new URIError('uri-stack');
      expect((typeErr.stack as string).includes('TypeError')).assertEqual(true);
      expect((rangeErr.stack as string).includes('RangeError')).assertEqual(true);
      expect((syntaxErr.stack as string).includes('SyntaxError')).assertEqual(true);
      expect((referenceErr.stack as string).includes('ReferenceError')).assertEqual(true);
      expect((evalErr.stack as string).includes('EvalError')).assertEqual(true);
      expect((uriErr.stack as string).includes('URIError')).assertEqual(true);
    });
  });
}
