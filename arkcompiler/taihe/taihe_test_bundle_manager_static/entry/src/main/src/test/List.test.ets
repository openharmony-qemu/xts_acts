'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import abilityInfoTest from "./ActsAbilityInfo.test"
import applicationInfoTest from "./ActsApplicationInfo.test"
import bundleInfoTest from "./ActsBundleInfo.test"
import elementNameTest from "./ActsElementName.test"
import extensionAbilityInfoTest from "./ActsExtensionAbilityInfo.test"
import hapModuleInfoTest from "./ActsHapModuleInfo.test"
import metadataTest from "./ActsMetadata.test"
import overlayModuleInfoTest from "./ActsOverlayModuleInfo.test"
import skillTest from "./ActsSkill.test"
export default function testsuite(): void {
    abilityInfoTest();
    applicationInfoTest();
    bundleInfoTest();
    elementNameTest();
    extensionAbilityInfoTest();
    hapModuleInfoTest();
    metadataTest();
    overlayModuleInfoTest();
    skillTest();
}