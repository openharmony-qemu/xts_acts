/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#ifndef DETAIL_ENHANCER_IMAGE_NDK_UNIT_TEST_H
#define DETAIL_ENHANCER_IMAGE_NDK_UNIT_TEST_H

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

// initialize environment
int vpeImageNdk_01();

// initialize and de-initialize
int vpeImageNdk_02();

// de-initialize without initialize
int vpeImageNdk_03();

// create instance
int vpeImageNdk_04();

// create instance with wrong type
int vpeImageNdk_05();

// destroy instance
int vpeImageNdk_06();

// destroy null instance
int vpeImageNdk_07();

// set parameter normally
int vpeImageNdk_08();

// set parameter with null
int vpeImageNdk_09();

// set parameter but instance is null
int vpeImageNdk_10();

// get parameter after set parameter
int vpeImageNdk_11();

// get parameter after set parameter: level none
int vpeImageNdk_11_2();

// get parameter after set parameter: level low
int vpeImageNdk_11_3();

// get parameter after set parameter: level medium
int vpeImageNdk_11_4();

// get parameter after set parameter: invalid param
int vpeImageNdk_11_5();

// get parameter but parameter is null
int vpeImageNdk_12();

// get parameter but instance is null set
int vpeImageNdk_13();

// get parameter but parameter is not null
int vpeImageNdk_14();

// colorspaceconversion support check 1
int vpeImageNdk_15();

// colorspaceconversion support check 2
int vpeImageNdk_16();

// colorspaceconversion support check 3
int vpeImageNdk_17();

// colorspaceconversion support check 4
int vpeImageNdk_18();

// conposition support check 1
int vpeImageNdk_19();

// conposition support check 2
int vpeImageNdk_20();

// conposition support check 3
int vpeImageNdk_21();

// deconposition support check 1
int vpeImageNdk_22();

// deconposition support check 2
int vpeImageNdk_23();

// deconposition support check 3
int vpeImageNdk_24();

// metadata generation support check 1
int vpeImageNdk_25();

// metadata generation support check 2
int vpeImageNdk_26();

// metadata generation support check 3
int vpeImageNdk_27();

// metadata generation support check 4
int vpeImageNdk_28();

// convert color space RGBA to BGRA impl
int vpeImageNdk_29();

// convert color space BGRA to RGBA impl
int vpeImageNdk_30();

// convert color space nullptr
int vpeImageNdk_31();

// compose RGBA impl
int vpeImageNdk_32();

// compose BGRA impl
int vpeImageNdk_33();

// compose nullptr
int vpeImageNdk_34();

// decompose RGBA impl
int vpeImageNdk_35();

// decompose BGRA impl
int vpeImageNdk_36();

// decompose nullptr
int vpeImageNdk_37();

// generate metadata RGBA impl
int vpeImageNdk_38();

// generate metadata BGRA impl
int vpeImageNdk_39();

// generate metadata nullptr
int vpeImageNdk_40();

// detail enhance RGBA
int vpeImageNdk_41();

// detail enhance BGRA
int vpeImageNdk_42();

// detail enhance nullptr
int vpeImageNdk_43();

// DeinitializeEnvironment without initialization
int vpeImageNdk_44();

// invalid parameter to create
int vpeImageNdk_45();

// invalid instance to create
int vpeImageNdk_46();

// invalid instance to destroy
int vpeImageNdk_47();

} // namespace VideoProcessingEngine
} // namespace Media
} // namespace OHOS

#endif // DETAIL_ENHANCER_IMAGE_NDK_UNIT_TEST_H

