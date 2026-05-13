import arrayBufferAtTest from "./arrayBuffer/ArrayBufferAtTest.test";
import arrayBufferBytesLengthTest from "./arrayBuffer/ArrayBufferBytesLengthTest.test";
import arrayBufferFromFiveTest from "./arrayBuffer/ArrayBufferFromFiveTest.test";
import arrayBufferFromFourTest from "./arrayBuffer/ArrayBufferFromFourTest.test";
import arrayBufferFromOneTest from "./arrayBuffer/ArrayBufferFromOneTest.test";
import arrayBufferFromSevenTest from "./arrayBuffer/ArrayBufferFromSevenTest.test";
import arrayBufferFromSixTest from "./arrayBuffer/ArrayBufferFromSixTest.test";
import arrayBufferFromThreeTest from "./arrayBuffer/ArrayBufferFromThreeTest.test";
import arrayBufferFromTwoTest from "./arrayBuffer/ArrayBufferFromTwoTest.test";
import arrayBufferPropertyTest from "./arrayBuffer/ArrayBufferPropertyTest.test";

export default function testsuite(): void {
  arrayBufferPropertyTest();
  arrayBufferAtTest();
  arrayBufferBytesLengthTest();
  arrayBufferFromOneTest();
  arrayBufferFromTwoTest();
  arrayBufferFromThreeTest();
  arrayBufferFromFourTest();
  arrayBufferFromFiveTest();
  arrayBufferFromSixTest();
  arrayBufferFromSevenTest();
}
