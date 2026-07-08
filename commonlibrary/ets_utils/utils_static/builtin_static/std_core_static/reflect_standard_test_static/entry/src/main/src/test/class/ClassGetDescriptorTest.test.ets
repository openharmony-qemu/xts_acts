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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class MyClass007 {
  public name: string = "";
}

class CustomClass {
}

interface DescriptorJsonSerializable {
  serialize(): string;
}

class DescriptorTestMyClass041 {
  public value: int = 0;
}

class DescriptorAnon043Holder {
  public value: int = 0;
}

function isValidDescriptor009(descriptor: string): boolean {
  return descriptor.startsWith("L") && descriptor.endsWith(";");
}

abstract class AbstractClass020 {
  public abstract method(): void;
}

class FinalClass021 {
  public value: int = 0;
}

interface MyInterface023 {
  test(): void;
}

enum TestEnum029 {
  VALUE1,
  VALUE2
}

function descriptorToName035(descriptor: string): string {
  let inner = descriptor.substring(1, descriptor.length - 1);
  let segments = inner.split('/');
  return segments.join('.');
}

function isValidStdDescriptor038(descriptor: string): boolean {
  return descriptor.startsWith("Lstd/core/") &&
  descriptor.endsWith(";") &&
  descriptor.length > 10;
}

class OuterClass042Inner042 {
  public value: int = 0;
}

class OuterClass042 {
}

class TypeRegistry044 {
  private static descriptors: Map<string, Class> = new Map<string, Class>();

  public static register(cls: Class): void {
    TypeRegistry044.descriptors.set(cls.getDescriptor(), cls);
  }

  public static get(cls: Class): Class | undefined {
    return TypeRegistry044.descriptors.get(cls.getDescriptor());
  }
}

function getTypeInfo045(cls: Class): TypeInfo045 {
  return {
    descriptor: cls.getDescriptor(),
    name: cls.getName()
  };
}

interface TypeInfo045 {
  descriptor: string;
  name: string;
}

function toJVMSignature046(cls: Class): string {
  return cls.getDescriptor();
}

