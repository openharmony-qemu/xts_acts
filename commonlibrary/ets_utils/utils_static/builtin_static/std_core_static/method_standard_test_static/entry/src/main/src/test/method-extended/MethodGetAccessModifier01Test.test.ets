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

class PubCtorAM {
  constructor() {}
}
class CtorVsMethod {
  constructor() {}
  exec(): void {}
}
class PubA {
  run(): void {}
}
class PubB {
  run(): void {}
}
class FourMethods {
  a(): void {}
  b(): void {}
  c(): void {}
  d(): void {}
}
class MixPubPriv {
  private a0(): void {}
  private a1(): void {}
  b0(): void {}
  b1(): void {}
  private a2(): void {}
  b2(): void {}
  private a3(): void {}
  b3(): void {}
  private a4(): void {}
  b4(): void {}
}
class MixFour {
  a(): void {}
  b(): void {}
  c(): void {}
  private d(): void {}
  private e(): void {}
  protected f(): void {}
  protected g(): void {}
  protected h(): void {}
}
interface IAa {
  a(): void;
}
interface IBb {
  b(): void;
}
class ImplAB implements IAa, IBb {
  a(): void {}
  b(): void {}
}
function isNotNull(m: Method | null): boolean {
  return m !== null;
}
function __getMethods(cls: ClassType): Method[] {
  let result: Method[] = [];
  let n: long = cls.getMethodsNum();
  for (let i: long = 0; i < n; i++) {
    result.push(cls.getMethod(i.toLong()));
  }
  return result;
}
class ProtRange {
  protected run(): void {}
}
class Consist5 {
  hide(): void {}
}
class IndexByName {
  run(): void {}
}
class MultiRef {
  run(): void {}
}
class BasePubForChild {
  baseMethod(): void {}
}
class ChildForBase extends BasePubForChild {
  childMethod(): void {}
}
class PropOnlyClass {
  name: string = '';
  age: number = 0;
  active: boolean = true;
}
class RepeatMethods {
  a(): void {}
  b(): void {}
}

