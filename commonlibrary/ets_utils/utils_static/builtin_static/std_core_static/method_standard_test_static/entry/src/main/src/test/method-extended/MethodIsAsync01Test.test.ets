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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class NoParamMethods_1 {
  async fooAsync(): Promise<void> {}
  fooSync(): void {}
  async fooStringAsync(): Promise<string> {
    return 'hello';
  }
  fooStringSync(): string {
    return 'hello';
  }
  async fooNumberAsync(): Promise<number> {
    return 42;
  }
  fooNumberSync(): number {
    return 42;
  }
  async fooBooleanAsync(): Promise<boolean> {
    return true;
  }
  fooBooleanSync(): boolean {
    return true;
  }
  async fooVoidAsync(): Promise<void> {}
  fooVoidSync(): void {}
  async fooUndefinedAsync(): Promise<undefined> {
    return undefined;
  }
  fooUndefinedSync(): undefined {
    return undefined;
  }
  async fooNullAsync(): Promise<null> {
    return null;
  }
  fooNullSync(): null {
    return null;
  }
}
class StaticInstanceMethods_1 {
  static async staticAsync(): Promise<void> {}
  static staticSync(): void {}
  static async staticAsyncReturn(): Promise<number> {
    return 1;
  }
  static staticReturn(): number {
    return 1;
  }
  async instanceAsync(): Promise<void> {}
  instanceSync(): void {}
  static async privateStaticAsync(): Promise<void> {}
  static privateStaticSync(): void {}
  static async publicStaticAsync(): Promise<void> {}
  static publicStaticSync(): void {}
}
class InterfaceStatic_1 {
  static async staticAsyncMethod(): Promise<void> {}
  static staticSyncMethod(): void {}
}
class StaticImpl_1 extends InterfaceStatic_1 {}
class SpecialNamingMethods_Nested {
  fooAsync(): void {}
  async syncStyle(): Promise<void> {}
  get data(): number {
    return 42;
  }
  get value(): number {
    return 10;
  }
  set value(val: number) {}
  async _internalAsync(): Promise<void> {}
  _internal(): void {}
  async addOperator(other: SpecialNamingMethods_Nested): Promise<SpecialNamingMethods_Nested> {
    return this;
  }
  subOperator(other: SpecialNamingMethods_Nested): SpecialNamingMethods_Nested {
    return this;
  }
  async symbolIterator(): Promise<number[]> {
    return [];
  }
  symbolToPrimitive(hint: string): number {
    return 0;
  }
  async method2Async(): Promise<void> {}
  method2(): void {}
  async chineseAsyncMethod(): Promise<void> {}
  chineseSyncMethod(): void {}
}
const isNotNull = (m: Method | null): boolean => {
  return m !== null;
};
class ParamCountMethods_Nested {
  async noParamAsync(): Promise<void> {}
  noParamSync(): void {}
  async singleParamAsync(a: number): Promise<void> {}
  singleParamSync(a: number): void {}
  async twoParamAsync(a: number, b: string): Promise<void> {}
  twoParamSync(a: number, b: string): void {}
  async threeParamAsync(a: number, b: string, c: boolean): Promise<void> {}
  threeParamSync(a: number, b: string, c: boolean): void {}
  async defaultParamAsync(a: number = 1): Promise<void> {}
  defaultParamSync(a: number = 1): void {}
  async optionalParamAsync(a?: number): Promise<void> {}
  optionalParamSync(a?: number): void {}
  async restParamAsync(...args: number[]): Promise<void> {}
  restParamSync(...args: number[]): void {}
}
class AccessModMethodsV2_Nested {
  async publicAsync(): Promise<void> {}
  publicSync(): void {}
  async privateAsync(): Promise<void> {}
  privateSync(): void {}
  async protectedAsync(): Promise<void> {}
  protectedSync(): void {}
  async packageAsync(): Promise<void> {}
  packageSync(): void {}
}
class NormalClass_03 {
  async existingAsync(): Promise<void> {}
  existingSync(): void {}
}
class Color_03 {
  static readonly Red: Color_03 = new Color_03();
  static readonly Green: Color_03 = new Color_03();
  static readonly Blue: Color_03 = new Color_03();
  valueOf(): number {
    return 0;
  }
}
class BoxNumber_03 {
  async getValueAsync(): Promise<number> {
    return 0;
  }
  getValueSync(): number {
    return 0;
  }
}
class BoxString_03 {
  async getValueAsync(): Promise<string> {
    return '';
  }
  getValueSync(): string {
    return '';
  }
}
class ReflectionTarget_03 {
  async reflectedAsync(): Promise<void> {}
  reflectedSync(): void {}
}
class GetMethodTarget_03 {
  constructor() {}
  foo(): Promise<void> {
    return new Promise<void>(() => {});
  }
  bar(): void {}
  toString(): string {
    return 'GetMethodTarget_03';
  }
  get myValue(): number {
    return 10;
  }
  set myValue(val: number) {}
}
class AsyncPatternVariants_03 {
  async arrowAsync(): Promise<void> {}
  arrowSync(): void {}
  async asyncGenerator(): Promise<number[]> {
    return [1];
  }

