/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import dataPreferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";
import { BusinessError } from "@ohos.base"
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'

let domain: int = 0x0000;
let tag: string = 'testTag';
hilog.info(domain, tag, '%{public}s', '================ export preferencetest start ....');
const KEY_TEST_DOUBLE_ELEMENT = 'key_test_double';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_DOUBLE_ARRAY_ELEMENT = 'key_test_double_array';
const KEY_TEST_BIGINT_ELEMENT = 'key_test_bigint';
const KEY_TEST_UINT8ARRAY_ELEMENT = 'key_test_uint8array';
const KEY_TEST_OBJECT_ELEMENT = 'key_test_object';
const KEY_TEST_INT_ARRAY_ELEMENT = 'key_test_int_array';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const MAX_KEY_LENGTH = 'X'.repeat(1024);
const NAME = 'test_preferences';
const NAME1 = "getPreferencesTest";
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';

let mPreferences: dataPreferences.Preferences;
let context: common.UIAbilityContext;
const TAG = '[PREFERENCES_CALLBACK_JSUNIT_TEST]'

class User {
  name: string = '';
  age: int;
  salary: double
};

class Company {
  cName: string = '';
  enName: string = '';
  year: int;
  money: BigInt = 0n;
  isActive: boolean = false;
  groups: string[] = [];
  users: User[] = [];
}

