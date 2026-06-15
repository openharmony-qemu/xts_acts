/*
* Copyright (c) 2024-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import xmlTest1 from './xml/Xml1.test';
import xmlTest2 from './xml/Xml2.test';
import dynamicXmlTest1 from './dynamicXml/DynamicXml1.test';
import dynamicXmlTest2 from './dynamicXml/DynamicXml2.test';
import actsXml3Test from './xml/Xml3.test';
import actsXml4Test from './xml/Xml4.test';
import XmlSAXParserTest from './xml/XmlSAXParser.test';

import XmlTest_01 from './xml/XmlTest01.test';
import XmlTest_02 from './xml/XmlTest02.test';
import XmlTest_03 from './xml/XmlTest03.test';
import XmlTest_04 from './xml/XmlTest04.test';
import XmlTest_05 from './xml/XmlTest05.test';
import XmlTest_07 from './xml/XmlTest07.test';
import XmlTest_08 from './xml/XmlTest08.test';

export default function testsuite(): void {
  xmlTest1();
  xmlTest2();
  dynamicXmlTest1();
  dynamicXmlTest2();
  actsXml3Test();
  actsXml4Test();

  XmlTest_01();
  XmlTest_02();
  XmlTest_03();
  XmlTest_04();
  XmlTest_05();
  XmlTest_07();
  XmlTest_08();

  XmlSAXParserTest();
}
