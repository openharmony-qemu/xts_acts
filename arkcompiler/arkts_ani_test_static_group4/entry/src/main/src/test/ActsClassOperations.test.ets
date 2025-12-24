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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function classOperationsTest() {

  describe("ActsClassOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0100
     * @tc.name      call_StaticMethodBool_0001
     * @tc.desc      call static method bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('call_StaticMethodBool_0001 start');
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethodBoolean();
      expect(result).assertTrue();
      console.log('call_StaticMethodBool_0001 done');
      done();
      console.log('call_StaticMethodBool_0001 end');
    })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0200
     * @tc.name      call_StaticMethodBool_0002
     * @tc.desc      call static method bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0002 done');
        done();
        console.log('call_StaticMethodBool_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0300
     * @tc.name      call_StaticMethodBool_0003
     * @tc.desc      call static method bool V
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0003 done');
        done();
        console.log('call_StaticMethodBool_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0400
     * @tc.name      call_StaticMethodBool_0004
     * @tc.desc      call static method bool A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0004 done');
        done();
        console.log('call_StaticMethodBool_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0500
     * @tc.name      call_StaticMethodBool_0005
     * @tc.desc      call static method bool from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0005 done');
        done();
        console.log('call_StaticMethodBool_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0600
     * @tc.name      call_StaticMethodBool_0006
     * @tc.desc      call static method bool from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0006 done');
        done();
        console.log('call_StaticMethodBool_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0700
     * @tc.name      call_StaticMethodBool_0007
     * @tc.desc      call static method bool from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0007 done');
        done();
        console.log('call_StaticMethodBool_0007 end');
      })

   /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0800
     * @tc.name      call_StaticMethodBool_0008
     * @tc.desc      call static method bool from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0008 done');
        done();
        console.log('call_StaticMethodBool_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0900
     * @tc.name      call_StaticMethodBool_0009
     * @tc.desc      call static method bool from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0009 done');
        done();
        console.log('call_StaticMethodBool_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1000
     * @tc.name      call_StaticMethodBool_0010
     * @tc.desc      call static method bool from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0010 done');
        done();
        console.log('call_StaticMethodBool_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1100
     * @tc.name      call_StaticMethodBool_0011
     * @tc.desc      call static method bool from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0011 done');
        done();
        console.log('call_StaticMethodBool_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1200
     * @tc.name      call_StaticMethodBool_0012
     * @tc.desc      DISABLED call static method bool overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0012 done');
        done();
        console.log('call_StaticMethodBool_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1300
     * @tc.name      call_StaticMethodBool_0013
     * @tc.desc      call static method bool combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0013 done');
        done();
        console.log('call_StaticMethodBool_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1400
     * @tc.name      call_StaticMethodBool_0014
     * @tc.desc      call static method bool combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0014 done');
        done();
        console.log('call_StaticMethodBool_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1500
     * @tc.name      call_StaticMethodBool_0015
     * @tc.desc      call static method bool combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0015 done');
        done();
        console.log('call_StaticMethodBool_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1600
     * @tc.name      call_StaticMethodBool_0016
     * @tc.desc      call static method bool null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0016 done');
        done();
        console.log('call_StaticMethodBool_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1700
     * @tc.name      call_StaticMethodBool_0017
     * @tc.desc      call static method bool combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0017 done');
        done();
        console.log('call_StaticMethodBool_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1800
     * @tc.name      call_StaticMethodBool_0018
     * @tc.desc      call static method bool combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0018 done');
        done();
        console.log('call_StaticMethodBool_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1900
     * @tc.name      call_StaticMethodBool_0019
     * @tc.desc      call static method bool combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0019 done');
        done();
        console.log('call_StaticMethodBool_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2000
     * @tc.name      call_StaticMethodBool_0020
     * @tc.desc      call static method bool combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_19();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0020 done');
        done();
        console.log('call_StaticMethodBool_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2100
     * @tc.name      call_StaticMethodBool_0021
     * @tc.desc      call static method bool combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_20();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0021 done');
        done();
        console.log('call_StaticMethodBool_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2200
     * @tc.name      call_StaticMethodBool_0022
     * @tc.desc      check initialization bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_21();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0022 done');
        done();
        console.log('call_StaticMethodBool_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2300
     * @tc.name      call_StaticMethodBool_0023
     * @tc.desc      check initialization bool a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_22();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0023 done');
        done();
        console.log('call_StaticMethodBool_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0100
     * @tc.name      call_StaticMethodInt_0001
     * @tc.desc      call static method int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('call_StaticMethodInt_0001 start');
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethodInt();
      expect(result).assertTrue();
      console.log('call_StaticMethodInt_0001 done');
      done();
      console.log('call_StaticMethodInt_0001 end');
    })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0200
     * @tc.name      call_StaticMethodInt_0002
     * @tc.desc      call static method int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0002 done');
        done();
        console.log('call_StaticMethodInt_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0300
     * @tc.name      call_StaticMethodInt_0003
     * @tc.desc      call static method int v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0003 done');
        done();
        console.log('call_StaticMethodInt_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0400
     * @tc.name      call_StaticMethodInt_0004
     * @tc.desc      call static method int A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0004 done');
        done();
        console.log('call_StaticMethodInt_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0500
     * @tc.name      call_StaticMethodInt_0005
     * @tc.desc      call static method int invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0005 done');
        done();
        console.log('call_StaticMethodInt_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0600
     * @tc.name      call_StaticMethodInt_0006
     * @tc.desc      call static method int invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0006 done');
        done();
        console.log('call_StaticMethodInt_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0700
     * @tc.name      call_StaticMethodInt_0007
     * @tc.desc      call static method int invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0007 done');
        done();
        console.log('call_StaticMethodInt_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0800
     * @tc.name      call_StaticMethodInt_0008
     * @tc.desc      call static method int v invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0008 done');
        done();
        console.log('call_StaticMethodInt_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0900
     * @tc.name      call_StaticMethodInt_0009
     * @tc.desc      call static method int v invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0009 done');
        done();
        console.log('call_StaticMethodInt_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1000
     * @tc.name      call_StaticMethodInt_0010
     * @tc.desc      call static method int v invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0010 done');
        done();
        console.log('call_StaticMethodInt_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1100
     * @tc.name      call_StaticMethodInt_0011
     * @tc.desc      call static method int a invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0011 done');
        done();
        console.log('call_StaticMethodInt_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1200
     * @tc.name      call_StaticMethodInt_0012
     * @tc.desc      call static method int a invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0012 done');
        done();
        console.log('call_StaticMethodInt_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1300
     * @tc.name      call_StaticMethodInt_0013
     * @tc.desc      call static method int a invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0013 done');
        done();
        console.log('call_StaticMethodInt_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1400
     * @tc.name      call_StaticMethodInt_0014
     * @tc.desc      call static method int a invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0014 done');
        done();
        console.log('call_StaticMethodInt_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1500
     * @tc.name      call_StaticMethodInt_0015
     * @tc.desc      call static method int combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0015 done');
        done();
        console.log('call_StaticMethodInt_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1600
     * @tc.name      call_StaticMethodInt_0016
     * @tc.desc      call static method int combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0016 done');
        done();
        console.log('call_StaticMethodInt_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1700
     * @tc.name      call_StaticMethodInt_0017
     * @tc.desc      call static method int combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0017 done');
        done();
        console.log('call_StaticMethodInt_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1800
     * @tc.name      call_StaticMethodInt_0018
     * @tc.desc      call static method int null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0018 done');
        done();
        console.log('call_StaticMethodInt_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1900
     * @tc.name      call_StaticMethodInt_0019
     * @tc.desc      call static method int combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0019 done');
        done();
        console.log('call_StaticMethodInt_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2000
     * @tc.name      call_StaticMethodInt_0020
     * @tc.desc      call static method int combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_19();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0020 done');
        done();
        console.log('call_StaticMethodInt_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2100
     * @tc.name      call_StaticMethodInt_0021
     * @tc.desc      call static method int combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_20();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0021 done');
        done();
        console.log('call_StaticMethodInt_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2200
     * @tc.name      call_StaticMethodInt_0022
     * @tc.desc      call static method int combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_21();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0022 done');
        done();
        console.log('call_StaticMethodInt_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2300
     * @tc.name      call_StaticMethodInt_0023
     * @tc.desc      call static method int combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_22();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0023 done');
        done();
        console.log('call_StaticMethodInt_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2400
     * @tc.name      call_StaticMethodInt_0024
     * @tc.desc      check initialization int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0024 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_23();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0024 done');
        done();
        console.log('call_StaticMethodInt_0024 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2500
     * @tc.name      call_StaticMethodInt_0025
     * @tc.desc      check initialization int a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0025 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_24();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0025 done');
        done();
        console.log('call_StaticMethodInt_0025 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0100
     * @tc.name      call_StaticMethodShort_0001
     * @tc.desc      call static method short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0001 done');
        done();
        console.log('call_StaticMethodShort_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0200
     * @tc.name      call_StaticMethodShort_0002
     * @tc.desc      call static method short v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0002 done');
        done();
        console.log('call_StaticMethodShort_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0300
     * @tc.name      call_StaticMethodShort_0003
     * @tc.desc      call static method short A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0003 done');
        done();
        console.log('call_StaticMethodShort_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0400
     * @tc.name      call_StaticMethodShort_0004
     * @tc.desc      call static method short from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0004 done');
        done();
        console.log('call_StaticMethodShort_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0500
     * @tc.name      call_StaticMethodShort_0005
     * @tc.desc      call static method short from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0005 done');
        done();
        console.log('call_StaticMethodShort_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0600
     * @tc.name      call_StaticMethodShort_0006
     * @tc.desc      call static method short from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0006 done');
        done();
        console.log('call_StaticMethodShort_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0700
     * @tc.name      call_StaticMethodShort_0007
     * @tc.desc      call static method short from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0007 done');
        done();
        console.log('call_StaticMethodShort_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0800
     * @tc.name      call_StaticMethodShort_0008
     * @tc.desc      call static method short from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0008 done');
        done();
        console.log('call_StaticMethodShort_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0900
     * @tc.name      call_StaticMethodShort_0009
     * @tc.desc      call static method short from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0009 done');
        done();
        console.log('call_StaticMethodShort_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1000
     * @tc.name      call_StaticMethodShort_0010
     * @tc.desc      call static method short from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0010 done');
        done();
        console.log('call_StaticMethodShort_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1100
     * @tc.name      call_StaticMethodShort_0011
     * @tc.desc      call static method short from combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0011 done');
        done();
        console.log('call_StaticMethodShort_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1200
     * @tc.name      call_StaticMethodShort_0012
     * @tc.desc      call static method short from combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0012 done');
        done();
        console.log('call_StaticMethodShort_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1300
     * @tc.name      call_StaticMethodShort_0013
     * @tc.desc      call static method short from combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0013 done');
        done();
        console.log('call_StaticMethodShort_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1400
     * @tc.name      class_FindStaticMethodShort_0014
     * @tc.desc      call static method short from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_13();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0014 done');
        done();
        console.log('class_FindStaticMethodShort_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1500
     * @tc.name      class_FindStaticMethodShort_0015
     * @tc.desc      call static method short from combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_14();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0015 done');
        done();
        console.log('class_FindStaticMethodShort_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1600
     * @tc.name      class_FindStaticMethodShort_0016
     * @tc.desc      call static method short from combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_15();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0016 done');
        done();
        console.log('class_FindStaticMethodShort_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1700
     * @tc.name      class_FindStaticMethodShort_0017
     * @tc.desc      call static method short from combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_16();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0017 done');
        done();
        console.log('class_FindStaticMethodShort_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1800
     * @tc.name      class_FindStaticMethodShort_0018
     * @tc.desc      call static method short from combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_17();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0018 done');
        done();
        console.log('class_FindStaticMethodShort_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1900
     * @tc.name      class_FindStaticMethodShort_0019
     * @tc.desc      call static method short from combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_18();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0019 done');
        done();
        console.log('class_FindStaticMethodShort_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_2000
     * @tc.name      class_FindStaticMethodShort_0020
     * @tc.desc      check initialization short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_19();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0020 done');
        done();
        console.log('class_FindStaticMethodShort_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_2100
     * @tc.name      class_FindStaticMethodShort_0021
     * @tc.desc      check initialization short a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_20();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0021 done');
        done();
        console.log('class_FindStaticMethodShort_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0100
     * @tc.name      call_StaticMethodByte_0001
     * @tc.desc      call static method byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0001 done');
        done();
        console.log('call_StaticMethodByte_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0200
     * @tc.name      call_StaticMethodByte_0002
     * @tc.desc      call static method byte v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0002 done');
        done();
        console.log('call_StaticMethodByte_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0300
     * @tc.name      call_StaticMethodByte_0003
     * @tc.desc      call static method byte A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0003 done');
        done();
        console.log('call_StaticMethodByte_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0400
     * @tc.name      call_StaticMethodByte_0004
     * @tc.desc      call static method byte from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0004 done');
        done();
        console.log('call_StaticMethodByte_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0500
     * @tc.name      call_StaticMethodByte_0005
     * @tc.desc      call static method byte from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0005 done');
        done();
        console.log('call_StaticMethodByte_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0600
     * @tc.name      call_StaticMethodByte_0006
     * @tc.desc      call static method byte from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0006 done');
        done();
        console.log('call_StaticMethodByte_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0700
     * @tc.name      call_StaticMethodByte_0007
     * @tc.desc      call static method byte from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0007 done');
        done();
        console.log('call_StaticMethodByte_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0800
     * @tc.name      call_StaticMethodByte_0008
     * @tc.desc      call static method byte from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0008 done');
        done();
        console.log('call_StaticMethodByte_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0900
     * @tc.name      call_StaticMethodByte_0009
     * @tc.desc      call static method short from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0009 done');
        done();
        console.log('call_StaticMethodByte_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1000
     * @tc.name      call_StaticMethodByte_0010
     * @tc.desc      call static method short from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0010 done');
        done();
        console.log('call_StaticMethodByte_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1100
     * @tc.name      call_StaticMethodByte_0011
     * @tc.desc      call static method byte from combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0011 done');
        done();
        console.log('call_StaticMethodByte_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1200
     * @tc.name      call_StaticMethodByte_0012
     * @tc.desc      call static method byte from combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0012 done');
        done();
        console.log('call_StaticMethodByte_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1300
     * @tc.name      call_StaticMethodByte_0013
     * @tc.desc      call static method byte from combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0013 done');
        done();
        console.log('call_StaticMethodByte_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1400
     * @tc.name      call_StaticMethodByte_0014
     * @tc.desc      call static method byte from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0014 done');
        done();
        console.log('call_StaticMethodByte_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1500
     * @tc.name      test_Class_FindStaticMethodByte_0014
     * @tc.desc      call static method short from combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethodByte_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_FindStaticMethodByte_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_14();
        expect(result).assertTrue();
        console.log('test_Class_FindStaticMethodByte_0014 done');
        done();
        console.log('test_Class_FindStaticMethodByte_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1600
     * @tc.name      call_StaticMethodByte_0016
     * @tc.desc      call static method byte from combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0016 done');
        done();
        console.log('call_StaticMethodByte_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1700
     * @tc.name      call_StaticMethodByte_0017
     * @tc.desc      call static method byte from combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0017 done');
        done();
        console.log('call_StaticMethodByte_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1800
     * @tc.name      call_StaticMethodByte_0018
     * @tc.desc      call static method byte from combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0018 done');
        done();
        console.log('call_StaticMethodByte_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1900
     * @tc.name      call_StaticMethodByte_0019
     * @tc.desc      call static method byte from combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0019 done');
        done();
        console.log('call_StaticMethodByte_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0100
     * @tc.name      call_StaticMethodLong_0001
     * @tc.desc      call static method long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0001 done');
        done();
        console.log('call_StaticMethodLong_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0200
     * @tc.name      call_StaticMethodLong_0002
     * @tc.desc      call static method long v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0002 done');
        done();
        console.log('call_StaticMethodLong_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0300
     * @tc.name      call_StaticMethodLong_0003
     * @tc.desc      call static method long A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0003 done');
        done();
        console.log('call_StaticMethodLong_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0400
     * @tc.name      call_StaticMethodLong_0004
     * @tc.desc      call static method long from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0004 done');
        done();
        console.log('call_StaticMethodLong_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0500
     * @tc.name      call_StaticMethodLong_0005
     * @tc.desc      call static method long from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0005 done');
        done();
        console.log('call_StaticMethodLong_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0600
     * @tc.name      call_StaticMethodLong_0006
     * @tc.desc      call static method long from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0006 done');
        done();
        console.log('call_StaticMethodLong_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0700
     * @tc.name      call_StaticMethodLong_0007
     * @tc.desc      call static method long from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0007 done');
        done();
        console.log('call_StaticMethodLong_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0800
     * @tc.name      call_StaticMethodLong_0008
     * @tc.desc      call static method long from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0008 done');
        done();
        console.log('call_StaticMethodLong_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_0900
     * @tc.name      call_StaticMethodLong_0009
     * @tc.desc      call static method long from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0009 done');
        done();
        console.log('call_StaticMethodLong_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1000
     * @tc.name      call_StaticMethodLong_0010
     * @tc.desc      call static method long from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0010 done');
        done();
        console.log('call_StaticMethodLong_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1100
     * @tc.name      call_StaticMethodLong_0011
     * @tc.desc      call static method long from combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0011 done');
        done();
        console.log('call_StaticMethodLong_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1200
     * @tc.name      call_StaticMethodLong_0012
     * @tc.desc      call static method long from combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0012 done');
        done();
        console.log('call_StaticMethodLong_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1300
     * @tc.name      call_StaticMethodLong_0013
     * @tc.desc      call static method long from combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0013 done');
        done();
        console.log('call_StaticMethodLong_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1400
     * @tc.name      call_StaticMethodLong_0014
     * @tc.desc      call static method long from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0014 done');
        done();
        console.log('call_StaticMethodLong_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1500
     * @tc.name      call_StaticMethodLong_0015
     * @tc.desc      call static method long from combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0015 done');
        done();
        console.log('call_StaticMethodLong_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1600
     * @tc.name      call_StaticMethodLong_0016
     * @tc.desc      call static method long from combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0016 done');
        done();
        console.log('call_StaticMethodLong_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1700
     * @tc.name      call_StaticMethodLong_0017
     * @tc.desc      call static method long from combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0017 done');
        done();
        console.log('call_StaticMethodLong_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1800
     * @tc.name      call_StaticMethodLong_0018
     * @tc.desc      call static method long from combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0018 done');
        done();
        console.log('call_StaticMethodLong_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_1900
     * @tc.name      call_StaticMethodLong_0019
     * @tc.desc      call static method long from combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0019 done');
        done();
        console.log('call_StaticMethodLong_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODLONG_2000
     * @tc.name      call_StaticMethodLong_0020
     * @tc.desc      call static method long from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodLong_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodLong_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodLong_19();
        expect(result).assertTrue();
        console.log('call_StaticMethodLong_0020 done');
        done();
        console.log('call_StaticMethodLong_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0100
     * @tc.name      call_StaticMethodRef_0001
     * @tc.desc      call static method ref 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0001 done');
        done();
        console.log('call_StaticMethodRef_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0200
     * @tc.name      call_StaticMethodRef_0002
     * @tc.desc      call static method ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0002 done');
        done();
        console.log('call_StaticMethodRef_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0300
     * @tc.name      call_StaticMethodRef_0003
     * @tc.desc      call static method ref v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0003 done');
        done();
        console.log('call_StaticMethodRef_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0400
     * @tc.name      call_StaticMethodRef_0004
     * @tc.desc      call static method ref a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0004 done');
        done();
        console.log('call_StaticMethodRef_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0500
     * @tc.name      call_StaticMethodRef_0005
     * @tc.desc      call static method ref invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0005 done');
        done();
        console.log('call_StaticMethodRef_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0600
     * @tc.name      call_StaticMethodRef_0006
     * @tc.desc      call static method ref invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0006 done');
        done();
        console.log('call_StaticMethodRef_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0700
     * @tc.name      call_StaticMethodRef_0007
     * @tc.desc      call static method ref invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0007 done');
        done();
        console.log('call_StaticMethodRef_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0800
     * @tc.name      call_StaticMethodRef_0008
     * @tc.desc      call static method ref v invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0008 done');
        done();
        console.log('call_StaticMethodRef_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_0900
     * @tc.name      call_StaticMethodRef_0009
     * @tc.desc      call static method ref v invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0009 done');
        done();
        console.log('call_StaticMethodRef_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1000
     * @tc.name      call_StaticMethodRef_0010
     * @tc.desc      call static method ref v invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0010 done');
        done();
        console.log('call_StaticMethodRef_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1100
     * @tc.name      call_StaticMethodRef_0011
     * @tc.desc      call static method ref a invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0011 done');
        done();
        console.log('call_StaticMethodRef_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1200
     * @tc.name      call_StaticMethodRef_0012
     * @tc.desc      call static method ref a invlid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0012 done');
        done();
        console.log('call_StaticMethodRef_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1300
     * @tc.name      call_StaticMethodRef_0013
     * @tc.desc      call static method ref a invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0013 done');
        done();
        console.log('call_StaticMethodRef_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1400
     * @tc.name      call_StaticMethodRef_0014
     * @tc.desc      call static method ref a invlid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0014 done');
        done();
        console.log('call_StaticMethodRef_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1500
     * @tc.name      call_StaticMethodRef_0015
     * @tc.desc      call static method ref combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0015 done');
        done();
        console.log('call_StaticMethodRef_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1600
     * @tc.name      call_StaticMethodRef_0016
     * @tc.desc      call static method long combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0016 done');
        done();
        console.log('call_StaticMethodRef_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1700
     * @tc.name      call_StaticMethodRef_0017
     * @tc.desc      call static method ref combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0017 done');
        done();
        console.log('call_StaticMethodRef_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1800
     * @tc.name      call_StaticMethodRef_0018
     * @tc.desc      call static method ref from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0018 done');
        done();
        console.log('call_StaticMethodRef_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_1900
     * @tc.name      call_StaticMethodRef_0019
     * @tc.desc      call static method ref combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0019 done');
        done();
        console.log('call_StaticMethodRef_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_2000
     * @tc.name      call_StaticMethodRef_0020
     * @tc.desc      call static method ref combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_19();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0020 done');
        done();
        console.log('call_StaticMethodRef_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_2100
     * @tc.name      call_StaticMethodRef_0021
     * @tc.desc      call static method ref combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_20();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0021 done');
        done();
        console.log('call_StaticMethodRef_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_2200
     * @tc.name      call_StaticMethodRef_0022
     * @tc.desc      call static method ref combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_21();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0022 done');
        done();
        console.log('call_StaticMethodRef_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODREF_2300
     * @tc.name      call_StaticMethodRef_0023
     * @tc.desc      call static method ref combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodRef_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodRef_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodRef_22();
        expect(result).assertTrue();
        console.log('call_StaticMethodRef_0023 done');
        done();
        console.log('call_StaticMethodRef_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0100
     * @tc.name      call_StaticMethodDouble_0001
     * @tc.desc      call static method double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0001 done');
        done();
        console.log('call_StaticMethodDouble_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0200
     * @tc.name      call_StaticMethodDouble_0002
     * @tc.desc      call static method double v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0002 done');
        done();
        console.log('call_StaticMethodDouble_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0300
     * @tc.name      call_StaticMethodDouble_0003
     * @tc.desc      call static method double A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0003 done');
        done();
        console.log('call_StaticMethodDouble_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0400
     * @tc.name      call_StaticMethodDouble_0004
     * @tc.desc      call static method double from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0004 done');
        done();
        console.log('call_StaticMethodDouble_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0500
     * @tc.name      call_StaticMethodDouble_0005
     * @tc.desc      call static method double from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0005 done');
        done();
        console.log('call_StaticMethodDouble_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0600
     * @tc.name      call_StaticMethodDouble_0006
     * @tc.desc      call static method double from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0006 done');
        done();
        console.log('call_StaticMethodDouble_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0700
     * @tc.name      call_StaticMethodDouble_0007
     * @tc.desc      call static method double A from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0007 done');
        done();
        console.log('call_StaticMethodDouble_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0800
     * @tc.name      call_StaticMethodDouble_0008
     * @tc.desc      call static method double A from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0008 done');
        done();
        console.log('call_StaticMethodDouble_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_0900
     * @tc.name      call_StaticMethodDouble_0009
     * @tc.desc      call static method double A from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0009 done');
        done();
        console.log('call_StaticMethodDouble_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1000
     * @tc.name      call_StaticMethodDouble_0010
     * @tc.desc      call static method double A from null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0010 done');
        done();
        console.log('call_StaticMethodDouble_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1100
     * @tc.name      call_StaticMethodDouble_0011
     * @tc.desc      call static method double combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0011 done');
        done();
        console.log('call_StaticMethodDouble_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1200
     * @tc.name      call_StaticMethodDouble_0012
     * @tc.desc      call static method double combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0012 done');
        done();
        console.log('call_StaticMethodDouble_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1300
     * @tc.name      call_StaticMethodDouble_0013
     * @tc.desc      call static method double combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0013 done');
        done();
        console.log('call_StaticMethodDouble_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1400
     * @tc.name      call_StaticMethodDouble_0014
     * @tc.desc      call static method double from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0014 done');
        done();
        console.log('call_StaticMethodDouble_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1500
     * @tc.name      call_StaticMethodDouble_0015
     * @tc.desc      call static method double combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0015 done');
        done();
        console.log('call_StaticMethodDouble_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1600
     * @tc.name      call_StaticMethodDouble_0016
     * @tc.desc      call static method double combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0016 done');
        done();
        console.log('call_StaticMethodDouble_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1700
     * @tc.name      call_StaticMethodDouble_0017
     * @tc.desc      call static method double combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0017 done');
        done();
        console.log('call_StaticMethodDouble_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1800
     * @tc.name      call_StaticMethodDouble_0018
     * @tc.desc      call static method double combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0018 done');
        done();
        console.log('call_StaticMethodDouble_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODDOUBLE_1900
     * @tc.name      call_StaticMethodDouble_0019
     * @tc.desc      call static method double combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodDouble_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodDouble_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodDouble_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodDouble_0019 done');
        done();
        console.log('call_StaticMethodDouble_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0100
     * @tc.name      call_StaticMethodFloat_0001
     * @tc.desc      call static method float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0001 done');
        done();
        console.log('call_StaticMethodFloat_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0200
     * @tc.name      call_StaticMethodFloat_0002
     * @tc.desc      call static method float v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0002 done');
        done();
        console.log('call_StaticMethodFloat_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0300
     * @tc.name      call_StaticMethodFloat_0003
     * @tc.desc      call static method float A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0003 done');
        done();
        console.log('call_StaticMethodFloat_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0400
     * @tc.name      call_StaticMethodFloat_0004
     * @tc.desc      call static method float from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0004 done');
        done();
        console.log('call_StaticMethodFloat_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0500
     * @tc.name      call_StaticMethodFloat_0005
     * @tc.desc      call static method float from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0005 done');
        done();
        console.log('call_StaticMethodFloat_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0600
     * @tc.name      call_StaticMethodFloat_0006
     * @tc.desc      call static method float from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0006 done');
        done();
        console.log('call_StaticMethodFloat_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0700
     * @tc.name      call_StaticMethodFloat_0007
     * @tc.desc      call static method float from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0007 done');
        done();
        console.log('call_StaticMethodFloat_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0800
     * @tc.name      call_StaticMethodFloat_0008
     * @tc.desc      call static method float from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0008 done');
        done();
        console.log('call_StaticMethodFloat_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_0900
     * @tc.name      call_StaticMethodFloat_0009
     * @tc.desc      call static method float from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0009 done');
        done();
        console.log('call_StaticMethodFloat_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1000
     * @tc.name      call_StaticMethodFloat_0010
     * @tc.desc      call static method float from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0010 done');
        done();
        console.log('call_StaticMethodFloat_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1100
     * @tc.name      call_StaticMethodFloat_0011
     * @tc.desc      call static method float combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0011 done');
        done();
        console.log('call_StaticMethodFloat_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1200
     * @tc.name      call_StaticMethodFloat_0012
     * @tc.desc      call static method float combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0012 done');
        done();
        console.log('call_StaticMethodFloat_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1300
     * @tc.name      call_StaticMethodFloat_0013
     * @tc.desc      call static method float combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0013 done');
        done();
        console.log('call_StaticMethodFloat_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1400
     * @tc.name      call_StaticMethodFloat_0014
     * @tc.desc      call static method float from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0014 done');
        done();
        console.log('call_StaticMethodFloat_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1500
     * @tc.name      call_StaticMethodFloat_0015
     * @tc.desc      call static method float combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0015 done');
        done();
        console.log('call_StaticMethodFloat_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1600
     * @tc.name      call_StaticMethodFloat_0016
     * @tc.desc      call static method float combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0016 done');
        done();
        console.log('call_StaticMethodFloat_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1700
     * @tc.name      call_StaticMethodFloat_0017
     * @tc.desc      call static method float combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0017 done');
        done();
        console.log('call_StaticMethodFloat_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1800
     * @tc.name      call_StaticMethodFloat_0018
     * @tc.desc      call static method float combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0018 done');
        done();
        console.log('call_StaticMethodFloat_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODFLOAT_1900
     * @tc.name      call_StaticMethodFloat_0019
     * @tc.desc      call static method float combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodFloat_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodFloat_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodFloat_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodFloat_0019 done');
        done();
        console.log('call_StaticMethodFloat_0019 end');
      })

      /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0100
     * @tc.name      call_StaticMethodVoid_0001
     * @tc.desc      call static method void
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0001 done');
        done();
        console.log('call_StaticMethodVoid_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0200
     * @tc.name      call_StaticMethodVoid_0002
     * @tc.desc      call static method void v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0002 done');
        done();
        console.log('call_StaticMethodVoid_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0300
     * @tc.name      call_StaticMethodVoid_0003
     * @tc.desc      call static method void A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0003 done');
        done();
        console.log('call_StaticMethodVoid_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0400
     * @tc.name      call_StaticMethodVoid_0004
     * @tc.desc      call static method void from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0004 done');
        done();
        console.log('call_StaticMethodVoid_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0500
     * @tc.name      call_StaticMethodVoid_0005
     * @tc.desc      call static method void from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0005 done');
        done();
        console.log('call_StaticMethodVoid_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0600
     * @tc.name      call_StaticMethodVoid_0006
     * @tc.desc      call static method void v from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0006 done');
        done();
        console.log('call_StaticMethodVoid_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0700
     * @tc.name      call_StaticMethodVoid_0007
     * @tc.desc      call static method void v from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0007 done');
        done();
        console.log('call_StaticMethodVoid_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0800
     * @tc.name      call_StaticMethodVoid_0008
     * @tc.desc      call static method void from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0008 done');
        done();
        console.log('call_StaticMethodVoid_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_0900
     * @tc.name      call_StaticMethodVoid_0009
     * @tc.desc      call static method void from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0009 done');
        done();
        console.log('call_StaticMethodVoid_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1000
     * @tc.name      call_StaticMethodVoid_0010
     * @tc.desc      call static method void from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0010 done');
        done();
        console.log('call_StaticMethodVoid_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1100
     * @tc.name      call_StaticMethodVoid_0011
     * @tc.desc      call static method void combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0011 done');
        done();
        console.log('call_StaticMethodVoid_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1200
     * @tc.name      call_StaticMethodVoid_0012
     * @tc.desc      call static method void combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0012 done');
        done();
        console.log('call_StaticMethodVoid_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1300
     * @tc.name      call_StaticMethodVoid_0013
     * @tc.desc      call static method void combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0013 done');
        done();
        console.log('call_StaticMethodVoid_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1400
     * @tc.name      call_StaticMethodVoid_0014
     * @tc.desc      call static method void from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0014 done');
        done();
        console.log('call_StaticMethodVoid_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1500
     * @tc.name      call_StaticMethodVoid_0015
     * @tc.desc      call static method void combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0015 done');
        done();
        console.log('call_StaticMethodVoid_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1600
     * @tc.name      call_StaticMethodVoid_0016
     * @tc.desc      call static method void combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0016 done');
        done();
        console.log('call_StaticMethodVoid_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1700
     * @tc.name      call_StaticMethodVoid_0017
     * @tc.desc      call static method void combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0017 done');
        done();
        console.log('call_StaticMethodVoid_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1800
     * @tc.name      call_StaticMethodVoid_0018
     * @tc.desc      call static method void combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0018 done');
        done();
        console.log('call_StaticMethodVoid_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODVOID_1900
     * @tc.name      call_StaticMethodVoid_0019
     * @tc.desc      call static method void combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodVoid_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodVoid_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodVoid_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodVoid_0019 done');
        done();
        console.log('call_StaticMethodVoid_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0100
     * @tc.name      call_StaticMethodChar_0001
     * @tc.desc      call static method char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0001 done');
        done();
        console.log('call_StaticMethodChar_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0200
     * @tc.name      call_StaticMethodChar_0002
     * @tc.desc      call static method char v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0002 done');
        done();
        console.log('call_StaticMethodChar_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0300
     * @tc.name      call_StaticMethodChar_0003
     * @tc.desc      call static method char A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_02();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0003 done');
        done();
        console.log('call_StaticMethodChar_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0400
     * @tc.name      call_StaticMethodChar_0004
     * @tc.desc      call static method char from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0004 done');
        done();
        console.log('call_StaticMethodChar_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0500
     * @tc.name      call_StaticMethodChar_0005
     * @tc.desc      call static method char from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0005 done');
        done();
        console.log('call_StaticMethodChar_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0600
     * @tc.name      call_StaticMethodChar_0006
     * @tc.desc      call static method char from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0006 done');
        done();
        console.log('call_StaticMethodChar_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0700
     * @tc.name      call_StaticMethodChar_0007
     * @tc.desc      call static method char V from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0007 done');
        done();
        console.log('call_StaticMethodChar_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0800
     * @tc.name      call_StaticMethodChar_0008
     * @tc.desc      call static method char V from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0008 done');
        done();
        console.log('call_StaticMethodChar_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_0900
     * @tc.name      call_StaticMethodChar_0009
     * @tc.desc      call static method char v from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0009 done');
        done();
        console.log('call_StaticMethodChar_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1000
     * @tc.name      call_StaticMethodChar_0010
     * @tc.desc      call static method char A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0010 done');
        done();
        console.log('call_StaticMethodChar_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1100
     * @tc.name      call_StaticMethodChar_0011
     * @tc.desc      call static method char A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0011 done');
        done();
        console.log('call_StaticMethodChar_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1200
     * @tc.name      call_StaticMethodChar_0012
     * @tc.desc      call static method char A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0012 done');
        done();
        console.log('call_StaticMethodChar_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1300
     * @tc.name      call_StaticMethodChar_0013
     * @tc.desc      call static method char A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0013 done');
        done();
        console.log('call_StaticMethodChar_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1400
     * @tc.name      call_StaticMethodChar_0014
     * @tc.desc      call static method char combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_13();
        expect(result).assertFalse();
        console.log('call_StaticMethodChar_0014 done');
        done();
        console.log('call_StaticMethodChar_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1500
     * @tc.name      call_StaticMethodChar_0015
     * @tc.desc      call static method char combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0015 done');
        done();
        console.log('call_StaticMethodChar_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1600
     * @tc.name      call_StaticMethodChar_0016
     * @tc.desc      call static method char combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0016 done');
        done();
        console.log('call_StaticMethodChar_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1700
     * @tc.name      call_StaticMethodChar_0017
     * @tc.desc      call static method char from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0017 done');
        done();
        console.log('call_StaticMethodChar_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1800
     * @tc.name      call_StaticMethodChar_0018
     * @tc.desc      call static method char combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0018 done');
        done();
        console.log('call_StaticMethodChar_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_1900
     * @tc.name      call_StaticMethodChar_0019
     * @tc.desc      call static method char combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0019 done');
        done();
        console.log('call_StaticMethodChar_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_2000
     * @tc.name      call_StaticMethodChar_0020
     * @tc.desc      call static method char combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_19();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0020 done');
        done();
        console.log('call_StaticMethodChar_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_2100
     * @tc.name      call_StaticMethodChar_0021
     * @tc.desc      call static method char combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_20();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0021 done');
        done();
        console.log('call_StaticMethodChar_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODCHAR_2200
     * @tc.name      call_StaticMethodChar_0022
     * @tc.desc      call static method char combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodChar_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodChar_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodChar_21();
        expect(result).assertTrue();
        console.log('call_StaticMethodChar_0022 done');
        done();
        console.log('call_StaticMethodChar_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0100
     * @tc.name      call_FindField_0001
     * @tc.desc      get point field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_00();
        expect(result).assertTrue();
        console.log('call_FindField_0001 done');
        done();
        console.log('call_FindField_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0200
     * @tc.name      call_FindField_0002
     * @tc.desc      point field not found
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_01();
        expect(result).assertTrue();
        console.log('call_FindField_0002 done');
        done();
        console.log('call_FindField_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0300
     * @tc.name      call_FindField_0003
     * @tc.desc      get extended point field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_02();
        expect(result).assertTrue();
        console.log('call_FindField_0003 done');
        done();
        console.log('call_FindField_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0400
     * @tc.name      call_FindField_0004
     * @tc.desc      get vector field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_03();
        expect(result).assertTrue();
        console.log('call_FindField_0004 done');
        done();
        console.log('call_FindField_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0500
     * @tc.name      call_FindField_0005
     * @tc.desc      get circle field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_04();
        expect(result).assertTrue();
        console.log('call_FindField_0005 done');
        done();
        console.log('call_FindField_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0600
     * @tc.name      call_FindField_0006
     * @tc.desc      get sphere field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_05();
        expect(result).assertTrue();
        console.log('call_FindField_0006 done');
        done();
        console.log('call_FindField_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0700
     * @tc.name      call_FindField_0007
     * @tc.desc      get space field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_06();
        expect(result).assertTrue();
        console.log('call_FindField_0007 done');
        done();
        console.log('call_FindField_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0800
     * @tc.name      call_FindField_0008
     * @tc.desc      get partial field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_07();
        expect(result).assertTrue();
        console.log('call_FindField_0008 done');
        done();
        console.log('call_FindField_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_0900
     * @tc.name      call_FindField_0009
     * @tc.desc      get required field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_08();
        expect(result).assertTrue();
        console.log('call_FindField_0009 done');
        done();
        console.log('call_FindField_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_1000
     * @tc.name      call_FindField_0010
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_09();
        expect(result).assertTrue();
        console.log('call_FindField_0010 done');
        done();
        console.log('call_FindField_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_1100
     * @tc.name      call_FindField_0011
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_10();
        expect(result).assertTrue();
        console.log('call_FindField_0011 done');
        done();
        console.log('call_FindField_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDFIELD_1200
     * @tc.name      call_FindField_0012
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindField_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindField_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField_11();
        expect(result).assertTrue();
        console.log('call_FindField_0012 done');
        done();
        console.log('call_FindField_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDSTATICFIELD_0100
     * @tc.name      call_FindStaticField_0001
     * @tc.desc      get field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindStaticField_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindStaticField_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticField();
        expect(result).assertTrue();
        console.log('call_FindStaticField_0001 done');
        done();
        console.log('call_FindStaticField_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDSTATICFIELD_0200
     * @tc.name      call_FindStaticField_0002
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindStaticField_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindStaticField_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticField_01();
        expect(result).assertTrue();
        console.log('call_FindStaticField_0002 done');
        done();
        console.log('call_FindStaticField_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDSTATICFIELD_0300
     * @tc.name      call_FindStaticField_0003
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindStaticField_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindStaticField_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticField_02();
        expect(result).assertTrue();
        console.log('call_FindStaticField_0003 done');
        done();
        console.log('call_FindStaticField_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FINDSTATICFIELD_0400
     * @tc.name      call_FindStaticField_0004
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_FindStaticField_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_FindStaticField_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticField_03();
        expect(result).assertTrue();
        console.log('call_FindStaticField_0004 done');
        done();
        console.log('call_FindStaticField_0004 end');
      })
  
    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0100
     * @tc.name      test_Class_Call_Static_Method_Bool_0001
     * @tc.desc      call static method by name bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_01();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0001 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0200
     * @tc.name      test_Class_Call_Static_Method_Bool_0002
     * @tc.desc      call static method by name bool v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_02();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0002 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0300
     * @tc.name      test_Class_Call_Static_Method_Bool_0003
     * @tc.desc      call static method by name bool A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_03();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0003 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0400
     * @tc.name      test_Class_Call_Static_Method_Bool_0004
     * @tc.desc      call static method by name bool null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_04();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0004 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0500
     * @tc.name      test_Class_Call_Static_Method_Bool_0005
     * @tc.desc      call static method by name bool null name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_05();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0005 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0600
     * @tc.name      test_Class_Call_Static_Method_Bool_0006
     * @tc.desc      call static method by name bool error name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_06();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0006 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0700
     * @tc.name      test_Class_Call_Static_Method_Bool_0007
     * @tc.desc      call static method by name bool null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_07();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0007 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0800
     * @tc.name      test_Class_Call_Static_Method_Bool_0008
     * @tc.desc      call static method by name bool v null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_08();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0008 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_0900
     * @tc.name      test_Class_Call_Static_Method_Bool_0009
     * @tc.desc      call static method by name bool v null name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_09();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0009 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_1000
     * @tc.name      test_Class_Call_Static_Method_Bool_0010
     * @tc.desc      call static method by name bool v errorname
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_10();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0010 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_1100
     * @tc.name      test_Class_Call_Static_Method_Bool_0011
     * @tc.desc      call static method by name bool v null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_11();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0011 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_1200
     * @tc.name      test_Class_Call_Static_Method_Bool_0012
     * @tc.desc      call static method by name bool A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_12();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0012 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_1300
     * @tc.name      test_Class_Call_Static_Method_Bool_0013
     * @tc.desc      call static method by name bool A null name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_13();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0013 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_1400
     * @tc.name      test_Class_Call_Static_Method_Bool_0014
     * @tc.desc      call static method by name bool A error name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_14();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0014 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_1500
     * @tc.name      test_Class_Call_Static_Method_Bool_0015
     * @tc.desc      call static method by name bool A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_15();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0015 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_1600
     * @tc.name      test_Class_Call_Static_Method_Bool_0016
     * @tc.desc      call static method by name bool A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_16();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0016 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2100
     * @tc.name      test_Class_Call_Static_Method_Bool_0021
     * @tc.desc      call static method by name bool null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_21();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0021 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2200
     * @tc.name      test_Class_Call_Static_Method_Bool_0022
     * @tc.desc      call static method by name bool combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_22();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0022 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2300
     * @tc.name      test_Class_Call_Static_Method_Bool_0023
     * @tc.desc      call static method by name bool combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_23();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0023 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2400
     * @tc.name      test_Class_Call_Static_Method_Bool_0024
     * @tc.desc      call static method by name bool combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0024 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_24();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0024 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0024 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2500
     * @tc.name      test_Class_Call_Static_Method_Bool_0025
     * @tc.desc      call static method by name bool combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0025 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_25();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0025 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0025 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2600
     * @tc.name      test_Class_Call_Static_Method_Bool_0026
     * @tc.desc      call static method by name bool combine scenes 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0026 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_26();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0026 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0026 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2700
     * @tc.name      test_Class_Call_Static_Method_Bool_0027
     * @tc.desc      call static method by name bool combine scenes 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0027 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_27();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0027 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0027 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2800
     * @tc.name      test_Class_Call_Static_Method_Bool_0028
     * @tc.desc      call static method by name bool combine scenes 11
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0028 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_28();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0028 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0028 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BOOL_2900
     * @tc.name      test_Class_Call_Static_Method_Bool_0029
     * @tc.desc      call static method by name bool combine scenes 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Bool_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Bool_0029 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Bool_29();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Bool_0029 done');
        done();
        console.log('test_Class_Call_Static_Method_Bool_0029 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0100
     * @tc.name      test_Class_Call_Static_Method_Byte_0001
     * @tc.desc      call static method by name byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_01();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0001 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0200
     * @tc.name      test_Class_Call_Static_Method_Byte_0002
     * @tc.desc      call static method by name byte v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_02();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0002 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0300
     * @tc.name      test_Class_Call_Static_Method_Byte_0003
     * @tc.desc      call static method by name byte A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_03();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0003 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0400
     * @tc.name      test_Class_Call_Static_Method_Byte_0004
     * @tc.desc      call static method by name byte null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_04();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0004 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0500
     * @tc.name      test_Class_Call_Static_Method_Byte_0005
     * @tc.desc      call static method by name byte null name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_05();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0005 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0600
     * @tc.name      test_Class_Call_Static_Method_Byte_0006
     * @tc.desc      call static method by name byte error name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_06();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0006 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0700
     * @tc.name      test_Class_Call_Static_Method_Byte_0007
     * @tc.desc      call static method by name byte null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_07();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0007 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0800
     * @tc.name      test_Class_Call_Static_Method_Byte_0008
     * @tc.desc      call static method by name byte v null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_08();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0008 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_0900
     * @tc.name      test_Class_Call_Static_Method_Byte_0009
     * @tc.desc      call static method by name byte v null name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_09();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0009 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_1000
     * @tc.name      test_Class_Call_Static_Method_Byte_0010
     * @tc.desc      call static method by name byte v errorname
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_10();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0010 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_1100
     * @tc.name      test_Class_Call_Static_Method_Byte_0011
     * @tc.desc      call static method by name byte v null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_11();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0011 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_1200
     * @tc.name      test_Class_Call_Static_Method_Byte_0012
     * @tc.desc      call static method by name byte A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_12();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0012 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_1300
     * @tc.name      test_Class_Call_Static_Method_Byte_0013
     * @tc.desc      call static method by name byte A null name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_13();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0013 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_1400
     * @tc.name      test_Class_Call_Static_Method_Byte_0014
     * @tc.desc      call static method by name byte A error name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_14();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0014 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_1500
     * @tc.name      test_Class_Call_Static_Method_Byte_0015
     * @tc.desc      call static method by name byte A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_15();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0015 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_1600
     * @tc.name      test_Class_Call_Static_Method_Byte_0016
     * @tc.desc      call static method by name byte A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_16();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0016 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_2100
     * @tc.name      test_Class_Call_Static_Method_Byte_0021
     * @tc.desc      call static method by name byte null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_21();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0021 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_2200
     * @tc.name      test_Class_Call_Static_Method_Byte_0022
     * @tc.desc      call static method by name byte combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_22();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0022 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_2300
     * @tc.name      test_Class_Call_Static_Method_Byte_0023
     * @tc.desc      call static method by name byte combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_23();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0023 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_2400
     * @tc.name      test_Class_Call_Static_Method_Byte_0024
     * @tc.desc      call static method by name byte combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0024 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_24();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0024 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0024 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_2500
     * @tc.name      test_Class_Call_Static_Method_Byte_0025
     * @tc.desc      call static method by name byte combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0025 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_25();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0025 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0025 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_2600
     * @tc.name      test_Class_Call_Static_Method_Byte_0026
     * @tc.desc      call static method by name byte combine scenes 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0026 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_26();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0026 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0026 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_CALL_STATIC_METHOD_BYTE_2700
     * @tc.name      test_Class_Call_Static_Method_Byte_0027
     * @tc.desc      call static method by name byte combine scenes 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Call_Static_Method_Byte_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Call_Static_Method_Byte_0027 start');
        let cls = new Foo();
        let result = cls.test_Class_Call_Static_Method_Byte_27();
        expect(result).assertTrue();
        console.log('test_Class_Call_Static_Method_Byte_0027 done');
        done();
        console.log('test_Class_Call_Static_Method_Byte_0027 end');
      })