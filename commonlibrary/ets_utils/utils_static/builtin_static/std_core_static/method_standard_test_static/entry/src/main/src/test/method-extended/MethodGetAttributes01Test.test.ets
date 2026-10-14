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
} from '../../../../hypium/index';
import Utils from '../Util.test';

const __getMethods = (cls: ClassType): Method[] => {
  let result: Method[] = [];
  let n: number = cls.getMethodsNum();
  for (let i: number = 0; i < n; i++) {
    result.push(cls.getMethod(i.toLong()));
  }
  return result;
};
class GANormalBoolean { isValid(): boolean { return true; } }
class GAFinalVsNormal { final doFinal(): void {}; doNormal(): void {} }
class GAMultiCtorsAttr { constructor() {}; constructor(v: number) {}; constructor(v: number, s: string) {} }
class GACtorClassA { constructor() {} }
class GACtorClassB { constructor() {} }
class GANonGetterStyle { getItem(index: number): string { return 'item'; } }
class GANonSetterStyle { setName(name: string): boolean { return name.length > 0; } }
class GATwoPublicAttr { first(): void {}; second(): void {} }
class GADeclaredVsByName { test(): void {} }
class GATargetAttr { action(): void {} }
function __getMethodByName(cls: ClassType, name: string): Method | undefined {
  const methods: Method[] = __getMethods(cls);
  for (let i: int = 0; i < methods.length; i++) {
    if (methods[i].getName() === name) {
      return methods[i];
    }
  }
  return undefined;
}
class NonPubBitCheck008 {
  secret(): void {}
}
class NonPrivCheck011 {
  open(): void {}
}
class CheckStaticBit013 {
  static run(): void {}
}
class InstanceNoStatic015 {
  doAction(): void {}
}
class NormalNoFinal018 {
  normalOp(): void {}
}
class MethodNoCtor021 {
  normal(): void {}
}
class NormalNoAsync023 {
  syncOp(): void {}
}
class NormalNoNative025 {
  compute(): int { return 0; }
}
class ConcreteNoAbs027 {
  concrete(): void {}
}
class InstVsCtorComp034 {
  constructor() {}
  doWork(): void {}
}
class GetterVsNormalComp037 {
  getValue(): int { return 0; }
  doAction(): void {}
}
class SameSigClassA038 {
  process(): void {}
}
class SameSigClassB038 {
  process(): void {}
}
class InheritParent059 {
  parentOp(): void {}
}
class InheritChild059 extends InheritParent059 {
  childOp(): void {}
}
class OverrideParent060 {
  speak(): string { return '...'; }
}
class OverrideChild060 extends OverrideParent060 {
  speak(): string { return 'bark'; }
}
class ImplicitCtor066 {
  value: int = 0;
}
class CtorNoStaticBit076 {
  constructor() {}
}
function _M(ct: ClassType, name: string): Method | null {
  return ct.getMethodByName(name);
}
class ExistClass001 {
  test(): void {}
}
class StringReflect004 {
  process(): void {}
}
class ExactParamCtor006 {
  name: string = '';
  constructor(name: string) {
    this.name = name;
  }
}
class FieldsOnly009 {
  name: string = '';
  value: number = 0;
  flag: boolean = false;
}
class PrivateParent017 {
  private secret(): void {}
  open(): void {}
}
class ChildOfPrivate017 extends PrivateParent017 {
  childOp(): void {}
}
class CaseSensitive019 {
  GetData(): void {}
  getData(): void {}
}
class CtorNotAbstract023 {
  constructor() {}
}
class CtorNotStatic024 {
  constructor() {}
}
class DeepBase036 {
  method(): void {}
}
class DeepMid036 extends DeepBase036 {
  method(): void {}
}
class DeepLeaf036 extends DeepMid036 {
  method(): void {}
}
interface BaseIface051 {
  baseOp(): void;
}
interface DerivedIface051 extends BaseIface051 {
  derivedOp(): void;
}
class ImplChain051 implements DerivedIface051 {
  baseOp(): void {}
  derivedOp(): void {}
}
class MixedTraverse055 {
  instOp(): void {}
  static statOp(): void {}
  helper(): void {}
  static util(): void {}
}
class BoxAttr058<T extends object> {
  _value: object = {};
  get(): T {
    return this._value as T;
  }
}
class AsyncNoStaticBit062 {
  async load(): Promise<void> {}
}
class PrivClassA064 {
  private secret(): void {}
}
class PrivClassB064 {
  private secret(): void {}
}
class GA3PubStatClassA066 {
  static run(): void {}
}
class GA3PubStatClassB066 {
  static run(): void {}
}
const isNotNull = (m: Method | null): boolean => { return m !== null; };

