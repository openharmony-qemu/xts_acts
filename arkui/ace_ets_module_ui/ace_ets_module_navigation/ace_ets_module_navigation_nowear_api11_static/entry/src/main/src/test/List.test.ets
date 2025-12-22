'use static';
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


import StepperJsunit11 from './stepperTest/StepperJsunit11.test'
import stepperInterface006 from './stepperTest/stepperInterface/stepperInterface006.test'
import SideBarContainer_AttributeTest from './SideBarContainerTest/SideBarContainer_attribute/SideBarContainer_Attribute.test'
import SideBarContainerDivider from './SideBarContainerTest/SideBarContainerDivider/SideBarContainerDivider.test'
import SideBarContainerTypeTest from './SideBarContainerTest/SideBarContainerType/SideBarContainerType.test'
import SideBarContainerType_DefaultValue1 from './SideBarContainerTest/SideBarContainerType/SideBarContainerType_DefaultValue1.test'
import SideBarContainerType_DefaultValue2 from './SideBarContainerTest/SideBarContainerType/SideBarContainerType_DefaultValue2.test'
import SideBarContainerType_DefaultValue3 from './SideBarContainerTest/SideBarContainerType/SideBarContainerType_DefaultValue3.test'
import sidebar from './SideBarContainerTest/SideBar.test'
import sidebarIconsJsunit from './SideBarContainerTest/sidebarfirst.test'
import stepperAction001 from './stepperTest/stepperAction/stepperAction001.test'
import stepperAction027 from './stepperTest/stepperAction/stepperAction027.test'
import stepperInterface001 from './stepperTest/stepperInterface/stepperInterface001.test'
import stepperInterface002 from './stepperTest/stepperInterface/stepperInterface002.test'
import stepperInterface003 from './stepperTest/stepperInterface/stepperInterface003.test'
import stepperInterface004 from './stepperTest/stepperInterface/stepperInterface004.test'
import stepperInterface005 from './stepperTest/stepperInterface/stepperInterface005.test'
import stepperInterface009 from './stepperTest/stepperInterface/stepperInterface009.test'
import stepperLayout001 from './stepperTest/stepperLayout/stepperLayout001.test'
import stepperLayout002 from './stepperTest/stepperLayout/stepperLayout002.test'
import stepperLayout003 from './stepperTest/stepperLayout/stepperLayout003.test'
import stepperLayout004 from './stepperTest/stepperLayout/stepperLayout004.test'
import stepperItemDisabledJsunit from './stepperTest/stepperItem.test'
import stepperJsunit1 from './stepperTest/StepperJsunit1.test'
import stepperUIJsunit from './stepperTest/stepperUIJsunit.test'

export default function testsuite() {

  StepperJsunit11() 
  stepperInterface006() 
  SideBarContainer_AttributeTest()
  SideBarContainerDivider() 
  SideBarContainerTypeTest()
  SideBarContainerType_DefaultValue1()
  SideBarContainerType_DefaultValue2()
  SideBarContainerType_DefaultValue3()
  sidebar()
  sidebarIconsJsunit()
  stepperAction001()
  stepperAction027() 
  stepperInterface001() 
  stepperInterface002() 
  stepperInterface003() 
  stepperInterface004() 
  stepperInterface005() 
  stepperInterface009() 
  stepperLayout001() 
  stepperLayout002() 
  stepperLayout003() 
  stepperLayout004() 
  stepperItemDisabledJsunit() 
  stepperJsunit1() 
  stepperUIJsunit() 
}