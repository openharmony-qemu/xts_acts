'use static';
import SparseArrayAccessorTest from "./sparsearray/SparseArrayAccessorTest.test";
import SparseArrayCreationTest from "./sparsearray/SparseArrayCreationTest.test";
import SparseArrayIterationTest from "./sparsearray/SparseArrayIterationTest.test";
import SparseArraySearchTest from "./sparsearray/SparseArraySearchTest.test";
import SparseArrayTransformTest from "./sparsearray/SparseArrayTransformTest.test";
import SparseArrayStackTest from "./sparsearray/SparseArrayStackTest.test";
import SparseArrayMutationTest from "./sparsearray/SparseArrayMutationTest.test";
import SparseArrayDeriveTest from "./sparsearray/SparseArrayDeriveTest.test";
import SparseArrayOverviewTest from "./sparsearray/SparseArrayOverviewTest.test";

export default function testsuite(): void {
  SparseArrayAccessorTest();
  SparseArrayCreationTest();
  SparseArrayIterationTest();
  SparseArraySearchTest();
  SparseArrayTransformTest();
  SparseArrayStackTest();
  SparseArrayMutationTest();
  SparseArrayDeriveTest();
  SparseArrayOverviewTest();
}
