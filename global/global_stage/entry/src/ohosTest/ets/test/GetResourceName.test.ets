/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import resourceManager from '@ohos.resourceManager';
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { GlobalContext } from '../test/global';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function getResourceNameTest() {

  describe('getResourceNameTest', () => {
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async (done: Function) => {
      console.info('beforeAll called');
      done();
    });

    beforeEach(() => {
      console.info('beforeEach called');
      resContext = (GlobalContext.getContext().getObject('yq') as Context);
      res = resContext.resourceManager;
    });

    afterEach(async (done: Function) => {
      console.info('afterEach called');
      done();
    });

    afterAll(async (done: Function) => {
      console.info('afterAll called');
      done();
    });

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_String_0100
     * @tc.name SUB_RM_ResourceManager_getResourceName_String_0100
     * @tc.desc Test getResourceName with app string resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_String_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_String_0100 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.string.test_stringOne').id);
        hilog.info(domain, tag, 'getResourceName_test_0100 value: ' + resName);
        expect(resName).assertEqual('test_stringOne');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_String_0100 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_String_0100 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Media_0110
     * @tc.name SUB_RM_ResourceManager_getResourceName_Media_0110
     * @tc.desc Test getResourceName with app media resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_Media_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Media_0110 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.media.icon').id);
        hilog.info(domain, tag, 'getResourceName_test_0200 value: ' + resName);
        expect(resName).assertEqual('icon');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Media_0110 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Media_0110 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Color_0120
     * @tc.name SUB_RM_ResourceManager_getResourceName_Color_0120
     * @tc.desc Test getResourceName with app color resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_Color_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM-RM_getResourceName_Color_0120 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.color.color_test1').id);
        hilog.info(domain, tag, 'getResourceName_test_0300 value: ' + resName);
        expect(resName).assertEqual('color_test1');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Color_0120 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Color_0120 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Float_0130
     * @tc.name SUB_RM_ResourceManager_getResourceName_Float_0130
     * @tc.desc Test getResourceName with app float resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_Float_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Float_0130 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.float.float_loopA').id);
        hilog.info(domain, tag, 'getResourceName_test_0400 value: ' + resName);
        expect(resName).assertEqual('float_loopA');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Float_0130 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Float_0130 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_StrArray_0140
     * @tc.name SUB_RM_ResourceManager_getResourceName_StrArray_0140
     * @tc.desc Test getResourceName with app strarray resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_StrArray_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_StrArray_0140 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.strarray.sizeList').id);
        hilog.info(domain, tag, 'getResourceName_test_0500 value: ' + resName);
        expect(resName).assertEqual('sizeList');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_StrArray_0140 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_StrArray_0140 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Boolean_0150
     * @tc.name SUB_RM_ResourceManager_getResourceName_Boolean_0150
     * @tc.desc Test getResourceName with app boolean resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_Boolean_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Boolean_0150 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.boolean.boolean_1').id);
        hilog.info(domain, tag, 'getResourceName_test_0600 value: ' + resName);
        expect(resName).assertEqual('boolean_1');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Boolean_0150 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Boolean_0150 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Integer_0160
     * @tc.name SUB_RM_ResourceManager_getResourceName_Integer_0160
     * @tc.desc Test getResourceName with app integer resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_Integer_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Integer_0160 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.integer.integer_1').id);
        hilog.info(domain, tag, 'getResourceName_test_0700 value: ' + resName);
        expect(resName).assertEqual('integer_1');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Integer_0160 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Integer_0160 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Plural_0170
     * @tc.name SUB_RM_ResourceManager_getResourceName_Plural_0170
     * @tc.desc Test getResourceName with app plural resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_Plural_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Plural_0170 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.plural.plural_name').id);
        hilog.info(domain, tag, 'getResourceName_test_0800 value: ' + resName);
        expect(resName).assertEqual('plural_name');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Plural_0170 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Plural_0170 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Symbol_0180
     * @tc.name SUB_RM_ResourceManager_getResourceName_Symbol_0180
     * @tc.desc Test getResourceName with app symbol resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_Symbol_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Symbol_0180 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('app.symbol.symbolTest1').id);
        hilog.info(domain, tag, 'getResourceName_test_0900 value: ' + resName);
        expect(resName).assertEqual('symbolTest1');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Symbol_0180 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Symbol_0180 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_SysString_0190
     * @tc.name SUB_RM_ResourceManager_getResourceName_SysString_0190
     * @tc.desc Test getResourceName with system string resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_SysString_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysString_0190 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('sys.string.ohos_id_text_font_family_regular').id);
        hilog.info(domain, tag, 'getResourceName_test_1000 value: ' + resName);
        expect(resName).assertEqual('ohos_id_text_font_family_regular');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_SysString_0190 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysString_0190 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_SysMedia_0200
     * @tc.name SUB_RM_ResourceManager_getResourceName_SysMedia_0200
     * @tc.desc Test getResourceName with system media resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_SysMedia_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysMedia_0200 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('sys.media.ohos_app_icon').id);
        hilog.info(domain, tag, 'getResourceName_test_1100 value: ' + resName);
        expect(resName).assertEqual('ohos_app_icon');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_SysMedia_0200 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysMedia_0200 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_SysColor_0210
     * @tc.name SUB_RM_ResourceManager_getResourceName_SysColor_0210
     * @tc.desc Test getResourceName with system color resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_SysColor_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysColor_0210 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('sys.color.ohos_id_color_foreground').id);
        hilog.info(domain, tag, 'getResourceName_test_1200 value: ' + resName);
        expect(resName).assertEqual('ohos_id_color_foreground');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_SysColor_0210 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysColor_0210 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_SysFloat_0220
     * @tc.name SUB_RM_ResourceManager_getResourceName_SysFloat_0220
     * @tc.desc Test getResourceName with system float resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_SysFloat_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysFloat_0220 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('sys.float.ohos_id_alpha_content_primary').id);
        hilog.info(domain, tag, 'getResourceName_test_1300 value: ' + resName);
        expect(resName).assertEqual('ohos_id_alpha_content_primary');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_SysFloat_0220 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysFloat_0220 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Null_0200
     * @tc.name SUB_RM_ResourceManager_getResourceName_Null_0200
     * @tc.desc Test getResourceName with null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_RM_ResourceManager_getResourceName_Null_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Null_0200 begin-----------------");
      try {
        let resName: string = res.getResourceName(null);
        hilog.info(domain, tag, 'getResourceName_test_1800 value: ' + resName);
        expect(false).assertFail();
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Null_0200 failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Null_0200 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_Undefined_0201
     * @tc.name SUB_RM_ResourceManager_getResourceName_Undefined_0201
     * @tc.desc Test getResourceName with undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_RM_ResourceManager_getResourceName_Undefined_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Undefined_0201 begin-----------------");
      try {
        let resName: string = res.getResourceName(undefined);
        hilog.info(domain, tag, 'getResourceName_test_1900 value: ' + resName);
        expect(false).assertFail();
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_Undefined_0201 failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_Undefined_0201 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_InvalidId_0300
     * @tc.name SUB_RM_ResourceManager_getResourceName_InvalidId_0300
     * @tc.desc Test getResourceName with invalid resource id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_RM_ResourceManager_getResourceName_InvalidId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_InvalidId_0300 begin-----------------");
      try {
        let resName: string = res.getResourceName(0x01234567);
        hilog.info(domain, tag, 'getResourceName_test_2000 value: ' + resName);
        expect(false).assertFail();
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_InvalidId_0300 failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code == 9001001).assertTrue();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_InvalidId_0300 end-----------------");
    })

    /**
     * @tc.number SUB_RM_ResourceManager_getResourceName_SysOverlayColor_0230
     * @tc.name SUB_RM_ResourceManager_getResourceName_SysOverlayColor_0230
     * @tc.desc Test getResourceName with system overlay color resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_RM_ResourceManager_getResourceName_SysOverlayColor_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysOverlayColor_0230 begin-----------------");
      try {
        let resName: string = res.getResourceName($r('sys.color.multi_color_01').id);
        hilog.info(domain, tag, 'getResourceName_test_2100 value: ' + resName);
        expect(resName).assertEqual('multi_color_01');
      } catch (error) {
        console.error('SUB_RM_ResourceManager_getResourceName_SysOverlayColor_0230 failed, code is ' + error.code + ', message is ' + error.message);
        expect().assertFail();
      }
      console.info("-----------------SUB_RM_ResourceManager_getResourceName_SysOverlayColor_0230 end-----------------");
    })
  })
}