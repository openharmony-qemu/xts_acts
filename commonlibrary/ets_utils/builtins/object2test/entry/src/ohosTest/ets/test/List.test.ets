/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import ObjectDefinePropertyTest from './objectAdd/ObjectDefineProperty.test';
import ObjectFromEntriesTest from './objectAdd/ObjectFromEntries.test';
import ObjectEntriesTest from './objectAdd/ObjectEntries.test';
import ObjectGetOwnPropertyDescriptorTest from './objectAdd/ObjectGetOwnPropertyDescriptor.test';
import ObjectGetOwnPropertyDescriptorsTest from './objectAdd/ObjectGetOwnPropertyDescriptors.test';
import ObjectGetOwnPropertyNamesTest from './objectAdd/ObjectGetOwnPropertyNames.test';
import ObjectGetOwnPropertySymbolsTest from './objectAdd/ObjectGetOwnPropertySymbols.test';
import ObjectGetPrototypeOfTests from './objectAdd/ObjectGetPrototypeOf.test';
import ObjectGroupByTest from './objectAdd/ObjectGroupBy.test';
import ObjectHasOwnTest from './objectAdd/ObjectHasOwn.test';
import ObjectAssignTest from './object3/ObjectAssign.test';
import ObjectAssign2Test from './object3/ObjectAssign2.test';
import ObjectAssign3Test from './object3/ObjectAssign3.test';
import ObjectConstructorTest from './object3/ObjectConstructor.test';
import ObjectConstructor2Test from './object3/ObjectConstructor2.test';
import ObjectCreateTest from './object3/ObjectCreate.test';
import ObjectCreate2Test from './object3/ObjectCreate2.test';
import ObjectDefinePropertiesTest from './object3/ObjectDefineProperties.test';
import ObjectDefineProperties2Test from './object3/ObjectDefineProperties2.test';
import ObjectDefineProperties3Test from './object3/ObjectDefineProperties3.test';
import ObjectFreezeTest from './object3/ObjectFreeze.test';
import ObjectFreeze2Test from './object3/ObjectFreeze2.test';
import ObjectIsFrozenTest from './object3/ObjectIsFrozen.test';
import ObjectIsFrozen2Test from './object3/ObjectIsFrozen2.test';
import ObjectIsSealedTest from './object3/ObjectIsSealed.test';
import ObjectIsSealed2Test from './object3/ObjectIsSealed2.test';
import ObjectIsTest from './object4/ObjectIs.test';
import ObjectIsExtensibleTest from './object4/ObjectIsExtensible.test';
import ObjectKeysTest from './object4/ObjectKeys.test';
import ObjectKeys2Test from './object4/ObjectKeys2.test';
import ObjectPreventExtensionsTest from './object4/ObjectPreventExtensions.test';
import ObjectPreventExtensions2Test from './object4/ObjectPreventExtensions2.test';
import ObjectPrototypeConstructorTest from './object4/ObjectPrototypeConstructor.test';
import ObjectPrototypeHOPTest from './object4/ObjectPrototypeHOP.test';
import ObjectPrototypeHOP2Test from './object4/ObjectPrototypeHOP2.test';

export default function testsuite() {

  ObjectDefinePropertyTest();
  ObjectFromEntriesTest();
  ObjectEntriesTest();
  ObjectGetOwnPropertyDescriptorTest();
  ObjectGetOwnPropertyDescriptorsTest();
  ObjectGetOwnPropertyNamesTest();
  ObjectGetOwnPropertySymbolsTest();
  ObjectGetPrototypeOfTests();
  ObjectGroupByTest();
  ObjectHasOwnTest();
  ObjectAssignTest();
  ObjectAssign2Test();
  ObjectAssign3Test();
  ObjectConstructorTest();
  ObjectConstructor2Test();
  ObjectCreateTest();
  ObjectCreate2Test();
  ObjectDefinePropertiesTest();
  ObjectDefineProperties2Test();
  ObjectDefineProperties3Test();
  ObjectFreezeTest();
  ObjectFreeze2Test();
  ObjectIsFrozenTest();
  ObjectIsFrozen2Test();
  ObjectIsSealedTest();
  ObjectIsSealed2Test();
  ObjectIsTest();
  ObjectIsExtensibleTest();
  ObjectKeysTest();
  ObjectKeys2Test();
  ObjectPreventExtensionsTest();
  ObjectPreventExtensions2Test();
  ObjectPrototypeConstructorTest();
  ObjectPrototypeHOPTest();
  ObjectPrototypeHOP2Test();
};

