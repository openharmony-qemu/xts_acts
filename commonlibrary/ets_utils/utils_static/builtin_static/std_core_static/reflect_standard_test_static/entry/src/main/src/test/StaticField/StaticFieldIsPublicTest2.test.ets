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
} from '../../../../hypium/index';
import Utils from '../Util.test';
import { StaticField } from '../Util.test';
class Class001 {
  public static name: string = 'test';
}
enum Color {
  RED,
}

class Class036 {
  public static val: string = 'val';
}

class Class051 {
  public static a: string = 'x';
  public static b: number = 1;
}
class Class074 {
  public static same: number = 1;
}

class Class075 {
  public static same: string = 's';
}

class Class078 {
  public static $field: number = 1;
}

class Class083 {
  public static val: number = 1;
  public static missing: string = 'missing';
  public static nonexistentField: string = 'nonexistentField';
}

class Class086<T> {
  public static val: number = 1;
}



class Class011 {
  public static val: Color = Color.RED;
}

class Class012 {
  public static val: string | number = 'hello';
}
export default function staticFieldIsPublicTest2(): void {
  describe('StaticFieldIsPublicTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0100
     * @tc.name testStaticFieldIsPublicAtTwo001
     * @tc.desc Verify isPublic returns true for Class001.name (public static string field 'name')
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class001>();
      let field = cls.getStaticField('name');
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0200
     * @tc.name testStaticFieldIsPublicAtTwo002
     * @tc.desc Verify isPublic returns true for Class036.val (uses intermediate result variable, first instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class036>();
      let field = cls.getStaticField('val');
      let result: boolean = field!.isPublic();
      expect(result).assertTrue();
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0300
     * @tc.name testStaticFieldIsPublicAtTwo003
     * @tc.desc Verify isPublic() returns true for Class051.a and b (two-field class with different types string and number)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class051>();
      let fa = cls.getStaticField('a');
      let fb = cls.getStaticField('b');
      expect(fa!.isPublic()).assertTrue();
      expect(fb!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0400
     * @tc.name testStaticFieldIsPublicAtTwo004
     * @tc.desc Verify isPublic returns true for Class074.same and Class075.same (two different classes, same field name)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsa = Class.from<Class074>();
      let clsb = Class.from<Class075>();
      let fa = clsa.getStaticField('same');
      let fb = clsb.getStaticField('same');
      expect(fa!.isPublic()).assertTrue();
      expect(fb!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0500
     * @tc.name testStaticFieldIsPublicAtTwo005
     * @tc.desc Verify isPublic returns true for Class078.$field (dollar-prefixed field name)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class078>();
      let field = cls.getStaticField('$field');
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0600
     * @tc.name testStaticFieldIsPublicAtTwo006
     * @tc.desc Verify isPublic returns true for Class086<number>.val (generic class with type parameter number)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class086<number>>();
      let field = cls.getStaticField('val');
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0700
     * @tc.name testStaticFieldIsPublicAtTwo007
     * @tc.desc Verify isPublic returns true for public static field Class083.nonexistentField (name preserved)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class083>();
      let field = cls.getStaticField('nonexistentField');
      expect(field!.isPublic()).assertTrue();
      expect(field!.getName()).assertEqual('nonexistentField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0800
     * @tc.name testStaticFieldIsPublicAtTwo008
     * @tc.desc Verify isPublic on null StaticField throws NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      try {
        field!.isPublic();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_0900
     * @tc.name testStaticFieldIsPublicAtTwo009
     * @tc.desc Verify isPublic returns true for Class011.val (public static enum Color field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class011>();
      let field = cls.getStaticField('val');
      expect(field!.isPublic()).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_TWO_1000
     * @tc.name testStaticFieldIsPublicAtTwo010
     * @tc.desc Verify isPublic returns true for Class012.val (public static union type field string|number)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPublicAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Class012>();
      let field = cls.getStaticField('val');
      expect(field!.isPublic()).assertTrue();
    });

  });
}