  syncGenerator(): number[] {
    return [1];
  }

  returnPromiseSync(): Promise<number> {
    return Promise.resolve(42.0);
  }

  useThenSync(): void {
    Promise.resolve()
      .then((): void => {})
      .then(() => {
        let x: number = 1;
      });
  }

  async withNestedAwait(): Promise<void> {
    let innerFn: () => Promise<void> = async () => {
      await Promise.resolve();
    };
    await innerFn();
  }
}
class LargeMethodClass_03 {
  m0(): void {}
  m1(): void {}
  m2(): void {}
  m3(): void {}
  m4(): void {}
  m5(): void {}
  m6(): void {}
  m7(): void {}
  m8(): void {}
  m9(): void {}
  m10(): void {}
  m11(): void {}
  m12(): void {}
  m13(): void {}
  m14(): void {}
  m15(): void {}
  m16(): void {}
  m17(): void {}
  m18(): void {}
  m19(): void {}
  m20(): void {}
  m21(): void {}
  m22(): void {}
  m23(): void {}
  m24(): void {}
  m25(): void {}
  m26(): void {}
  m27(): void {}
  m28(): void {}
  m29(): void {}
  m30(): void {}
  m31(): void {}
  m32(): void {}
  m33(): void {}
  m34(): void {}
  m35(): void {}
  m36(): void {}
  m37(): void {}
  m38(): void {}
  m39(): void {}
  m40(): void {}
  m41(): void {}
  m42(): void {}
  m43(): void {}
  m44(): void {}
  m45(): void {}
  m46(): void {}
  m47(): void {}
  m48(): void {}
  m49(): void {}
  m50(): void {}
  m51(): void {}
  m52(): void {}
  m53(): void {}
  m54(): void {}
  m55(): void {}
  m56(): void {}
  m57(): void {}
  m58(): void {}
  m59(): void {}
  m60(): void {}
  m61(): void {}
  m62(): void {}
  m63(): void {}
  m64(): void {}
  m65(): void {}
  m66(): void {}
  m67(): void {}
  m68(): void {}
  m69(): void {}
  m70(): void {}
  m71(): void {}
  m72(): void {}
  m73(): void {}
  m74(): void {}
  m75(): void {}
  m76(): void {}
  m77(): void {}
  m78(): void {}
  m79(): void {}
  m80(): void {}
  m81(): void {}
  m82(): void {}
  m83(): void {}
  m84(): void {}
  m85(): void {}
  m86(): void {}
  m87(): void {}
  m88(): void {}
  m89(): void {}
  m90(): void {}
  m91(): void {}
  m92(): void {}
  m93(): void {}
  m94(): void {}
  m95(): void {}
  m96(): void {}
  m97(): void {}
  m98(): void {}
  m99(): void {}
  async targetMethod(): Promise<void> {}
}
class DeepLevel0_03 {
  async deepAsync(): Promise<void> {}
}
class DeepLevel1_03 extends DeepLevel0_03 {}
class DeepLevel2_03 extends DeepLevel1_03 {}
class DeepLevel3_03 extends DeepLevel2_03 {}
class DeepLevel4_03 extends DeepLevel3_03 {}
class DeepLevel5_03 extends DeepLevel4_03 {}
class DeepLevel6_03 extends DeepLevel5_03 {}
class DeepLevel7_03 extends DeepLevel6_03 {}
class DeepLevel8_03 extends DeepLevel7_03 {}
class DeepLevel9_03 extends DeepLevel8_03 {}
class DeepLevel10_03 extends DeepLevel9_03 {}
class DeepLevel11_03 extends DeepLevel10_03 {}
class DeepLevel12_03 extends DeepLevel11_03 {}
class DeepLevel13_03 extends DeepLevel12_03 {}
class DeepLevel14_03 extends DeepLevel13_03 {}
class SideEffectCheck_03 {
  private counter: number = 0;
  async incrementAsync(): Promise<void> {
    this.counter++;
  }

  incrementSync(): void {
    this.counter++;
  }
}
function _findMethod(ct: ClassType, name: string): Method | undefined {
  let n: number = ct.getMethodsNum();
  for (let i: number = 0; i < n; i += 1) {
    const m = ct.getMethod(i.toLong());
    if (m.getName() === name) {
      return m;
    }
  }
  return undefined;
}

