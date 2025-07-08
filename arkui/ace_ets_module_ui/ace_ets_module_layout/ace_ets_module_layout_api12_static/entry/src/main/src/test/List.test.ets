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
import SpaceMainNumberJsunit from './Flex/SpaceMainNumber.test';
import SpaceMain5JustifyContentJsunit from './Flex/SpaceMain5JustifyContent.test';
import SpaceCross5AlignItemsJsunit from './Flex/SpaceCross5AlignItems.test';
import RelativeContainerApi from './RelativeContainer/RelativeContainerApi.test'
// import RelativeContainerLocalizedDirectionStartTest from './RelativeContainer/RelativeContainerLocalizedDirectionStartTest.test'  // app die
import FlexSpaceTest from './Flex/FlexSpaceTest.test';
import ColumnReverseTest from './Column/ColumnReverseTest.test'
import RowReverseTest from './Row/RowReverseTest.test'
import APIremoveGestureByTag from './Column/APIremoveGestureByTag.test'
import APIaccessibilityTextHint from './Column/APIaccessibilityTextHint.test'

export default function testsuite() {
    SpaceMainNumberJsunit();
    SpaceMain5JustifyContentJsunit();
    SpaceCross5AlignItemsJsunit();
    RelativeContainerApi();
    // RelativeContainerLocalizedDirectionStartTest();
    FlexSpaceTest();
    APIremoveGestureByTag();
    APIaccessibilityTextHint();
    ColumnReverseTest();
    RowReverseTest();
}