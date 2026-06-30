/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { dataShare } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';

let g_handle: dataShare.DataProxyHandle | undefined = undefined;

let g_config: dataShare.DataProxyConfig = {
  type: 0 as dataShare.DataProxyType.SHARED_CONFIG
}

let g_config_4K: dataShare.DataProxyConfig = {
  type: dataShare.DataProxyType.SHARED_CONFIG,
  maxValueLength: dataShare.DataProxyMaxValueLength.MAX_LENGTH_4K
}

let g_config_100K: dataShare.DataProxyConfig = {
  type: dataShare.DataProxyType.SHARED_CONFIG,
  maxValueLength: dataShare.DataProxyMaxValueLength.MAX_LENGTH_100K
}

let TAG = "ttt ";

export default function dataShareConfigPutValueTest() {
  describe("dataShareConfigPutValueTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll---------------------------------");
      await dataShare.createDataProxyHandle().then((handle: dataShare.DataProxyHandle) => {
        if (handle == null || handle == undefined) {
          console.log(TAG + "[DataShareProvider] createDataProxyHandle failed,handle is null");
          return;
        }
        g_handle = handle;
        console.log(TAG + "[DataShareProvider] createDataProxyHandle success");
      }).catch((err: BusinessError) => {
        console.error(TAG + `[DataShareProvider] createDataProxyHandle failed: code:${err.code},message:${err.message}`);
      })
    })
    beforeEach(async () => {
      console.info(TAG + "beforeEach---------------------------------");
      await g_handle!.deleteMyPublishedData(g_config);
    })
    afterEach(async () => {
      console.info(TAG + "afterEach---------------------------------");
      await g_handle!.deleteMyPublishedData(g_config);
    })
    afterAll(async () => {
      console.info(TAG + "afterAll---------------------------------");
    })

    /**
     * @tc.name   dataShareConfigPutValueTest001
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0010
     * @tc.desc   The parameters of the function "putvalue" are all undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await g_handle!.putValue(undefined, undefined, undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest001 failed,code =" + err.code + ",message=" + err.message);
        let result = err.code;
        expect(result).assertEqual(401);
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest002
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0020
     * @tc.desc   The parameters of the function "putvalue" are all null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await g_handle!.putValue(null, null, null, null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest002 failed,code =" + err.code + ",message=" + err.message);
        let result = err.code;
        expect(result).assertEqual(401);
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest003
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0030
     * @tc.desc   call putValue when uri is not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.test.dataproxyhandle/test"
        await g_handle!.putValue(testUri, 1, "PutValueTest003", g_config);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest003 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700011);
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest004
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0040
     * @tc.desc   call putValue when isMultiValues is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri,
          value: "PutValueTest004",
          isMultiValues: false,
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config).then((results: dataShare.DataProxyResult[]) => {
          let uri = results[0].uri;
          let rtnCode = results[0].result;
          expect(uri).assertEqual(testUri);
          expect(rtnCode).assertEqual(0);
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest004 publish failed.code =" + err.code + ",message=" + err.message);
          expect().assertFail();
        })
        await g_handle!.putValue(testUri, 1, "PutValueTest004", g_config);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest004 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700014);
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest005
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0050
     * @tc.desc   call putValue when isMultiValues is default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri,
          value: "test",
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config).then((results: dataShare.DataProxyResult[]) => {
          let uri = results[0].uri;
          let rtnCode = results[0].result;
          expect(uri).assertEqual(testUri);
          expect(rtnCode).assertEqual(0);
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest005 publish failed.code =" + err.code + ",message=" + err.message);
          expect().assertFail();
        })
        await g_handle!.putValue(testUri, 1, "PutValueTest005", g_config);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest005 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700014);
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest006
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0060
     * @tc.desc   call putValue when isMultiValues is true and trustProviders is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri,
          isMultiValues: true,
          values: { 1: "test1", 2: "test2"},
          trustProviders: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.putValue(testUri, 1, "PutValueTest006", g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        expect(values.length).assertEqual(2);
        expect(values[0]).assertEqual("PutValueTest006");
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest006 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest007
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0070
     * @tc.desc   call putValue when isMultiValues is true and trustProviders is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri,
          isMultiValues: true,
          values: { 1: "test1", 2: "test2"},
          trustProviders: ["123123123"]
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.putValue(testUri, 1, "PutValueTest007", g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        expect(values.length).assertEqual(2);
        expect(values[0]).assertEqual("PutValueTest007");
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest007 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest008
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0080
     * @tc.desc   call putValue to update an nonexistent key value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 1: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.putValue(testUri, 2, "PutValueTest008", g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        expect(values.length).assertEqual(2);
        expect(values[1]).assertEqual("PutValueTest008");
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest008 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest009
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0090
     * @tc.desc   call putValue with int type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 1: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.putValue(testUri, 2, 9, g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        expect(values.length).assertEqual(2);
        expect(values[1]).assertEqual(9);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest009 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest010
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0100
     * @tc.desc   call putValue with double type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 1: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.putValue(testUri, 2, 10.1, g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        expect(values.length).assertEqual(2);
        expect(values[1]).assertEqual(10.1);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest010 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest011
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0110
     * @tc.desc   call putValue with negative key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 1: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.putValue(testUri, -1, "PutValueTest011", g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        expect(values.length).assertEqual(2);
        expect(values[0]).assertEqual("PutValueTest011");
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest011 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest012
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0120
     * @tc.desc   call putValue when key count is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 0: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config_100K);
        await g_handle!.putValue(testUri, 1, "PutValueTest012", g_config_100K);
        for (let i = 1; i <= 9; i++) {
          await g_handle!.putValue(testUri, i, `val_${i}`, g_config_100K);
        }
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest012 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest013
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0130
     * @tc.desc   call putValue when key count exceeds 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 0: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config_100K);
        await g_handle!.putValue(testUri, 1, "PutValueTest013", g_config_100K);
        for (let i = 1; i <= 10; i++) {
          await g_handle!.putValue(testUri, i, `val_${i}`, g_config_100K);
        }
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest013 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700014);
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest014
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0140
     * @tc.desc   call putValue when single value is 4k bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 0: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config_100K);
        let overSizeStr = 'A'.repeat(4096);
        await g_handle!.putValue(testUri, 1, overSizeStr, g_config_100K);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest014 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest015
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0150
     * @tc.desc   call putValue when single value exceeds 4096 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 0: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config_100K);
        let overSizeStr = 'A'.repeat(4097);
        await g_handle!.putValue(testUri, 1, overSizeStr, g_config_100K);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest015 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700014);
      }
    });
    
    /**
     * @tc.name   dataShareConfigPutValueTest016
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0160
     * @tc.desc   call putValue when total size exceeds 4K and maxValueLength = MAX_LENGTH_4K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 0: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config_4K);
        let SizeStr1 = 'A'.repeat(2049);
        await g_handle!.putValue(testUri, 1, SizeStr1, g_config_4K);
        await g_handle!.putValue(testUri, 2, SizeStr1, g_config_4K);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest016 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700014);
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest017
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0170
     * @tc.desc   call putValue when uri length exceeds 256 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let overLengthUri = "datashareproxy://com.example.myapplication/" + 'X'.repeat(214);
        await g_handle!.putValue(overLengthUri, 1, "test", g_config_4K);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest017 failed,code =" + err.code + ",message=" + err.message);
        let result = err.code;
        expect(result).assertEqual(15700014);
      }
    });

    /**
     * @tc.name   dataShareConfigPutValueTest018
     * @tc.number SUB_DistributedData_DataShare_SDK_PutValue_0180
     * @tc.desc   call putValue with bool type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigPutValueTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config/test"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 1: "test1" },
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.putValue(testUri, 2, true, g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        expect(values.length).assertEqual(2);
        expect(values[1]).assertEqual(true);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigPutValueTest018 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
  })
}