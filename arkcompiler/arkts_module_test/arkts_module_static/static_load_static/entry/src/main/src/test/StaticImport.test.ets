'use static'
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { add as harAdd } from 'har/Index';
import { add as testAdd } from './fileTest/Test'
import hilog from '@ohos.hilog';
import { Calc, loadLibraryEntry } from '../../ets/pages/Add';

export default function staticImport() {
  describe('staticImportTest', () => {
    /**
     * @tc.number  SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0200
     * @tc.name    testStaticLibraryRes
     * @tc.desc    Import Static Library
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testStaticLibraryRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let staticLibraryRes: String = '';
      let a = harAdd(2, 3);
      if (a == 5) {
        staticLibraryRes = 'success';
        hilog.info(0x0000, 'ModuleTest', ' static library test success');
      }
      expect(staticLibraryRes).assertEqual('success');
    })

    /**
     * @tc.number  SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0300
     * @tc.name    testRelativePathRes
     * @tc.desc    Import Relative Path
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRelativePathRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let relativePathRes: String = '';
      let a = testAdd(2, 3);
      if (a == 5) {
        relativePathRes = 'success';
        hilog.info(0x0000, 'ModuleTest', ' RelativePath test success');
      }
      expect(relativePathRes).assertEqual('success');
    })

    /**
     * @tc.number  SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0400
     * @tc.name    testOhosRes
     * @tc.desc    Import System Native Module
     * @tc.size    MediumTest
     * @tc.type    Function`
     * @tc.level   Level 0
     */
    it('testOhosRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let ohosRes: String = '';
      if (typeof hilog.info != undefined) {
        ohosRes = 'success';
        hilog.info(0x0000, 'ModuleTest', 'dexter log: call')
      }
      expect(ohosRes).assertEqual('success');
    })
    /**
     * @tc.number  SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0500
     * @tc.name    testAniFunction001
     * @tc.desc    Import System Native Module
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testAniFunction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag: String = '';
      expect(loadLibraryEntry()).assertTrue();
      let cls = new Calc();
      if (cls.add(1, 2) == 3) {
        flag = 'success';
        hilog.info(0x0000, 'ModuleTest', 'static library cls.add(1, 2) test success');
      }
      expect(flag).assertEqual('success');
    })

    /**
     * @tc.number  SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0600
     * @tc.name    testAniFunction002
     * @tc.desc    Import System Native Module
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testAniFunction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag: String = '';
      expect(loadLibraryEntry()).assertTrue();
      let cls = new Calc();

      if (Math.abs(cls.addDouble(1.1, 2.2) - 3.3) < 1e-9) {
        flag = 'success';
        hilog.info(0x0000, 'ModuleTest', 'static library cls.addDouble(1, 2) test success');
      }
      expect(flag).assertEqual('success');
    })
    /**
     * @tc.number  SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0700
     * @tc.name    testAniFunction003
     * @tc.desc    Import System Native Module
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testAniFunction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag: String = '';
      expect(loadLibraryEntry()).assertTrue();
      let cls = new Calc();
      if (cls.addNumber(1, 2) == 3) {
        flag = 'success';
        hilog.info(0x0000, 'ModuleTest', 'static library cls.addNumber(1, 2) test success');
      }
      expect(flag).assertEqual('success');
    })
    /**
     * @tc.number  SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0800
     * @tc.name    testAniFunction004
     * @tc.desc    Import System Native Module
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testAniFunction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag: String = '';
      expect(loadLibraryEntry()).assertTrue();
      let cls = new Calc();
      if (cls.addString('addString') == 'addString') {
        flag = 'success';
        hilog.info(0x0000, 'ModuleTest', 'static library cls.addString(\'addString\') test success');
      }
      expect(flag).assertEqual('success');
    })
  })
}