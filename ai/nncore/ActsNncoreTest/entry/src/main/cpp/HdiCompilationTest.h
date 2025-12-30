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

#ifndef HDI_COMPILATION_TEST_H
#define HDI_COMPILATION_TEST_H

namespace OHOS {
namespace NeuralNetworkCore {

// Compilation Test Cases
int TestCompilationConstructForCache0100();
int TestCompilationConstructForCache0200();
int TestCompilationAddExtensionConfig0100();
int TestCompilationAddExtensionConfig0200();
int TestCompilationAddExtensionConfig0300();
int TestCompilationAddExtensionConfig0400();
int TestCompilationAddExtensionConfig0500();
int TestCompilationConstructWithOfflineModelFile0100();
int TestCompilationConstructWithOfflineModelFile0200();
int TestCompilationConstructWithOfflineModelBuffer0100();
int TestCompilationConstructWithOfflineModelBuffer0200();
int TestCompilationExportCacheToBuffer0100();
int TestCompilationExportCacheToBuffer0200();
int TestCompilationImportCacheFromBuffer0100();
int TestCompilationImportCacheFromBuffer0200();
int TestCompilationImportCacheFromBuffer0300();
int TestCompilationReturnCodeCheck001();
int TestCompilationReturnCodeCheck002();
int TestCompilationReturnCodeCheck003();
int TestCompilationReturnCodeCheck004();
int TestCompilationReturnCodeCheck005();
int TestCompilationReturnCodeCheck006();
int TestCompilationReturnCodeCheck007();
int TestCompilationReturnCodeCheck008();
int TestCompilationReturnCodeCheck009();

} // namespace NeuralNetworkCore
} // namespace OHOS

#endif // HDI_COMPILATION_TEST_H