export default function MethodIsAsync01Test(): void {
  describe('MethodIsAsync01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_0100
     * @tc.name testMethodIsAsyncAtOne001
     * @tc.desc Verify isAsync() returns true for async void method fooAsync in NoParamMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<NoParamMethods_1>() as ClassType;
      expect(cls.getMethodByName('fooAsync').isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_0200
     * @tc.name testMethodIsAsyncAtOne002
     * @tc.desc Verify isAsync() returns false for sync void method fooSync in NoParamMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<NoParamMethods_1>() as ClassType;
      expect(cls.getMethodByName('fooSync').isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_0300
     * @tc.name testMethodIsAsyncAtOne003
     * @tc.desc Verify isAsync() returns false for static sync method staticSync in StaticInstanceMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<StaticInstanceMethods_1>() as ClassType;
      try {
        let m = _M(cls, 'staticSync');
        if (isNotNull(m)) {
          expect(m.isAsync()).assertFalse();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_0900
     * @tc.name testMethodIsAsyncAtOne009
     * @tc.desc Verify isAsync() returns true for static async interface method in StaticImpl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<StaticImpl_1>() as ClassType;
      try {
        let m = _M(cls, 'staticAsyncMethod');
        if (isNotNull(m)) {
          expect(m.isAsync()).assertTrue();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_1500
     * @tc.name testMethodIsAsyncAtOne015
     * @tc.desc Verify isAsync for special-naming methods (async/sync, getters, operators, internal, unicode names)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let specialCls: ClassType = Type.from<SpecialNamingMethods_Nested>() as ClassType;
      expect(specialCls.getMethodByName('fooAsync').isAsync()).assertFalse();
      expect(specialCls.getMethodByName('syncStyle').isAsync()).assertTrue();
      try {
        let mData = _M(specialCls, 'data');
        if (isNotNull(mData)) {
          expect(mData.isAsync()).assertTrue();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      try {
        let mValue = _M(specialCls, 'value');
        if (isNotNull(mValue)) {
          expect(mValue.isAsync()).assertFalse();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(specialCls.getMethodByName('_internalAsync').isAsync()).assertTrue();
      expect(specialCls.getMethodByName('_internal').isAsync()).assertFalse();
      try {
        let mOpPlus = _M(specialCls, 'operator+');
        if (isNotNull(mOpPlus)) {
          expect(mOpPlus.isAsync()).assertTrue();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      try {
        let mOpMinus = _M(specialCls, 'operator-');
        if (isNotNull(mOpMinus)) {
          expect(mOpMinus.isAsync()).assertFalse();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(specialCls.getMethodByName('method2Async').isAsync()).assertTrue();
      expect(specialCls.getMethodByName('method2').isAsync()).assertFalse();
      expect(specialCls.getMethodByName('chineseAsyncMethod').isAsync()).assertTrue();
      expect(specialCls.getMethodByName('chineseSyncMethod').isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_1600
     * @tc.name testMethodIsAsyncAtOne016
     * @tc.desc Verify isAsync for methods with different parameter counts and parameter styles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let paramCls: ClassType = Type.from<ParamCountMethods_Nested>() as ClassType;
      expect(paramCls.getMethodByName('noParamAsync').isAsync()).assertTrue();
      expect(paramCls.getMethodByName('noParamSync').isAsync()).assertFalse();
      expect(paramCls.getMethodByName('singleParamAsync').isAsync()).assertTrue();
      expect(paramCls.getMethodByName('singleParamSync').isAsync()).assertFalse();
      expect(paramCls.getMethodByName('twoParamAsync').isAsync()).assertTrue();
      expect(paramCls.getMethodByName('twoParamSync').isAsync()).assertFalse();
      expect(paramCls.getMethodByName('threeParamAsync').isAsync()).assertTrue();
      expect(paramCls.getMethodByName('threeParamSync').isAsync()).assertFalse();
      expect(paramCls.getMethodByName('defaultParamAsync').isAsync()).assertTrue();
      expect(paramCls.getMethodByName('defaultParamSync').isAsync()).assertFalse();
      expect(paramCls.getMethodByName('optionalParamAsync').isAsync()).assertTrue();
      expect(paramCls.getMethodByName('optionalParamSync').isAsync()).assertFalse();
      expect(paramCls.getMethodByName('restParamAsync').isAsync()).assertTrue();
      expect(paramCls.getMethodByName('restParamSync').isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_1700
     * @tc.name testMethodIsAsyncAtOne017
     * @tc.desc Verify isAsync for methods with different access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let accessClsV2: ClassType = Type.from<AccessModMethodsV2_Nested>() as ClassType;
      expect(accessClsV2.getMethodByName('publicAsync').isAsync()).assertTrue();
      expect(accessClsV2.getMethodByName('publicSync').isAsync()).assertFalse();
      expect(accessClsV2.getMethodByName('privateAsync').isAsync()).assertTrue();
      expect(accessClsV2.getMethodByName('privateSync').isAsync()).assertFalse();
      expect(accessClsV2.getMethodByName('protectedAsync').isAsync()).assertTrue();
      expect(accessClsV2.getMethodByName('protectedSync').isAsync()).assertFalse();
      expect(accessClsV2.getMethodByName('packageAsync').isAsync()).assertTrue();
      expect(accessClsV2.getMethodByName('packageSync').isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_1800
     * @tc.name testMethodIsAsyncAtOne018
     * @tc.desc Verify isAsync returns false for valueOf sync method from enum-style class Color_03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enumCls: ClassType = Type.from<Color_03>() as ClassType;
      let enumMethod = enumCls.getMethodByName('valueOf');
      if (enumMethod != undefined) {
        expect(enumMethod.isAsync()).assertFalse();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_2100
     * @tc.name testMethodIsAsyncAtOne021
     * @tc.desc Verify isAsync returns consistent result for getValueAsync across BoxNumber_03 and BoxString_03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxNumCls: ClassType = Type.from<BoxNumber_03>() as ClassType;
      let boxStrCls: ClassType = Type.from<BoxString_03>() as ClassType;
      expect(boxNumCls.getMethodByName('getValueAsync').isAsync()).assertEqual(
        boxStrCls.getMethodByName('getValueAsync').isAsync(),
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_2400
     * @tc.name testMethodIsAsyncAtOne024
     * @tc.desc Verify isAsync returns true for reflectedAsync and false for reflectedSync in ReflectionTarget_03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<ReflectionTarget_03>() as ClassType;
      let asyncMethod = cls.getMethodByName('reflectedAsync');
      let syncMethod = cls.getMethodByName('reflectedSync');
      expect(asyncMethod.isAsync()).assertTrue();
      expect(syncMethod.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_2500
     * @tc.name testMethodIsAsyncAtOne025
     * @tc.desc Verify isAsync returns consistent result for same method obtained through different paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAlt: ClassType = Type.from<ReflectionTarget_03>() as ClassType;
      let methodAlt = clsAlt.getMethodByName('reflectedAsync');
      let cls: ClassType = Type.from<ReflectionTarget_03>() as ClassType;
      let method = cls.getMethodByName('reflectedAsync');
      expect(method.isAsync()).assertEqual(methodAlt.isAsync());
      expect(method.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_2600
     * @tc.name testMethodIsAsyncAtOne026
     * @tc.desc Verify isAsync returns false for constructor method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<GetMethodTarget_03>() as ClassType;
      const ctorMethod = cls.getConstructor(0);
      expect(ctorMethod.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_2800
     * @tc.name testMethodIsAsyncAtOne028
     * @tc.desc Verify isAsync returns false for getter method obtained via getMethodByName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<GetMethodTarget_03>() as ClassType;
      const getterMethod = cls.getMethodByName('%%get-myValue');
      expect(getterMethod.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_3300
     * @tc.name testMethodIsAsyncAtOne033
     * @tc.desc Verify isAsync returns true for async function expression assigned to class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<AsyncPatternVariants_03>() as ClassType;
      let method: Method | undefined = _findMethod(cls, 'arrowAsync');
      if (method != undefined) {
        expect(method.isAsync()).assertTrue();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_4100
     * @tc.name testMethodIsAsyncAtOne041
     * @tc.desc Verify isAsync in NormalClass_03 via for-loop: existingAsync true, existingSync false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<NormalClass_03>() as ClassType;
      let allMethodNames: string[] = ['existingAsync', 'existingSync'];
      for (let name of allMethodNames) {
        let method = cls.getMethodByName(name) as Method;
        let isAsyncVal: boolean = method.isAsync();
        if (name === 'existingAsync') {
          expect(isAsyncVal).assertTrue();
        } else {
          expect(isAsyncVal).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_4400
     * @tc.name testMethodIsAsyncAtOne044
     * @tc.desc Verify isAsync returns true for incrementAsync via before-call check in SideEffectCheck_03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<SideEffectCheck_03>() as ClassType;
      let incrementAsyncMethod = cls.getMethodByName('incrementAsync');
      let beforeCall: boolean = incrementAsyncMethod.isAsync();
      expect(beforeCall).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISASYNC_ONE_4500
     * @tc.name testMethodIsAsyncAtOne045
     * @tc.desc Verify getMethodByName returns non-null method and isAsync returns true for targetMethod in LargeMethodClass_03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAsyncAtOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<LargeMethodClass_03>() as ClassType;
      let method = cls.getMethodByName('targetMethod');
      expect(method).not().assertUndefined();
      expect(method.isAsync()).assertTrue();
    });
  });
}
