/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libnn_core_test.so';

export default function CompilationTest() {
  describe('CompilationTests', () => {

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0100
     * @tc.desc   创建compilation，检查返回值为空，设置正确的cache路径，build成功，推理成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationConstructForCache0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0200
     * @tc.desc   创建compilation，检查返回值非空，不设置cache，build失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationConstructForCache0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0100
     * @tc.desc   创建compilation，增加config，传入compilation为空，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationAddExtensionConfig0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0200
     * @tc.desc   创建compilation，增加config，传入configNames为空指针，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationAddExtensionConfig0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0300
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0300
     * @tc.desc   创建compilation，增加config，传入configNames为空字符串，报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0300', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationAddExtensionConfig0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0400
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0400
     * @tc.desc   创建compilation，增加config，传入configValues为空，报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0400', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationAddExtensionConfig0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0500
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0500
     * @tc.desc   创建compilation，增加config，传入configValueSize为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0500', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationAddExtensionConfig0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0100
     * @tc.desc   传入filepath为空指针，返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationConstructWithOfflineModelFile0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0200
     * @tc.desc   传入合法文件，返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationConstructWithOfflineModelFile0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0100
     * @tc.desc   传入modelData为空指针，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationConstructWithOfflineModelBuffer0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0200
     * @tc.desc   传入modelData为合法离线模型buffer，返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationConstructWithOfflineModelBuffer0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0100
     * @tc.desc   传入空指针返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationExportCacheToBuffer0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0200
     * @tc.desc   参数正确，nnrt模型返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationExportCacheToBuffer0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0100
     * @tc.desc   buffer为空，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationImportCacheFromBuffer0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0200
     * @tc.desc   modelSize为0，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationImportCacheFromBuffer0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0300
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0300
     * @tc.desc   参数正确，返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0300', Level.LEVEL1, async () => {
      const result = await testNapi.TestCompilationImportCacheFromBuffer0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck001
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck001
     * @tc.desc   错误码断言测试 OH_NN_MEMORY_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck001', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck001();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck002
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck002
     * @tc.desc   错误码断言测试 OH_NN_NULL_PTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck002', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck002();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck003
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck003
     * @tc.desc   错误码断言测试 OH_NN_INVALID_FILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck003', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck003();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck004
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck004
     * @tc.desc   错误码断言测试 OH_NN_UNAVALIDABLE_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck004', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck004();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck005
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck005
     * @tc.desc   错误码断言测试 OH_NN_INVALID_PATH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck005', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck005();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck006
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck006
     * @tc.desc   错误码断言测试 OH_NN_TIMEOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck006', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck006();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck007
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck007
     * @tc.desc   错误码断言测试 OH_NN_CONNECTION_EXCEPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck007', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck007();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck008
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck008
     * @tc.desc   错误码断言测试 OH_NN_SAVE_CACHE_EXCEPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck008', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck008();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck009
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck009
     * @tc.desc   错误码断言测试 OH_NN_UNAVAILABLE_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck009', Level.LEVEL1, () => {
      const result = testNapi.TestCompilationReturnCodeCheck009();
      expect(result).assertEqual(0);
    });
  });
}

