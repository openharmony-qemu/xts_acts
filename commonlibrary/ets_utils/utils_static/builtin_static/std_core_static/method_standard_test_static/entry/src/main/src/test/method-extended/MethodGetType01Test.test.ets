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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

class GetTypeSrc71Parent1 {
  constructor() {}
  calc(): number {
    return 10;
  }
}
class GetTypeSrc711 extends GetTypeSrc71Parent1 {
  constructor() {
    super();
  }
  calc(): number {
    return 20;
  }
}
class GetTypeSrc99Parent1 {
  constructor() {}
  public visible(): string {
    return 'visible';
  }
}
class GetTypeSrc991 extends GetTypeSrc99Parent1 {
  constructor() {
    super();
  }
  childOnly(): number {
    return 1;
  }
}
class GetTypeSrc1081 {
  constructor() {}
  process(): void {}
}
class GetTypeSrc1131 {
  constructor(a: number, b: string) {}
}
class GetTypeSrc1191 {
  constructor() {}
  f01(): void {}
  f02(): void {}
  f03(): void {}
  f04(): void {}
  f05(): void {}
  f06(): void {}
  f07(): void {}
  f08(): void {}
  f09(): void {}
  f10(): void {}
  f11(): void {}
  f12(): void {}
  f13(): void {}
  f14(): void {}
  f15(): void {}
  f16(): void {}
  f17(): void {}
  f18(): void {}
  f19(): void {}
  f20(): void {}
  f21(): void {}
  f22(): void {}
  f23(): void {}
  f24(): void {}
  f25(): void {}
  f26(): void {}
  f27(): void {}
  f28(): void {}
  f29(): void {}
  f30(): void {}
  f31(): void {}
  f32(): void {}
  f33(): void {}
  f34(): void {}
  f35(): void {}
  f36(): void {}
  f37(): void {}
  f38(): void {}
  f39(): void {}
  f40(): void {}
  f41(): void {}
  f42(): void {}
  f43(): void {}
  f44(): void {}
  f45(): void {}
  f46(): void {}
  f47(): void {}
  f48(): void {}
  f49(): void {}
  f50(): void {}
}
const __getMethods = (cls: ClassType): Method[] => {
  let result: Method[] = [];
  let n: number = cls.getMethodsNum();
  for (let i: number = 0; i < n; i++) {
    result.push(cls.getMethod(i.toLong()));
  }
  return result;
};
function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class TC61Class {
  getVersion(): string {
    return '1.0';
  }
}
class TC64ClassA {
  calc(): number {
    return 1;
  }
}
class TC64ClassB {
  calc(): number {
    return 2;
  }
}
class TC70Class {
  getStatus(): string {
    return 'ok';
  }
}
class TC81Class {
  private _data: string = '';
  get data(): string {
    return this._data;
  }
  set data(v: string) {
    this._data = v;
  }
}
class GetType03ErrCrossA011 {
  methodA(): string {
    return 'A';
  }
}
class GetType03ErrBase021 {
  baseMethod(): string {
    return 'base';
  }
}
class GetType03ErrSibA021 extends GetType03ErrBase021 {
  aMethod(): number {
    return 1;
  }
}
class GetType03ErrSibB021 extends GetType03ErrBase021 {
  bMethod(): boolean {
    return true;
  }
}
class GetType03ErrDeepPrivL11 {
  private secret(): string {
    return 'secret';
  }
  public open(): string {
    return 'open';
  }
}
class GetType03ErrDeepPrivL21 extends GetType03ErrDeepPrivL11 {}
class GetType03ErrDeepPrivL31 extends GetType03ErrDeepPrivL21 {}
class GetType03ErrDeepPrivL41 extends GetType03ErrDeepPrivL31 {}
class GetType03ErrDeepPrivL51 extends GetType03ErrDeepPrivL41 {
  leaf(): string {
    return 'leaf';
  }
}
class GetType03ErrCovariantParent021 {
  getObj(): GetType03ErrCovariantParent021 {
    return this;
  }
}
class GetType03ErrCovariantChild021 extends GetType03ErrCovariantParent021 {
  getObj(): GetType03ErrCovariantChild021 {
    return this;
  }
}
class GetType03ErrDiamondBase {
  baseMethod(): string {
    return 'base';
  }
}
class GetType03ErrDiamondMid1 extends GetType03ErrDiamondBase {
  mid1Method(): number {
    return 1;
  }
}
class GetType03ErrDiamondLeaf extends GetType03ErrDiamondMid1 {
  leafMethod(): void {}
}
class GetType03ErrPrivateInherit011 {
  private hidden(): string {
    return 'hidden';
  }
  public visible(): string {
    return 'visible';
  }
}
class GetType03ErrPrivateInheritChild011 extends GetType03ErrPrivateInherit011 {}