export default function MethodGetAttributes01Test(): void {
  describe('MethodGetAttributes01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0100
     * @tc.name testMethodGetAttributesAtOne001
     * @tc.desc Verify normal boolean getAttributes method returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GANormalBoolean>() as ClassType).getMethodByName('isValid');
      if (method != null) {
        const attrs: number = method.getAttributes();
        expect(attrs & 0x0008).assertEqual(0);
        expect(attrs & 0x0010).assertEqual(0);
        expect(attrs & 0x0020).assertEqual(0);
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0200
     * @tc.name testMethodGetAttributesAtOne002
     * @tc.desc Verify final vs normal getAttributes method returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType: ClassType = Type.from<GAFinalVsNormal>() as ClassType;
      const finMethod = classType.getMethodByName('doFinal');
      const norMethod = classType.getMethodByName('doNormal');
      if (finMethod != null && norMethod != null) {
        expect(finMethod.getAttributes()).not().assertEqual(norMethod.getAttributes());
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0300
     * @tc.name testMethodGetAttributesAtOne003
     * @tc.desc Verify multi ctors attr getAttributes returns expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType: ClassType = Type.from<GAMultiCtorsAttr>() as ClassType;
      const cCount: long = classType.getConstructorsNum();
      expect(cCount > 0).assertTrue();
      if (cCount > 0) {
        const attrs: number = classType.getConstructor(0).getAttributes();
        expect(attrs).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0400
     * @tc.name testMethodGetAttributesAtOne004
     * @tc.desc Verify ctor class a getAttributes returns expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctorA = (Type.from<GACtorClassA>() as ClassType).getConstructor(0);
      const ctorB = (Type.from<GACtorClassB>() as ClassType).getConstructor(0);
      if (ctorA != null && ctorB != null) {
        expect(ctorA.getAttributes() as Object).assertEqual(ctorB.getAttributes());
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0500
     * @tc.name testMethodGetAttributesAtOne005
     * @tc.desc Verify non getter style getAttributes method returns correct boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GANonGetterStyle>() as ClassType).getMethodByName('getItem');
      if (method != null) {
        const attrs: number = method.getAttributes();
        const isGet: boolean = method.isGetter();
        expect(attrs & 0x0020).assertEqual(0);
        expect(isGet).assertFalse();
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0600
     * @tc.name testMethodGetAttributesAtOne006
     * @tc.desc Verify non setter style getAttributes method returns correct boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GANonSetterStyle>() as ClassType).getMethodByName('setName');
      if (method != null) {
        const attrs: number = method.getAttributes();
        const isSet: boolean = method.isSetter();
        expect(attrs & 0x0020).assertEqual(0);
        expect(isSet).assertFalse();
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0700
     * @tc.name testMethodGetAttributesAtOne007
     * @tc.desc Verify two public attr getAttributes method returns expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType: ClassType = Type.from<GATwoPublicAttr>() as ClassType;
      const m1 = classType.getMethodByName('first');
      const m2 = classType.getMethodByName('second');
      if (m1 != null && m2 != null) {
        expect(m1.getAttributes() as Object).assertEqual(m2.getAttributes());
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0800
     * @tc.name testMethodGetAttributesAtOne008
     * @tc.desc Verify declared vs by name getAttributes method returns expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType: ClassType = Type.from<GADeclaredVsByName>() as ClassType;
      const declared: Method[] = __getMethods(classType);
      const byName = classType.getMethodByName('test');
      if (byName != null) {
        expect(declared[0].getAttributes()).assertEqual(byName.getAttributes());
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_0900
     * @tc.name testMethodGetAttributesAtOne009
     * @tc.desc Verify target attr getAttributes method returns expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref1: ClassType = Type.from<GATargetAttr>() as ClassType;
      const ref2: ClassType = Type.from<GATargetAttr>() as ClassType;
      const m1 = ref1.getMethodByName('action');
      const m2 = ref2.getMethodByName('action');
      if (m1 != null && m2 != null) {
        expect(m1.getAttributes() as Object).assertEqual(m2.getAttributes());
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1000
     * @tc.name testMethodGetAttributesAtOne010
     * @tc.desc Verify non-public bit check for default method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<NonPubBitCheck008>() as ClassType).getMethodByName('secret').getAttributes();
      expect(attrs & 0x0001).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1100
     * @tc.name testMethodGetAttributesAtOne011
     * @tc.desc Verify non-private method does not have private flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<NonPrivCheck011>() as ClassType).getMethodByName('open').getAttributes();
      expect(attrs & 0x0002).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1200
     * @tc.name testMethodGetAttributesAtOne012
     * @tc.desc Verify static method lookup via iteration with null guard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Method | undefined = __getMethodByName(Type.from<CheckStaticBit013>() as ClassType, 'run');
      expect(m).not().assertUndefined();
      if (m != undefined) {
        expect(m.getAttributes() >= 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1300
     * @tc.name testMethodGetAttributesAtOne013
     * @tc.desc Verify instance method does not have static flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<InstanceNoStatic015>() as ClassType).getMethodByName('doAction').getAttributes();
      expect(attrs & 0x0008).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1400
     * @tc.name testMethodGetAttributesAtOne014
     * @tc.desc Verify normal method does not have final flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<NormalNoFinal018>() as ClassType).getMethodByName('normalOp').getAttributes();
      expect(attrs & 0x0010).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1500
     * @tc.name testMethodGetAttributesAtOne015
     * @tc.desc Verify normal method does not have constructor flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<MethodNoCtor021>() as ClassType).getMethodByName('normal').getAttributes();
      expect(attrs & 0x0020).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1600
     * @tc.name testMethodGetAttributesAtOne016
     * @tc.desc Verify normal method does not have async flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<NormalNoAsync023>() as ClassType).getMethodByName('syncOp').getAttributes();
      expect(attrs & 0x0080).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1700
     * @tc.name testMethodGetAttributesAtOne017
     * @tc.desc Verify normal method does not have native flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<NormalNoNative025>() as ClassType).getMethodByName('compute').getAttributes();
      expect(attrs & 0x0100).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1800
     * @tc.name testMethodGetAttributesAtOne018
     * @tc.desc Verify concrete method does not have abstract flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const attrs: int = (Type.from<ConcreteNoAbs027>() as ClassType).getMethodByName('concrete').getAttributes();
      expect(attrs & 0x0400).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_1900
     * @tc.name testMethodGetAttributesAtOne019
     * @tc.desc Verify instance and constructor attributes differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType: ClassType = Type.from<InstVsCtorComp034>() as ClassType;
      const cAttr: int = classType.getConstructor(0).getAttributes();
      const mAttr: int = classType.getMethodByName('doWork').getAttributes();
      expect(cAttr).not().assertEqual(mAttr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2000
     * @tc.name testMethodGetAttributesAtOne020
     * @tc.desc Verify getter and normal method attributes are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType: ClassType = Type.from<GetterVsNormalComp037>() as ClassType;
      const gAttr: int = classType.getMethodByName('getValue').getAttributes();
      const nAttr: int = classType.getMethodByName('doAction').getAttributes();
      expect(gAttr).assertEqual(nAttr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2100
     * @tc.name testMethodGetAttributesAtOne021
     * @tc.desc Verify same signature across different classes have equal attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const aAttr: int = (Type.from<SameSigClassA038>() as ClassType).getMethodByName('process').getAttributes();
      const bAttr: int = (Type.from<SameSigClassB038>() as ClassType).getMethodByName('process').getAttributes();
      expect(aAttr).assertEqual(bAttr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2200
     * @tc.name testMethodGetAttributesAtOne022
     * @tc.desc Verify inherited method attributes are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pAttr: int = (Type.from<InheritParent059>() as ClassType).getMethodByName('parentOp').getAttributes();
      const cAttr: int = (Type.from<InheritChild059>() as ClassType).getMethodByName('parentOp').getAttributes();
      expect(pAttr).assertEqual(cAttr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2300
     * @tc.name testMethodGetAttributesAtOne023
     * @tc.desc Verify overridden method has same attributes as parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pAttr: int = (Type.from<OverrideParent060>() as ClassType).getMethodByName('speak').getAttributes();
      const cAttr: int = (Type.from<OverrideChild060>() as ClassType).getMethodByName('speak').getAttributes();
      expect(pAttr).assertEqual(cAttr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2400
     * @tc.name testMethodGetAttributesAtOne024
     * @tc.desc Verify implicit constructor has non-negative attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctor: Method = (Type.from<ImplicitCtor066>() as ClassType).getConstructor(0);
      const attrs: int = ctor.getAttributes();
      expect(attrs >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2500
     * @tc.name testMethodGetAttributesAtOne025
     * @tc.desc Verify constructor does not have static flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctor: Method = (Type.from<CtorNoStaticBit076>() as ClassType).getConstructor(0);
      const attrs: int = ctor.getAttributes();
      expect(attrs & 0x0008).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2600
     * @tc.name testMethodGetAttributesAtOne026
     * @tc.desc Verify Type.from on existing class returns valid ClassType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<ExistClass001>() as ClassType;
      expect(isNotNull(_M(ct, 'test'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2700
     * @tc.name testMethodGetAttributesAtOne027
     * @tc.desc Verify parent private method IS accessible from child class via getMethodByName and attributes equal 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType: ClassType = Type.from<ChildOfPrivate017>() as ClassType;
      const method = classType.getMethodByName('secret');
      expect(isNotNull(method)).assertTrue();
      expect(method.getAttributes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2800
     * @tc.name testMethodGetAttributesAtOne028
     * @tc.desc Verify same method name at different inheritance depths yields identical attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const baseMethod = (Type.from<DeepBase036>() as ClassType).getMethodByName('method');
      const midMethod = (Type.from<DeepMid036>() as ClassType).getMethodByName('method');
      const leafMethod = (Type.from<DeepLeaf036>() as ClassType).getMethodByName('method');
      expect(isNotNull(baseMethod) && isNotNull(midMethod) && isNotNull(leafMethod)).assertTrue();
      expect(baseMethod.getAttributes()).assertEqual(0);
      expect(midMethod.getAttributes()).assertEqual(0);
      expect(leafMethod.getAttributes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_2900
     * @tc.name testMethodGetAttributesAtOne029
     * @tc.desc Verify different generic type parameters do not affect method attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strBox: ClassType = Type.from<BoxAttr058<string>>() as ClassType;
      const intBox: ClassType = Type.from<BoxAttr058<number>>() as ClassType;
      const sMethod = strBox.getMethodByName('get');
      const iMethod = intBox.getMethodByName('get');
      if (isNotNull(sMethod) && isNotNull(iMethod)) {
        expect(sMethod.getAttributes() as Object).assertEqual(iMethod.getAttributes());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3000
     * @tc.name testMethodGetAttributesAtOne030
     * @tc.desc Verify async instance method attribute does not contain static bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<AsyncNoStaticBit062>() as ClassType).getMethodByName('load');
      if (isNotNull(method)) {
        const attrs: number = method.getAttributes();
        expect(attrs & 0x0008).assertEqual(0);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3100
     * @tc.name testMethodGetAttributesAtOne031
     * @tc.desc Verify private methods in different classes have equal attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const aMethod = (Type.from<PrivClassA064>() as ClassType).getMethodByName('secret');
      const bMethod = (Type.from<PrivClassB064>() as ClassType).getMethodByName('secret');
      if (isNotNull(aMethod) && isNotNull(bMethod)) {
        expect(aMethod.getAttributes() as Object).assertEqual(bMethod.getAttributes());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3200
     * @tc.name testMethodGetAttributesAtOne032
     * @tc.desc Verify StringReflect004 getAttributes returns correct value with as Object cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<StringReflect004>() as ClassType;
      const method = ct.getMethodByName('process');
      if (isNotNull(method)) {
        const attrs: number = method.getAttributes();
        expect(attrs).assertEqual(0);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3300
     * @tc.name testMethodGetAttributesAtOne033
     * @tc.desc Verify getConstructor with out-of-range index 5 on single-constructor class ExactParamCtor006 throws TypeError and leaves the result null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<ExactParamCtor006>() as ClassType;
      let ctor5: Method | null = null;
      try {
        ctor5 = ct.getConstructor(5);
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('TypeError'); }
      expect(ctor5).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3400
     * @tc.name testMethodGetAttributesAtOne034
     * @tc.desc Verify __getMethods (getMethodsNum + getMethod) traversal of FieldsOnly009 returns at least 18 methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<FieldsOnly009>() as ClassType;
      const methods: Method[] = __getMethods(ct);
      expect(methods.length >= 18).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3500
     * @tc.name testMethodGetAttributesAtOne035
     * @tc.desc Verify getMethodByName with non-existent method name returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<CaseSensitive019>() as ClassType;
      let method: Method | null = null;
      try {
        method = ct.getMethodByName('process');
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('TypeError'); }
      expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3600
     * @tc.name testMethodGetAttributesAtOne036
     * @tc.desc Verify CtorNotAbstract023 constructor is not abstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<CtorNotAbstract023>() as ClassType;
      const ctor: Method = ct.getConstructor(0);
      const isAbstract: boolean = ctor.isAbstract();
      expect(isAbstract).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3700
     * @tc.name testMethodGetAttributesAtOne037
     * @tc.desc Verify CtorNotStatic024 constructor is not static
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<CtorNotStatic024>() as ClassType;
      const ctor: Method = ct.getConstructor(0);
      const isStatic: boolean = ctor.isStatic();
      expect(isStatic).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3800
     * @tc.name testMethodGetAttributesAtOne038
     * @tc.desc Verify ImplChain051 interface chain method attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<ImplChain051>() as ClassType;
      const m1 = ct.getMethodByName('baseOp');
      const m2 = ct.getMethodByName('derivedOp');
      if (isNotNull(m1) && isNotNull(m2)) {
        expect(m1.getAttributes() as Object).assertEqual(m2.getAttributes());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_3900
     * @tc.name testMethodGetAttributesAtOne039
     * @tc.desc Verify MixedTraverse055 mixed static/instance traversal yields 22 methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<MixedTraverse055>() as ClassType;
      const methods: Method[] = __getMethods(ct);
      expect(methods.length).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_ONE_4000
     * @tc.name testMethodGetAttributesAtOne040
     * @tc.desc Verify GA3PubStatClassA066 and GA3PubStatClassB066 static method attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAttributesAtOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const aMethods: Method[] = __getMethods(Type.from<GA3PubStatClassA066>() as ClassType);
      const bMethods: Method[] = __getMethods(Type.from<GA3PubStatClassB066>() as ClassType);
      let aMethod: Method | null = null;
      let bMethod: Method | null = null;
      for (let i: number = 0; i < aMethods.length; i += 1) {
        if (aMethods[i.toInt()].getName() === 'run') {
          aMethod = aMethods[i.toInt()];
        }
      }
      for (let i: number = 0; i < bMethods.length; i += 1) {
        if (bMethods[i.toInt()].getName() === 'run') {
          bMethod = bMethods[i.toInt()];
        }
      }
      if (aMethod != null && bMethod != null) {
        expect(aMethod.getAttributes()).assertEqual(bMethod.getAttributes());
      } else {
        expect().assertFail();
      }
    });
  });
}
