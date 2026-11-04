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
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

class MyClass001 {
  public static value: string = 'hello';
}

class MyClass002 {
  public static a: number = 1;
}

class MyClass005 {
  public static MAX_VALUE: number = 100;
}

class MyClass013 {
  public static αβγ: string = 'gamma';
}

class MyClass014 {
  public static имя: string = 'значение';
}

class MyClass017 {
  public static $prop: string = 'val';
}

class MyClass020 {
  public static $: number = 1;
}

class MyClass023 {
  public static my$field: string = 'x';
}

class MyClass030 {
  public static a000000001000000002000000003000000004000000005000000006000000007: number = 0;
}

class MyLongField031 {
  public static f000000000100000000020000000003000000000400000000050000000006000000000700000000080000000009000000000100000000011000000000120000000001: number = 0;
}

class MyClass032 {
  public static abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789: string = 'all';
}

class MyClass039 {
  public static fieldName: string = 'hello';
}

class MyClass040 {
  public static alpha: number = 1;
  public static beta: number = 2;
}

class MyClass047 {
  public static $meta: string = 'info';
}

class ClassA065 {
  public static shared: number = 1;
}

class ClassB066 {
  public static shared: string = 'two';
}

class X068 {
  public static tag: number = 1;
}

class Y069 {
  public static tag: number = 2;
}

class Z070 {
  public static tag: number = 3;
}

class Alpha071 {
  public static id: string = 'a';
}

class Beta072 {
  public static id: string = 'b';
}

class One074 {
  public static n: number = 0;
}

class Two075 {
  public static n: string = 'x';
}

class MyClass076 {
  public static stable: number = 1;
}

class MyClass082 {
  public static quick: string = 'fast';
}

class MyClass084 {
  public static first: number = 1;
  public static second: number = 2;
  public static third: number = 3;
}

class MyClass085 {
  public static constant: number = 100;
}

class MyClass087 {
  public static exists: number = 1;
}

class GetNameAfterTypeCall {
  public static val: string = 'stable';
}

class GetNameTypeofCheck {
  public static data: number = 10;
}



class MyClass009 {
  public static nameZh: string = '值';
}

class MyClass010 {
  public static nameJa: string = '値';
}

class MyClass011 {
  public static nameKo: string = '값';
}

class MyClass012 {
  public static résumé: string = 'doc';
}

class MyClass018 {
  public static __hidden: number = 0;
}

class MyClass021 {
  public static _: string = 'underscore';
}