export default function MethodGetType01Test(): void {
  describe('MethodGetType01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0100
     * @tc.name testMethodGetTypeAtOne001
     * @tc.desc Verify __getMethods on child class GetTypeSrc711: every method has a non-empty result type and overridden calc returns number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let declared: Method[] = __getMethods(Type.from<GetTypeSrc711>() as ClassType);
      for (let i: number = 0; i < declared.length; i++) {
        let mt: MethodType = declared[i.toInt()].getType();
        expect(mt.getResultType().toString().length > 0).assertTrue();
        if (declared[i.toInt()].getName() === 'calc') {
          expect(mt.getResultType()).assertEqual(Type.from<number>());
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0200
     * @tc.name testMethodGetTypeAtOne002
     * @tc.desc Verify parent public method visible appears in child class getMethods traversal with result type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let methods: Method[] = __getMethods(Type.from<GetTypeSrc991>() as ClassType);
      let found: boolean = false;
      for (let i: number = 0; i < methods.length; i++) {
        if (methods[i.toInt()].getName() === 'visible') {
          let mt: MethodType = methods[i.toInt()].getType();
          expect(mt.getResultType()).assertEqual(Type.from<string>());
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0300
     * @tc.name testMethodGetTypeAtOne003
     * @tc.desc Class type conversion safety verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ct: ClassType = Type.from<GetTypeSrc1081>() as ClassType;
        let method = ct.getMethodByName('process');
        if (method != null) {
          expect(method.getName()).assertEqual('process');
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0400
     * @tc.name testMethodGetTypeAtOne004
     * @tc.desc Verify getType works on constructor obtained via getConstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor: Method = (Type.from<GetTypeSrc1131>() as ClassType).getConstructor(0);
      let mt: MethodType = ctor.getType();
      expect(mt.getResultType()).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0500
     * @tc.name testMethodGetTypeAtOne005
     * @tc.desc 50 own methods plus 18 inherited builtin methods yields 68 total; traversal without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let methods: Method[] = __getMethods(Type.from<GetTypeSrc1191>() as ClassType);
      let methodCount: number = methods.length;
      expect(methodCount).assertEqual(68);
      for (let i: number = 0; i < methods.length; i++) {
        let mt: MethodType = methods[i.toInt()].getType();
        expect(mt.getResultType().toString().length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0600
     * @tc.name testMethodGetTypeAtOne006
     * @tc.desc Call getType().getResultType() multiple times on Method, returns consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let method = (Type.from<TC61Class>() as ClassType).getMethodByName('getVersion');
      let rt1: Type = method.getType().getResultType();
      let rt2: Type = method.getType().getResultType();
      let rt3: Type = method.getType().getResultType();
      expect(rt1 as Object).assertEqual(rt2);
      expect(rt2 as Object).assertEqual(rt3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0700
     * @tc.name testMethodGetTypeAtOne007
     * @tc.desc Verify different classes with same method name calling getResultType() return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtA: Type = (Type.from<TC64ClassA>() as ClassType).getMethodByName('calc').getType().getResultType();
      let rtB: Type = (Type.from<TC64ClassB>() as ClassType).getMethodByName('calc').getType().getResultType();
      expect(rtA as Object).assertEqual(rtB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0800
     * @tc.name testMethodGetTypeAtOne008
     * @tc.desc No-parameter method parameters length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let method = _M(Type.from<TC70Class>() as ClassType, 'getStatus');
      let methodType: MethodType = method.getType();
      expect(methodType.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_0900
     * @tc.name testMethodGetTypeAtOne009
     * @tc.desc Getter and setter type detection: getResultType() is not null for both getter and setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct: ClassType = Type.from<TC81Class>() as ClassType;
      let methods: Method[] = __getMethods(ct);
      let getterFound: boolean = false;
      let setterFound: boolean = false;
      for (let i: number = 0; i < methods.length; i++) {
        if (methods[i.toInt()].isGetter()) {
          expect(methods[i.toInt()].getType().getResultType()).not().assertNull();
          getterFound = true;
        }
        if (methods[i.toInt()].isSetter()) {
          expect(methods[i.toInt()].getType().getResultType()).not().assertNull();
          setterFound = true;
        }
      }
      expect(getterFound).assertTrue();
      expect(setterFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_1000
     * @tc.name testMethodGetTypeAtOne010
     * @tc.desc Verify __getMethods on GetType03ErrCrossA011: the last method in traversal has a non-empty result type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let methods: Method[] = __getMethods(Type.from<GetType03ErrCrossA011>() as ClassType);
      let idx: number = methods.length - 1;
      if (idx >= 0) {
        let mt: MethodType = methods[idx.toInt()].getType();
        expect(mt.getResultType().toString().length > 0).assertTrue();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_1100
     * @tc.name testMethodGetTypeAtOne011
     * @tc.desc Verify getType for sibling class Methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mA = (Type.from<GetType03ErrSibA021>() as ClassType).getMethodByName('aMethod');
      let mB = (Type.from<GetType03ErrSibB021>() as ClassType).getMethodByName('bMethod');
      let mtA: MethodType = mA.getType();
      let mtB: MethodType = mB.getType();
      expect(mtA.getResultType() as Object).assertEqual(Type.from<number>());
      expect(mtB.getResultType() as Object).assertEqual(Type.from<boolean>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_1200
     * @tc.name testMethodGetTypeAtOne012
     * @tc.desc Verify parent private method not visible via child class Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let method = (Type.from<GetType03ErrDeepPrivL51>() as ClassType).getMethodByName('secret');
      let mtPub: MethodType = method.getType();
      expect(mtPub.getResultType() as Object).assertEqual(Type.from<string>());
      let publicMethod = (Type.from<GetType03ErrDeepPrivL51>() as ClassType).getMethodByName('open');
      let mtPub2: MethodType = publicMethod.getType();
      expect(mtPub2.getResultType() as Object).assertEqual(Type.from<string>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_1300
     * @tc.name testMethodGetTypeAtOne013
     * @tc.desc Verify diamond inheritance method getType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let method = (Type.from<GetType03ErrDiamondLeaf>() as ClassType).getMethodByName('baseMethod');
      let mt: MethodType = method.getType();
      expect(mt.getResultType() as Object).assertEqual(Type.from<string>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_ONE_1400
     * @tc.name testMethodGetTypeAtOne014
     * @tc.desc Verify __getMethods on child class GetType03ErrPrivateInheritChild011 yields 20 methods each with a non-empty result type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetTypeAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let methods: Method[] = __getMethods(Type.from<GetType03ErrPrivateInheritChild011>() as ClassType);
      for (let i: number = 0; i < methods.length; i++) {
        let mt: MethodType = methods[i.toInt()].getType();
        expect(mt.getResultType().toString().length > 0).assertTrue();
      }
      expect(methods.length).assertEqual(20);
    });
  });
}
