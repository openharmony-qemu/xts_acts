/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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


import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from '@ohos/hypium';
import testndk from 'libquery.so';

let TAG = '[testLog-ets]'
export default function RdbQueryWithoutRowCountTest() {
  describe('RdbQueryWithoutRowCountTest', () => {

    beforeAll(() => {

    })
    beforeEach(() => {
      try {
        console.info( TAG + "testTag SetUpTestCase begin");
        let res:number = testndk.SetUpTestCase();
        console.info( TAG + "testTag SetUpTestCase success");
        expect(res == 0).assertTrue();
      }catch (err){
        console.info( TAG + "testTag SetUpTestCase fail. erro:" + err.code + err.message);
      }

    })
    afterEach(() => {
      try{
        console.info( TAG + "testTag TearDownTestCase begin");
        let res:number = testndk.TearDownTestCase();
        console.info( TAG + "TearDownTestCase success");
        expect(res == 0).assertTrue()
      }catch (err){
        console.info( TAG + "testTag TearDownTestCase fail. erro:" + err.code + err.message);
      }
    })
    afterAll(() => {

    })

    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Normal_Get_0100
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0100
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Normal_Get_0100
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('OH_Rdb_QueryWithoutRowCount_Normal_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Normal_Get_0100();
      console.info( TAG + "OH_Rdb_QueryWithoutRowCount_Normal_Get_0100 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Normal_Get_0200
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0200
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Normal_Get_0200
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('OH_Rdb_QueryWithoutRowCount_Normal_Get_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Normal_Get_0200();
      console.info( TAG + "OH_Rdb_QueryWithoutRowCount_Normal_Get_0200 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0300
     * @tc.desc   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200();
      console.info( TAG + "Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0400
     * @tc.desc   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300();
      console.info( TAG + "Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0500
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400();
      console.info( TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0600
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500();
      console.info( TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_006
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0700
     * @tc.desc   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_006
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_006();
      console.info( TAG + "Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_006 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_007
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0800
     * @tc.desc   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_007
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_007();
      console.info( TAG + "Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_007 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   Rdb_QuerySqlWithoutRowCount_Normal_Get_001
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0900
     * @tc.desc   Rdb_QuerySqlWithoutRowCount_Normal_Get_001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('Rdb_QuerySqlWithoutRowCount_Normal_Get_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.Rdb_QuerySqlWithoutRowCount_Normal_Get_001();
      console.info( TAG + "Rdb_QuerySqlWithoutRowCount_Normal_Get_001 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   Rdb_QuerySqlWithoutRowCount_Normal_Get_002
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_1000
     * @tc.desc   Rdb_QuerySqlWithoutRowCount_Normal_Get_002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('Rdb_QuerySqlWithoutRowCount_Normal_Get_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.Rdb_QuerySqlWithoutRowCount_Normal_Get_002();
      console.info( TAG + "Rdb_QuerySqlWithoutRowCount_Normal_Get_002 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

     /**
     * @tc.name   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_008
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_1100
     * @tc.desc   Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_008
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_008();
      console.info( TAG + "Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_008 res=" + res);
      expect(res).assertEqual(0);
      done();
    });
  })
}