export default function preferenceTest() {
  describe('preferenceTest', (): void =>  {
    beforeAll (() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll')
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          context = abilitys.context
          context.stageMode = true;
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err : BusinessError | null) : void => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.preferences");
      await Utils.msSleep(6000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })


    afterAll(() => {
      hilog.info(domain, tag, '%{public}s', 'afterAll')
    })

    beforeEach(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach, stagemode is ' + context.stageMode)
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    })

    afterEach(() => {
      hilog.info(domain, tag, '%{public}s', 'afterEach')
      await dataPreferences.deletePreferences(context, NAME);
    })

    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesGetPreferences0001
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2200
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesGetPreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const NAME = 'getPreferencesTest'
      dataPreferences.getPreferences(context, NAME, (err : BusinessError | null, preferences : dataPreferences.Preferences|undefined) :void  => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err + "code:" + JSON.stringify(err))
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          console.log("Get preferences success");
          expect(preferences != undefined).assertTrue();
        }
      })
      done()
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesDeletePreferencesOptionsPromise_0100
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2300
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesDeletePreferencesOptionsPromise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const options_ : dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      try {
        hilog.info(domain, tag, '%{public}s', `getPreferences start.`);
        dataPreferences.getPreferences(context, options_).then(async (data : dataPreferences.Preferences) :  Promise<void> => {
          hilog.info(domain, tag, '%{public}s', `getPreferences successfully.`);
          expect(data!=null).assertTrue();
          dataPreferences.deletePreferences(context, options_).then(async () :  Promise<void> => {
            hilog.info(domain, tag, '%{public}s', `deletePreferences successfully.`);
            done();
          }).catch((err: BusinessError | null) : void => {
            expect().assertFail();
          })
        }).catch((err: Object|null|undefined) => {
          hilog.info(domain, tag, '%{public}s', `111 errInfo is :` + err);
          expect().assertFail();
        })
      } catch (errInfo : BusinessError) {
        hilog.info(domain, tag, '%{public}s', `222 errInfo is :` + errInfo);
        expect().assertFail();
      }
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesDeletePreferencesOptionsPromise_0200
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2400
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesDeletePreferencesOptionsPromise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const options_ : dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      hilog.info(domain, tag, '%{public}s', `getPreferences start.`);
      dataPreferences.getPreferences(context, options_, (err : BusinessError | null, preferences : dataPreferences.Preferences | undefined) :void  => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err + "code:" + JSON.stringify(err))
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          expect(preferences != null).assertTrue();
          dataPreferences.deletePreferences(context, options_, (err : BusinessError | null) : void => {
            if(err && err.code != 0){
              hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences err: " + err)
              expect(false).assertTrue();
            }else{
              hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences success")
            }
          })
        }
      })
      try {
        hilog.info(domain, tag, '%{public}s', `getPreferences start.`);
        dataPreferences.getPreferences(context, options_).then(async (data : dataPreferences.Preferences) :  Promise<void> => {
          hilog.info(domain, tag, '%{public}s', `getPreferences successfully.`);
          expect(data!=null).assertTrue();
          dataPreferences.deletePreferences(context, options_).then(async () :  Promise<void> => {
            hilog.info(domain, tag, '%{public}s', `deletePreferences successfully.`);
            done();
          }).catch((err: BusinessError | null) : void => {
            expect().assertFail();
          })
        }).catch((err: Object|null|undefined) => {
          hilog.info(domain, tag, '%{public}s', `111 errInfo is :` + err);
          expect().assertFail();
        })
      } catch (errInfo : BusinessError) {
        hilog.info(domain, tag, '%{public}s', `222 errInfo is :` + errInfo);
        expect().assertFail();
      }
    })

    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   PreferencesGetSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_0100
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesGetSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences.clearSync();
      const ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue");
      expect('defaultValue').assertEqual(ret);
      done();
    })

    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   PreferencesPutSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_EtsApiTest_0200
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesPutSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start');

      mPreferences.clearSync();
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start 2');

      const doubleVar = 6.666;
      mPreferences.putSync(KEY_TEST_DOUBLE_ELEMENT, 6.666);
      mPreferences.putSync("55555", 6.666);

      const stringVar = "6.666";
      mPreferences.putSync(KEY_TEST_STRING_ELEMENT, stringVar);

      const boolVar = true;
      mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, boolVar);

      const doubleArrVar = new Array<double>(1, 2, 3);
      mPreferences.putSync(KEY_TEST_DOUBLE_ARRAY_ELEMENT, doubleArrVar);

      const stringArr = new Array<string>('1', '2', '3');
      mPreferences.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);

      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start before bigint');
      const Num = BigInt("-12345678912345678912345678971234567123456");
      mPreferences.putSync(KEY_TEST_BIGINT_ELEMENT, Num);

      const uInt8Array = new Uint8Array(16);
      uInt8Array.fill(100);
      mPreferences.putSync(KEY_TEST_UINT8ARRAY_ELEMENT, uInt8Array);

      mPreferences.flush();

      let resDouble = mPreferences.getSync(KEY_TEST_DOUBLE_ELEMENT, 0) as double;
      expect(resDouble).assertEqual(doubleVar);

      let resString = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "") as string;
      expect(resString).assertEqual(stringVar);

      let resBool = mPreferences.getSync(KEY_TEST_BOOLEAN_ELEMENT, false) as boolean;
      expect(resBool).assertEqual(boolVar);

      let resDoubleArr = mPreferences.getSync(KEY_TEST_DOUBLE_ARRAY_ELEMENT, new Array<double>()) as Array<double>;
      for (let i = 0; i < doubleArrVar.length; i++) {
        hilog.info(domain, tag, '%{public}s', 'ttt  pre = ' + doubleArrVar[i] + '   now = ' + resDoubleArr[i]);
        expect(doubleArrVar[i]).assertEqual(resDoubleArr[i]);
      }

      let resStringArr = mPreferences.getSync(KEY_TEST_STRING_ARRAY_ELEMENT, new Array<string>()) as Array<string>;
      for (let i = 0; i < stringArr.length; i++) {
        hilog.info(domain, tag, '%{public}s', 'ttt  pre = ' + stringArr[i] + '   now = ' + resStringArr[i]);
        expect(stringArr[i]).assertEqual(resStringArr[i]);
      }

      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start get Uint8Array');
      let resUint8Array = mPreferences.getSync(KEY_TEST_UINT8ARRAY_ELEMENT, new Uint8Array()) as Uint8Array;
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 get Uint8Array success');
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 get Uint8Array success' + JSON.stringify(resUint8Array));
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 get Uint8Array success' + resUint8Array.length);
      for (let i = 0; i < resUint8Array.length; i++) {
        hilog.info(domain, tag, '%{public}s', 'ttt  pre = ' + uInt8Array[i] + '   now = ' + resUint8Array[i]);
        expect(resUint8Array[i]).assertEqual(uInt8Array[i]);
      }

      let allRes = mPreferences.getAllSync() as Object;
      hilog.info(domain, tag, '%{public}s', 'PreferencesEtsKit all = ' + JSON.stringify(allRes));

      done();
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesPutArrayNumber001
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_EtsApiTest_2500
     * @tc.desc   PutArrayNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutArrayNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.clear();
      mPreferences.put(KEY_TEST_INT_ARRAY_ELEMENT, new Array<number>(1, 2, 3), (err: BusinessError | null) :void => {
        let pre = await mPreferences.get(KEY_TEST_INT_ARRAY_ELEMENT, 0) as Array<number>;
        expect(3).assertEqual(pre.length);
        done();
      });
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesPutFlushRemoveGet_0300
     * @tc.number SUB_DistributedData_Preference_SDK_Flush_strong_basis_EtsApiTest_0300
     * @tc.desc   Flush promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutFlushRemoveGet_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "start_test_0300");
      if (mPreferences == null) {
        hilog.info(domain, tag, '%{public}s', TAG + "mPreferences is null.");
      }
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 111.2).then(async () : Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "put succeed");
      }).catch((err : Object|null|undefined) => {
        hilog.info(domain, tag, '%{public}s', TAG + "put failed error message = " + err);
      })

      await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then((res1 : Object) :  Promise<void> => {
        expect(111.2).assertEqual(res1);
        hilog.info(domain, tag, '%{public}s', TAG + "res1 = " + res1 + "get res1 succeed");
      }).catch((err : Object|null|undefined) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res1 failed error message = " + err);
      })

      await mPreferences.flush().then(() => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush succeed");
      }).catch((err : Object|null|undefined) => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush failed error message = " + err);
      })

      await dataPreferences.removePreferencesFromCache(context, NAME).then(() :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove succeed");
      }).catch((err : Object|null|undefined) => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove failed error message = " + err);
      })

      mPreferences = await dataPreferences.getPreferences(context, NAME);

      await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then((res2 : Object) :  Promise<void> => {
        expect(111.2).assertEqual(res2);
        hilog.info(domain, tag, '%{public}s', TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
        done();
      }).catch((err : Object|null|undefined) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res2 failed error message = " + err);
      })
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesGetFloat0100
     * @tc.number SUB_DistributedData_Preference_SDK_GetFloat_strong_basis_EtsApiTest_0400
     * @tc.desc   GetFloat promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesGetFloat0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0, (err: BusinessError | null, ret: dataPreferences.ValueType | undefined): void => {
        expect(3.0).assertEqual(ret as Number);
        done();
      })
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesPutInt0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutInt_strong_basis_EtsApiTest_0500
     * @tc.desc   PutInt promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutInt0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.clear();
      mPreferences.put(KEY_TEST_INT_ELEMENT, 4, (err: BusinessError | null) :void => {
        hilog.info(domain, tag, '%{public}s', TAG + "12");
        await mPreferences.flush(); // del
        hilog.info(domain, tag, '%{public}s', TAG + "123");
        let pre = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
        hilog.info(domain, tag, '%{public}s', TAG + "1234");
        expect(4).assertEqual(pre);
        hilog.info(domain, tag, '%{public}s', TAG + "12345");
        await mPreferences.flush();
        hilog.info(domain, tag, '%{public}s', TAG + "123456");
        let pre2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
        hilog.info(domain, tag, '%{public}s', TAG + "1234567");
        expect(4).assertEqual(pre2);
        hilog.info(domain, tag, '%{public}s', TAG + "12345678");
        done();
      });
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesDelete0010
     * @tc.number SUB_DistributedData_Preference_SDK_Delete_strong_basis_EtsApiTest_0600
     * @tc.desc   Delete promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDelete0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      let ret = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(3.0).assertEqual(ret);

      await mPreferences.flush();
      mPreferences.delete(KEY_TEST_FLOAT_ELEMENT, (err: BusinessError | null) => {
        if (err && err.code != 0) {
          hilog.info(domain, tag, '%{public}s', "Failed to delete the key KEY_TEST_STRING_ELEMENT. err =" + err);
          expect(!err).assertTrue();
        }
        hilog.info(domain, tag, '%{public}s', "Succeeded in deleting the key KEY_TEST_STRING_ELEMENT.");
        let per = mPreferences.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(0.0).assertEqual(per);
        done();
      });
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesHasKey0036
     * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0700
     * @tc.desc   HasKey promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesHasKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      mPreferences.has(KEY_TEST_BOOLEAN_ELEMENT, (err: BusinessError | null, ret : Boolean | undefined) : void => {
        expect(true).assertEqual(ret);
        done();
      })
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesHasKey0031
     * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0800
     * @tc.desc   HasKey promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesHasKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.has(KEY_TEST_STRING_ELEMENT).then((ret : Object) : Promise<void> => {
        expect(true).assertEqual(ret);
        done();
      }).catch((err : Object|null|undefined) => {
        expect(null).assertFail();
        done();
      });
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testRemovePreferencesFromCache0001
     * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0900
     * @tc.desc   HasKey promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemovePreferencesFromCache0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      dataPreferences.getPreferences(context, NAME, (err : BusinessError | null, preferences : dataPreferences.Preferences | undefined): void => {
        // if(err != null){
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          expect(preferences != null).assertTrue();
        }
      })
      dataPreferences.removePreferencesFromCache(context, NAME, (err  : BusinessError | null) : void => {
        // if(err != null){
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Remove preferences from cache error: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Remove preferences from cache success")
        }
      })
      done();
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   SUB_DDM_Preferences_removePreferencesFromCacheSync_0400
     * @tc.number SUB_DistributedData_Preference_SDK_removePreferencesFromCacheSync_strong_basis_EtsApiTest_1000
     * @tc.desc   removePreferencesFromCacheSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 begin.");
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        // dataGroupId: '123456'
      };
      hilog.info(domain, tag, '%{public}s', "000000000000 .");
      try {
        mPreferences = dataPreferences.getPreferencesSync(context, Options);
      } catch (err: BusinessError) {
        hilog.error(domain, tag, '%{public}s', "BusinessError: " + err.message);
      }
      mPreferences.clearSync();
      mPreferences.putSync(KEY_TEST_STRING_ELEMENT, 'test');
      mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 123");
      mPreferences.flush((err: BusinessError | null) => {
        hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 1234");
        if (err && err.code != 0) {
          hilog.info(domain, tag, '%{public}s', "flush err.");
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', "flush done.");
        dataPreferences.removePreferencesFromCacheSync(context, Options);
        let value : dataPreferences.ValueType = mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end" + value);
        expect('test').assertEqual(value);
        done();
        hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end");

      });
      hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 1235");

      done();
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   SUB_DDM_Preferences_deleteSync_0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_strong_basis_EtsApiTest_1100
     * @tc.desc   deleteSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_deleteSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "abc");
      expect("abc").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
      mPreferences.deleteSync(KEY_TEST_STRING_ELEMENT);
      expect("default").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
      done();
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   SUB_DDM_Preferences_GetPreferencesSync_0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_sGetPreferencesSync_basis_EtsApiTest_1200
     * @tc.desc   GetPreferencesSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const Options : dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: null
      };
      try {
        mPreferences = dataPreferences.getPreferencesSync(context, Options);
        done();
      } catch (errInfo : BusinessError) {
        expect().assertFail();
        done();
      }
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   PreferencesHasSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_HasSync_basis_EtsApiTest_1300
     * @tc.desc   HasSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesHasSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences.clearSync();
      mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
      const ret = mPreferences.hasSync(KEY_TEST_STRING_ELEMENT);
      expect(true).assertEqual(ret);
      done();
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   SUB_DDM_Preferences_GetAllSync_0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAllSync_basis_EtsApiTest_1400
     * @tc.desc   GetAllSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetAllSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences.clearSync();
      const doubleArr = new Array<double>(11, 22, 33);
      const stringArr = new Array<string>('11', '22', '33');
      const boolArr = new Array<boolean>(true, false, false, true);
      mPreferences.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      mPreferences.putSync(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      mPreferences.putSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
      mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "123");
      mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences.flush();
      let obj = mPreferences.getAllSync();
      let mapVals = obj as Record<string, dataPreferences.ValueType>;
      expect(false).assertEqual(mapVals.get(KEY_TEST_BOOLEAN_ELEMENT));
      expect("123").assertEqual(mapVals.get(KEY_TEST_STRING_ELEMENT));
      expect(123.1).assertEqual(mapVals.get(KEY_TEST_FLOAT_ELEMENT));

      let sArrObj = mapVals.get(KEY_TEST_STRING_ARRAY_ELEMENT);
      expect(sArrObj!=null).assertEqual(true);
      let sArr = sArrObj as Array<string>;
      for (let i = 0; i < sArr.length; i++) {
        expect(sArr[i]).assertEqual(stringArr[i]);
      }

      let bArrObj = mapVals.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
      expect(bArrObj!=null).assertEqual(true);
      let bArr = bArrObj as Array<boolean>;
      for (let i = 0; i < bArr.length; i++) {
        expect(bArr[i]).assertEqual(boolArr[i]);
      }

      let nArrObj = mapVals.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
      expect(nArrObj!=null).assertEqual(true);
      let nArr = nArrObj as Array<number>;
      for (let i = 0; i < nArr.length; i++) {
        expect(nArr[i]).assertEqual(doubleArr[i]);
      }
      done();
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesClear0012
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_Clear_basis_EtsApiTest_1500
     * @tc.desc   Clear promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesClear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      mPreferences.clear((err : BusinessError | null) : void => {
        let pre = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
        expect("defaultvalue").assertEqual(pre);
        done();
      });
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesClear0011
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_Clear_basis_EtsApiTest_1600
     * @tc.desc   Clear promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesClear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      await mPreferences.clear().then(() : void => {
        let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("defaultvalue").assertEqual(per);
        done();
      }).catch((err) => {
        expect(null).assertFail();
        done();
      });
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesDeletePreferences0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_DeletePreferences_basis_EtsApiTest_1700
     * @tc.desc   DeletePreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesDeletePreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const NAME = 'getPreferencesTest'
      dataPreferences.getPreferences(context, NAME, (err : BusinessError | null, preferences : dataPreferences.Preferences | undefined) : void => {
        // if(err != null){
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          expect(preferences != null).assertTrue();
        }
      })
      dataPreferences.deletePreferences(context, NAME, (err : BusinessError | null) : void => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences err: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences success")
        }
      })
      done()
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesGetPreferencesPromise0010
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetPreferences_basis_EtsApiTest_1800
     * @tc.desc   GetPreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromise0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      dataPreferences.getPreferences(context, NAME1).then(async (preferences : dataPreferences.Preferences) => {
        hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success" + preferences);
        await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
        preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err: BusinessError | null, ret: dataPreferences.ValueType | undefined) => {
          expect("test").assertEqual(ret);
        });
        await dataPreferences.deletePreferences(context, NAME1).then<void, void>((): void => {});
        done();
      }).catch((err: Object|null|undefined) => {
        hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err);
        expect(!err).assertTrue();
      })
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   PreferencesRemovePreferencesFromCacheSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_RemovePreferencesFromCacheSync_basis_EtsApiTest_1900
     * @tc.desc   RemovePreferencesFromCacheSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesRemovePreferencesFromCacheSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log("PreferencesRemovePreferencesFromCacheSync0100 begin.");
      mPreferences = await dataPreferences.getPreferences(context, NAME);
      mPreferences.clearSync();
      mPreferences.putSync(KEY_TEST_STRING_ELEMENT, 'test')
      mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
      mPreferences.flush((err: BusinessError |null): void => {
        if (err && err.code != 0) {
          console.log("flush err.");
          expect().assertFail();
        }
        console.log("flush done.");
        dataPreferences.removePreferencesFromCacheSync(context, NAME);
        let value = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
        console.log("PreferencesRemovePreferencesFromCacheSync0100 end." + value);
        expect('test').assertEqual(value);
        done();
        console.log("PreferencesRemovePreferencesFromCacheSync0100 end.");
      });
      done();
    });
    
    
    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesGetAllCallBackTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2000
     * @tc.desc   GetAll promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetAllCallBackTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.clear();
      let doubleArr = new Array<number>(11, 22, 33);
      let stringArr = new Array<string>('11', '22', '33');
      let boolArr = new Array<boolean>(true, false, false, true);
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences.flush();

      mPreferences.getAll((err: BusinessError | null, value: Object | undefined) => {
        let obj = value as Record<string, object>;
        expect(false).assertEqual(obj.get(KEY_TEST_BOOLEAN_ELEMENT));
        expect("123").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
        expect(123.1).assertEqual(obj.get(KEY_TEST_FLOAT_ELEMENT));

        let sArrObj = obj.get(KEY_TEST_STRING_ARRAY_ELEMENT);
        expect(sArrObj!=null).assertEqual(true);
        let sArr = sArrObj as Array<string>;
        for (let i = 0; i < sArr.length; i++) {
          expect(sArr[i]).assertEqual(stringArr[i]);
        }

        let bArrObj = obj.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
        expect(bArrObj!=null).assertEqual(true);
        let bArr = bArrObj as Array<boolean>;
        for (let i = 0; i < bArr.length; i++) {
          expect(bArr[i]).assertEqual(boolArr[i]);
        }

        let nArrObj = obj.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
        expect(nArrObj!=null).assertEqual(true);
        let nArr = nArrObj as Array<number>;
        for (let i = 0; i < nArr.length; i++) {
          expect(nArr[i]).assertEqual(doubleArr[i]);
        }

        done();
      });
    });


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesGetAllPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2100
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesGetAllPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences.clear();
      let doubleArr = new Array<number>(11, 22, 33);
      let stringArr = new Array<string>('11', '22', '33');
      let boolArr = new Array<boolean>(true, false, false, true);
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences.flush();

      await mPreferences.getAll().then((value: Object) => {
        let obj = value as Record<string, object>;
        expect(false).assertEqual(obj.get(KEY_TEST_BOOLEAN_ELEMENT));
        expect("123").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
        expect(123.1).assertEqual(obj.get(KEY_TEST_FLOAT_ELEMENT));

        let sArrObj = obj.get(KEY_TEST_STRING_ARRAY_ELEMENT);
        expect(sArrObj!=null).assertEqual(true);
        let sArr = sArrObj as Array<string>;
        for (let i = 0; i < sArr.length; i++) {
          expect(sArr[i]).assertEqual(stringArr[i]);
        }

        let bArrObj = obj.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
        expect(bArrObj!=null).assertEqual(true);
        let bArr = bArrObj as Array<boolean>;
        for (let i = 0; i < bArr.length; i++) {
          expect(bArr[i]).assertEqual(boolArr[i]);
        }

        let nArrObj = obj.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
        expect(nArrObj!=null).assertEqual(true);
        let nArr = nArrObj as Array<number>;
        for (let i = 0; i < nArr.length; i++) {
          expect(nArr[i]).assertEqual(doubleArr[i]);
        }
        done();
      }).catch((err: Object|null|undefined) => {
        expect(null).assertFail();
        done();
      })
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesOnChangePromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2600
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnChangePromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnChangePromiseTest0001 start");
      try {
        await mPreferences.clear();
        await mPreferences.flush();
        const testObserver = (key : string): void => {
            hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnChangePromiseTest0001 key:" + key);
            expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
            done();
        }
        mPreferences.on('change', testObserver);
        hilog.info(domain, tag, '%{public}s', TAG + "start on2");
        mPreferences.on('change', testObserver);
        hilog.info(domain, tag, '%{public}s', TAG + "start put");

        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        hilog.info(domain, tag, '%{public}s', TAG + "start flush");

        await mPreferences.flush();
        hilog.info(domain, tag, '%{public}s', TAG + "start sleep");

        await Utils.msSleep(1000);
        done();
      } catch (err : BusinessError) {
        expect().assertFail();
        done();
      }
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesOffChangePromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2700
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOffChangePromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffChangePromiseTest0001 start");
      try {
        await mPreferences.clear();
        await mPreferences.flush();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffChangePromiseTest0001 key:" + key);
          expect(null).assertFail();
          done();
        }
        mPreferences.on('change', testObserver);
        mPreferences.off('change', testObserver);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        await mPreferences.flush();
        await Utils.msSleep(1000);
        done();
      } catch (err : BusinessError) {
        expect().assertFail();
        done();
      }
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesOnMultiprocessPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2800
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnMultiprocessPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessPromiseTest0001 start");
      try {
        await mPreferences.clear();
        mPreferences.flushSync();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessPromiseTest0001 key:" + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
          done();
        }
        mPreferences.on('multiProcessChange', testObserver);
        mPreferences.on('multiProcessChange', testObserver);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences.flushSync();

        await Utils.msSleep(100);
        mPreferences.off('multiProcessChange', testObserver);
        done();
      } catch (err : BusinessError) {
        expect().assertFail();
        done();
      }
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesOffMultiprocessPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2900
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOffMultiprocessPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffMultiprocessPromiseTest0001 start");
      try {
        await mPreferences.clear();
        mPreferences.flushSync();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffMultiprocessPromiseTest0001 key:" + key);
          expect(null).assertFail();
          done();
        }
        mPreferences.on('multiProcessChange', testObserver);
        mPreferences.off('multiProcessChange', testObserver);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences.flushSync();
        await Utils.msSleep(1000);
        done();
      } catch (err : BusinessError) {
        expect().assertFail();
        done();
      }
    })


    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesOnDatachangePromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_3000
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnDatachangePromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnDatachangePromiseTest0001 start");
      try {
        await mPreferences.clear();
        mPreferences.flushSync();
        const testObserver = (obj: Record<string, dataPreferences.ValueType>): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnDatachangePromiseTest0001 value:" + obj.get(KEY_TEST_STRING_ELEMENT));
          expect("abc").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
          done();
        }
        let keys = new Array<string>(KEY_TEST_STRING_ELEMENT);
        mPreferences.on('dataChange', keys, testObserver);
        mPreferences.on('dataChange', keys, testObserver);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences.flushSync();
      } catch (err : BusinessError) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @generated.time 2025-11-09 20:49:48
     * @tc.name   testPreferencesOnMultiprocessErrPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_3100
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnMultiprocessErrPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessErrPromiseTest0001 start");
      try {
        await mPreferences.clear();
        mPreferences.flushSync();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessErrPromiseTest0001 key:" + key);
          expect(null).assertFail();
          done();
        }
        for (let index = 0; index < 80; index++) {
          mPreferences.on('multiProcessChange', testObserver);
          mPreferences.off('multiProcessChange', testObserver);
        }
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences.flushSync();
        await Utils.msSleep(1000);
        done();
      } catch (err : BusinessError) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessErrPromiseTest0001 :" + err.code + err.message );
        expect(err.code).assertEqual(15500019);
        done();
      }
    })


     /**
      * @generated.time 2025-11-09 20:49:48
      * @tc.name   testPreferencesMxaKeyLengthPromiseTest0001
      * @tc.number SUB_DistributedData_Preference_SDK_MxaKeyLength_basis_EtsApiTest_3200
      * @tc.desc   MxaKeyLength promise interface test
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testPreferencesMxaKeyLengthPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try{
        await mPreferences.clear();
        await mPreferences.put(MAX_KEY_LENGTH, "abc");
        let ret = await mPreferences.get(MAX_KEY_LENGTH, "default");
        expect("abc").assertEqual(ret);
        done();
      } catch(err : BusinessError) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesMxaKeyLengthPromiseTest0001 :" + err.code + err.message );
        expect().assertFail();
        done();
      }
    })

    const userArrVar: User[] = [];
    userArrVar.push({ name: 'zhangSan', age: 18, salary: 3000.5 });
    userArrVar.push({ name: 'lisi', age: 20, salary: 5000.4 });
    const moneyNum = BigInt("-12345678912345678912345678971234567123456");
    let company: Company = {
      cName: '我的公司',
      enName: 'myCompany',
      year: 1998,
      groups: ['dp1', 'dp2'],
      users: userArrVar,
      isActive: true,
      money: moneyNum
    };

    /**
     * @generated.time 2025-11-13 14:49:48
     * @tc.name   testPreferencesObjectPromiseTestGet
     * @tc.number SUB_DistributedData_Preference_SDK_ObjectGet_basis_EtsApiTest_3300
     * @tc.desc   MxaKeyLength promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesObjectPromiseTestGet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await mPreferences.clear();
        mPreferences.flushSync();

        await mPreferences.put("object_key", company);
        let compJson = await mPreferences.get("object_key", {});
        let compJsonElement = JSON.parseJsonElement(compJson!.toString());
        expect("我的公司").assertEqual(compJsonElement.getElement("cName").asString());
        expect("myCompany").assertEqual(compJsonElement.getElement("enName").asString());
        expect(1998).assertEqual(compJsonElement.getElement("year").asInteger());
        expect(true).assertEqual(compJsonElement.getElement("isActive").asBoolean());

        let groups = compJsonElement.getArray("groups");
        expect("dp1").assertEqual(groups[0].asString());
        expect("dp2").assertEqual(groups[1].asString());
        let users = compJsonElement.getArray("users");
        expect(18).assertEqual(users[0].getElement("age").asInteger());
        expect("zhangSan").assertEqual(users[0].getElement("name").asString());
        expect(3000.5).assertEqual(users[0].getElement("salary").asDouble());
        expect(20).assertEqual(users[1].getElement("age").asInteger());
        expect("lisi").assertEqual(users[1].getElement("name").asString());
        expect(5000.4).assertEqual(users[1].getElement("salary").asDouble());
        done();
      } catch(err : BusinessError) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesObjectPromiseTestGet :" + err.code + err.message );
        expect().assertFail();
        done();
      }
    })

    /**
     * @generated.time 2025-11-13 14:49:48
     * @tc.name   testPreferencesObjectPromiseTestGetAll
     * @tc.number SUB_DistributedData_Preference_SDK_ObjectGetAll_basis_EtsApiTest_3400
     * @tc.desc   MxaKeyLength promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesObjectPromiseTestGetAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await mPreferences.clear();
        mPreferences.flushSync();

        await mPreferences.put("object_key", company);
        await mPreferences.put("string_key", 'test_string');
        await mPreferences.put("double_key", 3.14);

        mPreferences.getAll((err: BusinessError | null, value: Object | undefined) => {
          let obj = value as Record<string, object>;
          expect("test_string").assertEqual(obj.get("string_key"));
          expect(3.14).assertEqual(obj.get("double_key"));
          let allJson = obj.get("object_key");
          let compJsonElement = JSON.parseJsonElement(allJson?.toString() as string);

          expect("我的公司").assertEqual(compJsonElement.getElement("cName").asString());
          expect("myCompany").assertEqual(compJsonElement.getElement("enName").asString());
          expect(1998).assertEqual(compJsonElement.getElement("year").asInteger());
          expect(true).assertEqual(compJsonElement.getElement("isActive").asBoolean());

          let groups = compJsonElement.getArray("groups");
          expect("dp1").assertEqual(groups[0].asString());
          expect("dp2").assertEqual(groups[1].asString());
          let users = compJsonElement.getArray("users");
          expect(18).assertEqual(users[0].getElement("age").asInteger());
          expect("zhangSan").assertEqual(users[0].getElement("name").asString());
          expect(3000.5).assertEqual(users[0].getElement("salary").asDouble());
          expect(20).assertEqual(users[1].getElement("age").asInteger());
          expect("lisi").assertEqual(users[1].getElement("name").asString());
          expect(5000.4).assertEqual(users[1].getElement("salary").asDouble());
          done();
        })
        done();
      } catch(err : BusinessError) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesObjectPromiseTestGetAll :" + err.code + err.message );
        expect().assertFail();
        done();
      }
    })

    /**
     * @generated.time 2025-11-27 20:49:48
     * @tc.name   PreferencesBaseDataType001
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesBaseDataType001_basis_EtsApiTest_3500
     * @tc.desc   Preferences Base DataType test int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesBaseDataType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let preferences = await dataPreferences.getPreferences(context, 'test_preferences_base_int');
      let baseInt: int = 123;
      await preferences.put('base_int', baseInt);
      await preferences.flush();
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType001 key base_int, value:" + baseInt);
      let ret: int = preferences.getSync("base_int", 0);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType001 key base_int, ret:" + ret);
      expect(baseInt).assertEqual(ret);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType001 key base_int, typeof(ret):" + typeof(ret));
      expect(typeof(ret)).assertEqual("int");
      await dataPreferences.deletePreferences(context, 'test_preferences_base_int');
      done();
    })

    /**
     * @generated.time 2025-11-27 20:49:48
     * @tc.name   PreferencesBaseDataType002
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesBaseDataType002_basis_EtsApiTest_3600
     * @tc.desc   Preferences Base DataType test number/double
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesBaseDataType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let preferences = await dataPreferences.getPreferences(context, 'test_preferences_base_double');
      let baseDouble: double = 1239999999.1;
      await preferences.put('base_double', baseDouble);
      await preferences.flush();
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType002 key base_double, value:" + baseDouble);
      let ret = preferences.getSync("base_double", 0.0) as double;
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType002 key base_double, ret:" + ret);
      expect(baseDouble).assertEqual(ret);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType002 key base_double, typeof(ret):" + typeof(ret));
      expect(typeof(ret)).assertEqual("number");
      let numberData: number = 777;
      expect(true).assertEqual(typeof(ret) == typeof(numberData));
      await dataPreferences.deletePreferences(context, 'test_preferences_base_double');
      done();
    })

    /**
     * @generated.time 2025-11-27 20:49:48
     * @tc.name   PreferencesBaseDataType003
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesBaseDataType003_basis_EtsApiTest_3700
     * @tc.desc   Preferences Base DataType test long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesBaseDataType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let preferences = await dataPreferences.getPreferences(context, 'test_preferences_base_long');
      let baseLong: long = 123888888888;
      await preferences.put('base_long', baseLong);
      await preferences.flush();
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType003 key base_long, value:" + baseLong);
      let ret: long = preferences.getSync("base_long", 0);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType003 key base_long, ret:" + ret);
      expect(baseLong).assertEqual(ret);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType003 key base_long, typeof(ret):" + typeof(ret));
      expect(typeof(ret)).assertEqual("long");
      await dataPreferences.deletePreferences(context, 'test_preferences_base_long');
      done();
    })
  })
}