export default function ClassGetDescriptorTest(): void {
  describe('ClassGetDescriptorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0100
     * @tc.name testClassGetDescriptor001
     * @tc.desc Verify ClassGetDescriptor case 001: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("L")).assertTrue();
      expect(descriptor.endsWith(";")).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0200
     * @tc.name testClassGetDescriptor002
     * @tc.desc Verify ClassGetDescriptor case 002: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor).assertEqual("Lstd/core/Set;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0300
     * @tc.name testClassGetDescriptor003
     * @tc.desc Verify ClassGetDescriptor case 003: Class.from<Map<int, string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let descriptor = Class.from<Map<int, string>>().getDescriptor();
      expect(descriptor).assertEqual("Lstd/core/Map;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0400
     * @tc.name testClassGetDescriptor004
     * @tc.desc Verify ClassGetDescriptor case 004: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Set<string>>();
      let desc1 = cls1.getDescriptor();
      expect(desc1).assertEqual("Lstd/core/Set;");

      let cls2 = Class.from<Map<int, string>>();
      let desc2 = cls2.getDescriptor();
      expect(desc2).assertEqual("Lstd/core/Map;");

      let cls3 = Class.from<Array<int>>();
      let desc3 = cls3.getDescriptor();
      expect(desc3).assertEqual("Lstd/core/Array;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0500
     * @tc.name testClassGetDescriptor005
     * @tc.desc Verify ClassGetDescriptor case 005: Class.from<CustomClass>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CustomClass>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("L")).assertTrue();
      expect(descriptor.endsWith(";")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0600
     * @tc.name testClassGetDescriptor006
     * @tc.desc Verify ClassGetDescriptor case 006: Class.from<MyClass007>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let descriptor = cls.getDescriptor();
      expect(isValidDescriptor009(descriptor)).assertTrue();
      expect(descriptor.startsWith("L")).assertTrue();
      expect(descriptor.endsWith(";")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0700
     * @tc.name testClassGetDescriptor007
     * @tc.desc Verify ClassGetDescriptor case 007: Class.from<ArrayLike<int>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayLike<int>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("L")).assertTrue();
      expect(descriptor.endsWith(";")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0800
     * @tc.name testClassGetDescriptor008
     * @tc.desc Verify ClassGetDescriptor case 008: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();
      expect(isValidDescriptor009(descriptor)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_0900
     * @tc.name testClassGetDescriptor009
     * @tc.desc Verify ClassGetDescriptor case 009: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.indexOf("std/core")).assertLarger(-1);
      expect(descriptor.indexOf("std.core")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1000
     * @tc.name testClassGetDescriptor010
     * @tc.desc Verify ClassGetDescriptor case 010: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Set<string>>();
      let desc1 = cls1.getDescriptor();

      let cls2 = Class.from<Set<int>>();
      let desc2 = cls2.getDescriptor();

      expect(desc1).assertEqual(desc2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1100
     * @tc.name testClassGetDescriptor011
     * @tc.desc Verify ClassGetDescriptor case 011: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor !== "").assertTrue();
      expect(descriptor.length).assertLarger(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1200
     * @tc.name testClassGetDescriptor012
     * @tc.desc Verify ClassGetDescriptor case 012: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Set<string>>();
      let cls2 = Class.from<Map<int, string>>();

      let desc1 = cls1.getDescriptor();
      let desc2 = cls2.getDescriptor();

      expect(desc1 !== desc2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1300
     * @tc.name testClassGetDescriptor013
     * @tc.desc Verify ClassGetDescriptor case 013: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Set<string>>();
      let cls2 = Class.from<Set<string>>();

      let desc1 = cls1.getDescriptor();
      let desc2 = cls2.getDescriptor();

      expect(desc1).assertEqual(desc2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1400
     * @tc.name testClassGetDescriptor014
     * @tc.desc Verify ClassGetDescriptor case 014: Class.of(instance), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [];
      let cls = Class.of(arr);
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("[")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1500
     * @tc.name testClassGetDescriptor015
     * @tc.desc Verify ClassGetDescriptor case 015: Class.of(instance), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
      let cls = Class.of(arr);
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("[")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1600
     * @tc.name testClassGetDescriptor016
     * @tc.desc Verify ClassGetDescriptor case 016: Class.of(instance), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let row1: FixedArray<int> = [1, 2];
      let row2: FixedArray<int> = [3, 4];
      let arr2d: FixedArray<FixedArray<int>> = [row1, row2];
      let cls = Class.of(arr2d);
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("[[")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1700
     * @tc.name testClassGetDescriptor017
     * @tc.desc Verify ClassGetDescriptor case 017: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1800
     * @tc.name testClassGetDescriptor018
     * @tc.desc Verify ClassGetDescriptor case 018: Class.from<CustomClass>(), initialize() behavior verified, getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CustomClass>();
      let descriptor = cls.getDescriptor();
      expect(descriptor !== "").assertTrue();

      cls.initialize();
      let descriptor2 = cls.getDescriptor();
      expect(descriptor).assertEqual(descriptor2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_1900
     * @tc.name testClassGetDescriptor019
     * @tc.desc Verify ClassGetDescriptor case 019: Class.from<AbstractClass020>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass020>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2000
     * @tc.name testClassGetDescriptor020
     * @tc.desc Verify ClassGetDescriptor case 020: Class.from<FinalClass021>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass021>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2100
     * @tc.name testClassGetDescriptor021
     * @tc.desc Verify ClassGetDescriptor case 021: Class.from<DescriptorJsonSerializable>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DescriptorJsonSerializable>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("L")).assertTrue();
      expect(descriptor.endsWith(";")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2200
     * @tc.name testClassGetDescriptor022
     * @tc.desc Verify ClassGetDescriptor case 022: Class.from<MyInterface023>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface023>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2300
     * @tc.name testClassGetDescriptor023
     * @tc.desc Verify ClassGetDescriptor case 023: Class.from<boolean>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<boolean>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2400
     * @tc.name testClassGetDescriptor024
     * @tc.desc Verify ClassGetDescriptor case 024: getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.PRIMITIVE_INT;
      let descriptor = cls.getDescriptor();
      expect(descriptor).assertEqual("I");

      let cls2 = Class.PRIMITIVE_BOOLEAN;
      let descriptor2 = cls2.getDescriptor();
      expect(descriptor2).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2500
     * @tc.name testClassGetDescriptor025
     * @tc.desc Verify ClassGetDescriptor case 025: Class.from<Array<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Array<string>>();
      let cls2 = Class.from<Array<int>>();
      let cls3 = Class.from<Array<MyClass007>>();

      let desc1 = cls1.getDescriptor();
      let desc2 = cls2.getDescriptor();
      let desc3 = cls3.getDescriptor();

      expect(desc1).assertEqual(desc2);
      expect(desc2).assertEqual(desc3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2600
     * @tc.name testClassGetDescriptor026
     * @tc.desc Verify ClassGetDescriptor case 026: Class.from<Map<string, Array<int>>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Map<string, Array<int>>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor).assertEqual("Lstd/core/Map;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2700
     * @tc.name testClassGetDescriptor027
     * @tc.desc Verify ClassGetDescriptor case 027: Class.from<int | string>(), isUnion returns true, getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2800
     * @tc.name testClassGetDescriptor028
     * @tc.desc Verify ClassGetDescriptor case 028: Class.from<TestEnum029>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum029>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.startsWith("L")).assertTrue();
      expect(descriptor.endsWith(";")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_2900
     * @tc.name testClassGetDescriptor029
     * @tc.desc Verify ClassGetDescriptor case 029: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Set<string>>();
      let cls2 = Class.from<Set<int>>();
      let cls3 = Class.from<Set<boolean>>();

      let desc1 = cls1.getDescriptor();
      let desc2 = cls2.getDescriptor();
      let desc3 = cls3.getDescriptor();

      expect(desc1).assertEqual(desc2);
      expect(desc2).assertEqual(desc3);
      expect(desc1).assertEqual("Lstd/core/Set;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3000
     * @tc.name testClassGetDescriptor030
     * @tc.desc Verify ClassGetDescriptor case 030: Class.from<Map<string, int>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Map<string, int>>();
      let cls2 = Class.from<Map<int, string>>();
      let cls3 = Class.from<Map<string, string>>();

      let desc1 = cls1.getDescriptor();
      let desc2 = cls2.getDescriptor();
      let desc3 = cls3.getDescriptor();

      expect(desc1).assertEqual(desc2);
      expect(desc2).assertEqual(desc3);
      expect(desc1).assertEqual("Lstd/core/Map;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3100
     * @tc.name testClassGetDescriptor031
     * @tc.desc Verify ClassGetDescriptor case 031: Class.from<Array<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<string>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor).assertEqual("Lstd/core/Array;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3200
     * @tc.name testClassGetDescriptor032
     * @tc.desc Verify ClassGetDescriptor case 032: Class.from<Array<int>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<int>>();
      let descriptor = cls.getDescriptor();
      expect(descriptor).assertEqual("Lstd/core/Array;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3300
     * @tc.name testClassGetDescriptor033
     * @tc.desc Verify ClassGetDescriptor case 033: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();

      let name = cls.getName();
      let descriptor = cls.getDescriptor();

      expect(name).assertEqual("std.core.Set");

      expect(descriptor).assertEqual("Lstd/core/Set;");

      expect(descriptor !== name).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3400
     * @tc.name testClassGetDescriptor034
     * @tc.desc Verify ClassGetDescriptor case 034: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();
      let name = cls.getName();

      expect(descriptorToName035(descriptor)).assertEqual(name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3500
     * @tc.name testClassGetDescriptor035
     * @tc.desc Verify ClassGetDescriptor case 035: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();

      let desc1 = cls.getDescriptor();
      let desc2 = cls.getDescriptor();
      let desc3 = cls.getDescriptor();

      expect(desc1).assertEqual(desc2);
      expect(desc2).assertEqual(desc3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3600
     * @tc.name testClassGetDescriptor036
     * @tc.desc Verify ClassGetDescriptor case 036: Class.from<Map<int, string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapDesc = Class.from<Map<int, string>>().getDescriptor();
      let setDesc = Class.from<Set<string>>().getDescriptor();
      expect(mapDesc).assertEqual("Lstd/core/Map;");
      expect(setDesc).assertEqual("Lstd/core/Set;");
      expect(mapDesc === setDesc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3700
     * @tc.name testClassGetDescriptor037
     * @tc.desc Verify ClassGetDescriptor case 037: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factories: Array<() => Class> = [
      (): Class => Class.from<Set<string>>(),
      (): Class => Class.from<Map<int, string>>(),
      (): Class => Class.from<Array<int>>(),
      (): Class => Class.from<Array<string>>(),
      ];
      for (let i = 0; i < factories.length; i++) {
        let cls = factories[i]();
        let descriptor = cls.getDescriptor();
        expect(isValidStdDescriptor038(descriptor)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3800
     * @tc.name testClassGetDescriptor038
     * @tc.desc Verify ClassGetDescriptor case 038: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();

      let startTime = Date.now();
      let descriptor = '';
      for (let i = 0; i < 1000; i++) {
        descriptor = cls.getDescriptor();
      }
      let endTime = Date.now();

      console.info(`getDescriptor 1000 calls: ${endTime - startTime}ms`);
      expect(isValidStdDescriptor038(descriptor)).assertTrue();
      expect(endTime - startTime).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_3900
     * @tc.name testClassGetDescriptor039
     * @tc.desc Verify ClassGetDescriptor case 039: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();

      let descriptor = '';
      for (let i = 0; i < 10000; i++) {
        descriptor = cls.getDescriptor();
      }
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4000
     * @tc.name testClassGetDescriptor040
     * @tc.desc Verify ClassGetDescriptor case 040: Class.from<DescriptorTestMyClass041>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DescriptorTestMyClass041>();
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4100
     * @tc.name testClassGetDescriptor041
     * @tc.desc Verify ClassGetDescriptor case 041: Class.from<OuterClass042Inner042>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OuterClass042Inner042>();
      let descriptor1 = cls.getDescriptor();
      let descriptor2 = cls.getDescriptor();
      expect(descriptor1.length).assertLarger(0);
      expect(descriptor1).assertEqual(descriptor2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4200
     * @tc.name testClassGetDescriptor042
     * @tc.desc Verify ClassGetDescriptor case 042: Class.of(instance), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new DescriptorAnon043Holder();
      let cls = Class.of(obj);
      let descriptor = cls.getDescriptor();
      expect(descriptor.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4300
     * @tc.name testClassGetDescriptor043
     * @tc.desc Verify ClassGetDescriptor case 043: Class.from<Set<string>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      TypeRegistry044.register(cls);
      expect(TypeRegistry044.get(cls)).assertEqual(cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4400
     * @tc.name testClassGetDescriptor044
     * @tc.desc Verify ClassGetDescriptor case 044: Class.from<Set<string>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let info = getTypeInfo045(cls);

      expect(info.descriptor).assertEqual("Lstd/core/Set;");
      expect(info.name).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4500
     * @tc.name testClassGetDescriptor045
     * @tc.desc Verify ClassGetDescriptor case 045: Class.from<Set<string>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let signature = toJVMSignature046(cls);
      expect(signature).assertEqual("Lstd/core/Set;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4600
     * @tc.name testClassGetDescriptor046
     * @tc.desc Verify ClassGetDescriptor case 046: Class.of(instance), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setObj = new Set<int>();
      let cls = Class.of(setObj);
      let descriptor = cls.getDescriptor();
      expect(descriptor).assertEqual("Lstd/core/Set;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETDESCRIPTOR_4700
     * @tc.name testClassGetDescriptor047
     * @tc.desc Verify ClassGetDescriptor case 047: Class.from<Set<string>>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetDescriptor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let descriptor = cls.getDescriptor();

      expect(descriptor.startsWith("L")).assertTrue();
      expect(descriptor.endsWith(";")).assertTrue();
      expect(descriptor.indexOf("..")).assertEqual(-1);
      expect(descriptor.indexOf("//")).assertEqual(-1);
    });

  });
}

