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
import testndk from 'libtran.so';

let TAG = '[testLog-ets]'


export default function TranQueryWithoutRowCountTest() {
  describe('TranQueryWithoutRowCountTest', () => {

    beforeAll(() => {

    })
    beforeEach(() => {
      try {
        console.info( TAG + "testTag TranSetUpTestCase begin");
        let res:number = testndk.TranSetUpTestCase()
        console.info( TAG + "testTag TranSetUpTestCase success");
        expect(res == 0).assertTrue();
      }catch (err){
        console.info( TAG + "testTag TranSetUpTestCase fail. erro:" + err.code + err.message);
      }

    })
    afterEach(() => {
      try{
        console.info( TAG + "testTag TranearDownTestCase begin");
        let res:number = testndk.TranearDownTestCase();
        console.info( TAG + "TranearDownTestCase success");
        expect(res == 0).assertTrue()
      }catch (err){
        console.info( TAG + "testTag TranearDownTestCase fail. erro:" + err.code + err.message);
      }
    })
    afterAll(() => {

    })

    /**
     * @tc.name   RdbTrans_QueryWithoutRowCount_Normal_Get_001
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0100
     * @tc.desc   RdbTrans_QueryWithoutRowCount_Normal_Get_001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QueryWithoutRowCount_Normal_Get_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QueryWithoutRowCount_Normal_Get_001();
      console.info( TAG + "RdbTrans_QueryWithoutRowCount_Normal_Get_001 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QueryWithoutRowCount_Normal_Get_002
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0200
     * @tc.desc   RdbTrans_QueryWithoutRowCount_Normal_Get_002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QueryWithoutRowCount_Normal_Get_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QueryWithoutRowCount_Normal_Get_002();
      console.info( TAG + "RdbTrans_QueryWithoutRowCount_Normal_Get_002 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0300
     * @tc.desc   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003();
      console.info( TAG + "RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0400
     * @tc.desc   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004();
      console.info( TAG + "RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

     /**
     * @tc.name   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0500
     * @tc.desc   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005();
      console.info( TAG + "RdbTrans_QueryWithoutRoRdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005wCount_Abnormal_InvalidArgs_004 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0600
     * @tc.desc   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006();
      console.info( TAG + "RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0700
     * @tc.desc   RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007();
      console.info( TAG + "RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0800
     * @tc.desc   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001();
      console.info( TAG + "RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_0900
     * @tc.desc   RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003();
      console.info( TAG + "RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003 res=" + res);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002
     * @tc.number SUB_DistributeData_Rdb_SDK_NdkAPITest_TranQueryWithoutRowCount_1000
     * @tc.desc   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  (done:Function)  => {
      let res = testndk.RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002();
      console.info( TAG + "RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002 res=" + res);
      expect(res).assertEqual(0);
      done();
    });
  })
}