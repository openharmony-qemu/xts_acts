'use static';
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
import {
  Foo,
  PointI,
  IfacePropC,
  IfacePoint,
  IfacePerson,
  IfacePersonName,
  IfaceCounter,
  IfaceManagedFoo,
  OptionalClass,
  IfaceDerivedImpl,
  Dog,
  IfaceGetterNamePerson
} from '../ets/Index';
let loadOk = true;
let loadMessage = '';
export default function TcIfaceTest(): void {
  describe("TcIfaceTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_IFACE_TEST_0100
     * @tc.name testTcIface0001
     * @tc.desc Verify that an interface cannot be directly instantiated by Object_New and object literal can be read.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let failed = cls.test_IfaceObjectNewInterfaceFail();
      let point: PointI = { x: 1, y: 1 };
      expect(failed).assertTrue();
      expect(cls.test_IfaceReadPointLiteral(point)).assertEqual(2);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0200
     * @tc.name testTcIface0002
     * @tc.desc Verify that interface properties are accessed as properties instead of fields.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let obj = new IfacePropC(10);
      expect(cls.test_IfacePropertyAccess(obj)).assertTrue();
      expect(obj.prop).assertEqual(123);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0300
     * @tc.name testTcIface0003
     * @tc.desc Verify that ordinary class fields can be accessed by field APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let point = new IfacePoint(5, 6);
      expect(cls.test_IfaceFieldAccess(point)).assertEqual(15);
      expect(point.x).assertEqual(15);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0400
     * @tc.name testTcIface0004
     * @tc.desc Verify that getter and setter properties are accessed by property APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let person = new IfacePerson(18);
      expect(cls.test_IfaceGetterSetterAccess(person)).assertEqual(35);
      expect(person.age).assertEqual(35);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0500
     * @tc.name testTcIface0005
     * @tc.desc Verify that reference type properties can be read and written by Ref property APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let person = new IfacePersonName();
      expect(cls.test_IfaceRefPropertyAccess(person)).assertEqual("Alice");
      expect(person.name).assertEqual("Alice");
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0600
     * @tc.name testTcIface0006
     * @tc.desc Verify that static fields can be accessed through class static field APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      IfaceCounter.count = 0;
      expect(cls.test_IfaceStaticFieldAccess()).assertEqual(1);
      expect(cls.test_IfaceStaticFieldAccess()).assertEqual(2);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0700
     * @tc.name testTcIface0007
     * @tc.desc Verify that a managed instance method can be called through a method ID.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let obj = new IfaceManagedFoo();
      expect(cls.test_IfaceCallManagedFunc(obj)).assertTrue();
      expect(obj.called).assertTrue();
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0800
     * @tc.name testTcIface0008
     * @tc.desc Verify that a managed instance method with parameters and return value can be called.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_IfaceCallAdd(new IfaceManagedFoo(), 3, 4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_0900
     * @tc.name testTcIface0009
     * @tc.desc Verify that a managed static method can be called through class call APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_IfaceCallStaticSquare(8)).assertEqual(64);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1000
     * @tc.name testTcIface0010
     * @tc.desc Verify that an optional function field can be read and invoked as a function object.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let obj = new OptionalClass();
      expect(cls.test_IfaceCallOptionalFn(obj)).assertEqual(7.0);
      obj.fn = (a: double, b: double): double => a * b;
      expect(cls.test_IfaceCallOptionalFn(obj)).assertEqual(12.0);
      obj.fn = undefined;
      expect(cls.test_IfaceCallOptionalFn(obj)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1100
     * @tc.name testTcIface0011
     * @tc.desc Verify that an interface object created by object literal can be modified in native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let point: PointI = { x: 10, y: 20 };
      expect(cls.test_IfaceModifyPoint(point)).assertEqual(20);
      expect(point.x).assertEqual(100);
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1200
     * @tc.name testTcIface0012
     * @tc.desc Verify that a native pointer can be wrapped, unwrapped, used, and released.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let wrapper = cls.test_IfaceCreateWrapper();
      expect(cls.test_IfaceUseWrapper(wrapper)).assertEqual(123);
      expect(cls.test_IfaceDeleteWrapper(wrapper)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1300
     * @tc.name testTcIface0013
     * @tc.desc Verify that a wrapped native pointer without a finalizer must be manually managed.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      try {
        expect(cls.test_IfaceWrapperWithoutFinalizer()).assertTrue();
      } finally {
        expect(cls.test_IfaceCleanupNativeData()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1400
     * @tc.name testTcIface0014
     * @tc.desc Verify that using property access for a field-only class reports an error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_IfaceWrongPropertyAccess(new IfacePoint(1, 2))).assertTrue();
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1500
     * @tc.name testTcIface0015
     * @tc.desc Verify that using field access for a property reports an error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_IfaceWrongFieldAccess(new IfaceGetterNamePerson())).assertTrue();
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1600
     * @tc.name testTcIface0016
     * @tc.desc Verify that properties inherited by a derived interface can be read.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_IfaceReadDerived(new IfaceDerivedImpl(7, "derived"))).assertEqual("7:derived");
    });

    /**
     * @tc.number SUB_TC_IFACE_TEST_1700
     * @tc.name testTcIface0017
     * @tc.desc Verify that an interface method implemented by a class can be called polymorphically.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcIface0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_IfaceCallAnimalSpeak(new Dog())).assertEqual("Woof");
    });
  });
}
