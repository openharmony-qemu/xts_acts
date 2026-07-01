'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import dataShare from '@ohos.data.dataShare';
import { BusinessError } from '@ohos.base';

let g_handle: dataShare.DataProxyHandle | undefined = undefined;

let g_config: dataShare.DataProxyConfig = {
  type: dataShare.DataProxyType.SHARED_CONFIG
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

export default function dataShareConfigGetValuesTest() {
  describe("dataShareConfigGetValuesTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll---------------------------------");
      await dataShare.createDataProxyHandle().then((handle: dataShare.DataProxyHandle) => {
        if (handle == null || handle == undefined) {
          console.log(TAG + "[DataShareProvider] createDataProxyHandle failed,handle is null");
          return;
        }
        g_handle = handle;
        console.log(TAG + "[DataShareProvider] createDataProxyHandle success");
      }).catch((err: Error) => {
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
     * @tc.name   dataShareConfigGetValuesTest003
     * @tc.number SUB_DistributedData_DataShare_SDK_GetValues_0030
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetValuesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.test.dataproxyhandle/test";
        await g_handle!.getValues(testUri, g_config);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetValuesTest003 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700011);
      }
    });

    /**
     * @tc.name   dataShareConfigGetValuesTest004
     * @tc.number SUB_DistributedData_DataShare_SDK_GetValues_0040
     * @tc.desc   call removeValue when publish a non-multi-value ProxyData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetValuesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config.static/valuesTest"
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri,
          value: "test",
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config);
        await g_handle!.getValues(testUri, g_config_4K);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetValuesTest004 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700014);
      }
    });

    /**
     * @tc.name   dataShareConfigGetValuesTest005
     * @tc.number SUB_DistributedData_DataShare_SDK_GetValues_0050
     * @tc.desc   call removeValue when uri length exceeds 256 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetValuesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let overLengthUri = "datashareproxy://com.example.myapplication/" + 'X'.repeat(214);
        await g_handle!.getValues(overLengthUri, g_config_100K);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetValuesTest005 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700014);
      }
    });
    
    /**
     * @tc.name   dataShareConfigGetValuesTest006
     * @tc.number SUB_DistributedData_DataShare_SDK_GetValues_0060
     * @tc.desc   call removeValue, then returns all values under multi-value config uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetValuesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config.static/valuesTest"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 1: "test1", 2: "test2"},
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_100K);
        values.forEach((value) => {
          console.log('[ttt] [DataProxyServiceTest] GetValuesTest006 value : ' + JSON.stringify(value));
        })
        expect(values.length).assertEqual(2);
        expect(values[0]).assertEqual("test1");
        expect(values[1]).assertEqual("test2");
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetValuesTest006 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   dataShareConfigGetValuesTest008
     * @tc.number SUB_DistributedData_DataShare_SDK_GetValues_0080
     * @tc.desc   call removeValue after all keys are removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetValuesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "datashareproxy://com.acts.dataShare.config.static/valuesTest"
        let proxyData: dataShare.ProxyData[] = [{
          uri: testUri,
          values: { 1: "test1"},
          isMultiValues: true,
          allowList: [],
          trustProviders: []
        }];
        await g_handle!.publish(proxyData, g_config_4K);
        await g_handle!.removeValue(testUri, 1, g_config_4K);
        let values = await g_handle!.getValues(testUri, g_config_4K);
        values.forEach((value) => {
          console.log('[ttt] [DataProxyServiceTest] GetValuesTest008 value : ' + JSON.stringify(value));
        })
        expect(values.length).assertEqual(0);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetValuesTest008 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /** 
     * @tc.name   dataShareConfigGetValuesTest009
     * @tc.number SUB_DistributedData_DataShare_SDK_GetValues_0090
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetValuesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let testUri = "";
        await g_handle!.getValues(testUri, g_config_4K);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetValuesTest009 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual(15700011);
      }
    });
  })
}