export default function MethodGetAccessModifier01Test(): void {
  describe('MethodGetAccessModifier01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0100
     * @tc.name testMethodGetAccessModifierAtOne001
     * @tc.desc Verify public constructor getAccessModifier returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctor = (Type.from<PubCtorAM>() as ClassType).getConstructor(0);
      if (isNotNull(ctor)) {
        expect(ctor.getAccessModifier()).assertEqual(0);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0200
     * @tc.name testMethodGetAccessModifierAtOne002
     * @tc.desc Verify public constructor and public method have same access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<CtorVsMethod>() as ClassType;
      const ctor = ct.getConstructor(0);
      const method = ct.getMethodByName('exec');
      if (isNotNull(ctor) && isNotNull(method)) {
        expect(ctor.getAccessModifier()).assertEqual(method.getAccessModifier());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0300
     * @tc.name testMethodGetAccessModifierAtOne003
     * @tc.desc Verify two different classes with public method have same access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mA = (Type.from<PubA>() as ClassType).getMethodByName('run');
      const mB = (Type.from<PubB>() as ClassType).getMethodByName('run');
      if (isNotNull(mA) && isNotNull(mB)) {
        expect(mA.getAccessModifier()).assertEqual(mB.getAccessModifier());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0400
     * @tc.name testMethodGetAccessModifierAtOne004
     * @tc.desc Verify multiple interface implementation methods have same access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<ImplAB>() as ClassType;
      const m1 = ct.getMethodByName('a');
      const m2 = ct.getMethodByName('b');
      if (isNotNull(m1) && isNotNull(m2)) {
        expect(m1.getAccessModifier()).assertEqual(m2.getAccessModifier());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0500
     * @tc.name testMethodGetAccessModifierAtOne005
     * @tc.desc Verify getAccessModifier returns 0 for four public methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<FourMethods>() as ClassType;
      const ma = ct.getMethodByName('a');
      const mb = ct.getMethodByName('b');
      const mc = ct.getMethodByName('c');
      const md = ct.getMethodByName('d');
      if (isNotNull(ma) && isNotNull(mb) && isNotNull(mc) && isNotNull(md)) {
        expect(ma.getAccessModifier()).assertEqual(0);
        expect(mb.getAccessModifier()).assertEqual(0);
        expect(mc.getAccessModifier()).assertEqual(0);
        expect(md.getAccessModifier()).assertEqual(0);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0600
     * @tc.name testMethodGetAccessModifierAtOne006
     * @tc.desc Verify private methods return 1 and public methods return 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<MixPubPriv>() as ClassType;
      const a0 = ct.getMethodByName('a0');
      if (isNotNull(a0)) {
        expect(a0.getAccessModifier()).assertEqual(1);
      } else {
        expect().assertFail();
        return;
      }
      const a1 = ct.getMethodByName('a1');
      if (isNotNull(a1)) {
        expect(a1.getAccessModifier()).assertEqual(1);
      } else {
        expect().assertFail();
        return;
      }
      const b0 = ct.getMethodByName('b0');
      if (isNotNull(b0)) {
        expect(b0.getAccessModifier()).assertEqual(0);
      } else {
        expect().assertFail();
        return;
      }
      const b1 = ct.getMethodByName('b1');
      if (isNotNull(b1)) {
        expect(b1.getAccessModifier()).assertEqual(0);
      } else {
        expect().assertFail();
        return;
      }
      const a2 = ct.getMethodByName('a2');
      if (isNotNull(a2)) {
        expect(a2.getAccessModifier()).assertEqual(1);
      } else {
        expect().assertFail();
        return;
      }
      const b2 = ct.getMethodByName('b2');
      if (isNotNull(b2)) {
        expect(b2.getAccessModifier()).assertEqual(0);
      } else {
        expect().assertFail();
        return;
      }
      const a3 = ct.getMethodByName('a3');
      if (isNotNull(a3)) {
        expect(a3.getAccessModifier()).assertEqual(1);
      } else {
        expect().assertFail();
        return;
      }
      const b3 = ct.getMethodByName('b3');
      if (isNotNull(b3)) {
        expect(b3.getAccessModifier()).assertEqual(0);
      } else {
        expect().assertFail();
        return;
      }
      const a4 = ct.getMethodByName('a4');
      if (isNotNull(a4)) {
        expect(a4.getAccessModifier()).assertEqual(1);
      } else {
        expect().assertFail();
        return;
      }
      const b4 = ct.getMethodByName('b4');
      if (isNotNull(b4)) {
        expect(b4.getAccessModifier()).assertEqual(0);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0700
     * @tc.name testMethodGetAccessModifierAtOne007
     * @tc.desc Verify public returns 0, private returns 1 and protected returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<MixFour>() as ClassType;
      const ma = ct.getMethodByName('a');
      const mb = ct.getMethodByName('b');
      const mc = ct.getMethodByName('c');
      const md = ct.getMethodByName('d');
      const me = ct.getMethodByName('e');
      const mf = ct.getMethodByName('f');
      const mg = ct.getMethodByName('g');
      const mh = ct.getMethodByName('h');
      if (
        isNotNull(ma) &&
        isNotNull(mb) &&
        isNotNull(mc) &&
        isNotNull(md) &&
        isNotNull(me) &&
        isNotNull(mf) &&
        isNotNull(mg) &&
        isNotNull(mh)
      ) {
        expect(ma.getAccessModifier()).assertEqual(0);
        expect(mb.getAccessModifier()).assertEqual(0);
        expect(mc.getAccessModifier()).assertEqual(0);
        expect(md.getAccessModifier()).assertEqual(1);
        expect(me.getAccessModifier()).assertEqual(1);
        expect(mf.getAccessModifier()).assertEqual(2);
        expect(mg.getAccessModifier()).assertEqual(2);
        expect(mh.getAccessModifier()).assertEqual(2);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0800
     * @tc.name testMethodGetAccessModifierAtOne008
     * @tc.desc Verify protected method getAccessModifier returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<ProtRange>() as ClassType).getMethodByName('run');
      if (isNotNull(method)) {
        expect(method.getAccessModifier()).assertEqual(2);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_0900
     * @tc.name testMethodGetAccessModifierAtOne009
     * @tc.desc Verify same method 5 calls in loop return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = (Type.from<Consist5>() as ClassType).getMethodByName('hide');
      if (isNotNull(m)) {
        const base = m.getAccessModifier();
        let allSame: boolean = true;
        for (let i: int = 0; i < 5; i++) {
          if (m.getAccessModifier() !== base) {
            allSame = false;
          }
        }
        expect(allSame).assertTrue();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_1000
     * @tc.name testMethodGetAccessModifierAtOne010
     * @tc.desc Verify getAccessModifier via __getMethods index 0 and via getMethodByName('run') return the same value for IndexByName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IndexByName>() as ClassType;
      const fromIdx = __getMethods(ct)[0].getAccessModifier();
      const fromNameMethod = ct.getMethodByName('run');
      if (isNotNull(fromNameMethod)) {
        expect(fromIdx).assertEqual(fromNameMethod.getAccessModifier());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_1100
     * @tc.name testMethodGetAccessModifierAtOne011
     * @tc.desc Verify different ClassType instances return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct1 = Type.from<MultiRef>() as ClassType;
      const ct2 = Type.from<MultiRef>() as ClassType;
      const m1 = ct1.getMethodByName('run');
      const m2 = ct2.getMethodByName('run');
      if (isNotNull(m1) && isNotNull(m2)) {
        expect(m1.getAccessModifier()).assertEqual(m2.getAccessModifier());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_1200
     * @tc.name testMethodGetAccessModifierAtOne012
     * @tc.desc Verify parent method baseMethod is visible via __getMethods traversal of child class ChildForBase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<ChildForBase>() as ClassType;
      const methods = __getMethods(ct);
      let found: boolean = false;
      for (let i: number = 0; i < methods.length; i++) {
        if (methods[i.toInt()].getName() === 'baseMethod') {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_1400
     * @tc.name testMethodGetAccessModifierAtOne014
     * @tc.desc Verify __getMethods on properties-only class PropOnlyClass returns exactly 18 methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const methods = __getMethods(Type.from<PropOnlyClass>() as ClassType);
      expect(methods.length).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_ONE_1500
     * @tc.name testMethodGetAccessModifierAtOne015
     * @tc.desc Verify two __getMethods traversals of RepeatMethods return consistent access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetAccessModifierAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<RepeatMethods>() as ClassType;
      const ms1 = __getMethods(ct);
      const ms2 = __getMethods(ct);
      expect(ms1.length).assertEqual(ms2.length);
      for (let i: number = 0; i < ms1.length; i++) {
        expect(ms1[i.toInt()].getAccessModifier()).assertEqual(ms2[i.toInt()].getAccessModifier());
      }
    });
  });
}
