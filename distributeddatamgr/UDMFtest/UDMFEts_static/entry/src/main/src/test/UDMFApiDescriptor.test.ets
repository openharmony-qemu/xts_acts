/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import UTD from '@ohos.data.uniformTypeDescriptor'
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function UDMFApiDescriptorTest() {
  describe("UDMFApiDescriptorTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'UDMFApiDescriptorTest start');
    let TAG = '';
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777
     * @tc.desc   parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".xls"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        hilog.info(domain, tag, TAG + ' start ');
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(UTD.UniformDataType.EXCEL);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776
     * @tc.desc   predicates orderByAsc normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls", "general.composite-object");
        hilog.info(domain, tag, '%{public}s', "result=====>" + result);
        expect(result == "com.microsoft.excel.xls").assertEqual(true);
        done()
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645
     * @tc.desc   Invalid parameter to belongsTo() -- The relationship between the object of the parameter and "".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100';
      const REFERENCE_URL =
        "https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis/js-apis-data-uniformTypeDescriptor.md#uniformdatatype";
      hilog.info(domain, tag, TAG + ' start ');
      expect(UTD.UniformDataType.TEXT).assertEqual("general.text");
      try {
        let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TEXT);
        if (!typeObj) {
          hilog.info(domain, tag, TAG + 'typeObj assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + " typeId:" + typeObj.typeId);
        hilog.info(domain, tag, TAG + " belongingToTypes:" + typeObj.belongingToTypes);
        hilog.info(domain, tag, TAG + " description:" + typeObj.description);
        hilog.info(domain, tag, TAG + " referenceURL:" + typeObj.referenceURL);
        hilog.info(domain, tag, TAG + " iconFile:" + typeObj.iconFile);
        hilog.info(domain, tag, TAG + " filenameExtensions:" + typeObj.filenameExtensions.toString());
        hilog.info(domain, tag, TAG + " mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.text");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
        expect(typeObj.description).assertEqual("Base type for all text.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/*");
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611
     * @tc.desc   parameters to belongsTo -- The relationship between the object of the parameter and the parent of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615
     * @tc.desc   parameters to belongsTo -- The relationship between the object of the parameter and the next level of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.NAVIGATION);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665
     * @tc.desc   parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the previous level of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671
     * @tc.desc   parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the next level of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.NAVIGATION);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720
     * @tc.desc   parameter to isHigherLevelType()--The high-level relationship between the object of a parameter and the level above the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.NAVIGATION);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725
     * @tc.desc   parameter to isHigherLevelType() --The high-level relationship between the object of a parameter and the level below the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300
     * @tc.desc   Equals the same parameter types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        if (!typeObj1) {
          hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
          expect(false).assertTrue();
          return;
        }
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        if (!typeObj2) {
          hilog.info(domain, tag, TAG + 'typeObj2 assertFail');
          expect(false).assertTrue();
          return;
        }
        let result = typeObj1.equals(typeObj2);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401
     * @tc.desc   Equals the different parameter types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        if (!typeObj1) {
          hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
          expect(false).assertTrue();
          return;
        }
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
        if (!typeObj2) {
          hilog.info(domain, tag, TAG + 'typeObj2 assertFail');
          expect(false).assertTrue();
          return;
        }
        let result = typeObj1.equals(typeObj2);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835
     * @tc.desc   parameter to getUniformDataTypeByMIMEType() --"image/tiff"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == "general.tiff").assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140
     * @tc.desc   parameter to getUniformDataTypesByFilenameExtension()  --parameter is ".xls"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypesByFilenameExtension(".xls");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result[0]).assertEqual(UTD.UniformDataType.EXCEL);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190
     * @tc.desc   parameter to getUniformDataTypesByMIMEType() --"image/tiff"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("image/tiff");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result[0] == "general.tiff").assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710
     * @tc.desc   Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isLowerLevelType start ');
        let result = typeObj1.isLowerLevelType("null");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715
     * @tc.desc   Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isLowerLevelType start ');
        let result = typeObj1.isLowerLevelType("undefined");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765
     * @tc.desc   Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isHigherLevelType start ');
        let result = typeObj1.isHigherLevelType("null");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770
     * @tc.desc   Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isHigherLevelType start ');
        let result = typeObj1.isHigherLevelType("undefined");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900
     * @tc.desc   Illegal parameters null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let typeObj = UTD.getTypeDescriptor("null");
        if (!typeObj) {
          hilog.info(domain, tag, TAG + 'typeObj assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' typeObj: ' + typeObj);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780
     * @tc.desc   Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("null");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846
     * @tc.desc   Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180
     * @tc.desc   Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("undefined");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220
     * @tc.desc   Invalid  parameter to getUniformDataTypesByMIMEType() --parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("");
        hilog.info(domain, tag, TAG + "result=====>" + result);
        expect().assertFail();
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + " end");
    });

    hilog.info(domain, tag, '%{public}s', 'UDMFApiDescriptorTest end');
  });
}
