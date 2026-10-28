'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import * as IfaceReadonlyTest from "../ets/iface_readonly_test";
import * as IfaceTest from "../ets/iface_test";

class SubFoo implements IfaceTest.Foo {
    bar(): void {}
    name: string = "";
}

class BaseImpl implements IfaceTest.IBase {
    id: string;
    constructor(id: string) {
        this.id = id;
    }
    getId(): string {
        return this.id;
    }
    setId(id: string): void {
        this.id = id;
        return;
    }
}

class Noo1 implements IfaceReadonlyTest.Noo {
    name: string = "hello";
    age?: int;
    bar(): void {
        console.log("Noo1");
    }
    constructor(name: string, age?: int) {
        this.name = name;
        this.age = age;
    }
}

export default function ifaceTest(): void {
  describe("ActsIfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Iface_GetName_STATIC_0100
     * @tc.name      test_Iface_GetName_Static_0001
     * @tc.desc      getIfaceName returns foo name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_GetName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_GetName_Static_0001 start');
      let foo = IfaceTest.getFooIface();
      let name = foo.name;
      console.log("foo.name is " + name);
      expect(name).assertEqual("foo");
      console.log('test_Iface_GetName_Static_0001 done');
      done();
      console.log('test_Iface_GetName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_GetReadonlyName_STATIC_0100
     * @tc.name      test_Iface_GetReadonlyName_Static_0001
     * @tc.desc      getIfaceReadonlyName returns noo name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_GetReadonlyName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_GetReadonlyName_Static_0001 start');
      let noo = IfaceReadonlyTest.getNooIface();
      let nooName = noo.name;
      console.log("noo.name is " + nooName);
      expect(nooName).assertEqual("noo");
      console.log('test_Iface_GetReadonlyName_Static_0001 done');
      done();
      console.log('test_Iface_GetReadonlyName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_SetName_STATIC_0100
     * @tc.name      test_Iface_SetName_Static_0001
     * @tc.desc      setIfaceName sets foo name to alice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_SetName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_SetName_Static_0001 start');
      let foo = IfaceTest.getFooIface();
      foo.name = "alice";
      let name = foo.name;
      console.log("foo.name is " + name);
      expect(name).assertEqual("alice");
      console.log('test_Iface_SetName_Static_0001 done');
      done();
      console.log('test_Iface_SetName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_PrintFooName_STATIC_0100
     * @tc.name      test_Iface_PrintFooName_Static_0001
     * @tc.desc      printFooName prints modified foo name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_PrintFooName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_PrintFooName_Static_0001 start');
      let foo = IfaceTest.getFooIface();
      foo.name = "bob";
      let name = IfaceTest.printFooName(foo);
      console.log("foo.name is " + name);
      expect(name).assertEqual("bob");
      console.log('test_Iface_PrintFooName_Static_0001 done');
      done();
      console.log('test_Iface_PrintFooName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_PrintNooName_STATIC_0100
     * @tc.name      test_Iface_PrintNooName_Static_0001
     * @tc.desc      printNooName prints noo name and creates Noo1 instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_PrintNooName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_PrintNooName_Static_0001 start');
      let noo = IfaceReadonlyTest.getNooIface();
      let name = IfaceReadonlyTest.printNooName(noo);
      console.log("noo name: ", noo.name);
      console.log("noo age: ", noo.age);
      console.log("print noo name: ", name);
      let a1 = new Noo1("test1", 100);
      console.log(a1);
      let a2 = new Noo1("test2");
      console.log(a2);
      console.log("noo.name is " + name);
      expect(name).assertEqual("noo");
      console.log('test_Iface_PrintNooName_Static_0001 done');
      done();
      console.log('test_Iface_PrintNooName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_SetSubFooName_STATIC_0100
     * @tc.name      test_Iface_SetSubFooName_Static_0001
     * @tc.desc      setSubFooName sets SubFoo name to aaa
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_SetSubFooName_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_SetSubFooName_Static_0001 start');
      let subFoo = new SubFoo();
      subFoo.name = "aaa";
      let name = subFoo.name;
      console.log("subFoo.name is " + name);
      expect(name).assertEqual("aaa");
      console.log('test_Iface_SetSubFooName_Static_0001 done');
      done();
      console.log('test_Iface_SetSubFooName_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_SubBaseFunBase_STATIC_0100
     * @tc.name      test_Iface_SubBaseFunBase_Static_0001
     * @tc.desc      subBaseFun.base returns SubBaseFun.base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_SubBaseFunBase_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_SubBaseFunBase_Static_0001 start');
      let sub = IfaceTest.getSubBaseFun();
      let info = sub.base();
      console.log("sub.base is " + info);
      expect(info).assertEqual("SubBaseFun.base");
      console.log('test_Iface_SubBaseFunBase_Static_0001 done');
      done();
      console.log('test_Iface_SubBaseFunBase_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_SubBaseElemBase_STATIC_0100
     * @tc.name      test_Iface_SubBaseElemBase_Static_0001
     * @tc.desc      subBaseElem.base get/set returns SubBaseElem.base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_SubBaseElemBase_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_SubBaseElemBase_Static_0001 start');
      let sub = IfaceTest.getSubBaseElem();
      sub.base = "SubBaseElem.base";
      let info = sub.base;
      console.log("SubBaseElem.base is " + info);
      expect(info).assertEqual("SubBaseElem.base");
      console.log('test_Iface_SubBaseElemBase_Static_0001 done');
      done();
      console.log('test_Iface_SubBaseElemBase_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Iface_Inherit_STATIC_0100
     * @tc.name      test_Iface_Inherit_Static_0001
     * @tc.desc      interface inheritance: IBase, IShape, IDerived
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Iface_Inherit_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Iface_Inherit_Static_0001 start');
      let ibase_1 = IfaceTest.makeIBase("abc");
      console.log("ibase_1 getId:", ibase_1.getId());
      let ibase_1_id = ibase_1.getId();
      expect(ibase_1_id).assertEqual("abc");

      ibase_1.setId("xyz");
      console.log("ibase_1 setId:", ibase_1.getId());
      ibase_1_id = ibase_1.getId();
      expect(ibase_1_id).assertEqual("xyz");

      let ibase_2 = IfaceTest.makeIBase("test");
      IfaceTest.copyIBase(ibase_1, ibase_2);
      ibase_1_id = ibase_1.getId();
      let ibase_2_id = ibase_2.getId();
      console.log("copyIBase:", ibase_1_id, ibase_2_id);
      expect(ibase_1_id).assertEqual("test");
      expect(ibase_2_id).assertEqual("test");

      let ishape_1 = IfaceTest.makeIShape("shape", 3.14, 2.5);
      console.log("makeIShape:", ishape_1.calculateArea());
      ibase_2_id = ibase_2.getId();
      let ishape_1_id = ishape_1.getId();
      expect(ibase_2_id).assertEqual("test");
      console.log("interface extends:", ishape_1_id);
      expect(ishape_1_id).assertEqual("shape");

      ishape_1.setId("aaaaa");
      ishape_1_id = ishape_1.getId();
      console.log("interface extends set:", ishape_1_id);
      expect(ishape_1_id).assertEqual("aaaaa");

      let a: BaseImpl = new BaseImpl("A");
      let b: BaseImpl = new BaseImpl("B");
      IfaceTest.copyIBase(b, a);
      let a_id = a.getId();
      let b_id = b.getId();
      console.log("impl interface: ", a_id, b_id);
      expect(a_id).assertEqual("A");
      expect(b_id).assertEqual("A");

      IfaceTest.copyIBase(ibase_1, ishape_1);
      ibase_1_id = ibase_1.getId();
      ishape_1_id = ishape_1.getId();
      console.log("interface extends: ", ibase_1_id, ishape_1_id);
      expect(ibase_1_id).assertEqual("aaaaa");
      expect(ishape_1_id).assertEqual("aaaaa");

      let d = new IfaceTest.IDerived();
      d.call();
      expect(d.getId()).assertEqual("d");
      console.log('test_Iface_Inherit_Static_0001 done');
      done();
      console.log('test_Iface_Inherit_Static_0001 end');
    });
  })
}