class MyClass029 {
  public static abcdefghijklmnopqrstuvwxyz012345: number = 0;
}
export default function staticFieldGetNameTest2(): void {
  describe('StaticFieldGetNameTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0100
     * @tc.name testStaticFieldGetNameAtTwo001
     * @tc.desc Verify getName returns "value" for MyClass001.value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getStaticField('value');
      let result = field!.getName();
      expect(result).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0200
     * @tc.name testStaticFieldGetNameAtTwo002
     * @tc.desc Verify getName returns "a" for MyClass002.a
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass002>().getStaticField('a');
      expect(field!.getName()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0300
     * @tc.name testStaticFieldGetNameAtTwo003
     * @tc.desc Verify getName returns "MAX_VALUE" for MyClass005.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass005>().getStaticField('MAX_VALUE');
      expect(field!.getName()).assertEqual('MAX_VALUE');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0400
     * @tc.name testStaticFieldGetNameAtTwo004
     * @tc.desc Verify getName returns greek field name for MyClass013
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass013>().getStaticField('αβγ');
      expect(field!.getName()).assertEqual('αβγ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0500
     * @tc.name testStaticFieldGetNameAtTwo005
     * @tc.desc Verify getName returns cyrillic field name for MyClass014
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass014>().getStaticField('имя');
      expect(field!.getName()).assertEqual('имя');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0600
     * @tc.name testStaticFieldGetNameAtTwo006
     * @tc.desc Verify getName returns "$prop" for MyClass017.$prop
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass017>().getStaticField('$prop');
      expect(field!.getName()).assertEqual('$prop');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0700
     * @tc.name testStaticFieldGetNameAtTwo007
     * @tc.desc Verify getName returns "$" for MyClass020.$
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass020>().getStaticField('$');
      expect(field!.getName()).assertEqual('$');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0800
     * @tc.name testStaticFieldGetNameAtTwo008
     * @tc.desc Verify getName returns "my$field" for MyClass023.my$field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass023>().getStaticField('my$field');
      expect(field!.getName()).assertEqual('my$field');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_0900
     * @tc.name testStaticFieldGetNameAtTwo009
     * @tc.desc Verify getName returns 64-char field name for MyClass030 (64-char length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass030>().getStaticField(
        'a000000001000000002000000003000000004000000005000000006000000007',
      );
      expect(field!.getName()).assertEqual('a000000001000000002000000003000000004000000005000000006000000007');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1000
     * @tc.name testStaticFieldGetNameAtTwo010
     * @tc.desc Verify getName returns 133-char field name for MyLongField031 (133-char length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyLongField031>().getStaticField(
        'f000000000100000000020000000003000000000400000000050000000006000000000700000000080000000009000000000100000000011000000000120000000001',
      );
      let result = field!.getName();
      expect(result).assertEqual(
        'f000000000100000000020000000003000000000400000000050000000006000000000700000000080000000009000000000100000000011000000000120000000001',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1100
     * @tc.name testStaticFieldGetNameAtTwo011
     * @tc.desc Verify getName returns "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" for MyClass032 (62-char length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass032>().getStaticField(
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
      );
      let result = field!.getName();
      expect(result).assertEqual('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1200
     * @tc.name testStaticFieldGetNameAtTwo012
     * @tc.desc Verify getName returns correct field name after getStaticField on MyClass039.fieldName
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputName: string = 'fieldName';
      let field = Class.from<MyClass039>().getStaticField(inputName);
      expect(field!.getName()).assertEqual(inputName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1300
     * @tc.name testStaticFieldGetNameAtTwo013
     * @tc.desc Verify getName returns "alpha" and "beta" for MyClass040's multiple fields
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let f1 = cls.getStaticField('alpha');
      let f2 = cls.getStaticField('beta');
      expect(f1!.getName()).assertEqual('alpha');
      expect(f2!.getName()).assertEqual('beta');
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1400
     * @tc.name testStaticFieldGetNameAtTwo014
     * @tc.desc Verify getName returns "$meta" for MyClass047.$meta
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fieldName: string = '$meta';
      let field = Class.from<MyClass047>().getStaticField(fieldName);
      expect(field!.getName()).assertEqual(fieldName);
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1500
     * @tc.name testStaticFieldGetNameAtTwo015
     * @tc.desc Verify getName returns "shared" for same-named field in ClassA065 and ClassB066
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa = Class.from<ClassA065>().getStaticField('shared');
      let fb = Class.from<ClassB066>().getStaticField('shared');
      expect(fa!.getName()).assertEqual('shared');
      expect(fb!.getName()).assertEqual('shared');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1600
     * @tc.name testStaticFieldGetNameAtTwo016
     * @tc.desc Verify getName returns "tag" for same-named field in X068, Y069 and Z070
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fx = Class.from<X068>().getStaticField('tag');
      let fy = Class.from<Y069>().getStaticField('tag');
      let fz = Class.from<Z070>().getStaticField('tag');
      expect(fx!.getName()).assertEqual('tag');
      expect(fy!.getName()).assertEqual('tag');
      expect(fz!.getName()).assertEqual('tag');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1700
     * @tc.name testStaticFieldGetNameAtTwo017
     * @tc.desc Verify getName returns same "id" for Alpha071 and Beta072 via chained call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = Class.from<Alpha071>().getStaticField('id')!.getName();
      let r2 = Class.from<Beta072>().getStaticField('id')!.getName();
      expect(r1).assertEqual('id');
      expect(r2).assertEqual('id');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1800
     * @tc.name testStaticFieldGetNameAtTwo018
     * @tc.desc Verify getName returns "n" for One074 and Two075 via chained call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<One074>().getStaticField('n')!.getName()).assertEqual('n');
      expect(Class.from<Two075>().getStaticField('n')!.getName()).assertEqual('n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_1900
     * @tc.name testStaticFieldGetNameAtTwo019
     * @tc.desc Verify getName returns consistent result across repeated calls on MyClass076.stable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass076>().getStaticField('stable');
      let r1 = field!.getName();
      let r2 = field!.getName();
      expect(r1).assertEqual('stable');
      expect(r2).assertEqual('stable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2000
     * @tc.name testStaticFieldGetNameAtTwo020
     * @tc.desc Verify getName returns "quick" for MyClass082.quick via chained call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<MyClass082>().getStaticField('quick')!.getName();
      expect(result).assertEqual('quick');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2100
     * @tc.name testStaticFieldGetNameAtTwo021
     * @tc.desc Verify getName returns 'first' for MyClass084.first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass084>();
      let result = cls.getStaticField('first')!.getName();
      expect(result).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2200
     * @tc.name testStaticFieldGetNameAtTwo022
     * @tc.desc Verify getName returns "constant" for MyClass085.constant consistently across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass085>();
      let f = cls.getStaticField('constant');
      let name1: string = f!.getName();
      let name2: string = f!.getName();
      expect(name1).assertEqual('constant');
      expect(name1).assertEqual(name2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2300
     * @tc.name testStaticFieldGetNameAtTwo023
     * @tc.desc Verify getName on non-existent field "noSuchField" for MyClass087 throws NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass087>().getStaticField('noSuchField');
      try {
        field!.getName();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2400
     * @tc.name testStaticFieldGetNameAtTwo024
     * @tc.desc Verify getName returns same value after calling getType on the same field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetNameAfterTypeCall>().getStaticField('val');
      let nameBefore: string = field!.getName();
      field!.getType();
      let nameAfter: string = field!.getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2500
     * @tc.name testStaticFieldGetNameAtTwo025
     * @tc.desc Verify getName returns the field name 'data' for GetNameTypeofCheck.data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetNameTypeofCheck>().getStaticField('data');
      let result: string = field!.getName();
      expect(result).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2600
     * @tc.name testStaticFieldGetNameAtTwo026
     * @tc.desc Verify getStaticField('') with empty field name returns undefined for GetNameTypeofCheck
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetNameTypeofCheck>();
      let field = cls.getStaticField('');
      expect(field).assertUndefined();
    });
/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2700
     * @tc.name testStaticFieldGetNameAtTwo027
     * @tc.desc Verify getName returns "nameZh" for MyClass009.nameZh
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass009>().getStaticField('nameZh');
      expect(field!.getName()).assertEqual('nameZh');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2800
     * @tc.name testStaticFieldGetNameAtTwo028
     * @tc.desc Verify getName returns "nameJa" for MyClass010.nameJa
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass010>().getStaticField('nameJa');
      expect(field!.getName()).assertEqual('nameJa');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_2900
     * @tc.name testStaticFieldGetNameAtTwo029
     * @tc.desc Verify getName returns "nameKo" for MyClass011.nameKo
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass011>().getStaticField('nameKo');
      expect(field!.getName()).assertEqual('nameKo');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_3000
     * @tc.name testStaticFieldGetNameAtTwo030
     * @tc.desc Verify getName returns latin-ext field name for MyClass012
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass012>().getStaticField('résumé');
      expect(field!.getName()).assertEqual('résumé');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_3100
     * @tc.name testStaticFieldGetNameAtTwo031
     * @tc.desc Verify getName returns "__hidden" for MyClass018.__hidden
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass018>().getStaticField('__hidden');
      expect(field!.getName()).assertEqual('__hidden');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_3200
     * @tc.name testStaticFieldGetNameAtTwo032
     * @tc.desc Verify getName returns "_" for MyClass021._
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass021>().getStaticField('_');
      expect(field!.getName()).assertEqual('_');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETNAME_TWO_3300
     * @tc.name testStaticFieldGetNameAtTwo033
     * @tc.desc Verify getName returns 32-char field name for MyClass029 (32-char length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetNameAtTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<MyClass029>().getStaticField('abcdefghijklmnopqrstuvwxyz012345');
      expect(field!.getName()).assertEqual('abcdefghijklmnopqrstuvwxyz012345');
    });

  });
}
