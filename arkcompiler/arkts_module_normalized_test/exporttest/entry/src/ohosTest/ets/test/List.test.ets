/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import exportBigIntTest from "./test/ExportBigIntTest.test";
import exportArrayTest from "./test/ExportArrayTest.test";
import ExportBooleanTest from "./test/ExportBooleanTest.test";
import exportClassTest from "./test/ExportClass.test";
import exportEnumerationTest from "./test/ExportEnumerationTest.test";
import ExportFunctionTest from "./test/ExportFunctionTest.test";
import ExportInterfaceTest from "./test/ExportInterfaceTest.test";
import ExportMapTest from "./test/ExportMapTest.test";
import exportNumberTest from "./test/ExportNumberTest.test";
import exportStringTest from "./test/ExportStringTest.test";
import exportTupleTest from "./test/ExportTupleTest.test";
import exportUnionTest from "./test/ExportUnionTest.test";
import exportDefaultTest from "./test/ExportDefaultsTest.test";
import ExportSetTest from "./test/ExportSetTest.test";
import exportGenericTypeTest from "./test/ExportGenericTypeTest.test.ets";
import exportAccessModifierTest from "./test/ExportAccessModifierTest.test.ets";
import exportReExportTest from "./test/ExportReExportTest.test.ets";
import exportContainerTypeTest from "./test/ExportContainerTypeTest.test.ets";
import exportLiteralTypeTest from "./test/ExportLiteralTypeTest.test.ets";
import exportDCRTest from "./test/ExportDCRTest.test.ets";
import exportAnnotationTest from "./test/ExportAnnotationTest.test.ets";

export default function testsuite() {
  exportTupleTest();
  exportEnumerationTest();
  exportArrayTest();
  exportStringTest();
  exportNumberTest();
  exportUnionTest();
  exportClassTest();
  ExportBooleanTest();
  ExportInterfaceTest();
  ExportMapTest();
  exportBigIntTest();
  ExportFunctionTest();
  exportDefaultTest();
  ExportSetTest();
  exportGenericTypeTest();
  exportAccessModifierTest();
  exportReExportTest();
  exportContainerTypeTest();
  exportLiteralTypeTest();
  exportDCRTest();
  exportAnnotationTest();
}